#!/bin/sh

installer(){
	# adding necessary files to the user's home
	# directory for the application to be able to run
	cd "$HOME"
	[ -f events.txt ] || [ -f guests.txt ] || [ -f rooms.txt ] && \
	echo "Error: make sure there aren't already 'events.txt', 'guests.txt' and 'rooms.txt' files present in the home($HOME) directory" && exit 1
	touch events.txt guests.txt rooms.txt
	echo "Project successfully set up for running"
}

uninstaller(){
	# removing the files from the user's home directory
	cd "$HOME"
	if [ -f events.txt ] || [ -f guests.txt ] || [ -f rooms.txt ]
	then
		rm events.txt guests.txt rooms.txt 2> /dev/null
		echo "Project setup successfully uninstalled"
	else
		echo "Error: project is already unset, hence does not require uninstalling"
		exit 1
	fi
}

usage(){
	printf "\e[1mUSAGE\e[0m\n\t$0 install\n\t$0 uninstall\n\n\e[1mCOMMANDS\e[0m\n\tinstall        sets the project up for running/debugging\n\tuninstall      unsets the project and cleans up\n\n"
}


if [ "$1" = "install" ]
then
	installer
elif [ "$1" = "uninstall" ]
then
	uninstaller
else
	if [ "$1" != "" ]
	then
		echo -e "Error: unexpected argument passed: \"$1\"\n"
	fi
	usage
fi