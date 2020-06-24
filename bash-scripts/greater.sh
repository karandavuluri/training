#!/bin/bash

clear
echo "comparing two numbers"
echo "######################"
echo "enter first number:: "
read FIRST
echo "enter second number:: "
read SECOND

if [ $FIRST -gt $SECOND ] 2>/dev/null; then
	echo "Greater Number is ---> $FIRST"
elif [ $SECOND -gt $FIRST ] 2>/dev/null; then
	echo "Greater Number is ---> $SECOND"
fi