#!/bin/bash

echo "Enter Your age: "

read age

if [ "$age" -gt 18 ]
then
	echo "Horray! You are eligible!"

else
	echo "Try again when you are 18!"
fi
