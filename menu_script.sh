#!/bin/bash
# Travis Schilling
# 11/27/16
# CS140U Assignment 6
# This is a simple command menu program. Several options are available via a case system.

#until loop menu that requires user input
until [ "$character" = "k" ]
	do
		echo "Command Menu"
		echo
		echo "a. Emailer Program"
		echo "b. Users Currently Logged On"
		echo "c. Current Date and Time"
		echo "d. This Month's Calendar"
		echo "e. Name of the Working Directory"
		echo "f. Contents of the Working Directory"
		echo "g. Find the IP of a Web Address"
		echo "h. See Your Fortune"
		echo "i. Print a File (on the screen)"
		echo "j. Clear Previous Input"
		echo "k. Exit"
		echo
		#prompt for input
		echo -n "Please select a letter: "
		read character
		case $character in
		a|A)
			#allow user to send email		
			echo "This program will allow you to send an email to a user."
			echo "A file can be attached to the email."
			echo
			# prompt for subject
			echo -n "Enter the subject of the email: "
			read emailMessage
			echo
			# prompt for email address
			echo -n "Enter the email address of the receipient: "
			read emailAddress
			echo
			# prompt for file name
			echo -n "Enter the name of the file to be attached: "
			read emailFile
			#send email based on user input
			mail -s "$emailMessage" "$emailAddress"<"$emailFile"
			echo
			read -n 1 -s -p "Press any key to continue..."
			;;
			
		b|B)
			# list users currently logged onto system
			who
			echo
			read -n 1 -s -p "Press any key to continue..."
			;;
		c|C)
			# display current date and time
			date
			echo
			read -n 1 -s -p "Press any key to continue..."
			;;
		d|D)
			# display calendar function
			cal
			echo
			read -n 1 -s -p "Press any key to continue..."
			;;
		e|E)
			# show current directory
			pwd
			echo
			read -n 1 -s -p "Press any key to continue..."
			;;
		f|F)
			# display files in current directory
			ls
			echo
			read -n 1 -s -p "Press any key to continue..."
			;;
		g|G)
			# prompt for URL input before displaying IP address
			echo -n "Enter the URL of the site whose IP address you wish to see: "
			read hostname
			dig +short $hostname
			echo
			read -n 1 -s -p "Press any key to continue..."
			;;
		h|H)
			# display random fortune via the fortune command
			fortune
			echo
			read -n 1 -s -p "Press any key to continue..."
			;;
		i|I)
			# prompt user for file name input
			# display contents of file one screen at a time
			echo -n "Enter the name of the file you wish to see: "
			read filename
			cat | more $filename
			echo
			read -n 1 -s -p "Press any key to continue..."
			;;
		j|J)
			# clear previous text before returning to menu
			clear
			;;
		k|K)
			#exit program due to condition being fulfilled in loop
			;;
		*)	
			echo
			# error message if a-k not entered
			echo ""$character" is out of the range a-k. Try again."
			echo
	
		esac
done
