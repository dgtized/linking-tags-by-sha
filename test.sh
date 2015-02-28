#!/bin/bash -ex

PAGER=cat
rm -rf .git
git init
touch .gitignore

git add test.sh
git commit -m "initial commit"

git add .gitignore
git commit -m "add gitignore"
git tag -a -m "a tag" named-tag master
git tag -l
BRANCH=`git rev-parse master`
TAG=`git rev-parse named-tag`

git show $BRANCH
git show $TAG

git remote add origin git@github.com:dgtized/linking-tags-by-sha.git
git push -u origin master
git push origin named-tag

curl -sI https://github.com/dgtized/linking-tags-by-sha/blob/master/test.sh | head -1
curl -sI https://github.com/dgtized/linking-tags-by-sha/blob/named-tag/test.sh | head -1
curl -sI https://github.com/dgtized/linking-tags-by-sha/blob/$BRANCH/test.sh | head -1
curl -sI https://github.com/dgtized/linking-tags-by-sha/blob/$TAG/test.sh | head -1

