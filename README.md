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
