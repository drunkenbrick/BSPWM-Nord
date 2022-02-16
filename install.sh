#!/bin/bash

readyToInstall=no

#Installing required programs


while [[ "$readyToInstall" != "Y" ]] 
do
	clear
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

	#creating bspwm locations
	sudo cp -r BaseDots/bspwm ~/.config

	#creating sxhkd locations
	sudo cp -r BaseDots/sxhkd ~/.config

elif [ "$basePrograms" == "n" ] || [ "$basePrograms" == 'N' ]
then
	echo "Skipping install of base programs"

else
	echo "Invalid option"
fi

#Copying the config files to the correct locations
if [ "$copyFiles" == 'y' ] || [ "$copyFiles" == 'Y' ]
then 
	mv BaseDots/dot.bashrc BaseDots/.bashrc

	echo "Installing configs"
	
	sudo cp -r BaseDots/dunst ~/.config
	sudo cp -r BaseDots/kitty ~/.config
	sudo cp -r BaseDots/polybar ~/.config
	sudo cp -r BaseDots/rofi ~/.config
	sudo cp -r BaseDots/zathura ~/.config
	sudo cp BaseDots/.bashrc ~
	sudo cp -r BaseDots/ranger ~/.config
	echo "Copied succesfully"

elif [ "$copyFiles" == "n" ] || [ "$copyFiles" == 'N' ]
then
	echo "Skipping config installation"


else
	echo "Invalid option"
fi
