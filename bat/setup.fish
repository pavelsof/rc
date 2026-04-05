#!/usr/bin/env fish

set repo_dir (realpath (dirname (status -f)))
set config_dir ~/.config/bat

if test -d $config_dir
	echo "~/.config/bat → already exists"
else
	mkdir -p $config_dir
	echo "~/.config/bat → created"
end

for item in config_dark config_light
	if test -e $config_dir/$item
		echo "~/.config/bat/$item → already exists"
	else
		ln -s $repo_dir/$item $config_dir/$item
		echo "~/.config/bat/$item → symlinked"
	end
end

# config is a symlink to one of the config_* files
if test -e $config_dir/config
	echo "~/.config/bat/config → already exists"
else
	ln -s $config_dir/config_light $config_dir/config
	echo "~/.config/bat/config → symlinked"
end
