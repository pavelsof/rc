#!/usr/bin/env fish

set packages_file (status dirname)/packages

set temp_file_1 (mktemp -t pacman.XXX)
set temp_file_2 (mktemp -t repo.XXX)

# the explicitly installed packages
pacman -Qeq > $temp_file_1

# the packages file without the empty and comment lines
grep -vP '^(#.*|)$' $packages_file | sort > $temp_file_2

vimdiff $temp_file_1 $temp_file_2
