#!/bin/bash

NUM1=10
NUM2=20

Total=$(($NUM1+$NUM2))

echo "Total is: $Total"

Movies=("RRR" "PUSHPA" "DURANDHAR")
echo "Movies are: ${Movies[@]}"
echo "First Movie is ${Movies[0]}"
echo "second Movie is ${Movies[1]}"
echo "third Movie is ${Movies[2]}"