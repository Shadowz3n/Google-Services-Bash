#!/bin/bash
# Google Services (IMPS)
# @autor: Henrique Bissoli Silva (emp.shad@gmail.com)
# Updates: https://github.com/Shadowz3n/Google-Services-Bash

if [[ $1 && $2 ]]; then
	AGENT='User-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.73 Safari/537.36'
	COOKIE=`curl -I -s -H "$AGENT" "https://accounts.google.com/AddSession"`
	#LOGIN=`curl -L -H "$COOKIE" -H "$AGENT" "https://accounts.google.com/accountLoginInfoXhr" -d "Email=$1&requestlocation=https%3A%2F%2Faccounts.google.com%2FAddSession%23identifier"`
	echo $COOKIE
else
	echo "Usage: bash ./$0 <login> <pass>"
fi
