# !/usr/bin/env bash
# TEMP=$(sensors | grep 'Package id 0:\|Tdie' | grep ':[ ]*+[0-9]*.[0-9]*°C' -o | grep '+[0-9]*.[0-9]*°C' -o)
# CPU_USAGE=$(mpstat 1 1 | awk '/Average:/ {printf("%s\n", $(NF-9))}')
# echo "$CPU_USAGE $TEMP" | awk '{ printf("💾 CPU:%6s% @ %s\n"), $1, $2 }'
# echo "$CPU_USAGE $TEMP" | awk '{ printf("💾 CPU:%6s%\n"), $1, $2 }'
# echo "$TEMP"
# TEMP=$(sensors | grep 'Package id 0:\|Tdie' | grep ':[ ]*+[0-9]*.[0-9]*°C' -o | grep '+[0-9]*.[0-9]*°C' -o)
# CPU_USAGE=$(mpstat 1 1 | awk '/Average:/ {printf("%s\n", $(NF-9))}')
# echo "$CPU_USAGE $TEMP" | awk '{ printf(" CPU:%6s% @ %s \n"), $1, $2 }'

case $BLOCK_BUTTON in
	1) notify-send -u low -i none "🖥 CPU hogs" "$(ps axch -o cmd:15,%cpu --sort=-%cpu | head)\\n(100% per core)" ;;
	2) setsid -f alacritty --title cpu-f -e gotop ;;
	3) notify-send "🖥 CPU module " "\- Shows CPU temperature.
- Click to show intensive processes.
- Middle click to open htop." -i none ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

sensors | awk '/Core 0/ {print "🌡" $3"° C"}'


