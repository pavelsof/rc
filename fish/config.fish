#
# locale
#

set -l my_locale (
	if test (locale -a | grep -i C.UTF)
		echo C.UTF-8
	else
		echo en_US.UTF-8
	end
)

set -gx LANG $my_locale
set -gx LC_ADDRESS $my_locale
set -gx LC_COLLATE $my_locale
set -gx LC_CTYPE $my_locale
set -gx LC_IDENTIFICATION $my_locale
set -gx LC_MEASUREMENT $my_locale
set -gx LC_MESSAGES $my_locale
set -gx LC_MONETARY $my_locale
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
if not contains (realpath ~/bin) $PATH
	set -gx PATH ~/bin $PATH
end

# on macOS: add the homebrew env vars and paths
if test (uname -s | grep Darwin)
	/opt/homebrew/bin/brew shellenv | source
end

# on ubuntu: SSH_AUTH_SOCK would be already set
# on arch: complements systemctl enable --user ssh-agent.service
if not set -q SSH_AUTH_SOCK
	set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
end

if type -q fd
	# use fd as the default file traversing source for fzf in order to:
	# - respect .gitignore files (fd does it by default)
	# - include hidden files, except for those in .git/ dirs
	# - include symlinks
	set -gx FZF_DEFAULT_COMMAND \
		fd --type f --hidden --exclude .git --follow --strip-cwd-prefix
end


#
# theme fixes
#

# foreground (bold) instead of blue for commands
set -gx fish_color_command --bold $fish_color_normal

# foreground (not bold) instead of red for not yet fully typed commands
set -gx fish_color_error $fish_color_normal


#
# key bindings
#

# enable the default fzf key bindings: ctrl+t, ctrl+r, alt+c
if type -q fzf
	fzf --fish | source
end


#
# abbreviations
#

# git
abbr --add ga -- git add
abbr --add gaa -- git add --all
abbr --add gb -- git branch
abbr --add gc --set-cursor -- git commit -am \"%\"
abbr --add gca -- git commit --amend
abbr --add gd -- git diff
abbr --add gdc -- git diff --cached
abbr --add gi -- git
abbr --add gl -- git log
abbr --add gm -- git merge
abbr --add go -- git checkout
abbr --add gob -- git checkout -b
abbr --add gp -- git pull
abbr --add gs -- git status
abbr --add gu -- git push

# kitty
abbr --add kc -- kitten clipboard
abbr --add ki -- kitten icat
abbr --add kp -- kitten clipboard --get-clipboard

# ruff
abbr --add rc -- ruff check
abbr --add rf -- ruff format


#
# functions
#

function ls --description "ls that shows the directories first"
	set -l params --color=auto --group-directories-first

	if isatty stdout
		set params $params --indicator-style=classify
	end

	command ls $params $argv
end

function auto_source_venv --on-variable PWD
	if test -d venv
		if set -q VIRTUAL_ENV
			deactivate
		end

		source venv/bin/activate.fish
	end
end


#
# distro-specific functions
#

if test (uname -a | grep arch)

	# fix cal to start the week with the day of the moon
	function cal -w cal
		command cal -m $argv
	end

	# force electron apps to use wayland
	set -gx ELECTRON_OZONE_PLATFORM_HINT wayland

	# fix java apps to open in wayland
	set -gx _JAVA_AWT_WM_NONREPARENTING 1

end

if test (uname -a | grep Ubuntu)

	# make HOME and END work in fish
	function fish_user_key_bindings
		bind \e\[1~ beginning-of-line
		bind \e\[4~ end-of-line
	end

	# fix the gvim issue
	function gvim -w gvim
		command gvim ^ /dev/null $argv
	end

	# fix cal to start the week with the day of the moon
	function cal -w ncal
		ncal -b -M $argv
	end

end

if test (uname -s | grep Darwin)

	# overwrite the ls function defined above
	function ls -w ls
		set -l params -G

		if isatty stdout
			set params $params -F
		end

		command ls $params $argv
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
