#!/usr/bin/env bash

cd ~/Documents/Code/Guile/blog
haunt build
cd ..
cp -r blog/site/* git-blog-coldboot/
cp -r blog/* git-blog-coldboot/src/
cd git-blog-coldboot/src/
rm -r site
rm */*.~undo-tree~
cd ..
git add *
git commit -m "Automatic Commit @ $(date +%s)"
git push origin master
