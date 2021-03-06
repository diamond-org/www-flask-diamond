#!/bin/bash
# (cc) 2016 diamond-patterns

if [ -f /usr/local/rvm/scripts/rvm ]; then
    source /usr/local/rvm/scripts/rvm
fi

pushd "/home/private/blog"

echo $PWD

# load installation settings
source .settings.conf

# update the repo
export GIT_DIR=".git"
git checkout media
git pull

# build
make clean build

# publish
rsync -acv --delete _site/ "${PUBLISH_PATH}"

# clean up
make clean
rm -rf media
