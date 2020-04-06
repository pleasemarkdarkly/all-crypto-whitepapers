#!/bin/bash

if [ -d "aiff" ]; then
  echo "aiff folder exists"
else
  mkdir aiff
fi

if [ -d "mp3" ]; then
  echo "mp3 folder exists"
else
  mkdir mp3
fi

text_files=*.txt
for file in $text_files
  do
    echo "Converting $file to aiff"
    cat $file | say --progress -v "Samantha Compact" --rate=350 -o "$file.aiff"
    ffmpeg -i "$file.aiff" -f mp3 -acodec libmp3lame -ab 320000 -ar 44100 "$file.aiff.mp3"
    mv -v *.aiff aiff/
    mv -v *.mp3 mp3/
  done
