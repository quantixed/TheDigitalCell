#!/usr/bin/env bash
set -x
trap read debug
# this bash script will execute line-by-line
# go to the Desktop
cd ~/Desktop
# make a directory
mkdir my_folder
# is it there?
ls -d */
# go to my_folder
cd my_folder
# to see what you are doing, display my_folder in Finder or equivalent
# make two text files
echo "Is this the real life?" > a.txt
echo "Is this just fantasy?" > b.txt
# check that you have two files called a.txt and b.txt
ls
# join them together
cat a.txt b.txt > c.txt
# have a look at the file, and then use q to quit
less c.txt
# editing the file is possible using nano, use ctrl+x to quit
nano c.txt
# copy this file out of our folder to the desktop and change its name
cp c.txt ../d.txt
# now move the file from the desktop into our folder
mv ../d.txt d.txt
# we can clean up by removing a file with rm
rm a.txt
# or we can remove all files and then delete our folder
cd ~/Desktop
rm my_folder/*
rmdir my_folder/
