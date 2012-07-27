#!/bin/sh
for i in `find $(pwd)/dotfiles/ -maxdepth 1`; do
  original_file=`basename $i`
  ln -snfv $i ~/.${original_file}
done
