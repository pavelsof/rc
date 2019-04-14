#!/usr/bin/env fish

set -l x_dir (realpath (dirname (status -f)))

ln -sv $x_dir/Xresources $HOME/.Xresources
ln -sv $x_dir/Xresources.d $HOME/.Xresources.d
