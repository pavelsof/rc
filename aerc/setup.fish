#!/usr/bin/env fish

set repo_dir (realpath (dirname (status -f)))
set config_dir $HOME/.config/aerc

if test -d $config_dir
	echo $config_dir → already exists
else
	mkdir -p $config_dir
	echo $config_dir → created
end

for file in aerc.conf binds.conf
	if test -e $config_dir/$file
		echo $config_dir/$file → already exists
	else
		ln -s $repo_dir/$file $config_dir/$file
		echo $config_dir/$file → symlinked
	end
end
