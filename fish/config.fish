# locale
set -gx LANG C.UTF-8
set -gx LC_ADDRESS C.UTF-8
set -gx LC_COLLATE C.UTF-8
set -gx LC_CTYPE C.UTF-8
set -gx LC_IDENTIFICATION C.UTF-8
set -gx LC_MONETARY C.UTF-8
set -gx LC_MESSAGES C.UTF-8
set -gx LC_MEASUREMENT C.UTF-8
set -gx LC_NAME C.UTF-8
set -gx LC_NUMERIC C.UTF-8
set -gx LC_PAPER C.UTF-8
set -gx LC_TELEPHONE C.UTF-8
set -gx LC_TIME C.UTF-8

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

# source config_local.fish if available
set -l config_local (dirname (status -f))/config_local.fish
if test -f $config_local
	source $config_local
end
