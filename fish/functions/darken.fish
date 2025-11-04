function darken
	argparse 'v/verbose' -- $argv
	or return

	# light or dark
	set new_theme

	# determine which is the current and which will be the new one
	begin
		set -l last_theme

		switch (basename (readlink ~/.config/kitty/current_theme))
			case gruvbox_light.conf
				set last_theme light
				set new_theme dark
			case gruvbox_dark.conf
				set last_theme dark
				set new_theme light
			case '*'
				set last_theme unknown
				set new_theme light
		end

		if set -q _flag_verbose
			echo "Current theme: $last_theme"
			echo "New theme: $new_theme"
		end
	end

	# kitty
	begin
		set -l theme_path ~/.config/kitty/themes/gruvbox_$new_theme.conf

		ln -sf $theme_path ~/.config/kitty/current_theme

		if set -q _flag_verbose
			echo "Kitty: symlinked current_theme to $theme_path"
		end

		for socket in (ls -1 $XDG_RUNTIME_DIR/kitty-*)
			kitty @ --to unix:$socket \
					set-colors --all --configured $theme_path

			if set -q _flag_verbose
				echo "Kitty: sent message to $socket"
			end
		end
	end

	# GTK
	begin
		set -l color_scheme "'prefer-$new_theme'"

		# assume that xdg-desktop-portal-gtk is installed
		gsettings set org.gnome.desktop.interface color-scheme $color_scheme

		if set -q _flag_verbose
			echo "GTK: set the color scheme to $color_scheme"
		end
	end
end
