#!/bin/sh
: '
9) Write a shell script finder-app/finder.sh as described below:

Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem, referred to below as filesdir; the second argument is a text string which will be searched within these files, referred to below as searchstr

Exits with return value 1 error and print statements if any of the parameters above were not specified

Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem

Prints a message "The number of files are X and the number of matching lines are Y" where X is the number of files in the directory and all subdirectories and Y is the number of matching lines found in respective files, where a matching line refers to a line which contains searchstr (and may also contain additional content).

'

if [ $# -ne 2 ]; then
    echo "2 arguments need to be provided"
    exit 1
fi

filesdir=$1

if [ -d "${filesdir}" ]; then
    :
else
    echo "${filesdir} is not a valid directory!"
    exit 1
fi

searchstr=$2

X=$(grep -rl "${searchstr}" "${filesdir}" | wc -l)
Y=$(grep -or "${searchstr}" "${filesdir}" | wc -l)

echo "The number of files are ${X} and the number of matching lines are ${Y}"



