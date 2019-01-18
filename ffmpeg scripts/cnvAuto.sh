#ffmpeg script that will pull the .ass subtitle file from an mkv file and convert to .srt then delete the .ass file
for f in "$@"*.mkv;
    do ffmpeg -i "$f" -c:s copy "${f%.mkv}.ass";
    ffmpeg -i "${f%.mkv}.ass" "${f%.mkv}.srt";
    rm "${f%.mkv}.ass";
    sed -r -i 's/ size="[0-9]+"//g' "${f%.mkv}.srt"; done
	
# replace current sed line with the following to remove html or anything in between corner brackets <> 
#sed 's/<[^>]\+>//g'"${f%.mkv}.srt"; done

#This is the Auto version, which has directory pipe, can get torrent client to run external program /WhereYourScriptIsLocated/./cnvAuto.sh %D



