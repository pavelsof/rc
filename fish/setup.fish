#!/usr/bin/fish

begin
	set -l fish_dir (realpath (dirname (status -f)))

	if not test -d $HOME/.config/fish
		mkdir -pv $HOME/.config/fish
	end

	ln -sv $fish_dir/config.fish $HOME/.config/fish/config.fish
end
