#!/bin/bash

clear
echo "Printing numbers 1 to 10"
echo "########################"

i=1
while [ $i -le 10 ]; do
	echo "Printing Number $i"
	i=`expr $i + 1`
done