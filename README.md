# git-aliases

Centralized bash functions and git aliases. Clean local git branches, miscellaneous small git scripts, etc..

## cleanup/

macOS scripts for reclaiming disk space. Each shows what it will delete and asks before deleting.

- `messages-cleanup.sh [days]` — Messages attachments older than N days (default 30), preview caches, empty folders. Quits Messages after you confirm. Needs Full Disk Access for your terminal.
- `xcode-cleanup.sh [--archives]` — Xcode DerivedData, device support, caches, simulators.
- `disk-cleanup.sh [--quick]` — shows what is using disk space, then offers to clear user caches and logs.
- `safe-rm.sh` — guarded `rm -rf` the scripts above use; refuses paths in `PROTECTED_PATHS`. Keep it in the same folder.
