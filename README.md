# dotfiles
My personal dotfiles

# add alias
First of all add to your `.bashrc` or `.zshrc` this alias or simply export it
```
alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
```

# clone bare repository
```
dotfiles clone --bare https://github.com/meegle84/dotfiles $HOME/dotfiles
dotfiles checkout
dotfiles submodule update --init --recursive -j 8
dotfiles config --local status.showUntrackedFiles no
```
