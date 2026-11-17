#!/usr/bin/env bash
set -euo pipefail
root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
if [[ "$root" == *$'\n'* || "$root" == *'%'* ]]; then
  printf '%s\n' 'Installation paths containing newlines or percent signs are unsupported.' >&2
  exit 1
fi
mkdir -p "$HOME/.local/share/applications"
escaped=${root//\\/\\\\}
escaped=${escaped//\"/\\\"}
escaped=${escaped//\$/\\\$}
escaped=${escaped//\`/\\\`}
cat > "$HOME/.local/share/applications/turbocpp.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=turbocpp
Comment=Turbo C++ 3.0 using DOSBox Staging
Exec="$escaped/start.sh"
Icon=utilities-terminal
Terminal=false
Categories=Development;IDE;
StartupNotify=false
DESKTOP
command -v update-desktop-database >/dev/null && update-desktop-database "$HOME/.local/share/applications" || true
printf '%s\n' 'Launcher installed. Search for turbocpp in your app menu.'
