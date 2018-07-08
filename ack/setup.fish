#!/usr/bin/fish

set -l ack_dir (realpath (dirname (status -f)))

ln -sv $ack_dir/ackrc $HOME/.ackrc
