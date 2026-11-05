#!/bin/bash
# Frees disk space used by Xcode. Everything removed here is regenerated on demand.
# Usage: ./xcode-cleanup.sh              # clean caches, build data, simulators
#        ./xcode-cleanup.sh --archives   # also delete Archives (you lose old builds' dSYMs)

source "$(dirname "${BASH_SOURCE[0]}")/safe-rm.sh"

DEV=~/Library/Developer

paths=(
  "$DEV/Xcode/DerivedData"
  "$DEV/Xcode/iOS DeviceSupport"
  "$DEV/Xcode/watchOS DeviceSupport"
  "$DEV/CoreSimulator/Caches"
  ~/Library/Caches/com.apple.dt.Xcode
  ~/Library/Caches/org.swift.swiftpm
)
[[ "$1" == "--archives" ]] && paths+=("$DEV/Xcode/Archives")

if pgrep -xq Xcode; then
  echo "Quit Xcode first."
  exit 1
fi

echo "Will delete:"
for p in "${paths[@]}"; do
  [[ -e "$p" ]] && du -sh "$p" 2>/dev/null
done
echo "Plus: simulators whose runtime is no longer installed,"
echo "      and all remaining simulators are erased (apps and data wiped, devices kept)."

read -r -p "Proceed? [y/N] " answer
[[ "$answer" =~ ^[Yy]$ ]] || { echo "Cancelled."; exit 0; }

for p in "${paths[@]}"; do
  [[ -e "$p" ]] && safe_rm "$p" && echo "Removed $p"
done

xcrun simctl delete unavailable && echo "Removed unavailable simulators"
xcrun simctl shutdown all 2>/dev/null
xcrun simctl erase all && echo "Erased all simulators"

echo "Done."
