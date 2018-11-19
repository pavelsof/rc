function ls --description "ls that shows the directories first"
	set -l params --color=auto --group-directories-first

	if isatty 1
		set params $params --indicator-style=classify
	end

	command ls $params $argv
end
