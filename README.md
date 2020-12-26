# dotfiles
My personal dotfiles

# clone bare repository
````
alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
dotfiles clone --bare https://github.com/meegle84/dotfiles $HOME/dotfiles
dotfiles checkout
dotfiles submodule update --init --recursive -j 8```
