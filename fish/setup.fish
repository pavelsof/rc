#!/usr/bin/env fish

set repo_dir (realpath (dirname (status -f)))
set config_dir $HOME/.config/fish

if test -d $config_dir
	echo $config_dir → already exists
else
	mkdir -p $config_dir
	echo $config_dir → created
end

for item in config.fish functions
	if test -e $config_dir/$item
		echo $config_dir/$item → already exists
	else
		ln -s $repo_dir/$item $config_dir/$item
		echo $config_dir/$item → symlinked
	end
end
