#!/bin/bash

function isuser() {
	local has_user_name=$(cut -d: -f1 /etc/passwd | grep -o "^$1$")

	if [ "$has_user_name" = "" ]; then
		return 1
	fi
	return 0
}

echo "Informe o nome do usuário a ser consultado:"
read username

username=$(echo $username | tr [A-Z] [a-z])

if isuser "$username" ; then
	echo "$username é usuário cadastrado"
else
	echo "$username não é usuário cadastrado"
fi
