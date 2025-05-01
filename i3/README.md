<!-- Tutorial link: https://www.youtube.com/playlist?list=PL0rXAycsylvXxyPDT5kGQ5MiHcqrZWv69 -->

# i3 Tiling Window Manager

- Use [font awesome](https://fontawesome.com/v4/cheatsheet/) and [nerd font](https://www.nerdfonts.com/cheat-sheet) cheat sheets to set names and symbols for various workspaces, status bars etc.

- i3 requires the following packages to work properly:

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
    | nitrogen     |                                       |
    <!-- | xinput       | enable touchpad tap to click          | -->

## Install Pre-requisite packages (Fedora)

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


## Setting up i3 TWM

- Clone [catppuccin wallpaper pack](https://github.com/orangci/walls-catppuccin-mocha)
```
git clone https://github.com/orangci/walls-catppuccin-mocha.git ~/walls_catppuccin_mocha
```

- Copy the i3 config folder
```bash
# copy the i3 folder in ~/.config
cp -rv ./i3/ ~/.config/
```

- Enable mouse touchpad controls

```bash
# check and create the dir
sudo mkdir -p /etc/X11/xorg.conf.d
# copy the touchpad config file to the location
sudo cp -rv ./i3/90-touchpad.conf /etc/X11/xorg.conf.d/90-touchpad.conf
```

- By default the config file uses `dmenu` and `polybar` as defaults. Make sure to copy the config
files for them as well.

### Use `rofi` as an alternative to `dmenu`
- To select rofi themes: `rofi-theme-selector`
- To configure `rofi` for `i3` and setup catppuccin colorscheme checkout the rofi [README](https://github.com/usman1515/dotfiles/blob/main/rofi/README.md).

### Use `polybar` as an alternative to `i3status`
- Use `polybar` as an alternative `i3status` or `i3bar` replacement.
- To configure `polybar` for `i3` and setup catppuccin colorscheme checkout the polybar [README](https://github.com/usman1515/dotfiles/blob/main/polybar/README.md).

