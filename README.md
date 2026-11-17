# TurboCPP4Hyprland

Turbo C++ 3.0 for DOS running on Linux using DOSBox Staging. This fork configures a resizable Wayland-friendly window for Hyprland. It stretches the DOS display to fill the window; this changes the original aspect ratio.

## Setup

1. Install [DOSBox Staging](https://www.dosbox-staging.org/getting-started/introduction/installation/) for Linux. The launcher looks for `dosbox-staging` on your PATH. For the local installation used in the original setup it also checks `~/.local/opt/turbocpp/staging/dosbox`.
2. Clone this repository and keep it in a permanent location:

   ```sh
   git clone https://github.com/KingSahil/TurboCPP4Hyprland.git
   cd TurboCPP4Hyprland
   bash install.sh
   ```

3. Search for **turbocpp** in your application menu, or run `./start.sh` from the repository.

The launcher points to the repository's current location, so rerun `./install.sh` if you move it. Turbo C++ writes its files within the `TC` directory; keep backups of your work.

Resize the window using your Hyprland bindings or mouse. Keyboard shortcuts vary by Hyprland configuration; DOSBox Staging uses Alt+Enter for its own fullscreen toggle. The default window is 1280×800; edit `dosbox-staging.conf` to change it. Set `aspect = auto` if you prefer the original proportions with possible borders.

This is an old DOS compiler and does not support modern C++ standards. Use GCC or Clang for modern C++ projects.

## Credits

Forked from [AvinashReddy3108/TurboCPP4Linux](https://github.com/AvinashReddy3108/TurboCPP4Linux), which credits [vineetchoudhary](https://github.com/vineetchoudhary) for the Turbo C++ files. DOSBox Staging is a separate open-source project.

## Mouse integration and shortcuts

To optionally enable host-rendered mouse integration, download the [VBADOS binaries](https://git.javispedro.com/cgit/vbados.git/about/) and place `VBMOUSE.EXE` and `VBMOUSE.EN` from its ZIP in `TC/BIN`. Restart Turbo C++ to enable it. Without these files the launcher uses the emulator's built-in mouse driver. VBMouse is a separate project; check its documentation and licence before redistribution. If mouse behaviour is unreliable, remove those two files to revert.

DOSBox's Ctrl+F9 shutdown shortcut is unbound so the key reaches Turbo C++'s Run command. Other IDE shortcuts retain their original behaviour; Ctrl+V does not paste the Linux clipboard into the Turbo C++ editor.

To reduce background load, emulation pauses while the window is inactive, including any program running in it. Set `pause_when_inactive = off` in `dosbox-staging.conf` to keep programs running in the background. The emulator also runs at lower scheduling priority and at 12,000 emulated CPU cycles.

## Caelestia sidebar

Some Hyprland/Quickshell setups may have trouble with live window previews. An experimental local workaround disabled Caelestia's live preview for the DOSBox Staging window only; it has not been confirmed to solve recurring sidebar freezes and is not applied automatically by this repository. If Caelestia freezes, `caelestia shell --restart --daemon` restarts its shell without closing open applications.
