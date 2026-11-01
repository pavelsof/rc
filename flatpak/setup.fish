#!/usr/bin/env fish

set repo_dir (realpath (dirname (status -f)))
set overrides_dir ~/.local/share/flatpak/overrides

if test -d $overrides_dir
	echo "$overrides_dir → already exists"
else
	mkdir -p $overrides_dir
	echo "$overrides_dir → created"
end

for item in (ls -1 $repo_dir/overrides)
	if test -e $overrides_dir/$item
		echo "$overrides_dir/$item → already exists"
	else
		ln -s $repo_dir/overrides/$item $overrides_dir/$item
		echo "$overrides_dir/$item → symlinked"
	end
end
