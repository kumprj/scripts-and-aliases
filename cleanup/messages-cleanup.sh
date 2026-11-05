#!/bin/bash
# Frees disk space used by the Messages app.
#   - Deletes attachments (photos, videos, files) older than N days from ~/Library/Messages/Attachments
#   - Clears ~/Library/Messages/Caches (thumbnails/previews; Messages regenerates them)
#   - Removes the empty attachment folders left behind
# Quits Messages (after you confirm) before deleting anything.
# Messages history (chat.db) is not touched; deleted attachments show as missing in old chats.
# If Messages in iCloud is on, Messages can re-download them; if it is off, they are gone for good.
#
# Usage: ./messages-cleanup.sh            # attachments older than 30 days
#        ./messages-cleanup.sh 90         # attachments older than 90 days
# Your terminal needs Full Disk Access (System Settings > Privacy & Security) to read ~/Library/Messages.

source "$(dirname "${BASH_SOURCE[0]}")/safe-rm.sh"

DAYS=${1:-30}
[[ "$DAYS" =~ ^[0-9]+$ ]] || { echo "Usage: $0 [days]"; exit 1; }

MSG=~/Library/Messages
ATT="$MSG/Attachments"
CACHE="$MSG/Caches"

if ! ls "$MSG" >/dev/null 2>&1; then
  echo "Cannot read $MSG. Give your terminal Full Disk Access and try again."
  exit 1
fi

old_count=$(find "$ATT" -type f -mtime +"$DAYS" 2>/dev/null | wc -l | tr -d ' ')
old_kb=$(find "$ATT" -type f -mtime +"$DAYS" -print0 2>/dev/null | xargs -0 du -ck 2>/dev/null | tail -1 | cut -f1)

echo "Will delete:"
echo "  $old_count attachments older than $DAYS days ($(( ${old_kb:-0} / 1024 )) MB) in $ATT"
[[ -d "$CACHE" ]] && echo "  Caches: $(du -sh "$CACHE" 2>/dev/null | cut -f1) in $CACHE"
echo "  Empty folders in $ATT"
echo "Deleted attachments can only be recovered if Messages in iCloud is on."

read -r -p "Proceed? [y/N] " answer
[[ "$answer" =~ ^[Yy]$ ]] || { echo "Cancelled."; exit 0; }

# Messages keeps running after its window is closed; quit it so it isn't writing attachments mid-cleanup.
if pgrep -xq Messages; then
  echo "Quitting Messages..."
  osascript -e 'quit app id "com.apple.MobileSMS"' >/dev/null 2>&1
  for _ in {1..20}; do pgrep -xq Messages || break; sleep 0.5; done
  if pgrep -xq Messages; then
    echo "Messages did not quit. Quit it manually (Cmd+Q) and try again."
    exit 1
  fi
fi

find "$ATT" -type f -mtime +"$DAYS" -print0 2>/dev/null |
  while IFS= read -r -d '' f; do safe_rm "$f"; done
echo "Removed old attachments"

[[ -d "$CACHE" ]] && safe_rm "$CACHE"/* && echo "Cleared Messages caches"

# Each pass removes the current empty leaves; their parents become empty for the next pass.
while :; do
  empty=()
  while IFS= read -r -d '' d; do empty+=("$d"); done \
    < <(find "$ATT" -mindepth 1 -type d -empty -print0 2>/dev/null)
  (( ${#empty[@]} )) || break
  safe_rm "${empty[@]}" || break
done
echo "Removed empty folders"

echo "Done. Attachments now: $(du -sh "$ATT" 2>/dev/null | cut -f1)"
