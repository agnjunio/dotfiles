#!/usr/bin/env bash

while true; do
  for f in $HOME/Pictures/Wallpappers/*; do
    feh -z --bg-scale --no-fehbg "$f"
    sleep 600
  done
done
