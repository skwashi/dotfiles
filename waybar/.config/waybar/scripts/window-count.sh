#!/usr/bin/env bash

count=$(hyprctl activeworkspace -j | jq -r '.windows')
echo " $count"
