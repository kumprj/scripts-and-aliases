#!/bin/bash
# Sourced by the cleanup scripts. Provides safe_rm, a guarded `rm -rf`.
# Refuses any target that is, contains, or sits inside a protected path.

PROTECTED_PATHS=(
  "$HOME/Library/Android/sdk"
)

_resolve() { realpath "$1" 2>/dev/null || echo "$1"; }

safe_rm() {
  local t p
  for t in "$@"; do
    t=$(_resolve "$t")
    for p in "${PROTECTED_PATHS[@]}"; do
      p=$(_resolve "$p")
      if [[ "$t" == "$p" || "$t" == "$p"/* || "$p" == "$t"/* ]]; then
        echo "Skipping protected path: $t" >&2
        return 1
      fi
    done
  done
  rm -rf "$@"
}
