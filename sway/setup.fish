#!/usr/bin/env fish

set repo_dir (realpath (dirname (status -f)))
set config_dir $HOME/.config/sway

# the sway config dir
if test -d $config_dir
	echo $config_dir → already exists
else
	mkdir -p $config_dir
	echo $config_dir → created
end

# the main config file
if test -e $config_dir/config
	echo $config_dir/config → already exists
else
	ln -s $repo_dir/config $config_dir/config
	echo $config_dir/config → symlinked
end

# the outputs config
if test -e $config_dir/outputs
	echo $config_dir/outputs → already exists
else
	cp $repo_dir/outputs $config_dir/outputs
	echo $config_dir/outputs → template copied
end
