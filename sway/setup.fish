#!/usr/bin/env fish

set repo_dir (realpath (dirname (status -f)))
set config_dir $HOME/.config/sway

# create the sway config dir
if test -d $config_dir
	echo $config_dir → already exists
else
	mkdir -p $config_dir
	echo $config_dir → created
end

# symlink the main config file
if test -e $config_dir/config
	echo $config_dir/config → already exists
else
	ln -s $repo_dir/config $config_dir/config
	echo $config_dir/config → symlinked
end

# copy the outputs config template
if test -e $config_dir/outputs
	echo $config_dir/outputs → already exists
else
	cp $repo_dir/outputs $config_dir/outputs
	echo $config_dir/outputs → template copied
end

# symlink i3status-rust config
if test -e $config_dir/i3status-rust.toml
	echo $config_dir/i3status-rust.toml → already exists
else
	ln -s $repo_dir/i3status-rust.toml $config_dir/i3status-rust.toml
	echo $config_dir/i3status-rust.toml → symlinked
end
