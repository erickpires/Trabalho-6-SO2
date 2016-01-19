#!/bin/bash

function print_numbers() {
	echo "Valores lidos: $1 e $2"
}

function soma() {
	echo "$1 + $2 = $(($1 + $2))"
}

echo "Valor 1"
read left_num
echo "Valor 2"
read right_num

print_numbers $left_num $right_num
soma $left_num $right_num
