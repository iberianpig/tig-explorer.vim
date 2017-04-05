#!/bin/bash

/bin/echo "$1 $2" > /tmp/vim_tig_current_file

# kill parent process(tig)
kill $PPID
