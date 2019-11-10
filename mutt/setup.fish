#!/usr/bin/env fish

set -l repo_dir (realpath (dirname (status -f)))
set -l config_dir $HOME/.config/mutt

if test -d $config_dir
	echo $config_dir → OK
else
	mkdir -p $config_dir
	echo $config_dir → created
end

if test -e $config_dir/muttrc
	echo $config_dir/muttrc → OK
else
	ln -s $repo_dir/muttrc $config_dir/muttrc
	echo $config_dir/muttrc → symlinked
end

if test -e $config_dir/local
	echo $config_dir/local → OK
else
	touch $config_dir/local
	echo $config_dir/local → created empty
end
