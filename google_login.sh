#!/bin/bash
# Google Services (IMPS)
# @autor: Henrique Bissoli Silva (emp.shad@gmail.com)
# Updates: https://github.com/Shadowz3n/GoogleServices-Bash

BANNERT="\e[1m\e[5;32;40m"
INVERT="\e[7m"
RED="\e[1m\e[91m"
VERSION='0.0.1'
NC=`tput sgr0 && tput setab 9`

banner(){
	echo -e "\n\t${BANNERT}******************************************************************${NC}"
	echo -e "\t${BANNERT}*                                                                *${NC}"
	echo -e "\t${BANNERT}*               Google Services Bash Version $VERSION               *${NC}"
	echo -e "\t${BANNERT}*               Sponsored by IMPS - http://imps.pro              *${NC}"
	echo -e "\t${BANNERT}*                                                                *${NC}"
	echo -e "\t${BANNERT}******************************************************************${NC}\n\n"
	echo -e "\t${RED}${INVERT}[!]${NC} ${RED}legal disclaimer: Usage of Google Services Bash for attacking targets without prior mutual consent is illegal.\n\tIt is the end user's responsibility to obey all applicable local, state and federal laws.\n\tDevelopers assume no liability and are not responsible for any misuse or damage caused by this program${NC}\n"
}

GoogleLogin(){
	AGENT='User-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.73 Safari/537.36'
	INITIAL=`curl -s -L --cookie-jar '/tmp/google_cookies.txt' -s -H "$AGENT" "https://accounts.google.com/AddSession"`
	INITIAL=`echo $INITIAL | grep -Po '(?<=<form|<FORM>).*(?=</form|</FORM)'`
	GXF=`echo $INITIAL | grep -Po '(?<=gxf" value=").*(?="> <input id="profile)'`
	LOGIN=`curl --cookie '/tmp/google_cookies.txt' --cookie-jar '/tmp/google_cookies.txt' -s -H "$AGENT" "https://accounts.google.com/accountLoginInfoXhr" -d "Email=$1&Page=PasswordSeparationAddSession&requestlocation=https%3A%2F%2Faccounts.google.com%2FAddSession%23identifier"`
	
	echo $GXF
	exit 1
	
	if [[ $LOGIN == *email* && $INITIAL == *name=\"gxf\"* ]]; then
		echo -e "\t${BANNERT}Login OK${NC}"
	
		SECTOK=${INITIAL##*name=\"secTok\"}
		SECTOK=${SECTOK##*value=\"}
		SECTOK=${SECTOK%%\"*}
		
		PROFILE=${LOGIN##*encoded_profile_information\":\"}
		PROFILE=${PROFILE%%\"*}
		
		PASS=`curl -L --cookie '/tmp/google_cookies.txt' --cookie-jar '/tmp/google_cookies.txt' -X POST -s -H "$AGENT" "https://accounts.google.com/AddSession" -d "Page=PasswordSeparationAddSession&timeStmp=$TIMESTMP&Email=$1&Passwd=$2&identifiertoken=&identifiertoken_audio=&identifier-captcha-input=&_utf8=☃&ProfileInformation=$PROFILE&gxf=$GXF&bgresponse=js_disabled"`
		echo $PASS
		#cat '/tmp/google_cookies.txt'
	else
		echo -e "\t${RED}Login incorreto${NC}"
	fi
}

banner

if [[ $1 && $2 ]]; then
	GoogleLogin $1 $2
else
	echo "Usage: bash $0 <login> <pass>"
fi
