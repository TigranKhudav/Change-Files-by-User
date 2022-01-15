#!/bin/bash

# $1 argument  path file(s) 
# $2 argument  user name
# $3 argument  path to save

if [ -n "$1" ] && [ -n "$2" ] && [ -n "$3" ]; then # check arguments
    if [ -d $1 ]; then # check directory
        ls -la $1 | tr -s ' '| cut -d' ' -f 3 | grep -w $2 &>/dev/null
        if [ $? -eq 0 ]; then #check user files
            if [ -d $3 ]; then
                FILES=`ls -la $1 | grep -i $2 | tr -s ' '| cut -d' ' -f 9`
                
                for i in $FILES; do
                    mv "$1/$i" $3 
                done
                
            else
                echo "Please write correct path for save!"
                echo "$3 is not a directory!"
            fi
        else
            echo "No file with this \"$2\" username was found in the specified directory!"
        fi
    else
        echo "Please write correct file(s) path!"
        echo "$1 is not a directory!"
    fi

else
    echo "Please write [ path file(s) ] [ user name ] [ path to save ]"
fi

