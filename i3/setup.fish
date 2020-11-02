#!/usr/bin/env fish

set repo_dir (realpath (dirname (status -f)))
set config_dir $HOME/.config/i3

if test -d $config_dir
	echo $config_dir → already exists
else
	mkdir -p $config_dir
	echo $config_dir → created
end

if test -e $config_dir/config
	echo $config_dir/config → already exists
else
	ln -s $repo_dir/config $config_dir/config
	echo $config_dir/config → symlinked
end

if test -e $config_dir/post-config.sh
	echo $config_dir/post-config.sh → already exists
else
	cp $repo_dir/post-config.sh -t $config_dir
	echo $config_dir/post-config.sh → created
end
