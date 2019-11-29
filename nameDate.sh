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
    curInputRaw=$(identify -verbose "$file" | grep 'Created Date')
    curInput=${curInputRaw:26:11}
    percent=$(echo "scale=4;100/$totalFile*$curFile" | bc -l)
    echo -ne "Progress: $percent% | ${curInput}${file} | Hit $hitCounter times\r"
    curFile=$(($curFile+1))
    case "${preferredMethod}" in
    1)
        curInputRaw=$(identify -verbose "$file" | grep 'Created Date')
        curInput=${curInputRaw:26:11}
        mv $file "${curInput}-$file"
        hitCounter=$(($hitCounter+1))
        #echo $curInput
        ;;
    2)
        curInputRaw=$(identify -verbose "$file" | grep 'exif:DateTime')
        curInput=${curInputRaw:19:11}
        curInputAltered=${curInput//:/}
        #echo $curInputAltered
        if [ "${curInputAltered}" != "" ]
        then
            mv $file "${curInputAltered}-$file"
            hitCounter=$(($hitCounter+1))
        fi
        ;;
    *)
        curInputRaw=$(identify -verbose "$file" | grep 'Created Date')
        curInput=${curInputRaw:26:11}
        if [ "${curInput}" == "" ]
        then
            curInputRaw=$(identify -verbose "$file" | grep 'exif:DateTime')
            curInput=${curInputRaw:19:11}
            curInputAltered=${curInput//:/}
            if [ "${curInputAltered}" == "" ]
            then
                continue
            else
                mv $file "${curInputAltered}-$file"
                hitCounter=$(($hitCounter+1))
                #echo $curInputAltered
                preferredMethod=2
            fi
        else    
            mv $file "${curInput}-$file"
            hitCounter=$(($hitCounter+1))
            #echo $curInput
            preferredMethod=1
        fi
    esac
    echo -ne "\r"
done
