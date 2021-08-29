#!/usr/bin/env fish

set this_dir (realpath (dirname (status -f)))

# symlink ~/.vim, ~/.vimrc and ~/.gvimrc
for item in vim vimrc gvimrc
	set path $HOME/.$item

	if test -e $path
		echo $path → already exists
	else
		ln -s $this_dir/$item $path
		echo $path → symlinked
	end
end

# symlink ~/.config/nvim/init.vim
set path $HOME/.config/nvim/init.vim

if not test -e (dirname $path)
	mkdir (dirname $path)
	echo (dirname $path) → created
end

if test -e $path
	echo $path → already exists
else
	ln -s $this_dir/init.vim $path
	echo $path → symlinked
end
