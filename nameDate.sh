#!/bin/bash
echo Commencing mass rename.
for file in $(echo $PWD); do
    curInputRaw=$(identify -verbose "$file" | grep date:create)
    echo ${curInputRaw:16:21} 
done
