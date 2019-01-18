for f in *.mp4;
    do ffmpeg -i "$f" -c:s copy "${f%.mp4}.ass";
    ffmpeg -i "${f%.mp4}.ass" "${f%.mp4}.srt";
    rm "${f%.mp4}.ass";
    sed -r -i 's/ size="[0-9]+"//g' "${f%.mp4}.srt"; done

# use this to remove all html or anything inbetween corner brackets <> 
#sed -i 's/<[^>]\+>//g' "${f%.mp4}.srt";
