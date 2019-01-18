#ffmpeg script that will pull the .ass subtitle file from a mkv file and convert to .srt then delete the .ass file
for f in *.mkv;
    do ffmpeg -i "$f" -c:s copy "${f%.mkv}.ass";
    ffmpeg -i "${f%.mkv}.ass" "${f%.mkv}.srt";
    rm "${f%.mkv}.ass";
    sed -r -i 's/ size="[0-9]+"//g' "${f%.mkv}.srt"; done

# replace current sed line with the following to remove html or anything in between corner brackets <> 
#sed -i 's/<[^>]\+>//g'"${f%.mkv}.srt"; done
