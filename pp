#!/bin/bash
TxRx="wlan0"
dirx=${1:-"./"}
if [ "$1" = "-h" ] ||[ "$1" = "--h" ] || [ "$1" = "-help" ] || [ "$1" = "--help" ];then
name="\e[1m\e[34m$(basename $0)\e[0m\e[0m"
echo -e "\nThis script Creates a \"\e[4m\e[1mpython -m http.server\e[0m\e[0m\" for a File OR Directory\n\nThe script requires \e[4m\e[1m\e[32mone\e[0m\e[0m\e[0m(\e[1m\e[33m1\e[0m\e[0m) Argument\nA directory PATH OR a file  PATH \nTHE \e[32mDEFAULT\e[0m directory used, is you current directory (\e[34m./\e[0m)\n\n\e[4m\e[1mUsage\e[0m\e[0m:\n\e[1m\e[31mNOTE\e[0m\e[0m: Running only $name without any Argument defaults to \e[1m./\e[0m\n   $name -> will be $name \e[34m./\e[0m" ;
else
echo -e "\n"
ip addr show $TxRx | grep "$TxRx$"
echo -e "\n\nCreating Server for:     $dirx\n\n"
python -m http.server -d $dirx
fi
