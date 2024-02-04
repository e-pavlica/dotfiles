#!/bin/bash
LOC="$1"
# HTML encode string as %20
LOCATION=$(sed -e "s/ /%20/g" <<<"$LOC")
curl -s "https://wttr.in/$LOCATION?u" | less
