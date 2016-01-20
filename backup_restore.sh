#!/bin/bash

function backup() {
    local dir_files=$(ls $current_dir)
    local back_dir_files=$(ls $backup_dir/$(basename $(pwd)))
    local equal=0

    #verifying what already exists
    for obj in $dir_files; do
        equal=0
        for obj_b in $back_dir_files; do
            if [ "$obj" = "$obj_b" ]; then
                equal=1
                break
            fi
        done

        if [ $equal -eq 0 ]; then
            echo "copying..."
            cp $obj $backup_dir/$(basename $(pwd))/.
            equal=0
        fi
    done
}


# if [ diff -q --brief obj _b obj ]; then
#     #eh diferente
# else
#     #eh igual
# fi



function restore() {
    local dir_files=$(ls $current_dir)
    local back_dir_files=$(ls $backup_dir/$(basename $(pwd)))
    local equal=0
}


backup_dir="$HOME/.backup_SO2"
current_dir=$PWD

if [ ! -d "$backup_dir" ]; then
    echo "creating"
    mkdir -p $backup_dir/$(basename $(pwd))
fi

if [ $# -ne 1 ]; then
    echo "somente um argumento. backup ou restore"
    exit
fi

if [ "$1" = "backup" ]; then
    backup
    exit
fi

if [ "$1" = "restore" ]; then
    restore
    exit
fi
