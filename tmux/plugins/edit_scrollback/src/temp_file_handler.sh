#!/usr/bin/env bash

temp_file_path=$1
keep_temp_file=$2

case "$keep_temp_file" in
    "keep")
        echo "Temp file saved at $temp_file_path"
        ;;
    "delete")
        rm -f $temp_file_path
        echo "Temp file $temp_file_path removed"
        ;;
    "prompt")
        read -r -p "Do you want to keep the temp file? [y/N] " keep_file
        case $keep_file in
            [yY])
                echo "Temp file saved at $temp_file_path"
                ;;
            [nN]*)
                rm -f $temp_file_path
                ;;
        esac
        ;;
esac
