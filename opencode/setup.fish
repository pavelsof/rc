#!/usr/bin/env fish

set repo_dir (realpath (dirname (status -f)))
set config_dir ~/.config/opencode

if test -d $config_dir
	echo "~/.config/opencode → already exists"
else
	mkdir -p $config_dir
	echo "~/.config/opencode → created"
end

for item in tui.json
	if test -e $config_dir/$item
		echo "~/.config/opencode/$item → already exists"
	else
		ln -s $repo_dir/$item $config_dir/$item
		echo "~/.config/opencode/$item → symlinked"
	end
end
