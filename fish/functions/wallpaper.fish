function wallpaper
	argparse 'v/verbose' -- $argv
	or return

	# prefix with kitty- so that darken can work on it
	set socket $XDG_RUNTIME_DIR/kitty-wallpaper

	if test -S $socket
		if set -q _flag_verbose
			echo "Removing an already running wallpaper"
		end

		fuser --silent --kill -TERM $socket
	end

	if set -q _flag_verbose
		echo "The wallpaper is on"
	end

	kitten panel \
		--edge background \
		--listen-on unix:$socket \
		htop --no-mouse --readonly
end
