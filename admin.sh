#!/bin/bash
# last update : 08/04/2019
clear;clear
GREEN=$(tput setaf 2) #HIJAU
WHITE=$(tput setaf 7) #PUTIH
CYAN=$(tput setaf 6) #CYAN
RED=$(tput setaf 1) #MERAH
NORMAL=$(tput sgr0)
coun=2
threads=18
function check(){
wget -q --spider http://google.com
if [ $? -eq 0 ]; then
    echo "online ..."
else
    echo "hidupkan koneksi internet.."
fi
if [[ ! -z $(command -v lynx) ]]; then
	printf ""
else
	sleep 2
	apt install grep && apt install gawk; apt install lynx
	printf "selesai terinstall.\n"
fi
return
}
function banner(){
printf "${RED}
\t[ c0der by widhisec       ]
\t[ admin finder with bash  ]
\t\033[0;36mPowered by ZseCc0de-Crew.ID
"
}
function scanlgsg(){
fc=$(lynx -head -dump "$urls/$x" | grep -n "1" | cut -d "8" -f1 | cut -d "6" -f3 | cut -d "9" -f6 | cut -d "5" -f1 | tr -d "4" | grep --text "1:.*" | awk '/:/{print $2}')
status; return
}
status(){
printf "${GREEN}STATUS : ${WHITE}%s$fc => $urls/$x \n"
}
printf ""
banner
echo -e -n $CYAN'[*]'$WHITE"URL HERE :" 
read urls
echo -e -n $CYAN'[?]'$WHITE"LIST HERE :" 
read lisz
if [ ! -e $lisz ]; then
printf "empaz Not found\n"
exit
fi
N=10
(
for x in $(cat $lisz);do 
    ((i=i%N)); ((i++==0)) && wait
    scanlgsg "$lisz" &
    wait
done
)
