#!/bin/sh
dconf write /org/gnome/desktop/wm/keybindings/close "['<Shift><Super>c']"

dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-1 "['<Super>1']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-2 "['<Super>2']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-3 "['<Super>3']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-4 "['<Super>4']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-5 "['<Super>5']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-6 "['<Super>6']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-7 "['<Super>7']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-8 "['<Super>8']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-9 "['<Super>9']"

dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-1 "['<Shift><Super>1']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-2 "['<Shift><Super>2']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-3 "['<Shift><Super>3']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-4 "['<Shift><Super>4']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-5 "['<Shift><Super>5']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-6 "['<Shift><Super>6']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-7 "['<Shift><Super>7']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-8 "['<Shift><Super>8']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-9 "['<Shift><Super>9']"

# Shellshape stuff
dconf write /org/gnome/shell/extensions/net/gfxmonk/shellshape/keybindings/set-layout-floating "['<Super>t']"
dconf write /org/gnome/shell/extensions/net/gfxmonk/shellshape/keybindings/set-layout-fullscreen "['<Super>f']"

# Disable caps-lock
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:none']"
