# Vim

To setup this config perform the following steps:

## 1. Delete previous cache and config
```bash
rm -rfv ~/.vim
```

# 2. Copy the .vimrc file in `$HOME` dir.
```bash
cp -rv vim/.vimrc ~
```

## 3. Install the pre-requsite [vim-plug](https://github.com/junegunn/vim-plug) plugin manager.
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
- To setup and install the various packages open vim and enter the command `:PlugInstall`.
