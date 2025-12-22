function now
	argparse --max-args 1 'v/verbose' -- $argv
	or return

	# determine the timezone
	if test (count $argv) -gt 0
		set matches (timedatectl list-timezones | grep -i $argv[1])
		set num_matches (count $matches)
		set timezone

		if test $num_matches -eq 0
			echo "No timezone matching \"$argv[1]\""
			return 1
		else if test $num_matches -eq 1
			set timezone $matches[1]
		else
			# e.g. Etc/UTC and UTC
			set full_matches (timedatectl list-timezones | grep -ix $argv[1])

			if test (count $full_matches) -eq 1
				set timezone $full_matches[1]
			else
				echo "Multiple timezones matching \"$argv[1]\": "(string join ", " $matches)
				return 1
			end
		end

		if set -q _flag_verbose
			echo "Timezone: $timezone"
		end

		set -fx TZ $timezone
	end

	date +"%d %b %Y (%a) — %T %Z"
end
