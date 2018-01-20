# same as fish' default ls, with added --group-directories-first
function ls
	set -l params --color=auto --group-directories-first

	if isatty 1
		set params $params --indicator-style=classify
	end

	command ls $params $argv
end
