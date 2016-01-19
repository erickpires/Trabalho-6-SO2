#!/bin/bash

function read_number() {
	echo "Digite um valor"
	local value
	read value

	if [ "$value" = "ans" ]; then
		if [ "$ans" = "" ]; then
			echo "ANS não tem valor definido"
			return 1
		else
			value=$ans
		fi
	fi

	# TODO: Test whether value is a number or not
	eval $1='$value'
}

function print_numbers() {
	echo "Valores lidos: $1 e $2"
}

function opera() {
	ans=$(($1 $3 $2))
	echo "ans = $1 $3 $2 = $ans"
}

while true; do
	echo "Escolha (1) para Adição"
	echo "Escolha (2) para Subtração"
	echo "Escolha (3) para Multiplicação"
	echo "Escolha (4) para Divisão"
	echo "Escolha (5) para Resto da divisão"
	echo "Escolha (6) para Sair"

	read choosen

	case $choosen in
		"1" ) operator='+' ;;
		"2" ) operator='-' ;;
		"3" ) operator='*' ;;
		"4" ) operator='/' ;;
		"5" ) operator='%' ;;
		"6" ) exit 0 ;;
		*	)
			 echo "Entrada Inválida"
			 continue
	esac

	if ! read_number left_num; then continue; fi
	if ! read_number right_num; then continue; fi

	print_numbers $left_num $right_num
	opera "$left_num" "$right_num" "$operator"
done
