#ffmpeg script that will pull the .ass subtitle file from a mp4 file and convert to .srt then delete the .ass file
for f in *.mp4;
    do ffmpeg -i "$f" -c:s copy "${f%.mp4}.ass";
    ffmpeg -i "${f%.mp4}.ass" "${f%.mp4}.srt";
    rm "${f%.mp4}.ass";
    sed -r -i 's/ size="[0-9]+"//g' "${f%.mp4}.srt"; done

# replace current sed line with the following to remove html or anything in between corner brackets <> 
#sed -i 's/<[^>]\+>//g'"${f%.mkv}.srt"; done

