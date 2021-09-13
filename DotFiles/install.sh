#!/bin/bash

readyToInstall=no

#Installing required programs


while [[ "$readyToInstall" != "Y" ]] 
do
	#Getting the user options
	echo "-----WELCOME-----"
	read -p "Would you like to install the base programs [Y/n] " basePrograms
	read -p "Would you like to copy the config files [Y/n] " copyFiles


	
	#Setting the option to yes if no option is selected
	if [ -z $basePrograms ]
	then 
		basePrograms="Y"
	fi

	if [ -z $copyFiles ]
	then 
		copyFiles="Y"
	fi

	
  	#Confirming the options of the user
	printf "\n"
	echo "-----OPTIONS-----"
	echo "Base programs: $basePrograms"
	echo "Copy files: $copyFiles"	
	
	read -p "Are these the settings you would like	[Y/n] " readyToInstall
	
	#Have to do this cuz cant figure out how to do or statement in while loop
	if [ -z $readyToInstall ] || [ "$readyToInstall" == 'y' ]
	then
		readyToInstall="Y"
	fi


done

clear

#Installing the base programs required for the setup
if [ "$basePrograms" == "y" ] || [ "$basePrograms" == 'Y' ] 
then 
	echo "Installing base programs"
	sudo pacman -S bspwm dunst kitty polybar rofi sxhkd zathura ranger

elif [ "$basePrograms" == "n" ] || [ "$basePrograms" == 'N' ]
then
	echo "Skipping install of base programs"

else
	echo "Invalid option"
fi

#Copying the config files to the correct locations
if [ "$copyFiles" == 'y' ] || [ "$copyFiles" == 'Y' ]
then 
	echo "Installing configs"
	sudo cp -r bspwm ~/.config
	sudo cp -r dunst ~/.config
	sudo cp -r kitty ~/.config
	sudo cp -r polybar ~/.config
	sudo cp -r rofi ~/.config
	sudo cp -r sxhkd ~/.config
	sudo cp -r zathura ~/.config
	sudo cp .bashrc ~
	sudo cp -r ranger ~/.config
	echo "Copied succesfully"

elif [ "$copyFiles" == "n" ] || [ "$copyFiles" == 'N' ]
then
	echo "Skipping config installation"


else
	echo "Invalid option"
fi
