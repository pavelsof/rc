#!/usr/bin/env fish

set -l repo_dir (realpath (dirname (status -f)))

if test -e ~/.gitconfig
	echo "~/.gitconfig → already exists"
else
	ln -s $repo_dir/gitconfig ~/.gitconfig
	echo "~/.gitconfig → symlinked"
end

if test -e ~/.gitconfig_local
	echo "~/.gitconfig_local → already exists"
else
	touch ~/.gitconfig_local
	echo "~/.gitconfig_local → created"
end
