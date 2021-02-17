function darken
	set -l config_dir ~/.config/kitty
	set -l theme $config_dir/themes/gruvbox_dark.conf

	for sock in (ls -1 $XDG_RUNTIME_DIR/kitty.sock*)
		kitty @ --to unix:$sock set-colors $theme
	end

	ln -sf $theme $config_dir/current_theme
end
