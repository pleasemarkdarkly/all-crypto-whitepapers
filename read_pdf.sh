#!/bin/bash

# Create temp working folder to
# isolate files we care about
temp_folder=$(date)
mkdir "${temp_folder}"

# Lower all extensions
find . -name '*.*' -exec sh -c '
  a=$(echo "$0" | sed -r "s/([^.]*)\$/\L\1/");
  [ "$a" != "$0" ] && mv "$0" "$a" ' {} \;

# Copy files we want to work with
cp -vr *.pdf "${temp_folder}"

# Move into temp_dir
cd "${temp_folder}"

# Convert PDF to text
pdf_files=*.pdf
for pdf in $pdf_files
  do
    echo "converting pdfs to text"
    pdftotext $pdf
  done

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
    cat $file | say --progress -v "Samantha Compact" --rate=250 -o "$file.aiff"
    ffmpeg -i "$file.aiff" -f mp3 -acodec libmp3lame -ab 320000 -ar 44100 "$file.mp3"
  done

# Cleanup
# mv -v *.aiff aiff/
rm -rf *.aiff
mv -v *.mp3 ../
echo rm -rf "${temp_folder}"

