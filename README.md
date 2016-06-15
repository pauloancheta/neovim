## My Personal NeoVim

Install neovim:
```
$ brew install neovim/neovim/neovim
```

Upgrade neovim with:
```
$ brew update
$ brew upgrade neovim
```

this repo should be in `~/.config/nvim/`

### Vim-Plug
I am using vim plug. It can be installed with this:
```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install plugins with
`:PlugInstall`
