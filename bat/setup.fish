#!/usr/bin/env fish

set repo_dir (realpath (dirname (status -f)))
set config_dir ~/.config/bat

if test -d $config_dir
	echo "~/.config/bat → already exists"
else
	mkdir -p $config_dir
	echo "~/.config/bat → created"
end

if test -e $config_dir/config
	echo "~/.config/bat/config → already exists"
else
	ln -s $repo_dir/config $config_dir/config
	echo "~/.config/bat/config → symlinked"
end
