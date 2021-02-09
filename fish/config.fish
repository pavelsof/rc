#
# locale
#

set -l my_locale (
	if not test -z (locale -a | grep C.UTF-8)
		echo C.UTF-8
	else
		echo en_DK.UTF-8
	end
)

set -gx LANG $my_locale
set -gx LC_ADDRESS $my_locale
set -gx LC_COLLATE $my_locale
set -gx LC_CTYPE $my_locale
set -gx LC_IDENTIFICATION $my_locale
set -gx LC_MONETARY $my_locale
set -gx LC_MESSAGES $my_locale
set -gx LC_MEASUREMENT $my_locale
set -gx LC_NAME $my_locale
set -gx LC_NUMERIC $my_locale
set -gx LC_PAPER $my_locale
set -gx LC_TELEPHONE $my_locale
set -gx LC_TIME $my_locale


#
# other global vars
#

# also works for sudoedit
set -gx EDITOR vim

# add ~/bin to the PATH
set -gx PATH $PATH ~/bin

# on ubuntu: SSH_AUTH_SOCK would be already set
# on arch: complements ~/.config/systemd/user/ssh-agent.service
if not set -q SSH_AUTH_SOCK
	set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.sock
end


#
# theme fixes
#

# foreground (bold) instead of blue for commands
set -gx fish_color_command --bold $fish_color_normal

# foreground (not bold) instead of red for not yet fully typed commands
set -gx fish_color_error $fish_color_normal


#
# ubuntu-specific
#

if not test -z (uname -a | grep -i ubuntu)

	# make HOME and END work in fish
	function fish_user_key_bindings
		bind \e\[1~ beginning-of-line
		bind \e\[4~ end-of-line
	end

	# fix the gvim issue
	function gvim -w gvim
		command gvim ^ /dev/null $argv
	end

	# cal on ubuntu does not start the week with monday
	function cal -w ncal
		ncal -b -M $argv
	end

end


#
# more config
#

# source config_local.fish if available
set -l config_local (dirname (status -f))/config_local.fish

if test -f $config_local
	source $config_local
end
