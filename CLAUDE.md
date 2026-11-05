# Scripts repo

## Protected paths

Never delete, modify, or clean up `/Users/robertkump/Library/Android/sdk` (or anything inside it) with any script in this repo, and never run commands that do so.

- Cleanup scripts must delete through `safe_rm` from `cleanup/safe-rm.sh`, not plain `rm -rf`. It refuses protected paths, their contents, and their parent directories.
- New cleanup scripts go in `cleanup/` and must `source "$(dirname "${BASH_SOURCE[0]}")/safe-rm.sh"`.
- To protect another path, add it to `PROTECTED_PATHS` in `cleanup/safe-rm.sh`.
