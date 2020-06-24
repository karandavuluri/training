#!/bin/bash

echo "one"
echo "two"

echo "enter choice:"
read CHOICE

case $CHOICE in
	1) 
echo "chossen 1" ;;
    2)
echo "chossen 2" ;;
    *)
echo "wrong option"

		;;
esac