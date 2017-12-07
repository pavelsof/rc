#!/usr/bin/fish

begin
	set -l git_dir (realpath (dirname (status -f)))

	ln -sv $git_dir/gitconfig $HOME/.gitconfig
end
