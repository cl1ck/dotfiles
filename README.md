cl1ck's dotfiles
================

Clone repository:
```
cd ~
git clone https://github.com/cl1ck/dotfiles .dotfiles
```

Installation
------------
Use GNU `stow` to install individual modules:

```
cd .dotfiles
stow MODULENAME
```

vim
---

I use NeoBundle, install it first before starting vim:
```
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | bash
```

Then start vim and run `:NeoBundleInstall`.
