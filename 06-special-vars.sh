#!/bin/bash

echo "all the varaibles paased to the script: $@"
echo "no.of variables passed to the script: $#"
echo "first script: $1"
echo "script name: $0"
echo "who is running script: $USER"
echo "home dirctory: $HOME"
echo "which directory: $PWD"
echo "PID of the current script: $$"
sleep 5 &
echo "PID of the current background process: $!"
wait $!
echo "Line number: $LINENO"
echo "Script executed in $SECONDS seconds"
echo "Random Number: $RANDOM"
echo "Exit code of the prevoius command: $?"
