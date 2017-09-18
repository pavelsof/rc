#!/usr/bin/fish

begin
	set -l x_dir (dirname (status -f))

	ln -sv $x_dir/Xresources $HOME/.Xresources
end
