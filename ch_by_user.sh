#!/bin/bash

# $1 argument  path file(s) 
# $2 argument  user name
# $3 argument  path to save

FILES=`ls -la $1 | rg -i $2 | tr -s ' '| cut -d' ' -f 9`

for i in $FILES; do
    mv "$1/$i" $3 
done



