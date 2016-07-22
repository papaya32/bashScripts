#!/bin/bash

user=$1
pass=$2
mode=$3  #reference for what we're doing to the password file

passwdFile="/etc/mosquitto/passwd"

if [ $mode = 1 ] #if we're making a new user
then
	mosquitto_passwd -b $passwdFile $user $pass
else
	if [ $mode = 2 ] #password change
	then
		#remove line with username
		awk '!/$user/' $passwdFile > temp && mv temp $passwdFile
		#recreate the user
		mosquitto_passwd -b $passwdFile $user $pass
	fi
fi
service mosquitto restart
