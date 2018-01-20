# disable error highlighting
set fish_color_error $fish_color_normal

# make HOME and END work in fish
function fish_user_key_bindings
	bind \e\[1~ beginning-of-line
	bind \e\[4~ end-of-line
end

# fix gvim on ubuntu bug
function gvim
	command gvim ^ /dev/null $argv
end
