#!/usr/bin/fish

set -l vim_dir (realpath (dirname (status -f)))

ln -sv $vim_dir/vim $HOME/.vim
ln -sv $vim_dir/vimrc $HOME/.vimrc
ln -sv $vim_dir/gvimrc $HOME/.gvimrc
