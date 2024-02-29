#!/usr/bin/env bash

_webms2mp4() {
  local source_dir=""
  if [[ -d "webms" ]]; then
    source_dir="webms"
  elif [[ -n "$1" && -d "$1" ]]; then
    source_dir="$1"
  else
    echo "Error: 'webms' directory doesnt exist"
    return 1
  fi

  mkdir -p mp4s

  local webm_files=("$source_dir"/*.webm)
  local n_total=${#webm_files[@]}
  
  if [[ n_total -eq 0 ]]; then
    echo "No .webms found in $source_dir."
    return 1
  fi

  echo "Trtying to convert $n_total webms to mp4"

  local i=0
  for file in "${webm_files[@]}"; do
    ((i++))
    (
      local filename=$(basename -- "$file")
      local newfile="mp4s/${filename/.webm/.mp4}"
      
      echo "Processing $i/$n_total: $filename"
      ffmpeg -i "$file" -c:v libx264 -preset fast -vf scale=-1:720 -c:a aac "$newfile" 2>&1
      
      if [[ $? -ne 0 ]]; then
        echo "Error: converting $filename. something bbout frames? idk...see ffmpeg...skipping"
      fi
    ) &

    # limit # of parallel threads...video conversion is a hungry hungry CPU hippo
    if (( $(jobs -r | wc -l) >= $(nproc) )); then
      wait -n
    fi
  done
  
  wait
  echo "all done."
}

_webms2mp4 "$1"
