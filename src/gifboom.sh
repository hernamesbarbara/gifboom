#!/usr/bin/env bash

GIFBOOM_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

YTS_FETCHALL_SCRIPT="$GIFBOOM_DIR/yts_fetchall.sh"
WEBMS2MP4_SCRIPT="$GIFBOOM_DIR/webms2mp4.sh"

usage() {
  echo "Usage: gifboom <command>"
  echo "Commands:"
  echo "  fetch <url_file>: Fetch YouTube videos from a list of URLs"
  echo "  convert: Convert fetched videos to GIFs"
}

# Main function
main() {
  if [[ "$1" == "fetch" ]]; then
    
    if [[ -z "$2" ]]; then
      echo "Error: Please provide a URL file."
      usage
      exit 1
    fi
    "$YTS_FETCHALL_SCRIPT" "$2"

  elif [[ "$1" == "convert" ]]; then
    "$WEBMS2MP4_SCRIPT"
  else
    echo "Error: Invalid command."
    usage
    exit 1
  fi
}

main "$@"