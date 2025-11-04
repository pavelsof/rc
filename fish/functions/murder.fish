function murder --wraps kill
	argparse -- $argv
	or return

	kill \
		--signal TERM \
		--timeout 1000 KILL \
		$argv
end
