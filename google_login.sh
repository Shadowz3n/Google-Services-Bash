#!/bin/bash
# Google Services (IMPS)
# @autor: Henrique Bissoli Silva (emp.shad@gmail.com)
# Updates: https://github.com/Shadowz3n/Google-Services-Bash

BANNERT="\e[1m\e[5;32;40m"
INVERT="\e[7m"
RED="\e[1m\e[91m"
NC=`tput sgr0 && tput setab 9`

banner(){
	echo -e "\n\t${BANNERT}******************************************************************${NC}"
	echo -e "\t${BANNERT}*                                                                *${NC}"
	echo -e "\t${BANNERT}*                      WPExploit Version $VERSION                   *${NC}"
	echo -e "\t${BANNERT}*               Sponsored by IMPS - http://imps.pro              *${NC}"
	echo -e "\t${BANNERT}*                                                                *${NC}"
	echo -e "\t${BANNERT}******************************************************************${NC}\n\n"
	echo -e "\t${RED}${INVERT}[!]${NC} ${RED}legal disclaimer: Usage of wpexploit for attacking targets without prior mutual consent is illegal.\n\tIt is the end user's responsibility to obey all applicable local, state and federal laws.\n\tDevelopers assume no liability and are not responsible for any misuse or damage caused by this program${NC}\n"
}

if [[ $1 && $2 ]]; then
	AGENT='User-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.73 Safari/537.36'
	COOKIE=`curl -I -s -H "$AGENT" "https://accounts.google.com/AddSession"`
	#LOGIN=`curl -L -H "$COOKIE" -H "$AGENT" "https://accounts.google.com/accountLoginInfoXhr" -d "Email=$1&requestlocation=https%3A%2F%2Faccounts.google.com%2FAddSession%23identifier"`
	echo $COOKIE
else
	echo "Usage: bash ./$0 <login> <pass>"
fi