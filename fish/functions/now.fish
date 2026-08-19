function now
	argparse --max-args 1 'v/verbose' -- $argv
	or return

	# determine the timezone
	if test (count $argv) -gt 0
		if command -q timedatectl
			set matches (timedatectl list-timezones | string match -ie -- $argv[1])
		else
			# fall back on zone.tab (does not include UTC) on macOS
			set -l timezones (string match -rg '^[A-Z]{2}\t\S+\t(\S+)' </usr/share/zoneinfo/zone.tab)
			set -a timezones UTC
			set matches (string match -ie -- $argv[1] $timezones)
		end

		set num_matches (count $matches)
		set timezone

		if test $num_matches -eq 0
			echo "No timezone matching \"$argv[1]\""
			return 1
		else if test $num_matches -eq 1
			set timezone $matches[1]
		else
			# e.g. Etc/UTC and UTC
			set full_matches (string match -i -- $argv[1] $matches)

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
