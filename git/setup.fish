#!/usr/bin/env fish

set -l git_dir (realpath (dirname (status -f)))

ln -sv $git_dir/gitconfig $HOME/.gitconfig
