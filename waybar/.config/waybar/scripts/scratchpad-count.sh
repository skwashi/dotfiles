#!/bin/bash

count=$(hyprctl clients -j | jq '[.[] | select(.workspace.name == "special")] | length')

if [ "$count" -gt 0 ]; then
    echo " $count"
else
    echo ""
fi
