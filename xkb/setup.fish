#!/usr/bin/env fish

set repo_dir (realpath (dirname (status -f)))
set config_dir ~/.config/xkb/symbols

if test -d $config_dir
	echo "~/.config/xkb/symbols → already exists"
else
	mkdir -p $config_dir
	echo "~/.config/xkb/symbols → created"
end

for symbols_file in bg_sr
	if test -e $config_dir/$symbols_file
		echo "~/.config/xkb/symbols/$symbols_file → already exists"
	else
		ln -s $repo_dir/$symbols_file $config_dir/$symbols_file
		echo "~/.config/xkb/symbols/$symbols_file → symlinked"
	end
end
