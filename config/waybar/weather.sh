#!/bin/bash
LOC="$1"
# HTML encode string as %20
LOCATION=$(sed -e "s/ /%20/g" <<<"$LOC")
WEATHER=$(curl -s "https://wttr.in/$LOCATION?u&format=%t|%c+%t+-+%l")
TEMP=$(echo $WEATHER | sed 's/|.*//')
TOOLTIP=$(echo $WEATHER | sed 's/.*|//')
cat <<JSON | jq --unbuffered --compact-output
{ "text": "$TEMP", "tooltip": "$TOOLTIP" }
JSON

