#!/usr/bin/env fish

set -l mutt_dir (realpath (dirname (status -f)))

if not test -d $HOME/.config/mutt
	mkdir -pv $HOME/.config/mutt
end

ln -sv $mutt_dir/muttrc $HOME/.config/mutt/muttrc
touch $HOME/.config/mutt/muttrc_local
