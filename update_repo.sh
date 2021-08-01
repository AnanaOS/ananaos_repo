#!/bin/bash

# Getting new packages

git pull

# Going to the right folder
cd x86_64

# Deleting all files except the packages
rm -rf harpy_repo*

# Creating new database
repo-add harpy_repo.db.tar.gz *.pkg.tar.zst

# Asking if the user want to push the changes

echo "Do you want to push the changes to the repository? (y/n leave blank to yes)"

read askPush

if [ "$askPush" == "y" ] || [ "$askPush" == "" ]
    then

    # Putting the new packages in the repo
    git add *

    echo "Write here the changes you made"
    read Commit

    git commit -m "$Commit"

    git push
fi