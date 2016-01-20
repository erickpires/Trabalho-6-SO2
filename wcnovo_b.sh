#!/bin/bash

function get_files() {
	local dir=$(ls $1)
    local return_list=""

	for file in $dir; do
        if [ -f "$1/$file" ]; then
            if [ "$return_list" != "" ]; then
                return_list="$return_list $1/$file"
            else
                return_list="$1/$file"
            fi
        fi
    done

    echo $return_list
}

function get_lines_words_sum() {
    words=$(wc -w "$1" | cut -d " " -f 1)
    lines=$(wc -l "$1" | cut -d " " -f 1)
    echo "File $1 has $words words and $lines lines"
    total_lines=$(($total_lines + $lines))
    total_words=$(($total_words + $words))
}

filenames=$(get_files $PWD)
total_lines=0
total_words=0

for file in $filenames; do
    get_lines_words $file $total_lines $total_words
done

echo "Total lines: $total_lines and Total words: $total_words"
