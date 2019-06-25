#!/bin/bash

function usage() {
	echo "Usage: $0 [cmd]"
	echo " commands are: bash, firefox, ff, ffremote, config"
}

if [[ "a$1" == "a" ]] ; then
	/opt/firefox/firefox --no-remote
elif [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]] ; then
	usage
	exit 0
else
	if ! [[ "$1" =~ ^(bash|shell|firefox|ff|ffremote|config)$ ]] ; then
		echo "Sorry, unknown command $1"
		usage
		exit 1
	elif [[ "$1" =~ ^(firefox|ff)$ ]] ; then
		/opt/firefox/firefox --no-remote
	elif [[ "$1" =~ ^(ffremote)$ ]] ; then
		/opt/firefox/firefox
	elif [[ "$1" =~ ^(bash|shell)$ ]] ; then
		/bin/bash
	elif [[ "$1" =~ ^(config)$ ]] ; then
		itweb-settings
	fi
fi
