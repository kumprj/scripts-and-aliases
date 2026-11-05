#!/bin/bash
# Shows what is using disk space, then offers to clear user caches and logs.
# Nothing is deleted unless you answer y. Answer n to use it as a read-only scan.
# Usage: ./disk-cleanup.sh           # full scan (home deep scan + system folders, asks for password)
#        ./disk-cleanup.sh --quick   # only ~/Library and top-level home folders
# For Xcode build data use xcode-cleanup.sh; for Messages attachments use messages-cleanup.sh.

source "$(dirname "${BASH_SOURCE[0]}")/safe-rm.sh"

section() {
  echo ""
  echo "=================================================="
  echo " $1"
  echo "=================================================="
}

section "Largest items in ~/Library"
du -shx ~/Library/* 2>/dev/null | sort -hr | head -n 15

section "Home directory folders"
du -shx ~/* 2>/dev/null | sort -hr

if [[ "$1" != "--quick" ]]; then
  section "Home directory, 3 levels deep (this will take a minute)"
  du -h -d 3 ~ 2>/dev/null | sort -hr | head -n 35

  section "System-level data folders (you may be prompted for your Mac password)"
  sudo du -h -d 2 /Library 2>/dev/null | sort -hr | head -n 15
  sudo du -h -d 2 /private/var/folders 2>/dev/null | sort -hr | head -n 10
fi

section "Cleanup"
echo "Can clear (apps rebuild these on demand):"
du -sh ~/Library/Caches ~/Library/Logs 2>/dev/null
read -r -p "Clear user caches and logs? [y/N] " answer
[[ "$answer" =~ ^[Yy]$ ]] || { echo "Nothing deleted."; exit 0; }

safe_rm ~/Library/Caches/* 2>/dev/null || true
echo "   -> User caches cleared."
safe_rm ~/Library/Logs/* 2>/dev/null || true
echo "   -> User logs cleared."
