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
args=(--noprimaryconf --nolocalconf --conf "$root/dosbox-staging.conf"
  --set "mapperfile=$root/turbocpp.map"
  -c "mount c \"$root\"" -c 'c:' -c 'set PATH=C:\TC\BIN' -c 'cd \TC\BIN')
if [[ -f "$root/TC/BIN/VBMOUSE.EXE" ]]; then
  args+=(--set 'builtin_dos_mouse_driver=off' -c 'VBMOUSE.EXE' -c 'VBMOUSE.EXE hostcur on')
fi
args+=(-c 'TC.EXE' -c 'exit')
exec nice -n 10 "$emulator" "${args[@]}"
