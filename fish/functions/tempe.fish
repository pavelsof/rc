# create a temp dir and go there
# inspired by https://evanhahn.com/scripts-i-wrote-that-i-use-all-the-time/
function tempe
	argparse -- $argv
	or return

	cd (mktemp -d)
end
