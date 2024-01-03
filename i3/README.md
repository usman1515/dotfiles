<!-- Tutorial link: https://www.youtube.com/playlist?list=PL0rXAycsylvXxyPDT5kGQ5MiHcqrZWv69 -->

# i3 Tiling Window Manager

-   Use [font awesome](https://fontawesome.com/v4/cheatsheet/) and [nerd font](https://www.nerdfonts.com/cheat-sheet) cheat sheets to set names and symbols for various workspaces, status bars etc.

-   i3 requires the following packages to work properly:
    | Package      | Description                           |
    | :----------- | :------------------------------------ |
    | feh          | set wallpapers                        |
    | xprop        | displaying window and font properties |
    | picom        | make windows transparent              |
    | lxappearance | change GTK system themes              |
    | arandr       | configure screens and resolutions     |
    | rofi         | dmenu alternative app launcher        |
    | pactl        | enable volume key functionality       |
    | playerctl    | enable multimedia key functionality   |
    | light        | enable screen brightness              |
    | xset         | user preference utility for X server  |

    <!-- | xinput       | enable touchpad tap to click          | -->


-   Install pre requisite packages
```bash
# install the following packages
sudo dnf install -y feh xprop picom lxappearance arandr rofi pactl playerctl light xset

# install i3 packages
sudo dnf install -y i3status i3bar i3-gaps

# setup i3lock color
sudo dnf copr enable tokariew/i3lock-color
sudo dnf remove -y i3lock
sudo dnf install -y i3lock-color

# install polybar
sudo dnf install -y polybar
```

-   Enable touchpad controls
```bash
# check and create the dir
sudo mkdir -p /etc/X11/xorg.conf.d
# copy the touchpad config file to the location
sudo cp -rv ./i3/90-touchpad.conf /etc/X11/xorg.conf.d/90-touchpad.conf
```

-   To setup the config perform the following steps:
```bash
# download catppuccin i3 colorscheme files
wget https://raw.githubusercontent.com/catppuccin/i3/main/themes/{catppuccin-frappe,catppuccin-latte,catppuccin-macchiato,catppuccin-mocha} -P $PWD/i3

# rename the files to *.conf
for f in ./i3/catppuccin-{frappe,latte,macchiato,mocha}; do mv -- "$f" "$f.conf"; done
```

## Use `rofi` as an alternative `dmenu` replacement
-   To select rofi themes: `rofi-theme-selector`
-   To configure `rofi` for `i3` and setup catppuccin colorscheme checkout the rofi [README](https://github.com/usman1515/dotfiles/blob/main/rofi/README.md).


## To setup the **i3 config with i3 status bar** run the following:
```bash
# create i3 folder
mkdir -p ~/.config/i3

# copy the following files in ~/.config/i3
cp -rv ./i3/90-touchpad.conf ~/.config/i3
cp -rv ./i3/catppuccin*.conf ~/.config/i3
cp -rv ./i3/i3status.conf ~/.config/i3
cp -rv ./i3/config_i3status ~/.config/i3/config
```
## To setup the **i3 config with polybar** run the following:
```bash
# create i3 folder
mkdir -p ~/.config/i3

# copy the following files in ~/.config/i3
cp -rv ./i3/90-touchpad.conf ~/.config/i3
cp -rv ./i3/catppuccin*.conf ~/.config/i3
cp -rv ./i3/config_polybar ~/.config/i3/config
```

-   Use `polybar` as an alternative `i3status` or `i3bar` replacement.
-   To configure `polybar` for `i3` and setup catppuccin colorscheme checkout the polybar [README](https://github.com/usman1515/dotfiles/blob/main/polybar/README.md).
