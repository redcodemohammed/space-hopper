#!/bin/sh
echo -ne '\033c\033]0;SpaceHopper\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/export.x86_64" "$@"
