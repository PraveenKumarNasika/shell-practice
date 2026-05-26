#!/bin/bash

NUM=$1

if [ $NUM -gt 20 ]; then

    echo "Number $NUM is greaterthan 20"

elif [ $NUM -eq 20 ]; then
     
     echo "Number $NUM is equal to 20"

else

    echo "Number $NUM is lessthan 20"

fi