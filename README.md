# Github cannot link to the sha of a tag

 * [test.sh initial commit](https://github.com/dgtized/linking-tags-by-sha/blob/5d0a2b84b746bf5241c0d89d4d706191685fa3f2/test.sh)
 * [test.sh by tag](https://github.com/dgtized/linking-tags-by-sha/blob/4377df0c66ed23c7bc594da1c6b03c744915fd2d/test.sh)

`$ /test.sh > README.md 2>&1`

```
+ PAGER=cat
+ rm -rf .git
+ git init
Initialized empty Git repository in /home/clgc/test/.git/
+ touch .gitignore
+ git add test.sh
+ git commit -m 'initial commit'
[master (root-commit) 3a449eb] initial commit
 1 file changed, 29 insertions(+)
 create mode 100755 test.sh
+ git add .gitignore
+ git commit -m 'add gitignore'
[master 5d0a2b8] add gitignore
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 .gitignore
+ git tag -a -m 'a tag' named-tag master
+ git tag -l
named-tag
++ git rev-parse master
+ BRANCH=5d0a2b84b746bf5241c0d89d4d706191685fa3f2
++ git rev-parse named-tag
+ TAG=4377df0c66ed23c7bc594da1c6b03c744915fd2d
+ git show 5d0a2b84b746bf5241c0d89d4d706191685fa3f2
commit 5d0a2b84b746bf5241c0d89d4d706191685fa3f2
Author: Charles Comstock <dgtized@gmail.com>
Date:   Sat Feb 28 17:58:27 2015 -0600

    add gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..e69de29
+ git show 4377df0c66ed23c7bc594da1c6b03c744915fd2d
tag named-tag
Tagger: Charles Comstock <dgtized@gmail.com>
Date:   Sat Feb 28 17:58:27 2015 -0600

a tag

commit 5d0a2b84b746bf5241c0d89d4d706191685fa3f2
Author: Charles Comstock <dgtized@gmail.com>
Date:   Sat Feb 28 17:58:27 2015 -0600

    add gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..e69de29
+ git remote add origin git@github.com:dgtized/linking-tags-by-sha.git
+ git push -u origin master
X11 forwarding request failed
To git@github.com:dgtized/linking-tags-by-sha.git
 * [new branch]      master -> master
Branch master set up to track remote branch master from origin.
+ git push origin named-tag
X11 forwarding request failed
To git@github.com:dgtized/linking-tags-by-sha.git
 * [new tag]         named-tag -> named-tag
+ curl -sI https://github.com/dgtized/linking-tags-by-sha/blob/master/test.sh
+ head -1
HTTP/1.1 200 OK
+ curl -sI https://github.com/dgtized/linking-tags-by-sha/blob/named-tag/test.sh
+ head -1
HTTP/1.1 200 OK
+ curl -sI https://github.com/dgtized/linking-tags-by-sha/blob/5d0a2b84b746bf5241c0d89d4d706191685fa3f2/test.sh
+ head -1
HTTP/1.1 200 OK
+ curl -sI https://github.com/dgtized/linking-tags-by-sha/blob/4377df0c66ed23c7bc594da1c6b03c744915fd2d/test.sh
+ head -1
HTTP/1.1 404 Not Found
```
