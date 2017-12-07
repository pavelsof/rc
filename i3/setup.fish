#!/usr/bin/fish

begin
	set -l i3_dir (realpath (dirname (status -f)))

	if not test -d $HOME/.config/i3
		mkdir -pv $HOME/.config/i3
	end

	ln -sv $i3_dir/config $HOME/.config/i3/config

	touch $HOME/.config/i3/post-config.sh
end
