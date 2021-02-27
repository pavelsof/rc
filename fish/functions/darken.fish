function darken
	set config_dir ~/.config/kitty
	set future

	switch (basename (readlink $config_dir/current_theme))
		case gruvbox_dark.conf;
			set future light
		case gruvbox_light.conf
			set future dark
		case '*'
			return 1
	end

	# kitty
	set theme $config_dir/themes/gruvbox_$future.conf

	for sock in (ls -1 $XDG_RUNTIME_DIR/kitty.sock*)
		kitty @ --to unix:$sock set-colors $theme
	end

	ln -sf $theme $config_dir/current_theme

	# vim
	set -Ux THEME $future

	for name in (vim --serverlist)
		vim --servername $name --remote-send ":set background=$future<CR>"
	end
end
