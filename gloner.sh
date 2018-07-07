#!/bin/bash
###
read -d '' banner <<- EOF
╔═╗┬  ┌─┐┌┐┌┌─┐┬─┐
║ ╦│  │ ││││├┤ ├┬┘
╚═╝┴─┘└─┘┘└┘└─┘┴└─
     Coded By Z3r0

Imagine that you have list of GITs that you want to clone
all of them in your local machine. I think cloning them
one by one, is boring, So, witl "Gloner", you can do this
easily and in automated way.
EOF
###
echo -e "$banner\n"
###
read -p "[*] Enter the path that you want to download into it(Please remember that path should NOT end with /): " downpath
###
if [ -d "$downpath" ]; then
	if [ -L "$downpath" ]; then
		#its symlink
		echo "[!] Its not a Directory, its a symlink"
		exit 1
	else
		read -p "[*] Enter path of text file that contains git addresses: " textpath
		if [ ! -f "$textpath" ]; then
			echo "[!] File not exists"
			exit 1
		else
			while read line; do
				#echo $line
				a=($(echo $line | tr "/" "\n"))
				######echo "${a[3]}"
				######echo "${downpath::-3}"
				######echo "$downpath/${a[3]}"
				mkdir -p "$downpath/${a[3]}"
				git clone -v "$line" "$downpath/${a[3]}"
			done <$textpath
		fi
		#do gits
	fi
else
	echo "[!] Directory not exists"
	exit 1
fi
