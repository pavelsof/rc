#!/usr/bin/fish

begin
	set -l git_dir (dirname (status -f))

	ln -sv $git_dir/gitconfig $HOME/.gitconfig
end
