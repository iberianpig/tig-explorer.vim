#!/bin/bash

# make temporary tigrc
tmp_tigrc_path=/tmp/.tigrc
# TODO: detect config file path XDG_CONFIG/SYSTEM_CONFIG
cp ~/.tigrc $tmp_tigrc_path
open_file_info=/tmp/tig_explorer_current_file

# Overwriting temporary tigrc

edit_cmd='edit' # edit on existing tab
echo "bind generic e <sh -c \"echo $edit_cmd +%(lineno) %(file) > $open_file_info\"" >> /tmp/.tigrc
echo "bind generic <C-o> <sh -c \"echo $edit_cmd +%(lineno) %(file) > $open_file_info\"" >> /tmp/.tigrc

edit_cmd='tabedit' # edit on new tab
echo "bind generic <C-t> <sh -c \"echo $edit_cmd +%(lineno) %(file) > $open_file_info\"" >> /tmp/.tigrc

edit_cmd='vsplit' # edit on existing tab
echo "bind generic <C-v> <sh -c \"echo $edit_cmd +%(lineno) %(file) > $open_file_info\"" >> /tmp/.tigrc

edit_cmd='split' # edit on existing tab
echo "bind generic <C-s> <sh -c \"echo $edit_cmd +%(lineno) %(file) > $open_file_info\"" >> /tmp/.tigrc
