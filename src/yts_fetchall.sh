#!/usr/bin/env bash
# yts_fetchall.sh

_yts_fetchall() {
  local filename="yt-urls.txt"
  local output_path="webms/%(title)s.%(ext)s"
  
  if [[ ! -f "$filename" ]]; then
    echo "File Error: 'yt-urls.txt' doesnt exist. Add urls there & try again"
    echo "exit(1)"
    return 1
  fi
  
  local n=$(wc -l < "$filename") 
  local i=0
  local param_str='bestvideo[ext=webm]+bestaudio[ext=webm]/best[ext=webm]'

  while IFS= read -r url; do
    ((i++))
    echo "${i} of ${n}: fetching ${url}" | cut -c 1-79

    if ! yt-dlp -f "$param_str" --merge-output-format webm -o "$output_path" "$url"; then
      echo "First attempt failed...retrying"
      
      # Change the format for the retry attempt
      if ! yt-dlp -f 'best' --merge-output-format mkv -o "$output_path" "$url"; then
        echo "error calling yt-dlp. skipping ${url}...alas we move"
        continue
      fi
    fi
  done < "$filename"
}

# Call the function
_yts_fetchall
