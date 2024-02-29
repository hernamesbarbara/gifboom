#!/usr/bin/env bash

fetch_videos() {
  source ./yts_fetchall.sh
}

convert_videos() {
  source ./webms2mp4.sh
}


case "$1" in
  fetch)
    fetch_videos "${@:2}"
    ;;
  convert)
    convert_videos "${@:2}"
    ;;
  *)
    echo "Usage: $0 {fetch|convert} [arguments]"
    exit 1
    ;;
esac

