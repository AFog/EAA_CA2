#!/bin/bash

echo "Idle n Co" >> results.dat

for i in {1..50}
do
    ./loadtest $i &
    idle=$(mpstat 1 10 | awk 'NR==14{print $12}')
    pkill loadtest
    echo $idle " " $i " " $(wc -l synthetic.dat | awk '{print $1}') >> results.dat

done
