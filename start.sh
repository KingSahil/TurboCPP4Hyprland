#!/usr/bin/env bash
set -euo pipefail
root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
if command -v dosbox-staging >/dev/null 2>&1; then
  emulator=$(command -v dosbox-staging)
elif [[ -x "${HOME}/.local/opt/turbocpp/staging/dosbox" ]]; then
  emulator="${HOME}/.local/opt/turbocpp/staging/dosbox"
else
  printf '%s\n' 'DOSBox Staging is required. Install it from https://www.dosbox-staging.org/' >&2
  exit 1
fi
exec "$emulator" --noprimaryconf --nolocalconf --conf "$root/dosbox-staging.conf" \
  -c "mount c \"$root\"" -c 'c:' -c 'set PATH=C:\TC\BIN' \
  -c 'cd \TC\BIN' -c 'TC.EXE' -c 'exit'
