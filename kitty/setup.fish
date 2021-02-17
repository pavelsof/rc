#!/usr/bin/env fish

set repo_dir (realpath (dirname (status -f)))
set config_dir $HOME/.config/kitty


if test -d $config_dir
	echo $config_dir → already exists
else
	mkdir -p $config_dir
	echo $config_dir → created
end

for item in kitty.conf themes
	if test -e $config_dir/$item
		echo $config_dir/$item → already exists
	else
		ln -s $repo_dir/$item $config_dir/$item
		echo $config_dir/$item → symlinked
	end
end


# current_theme is a symlink to the symlink of the theme
set default_theme $config_dir/themes/gruvbox_light.conf

if test -e $config_dir/current_theme
	echo $config_dir/current_theme → already exists
else
	ln -s $default_theme $config_dir/current_theme
	echo $config_dir/current_theme → created
end
