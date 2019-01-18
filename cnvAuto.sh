for f in "$@"*.mkv;
    do ffmpeg -i "$f" -c:s copy "${f%.mkv}.ass";
    ffmpeg -i "${f%.mkv}.ass" "${f%.mkv}.srt";
    rm "${f%.mkv}.ass";
    sed -r -i 's/ size="[0-9]+"//g' "${f%.mkv}.srt"; done


# use this to remove all html or anything inbetween corner brackets <> 
#sed 's/<[^>]\+>//g'
