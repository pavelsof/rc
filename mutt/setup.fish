#!/usr/bin/env fish

set -l mutt_dir (realpath (dirname (status -f)))

if not test -d $HOME/.mutt
	mkdir -v $HOME/.mutt
end

ln -sv $mutt_dir/muttrc $HOME/.mutt/muttrc
