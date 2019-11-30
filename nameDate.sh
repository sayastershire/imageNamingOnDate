#!/bin/bash
echo Calculating total file to bash rename.
totalFile=$(find . -type f -print | wc -l)
curFile=1
hitCounter=0
preferredMethod=0
echo Commencing mass rename out of $totalFile files.
WORKDIR=\"$(echo $PWD)/*\"
echo $WORKDIR
for file in *; do
    curInput=""
    curInputAltered=""
    curInputRaw=$(identify -verbose "$file" | grep 'Created Date')
    curInput=${curInputRaw:26:11}
    percent=$(echo "scale=4;100/$totalFile*$curFile" | bc -l)
    echo -ne "Progress: $percent% | ${curInput}${file} | Hit $hitCounter times\r"
    curFile=$(($curFile+1))
    if ! [[ ${curInput} =~ ^[0-9]+ ]]
    then
        curInputRaw=$(identify -verbose "$file" | grep 'exif:DateTimeOriginal')
        curInput=${curInputRaw:27:10}
        curInputAltered=${curInput//:/}
        if [ "${curInputAltered}" == "" ]
        then
            continue
        else
            mv $file "${curInputAltered}-$file"
            hitCounter=$(($hitCounter+1))
            #echo $curInputAltered-$file DateTimeOri
            preferredMethod=2
        fi
    else    
        mv $file "${curInput}-$file"
        hitCounter=$(($hitCounter+1))
        #echo $curInput-$file Fallback
        preferredMethod=1
    fi
done
