# Polybar

-   Default polybar location: `/etc/polybar/config.ini`

```bash
# make launch.sh executable
chmod +x ./launch.sh

# download catppuccin theme for polybar
wget https://raw.githubusercontent.com/catppuccin/polybar/main/themes/{frappe.ini,latte.ini,macchiato.ini,mocha.ini} -P $PWD/polybar

# copy the folder
cp -rv ./polybar ~/.config/
```