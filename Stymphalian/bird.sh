# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    bird.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phtruong <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/05 14:52:09 by phtruong          #+#    #+#              #
#    Updated: 2019/04/05 21:01:31 by phtruong         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'



cat bird.txt
if [[ ("$1" == "-h" || "$1" == "-help") && $# == 1 ]] ; then
	echo "Hi, this is a script to help create a Makefile, author and add libft"
	echo "In create mode, you may have options to add choose which language 
to work with to generate a gitignore file, whether to include libft, or to generate
a template of a Makefile (currently using for Fillit), or create subfolders
for organization"
	echo "use the option -c to get started"
elif [[ ("$1" == "-c" || "$1" == "-create") && $# == 1 ]] ; then
	# Ask user what which path to work with
	read -p "Enter project path you wish to use: " PRO_DIR
	read -p "Name your project folder: " PRO_FOLDER
	DIR=$PRO_DIR/$PRO_FOLDER
	mkdir $DIR
	echo "Folder created @ $DIR"
	
	# Ask user which language to work with
	read -p "What language would you like to work with: " LANG
	if [[ "$LANG" == "C" || "$LANG" == "c" ]] ; then
		echo "Ok, I only know that anyways"
	else
		echo "I only know C so I'll just choose C for you xD"
	fi
	echo "${GREEN}Creating gitignore file for C${NC}"
	sh gitignore.sh $DIR

	# Ask user for author file
	while true; do
		read -p "Would you like to create author file? (y/n): " yn
		case $yn in
			[Yy]* ) sh author.sh $DIR; break;;
			[Nn]* ) break;;
			* ) echo "Please answer y or n...";;
		esac
	done

	# Ask for libft folder creation
	while true; do
		read -p "[31mWould you like to add libft? (y/n):[0m " yn
		case $yn in
			[Yy]* ) sh add_libft.sh $DIR; break;;
			[Nn]* ) break;;
			* ) echo "${YELLOW}Please answer y or n...${NC}";;
		esac
	done
	echo "${GREEN}Added libft @ $DIR${NC}"

	# Ask for Makefile creation
	while true; do
		read -p "[33mWould you like to add a Makefile? (y/n):[1m " yn
		case $yn in
			[Yy]* ) sh add_makefile.sh $DIR; break;;
			[Nn]* ) break;;
			* ) echo "${YELLOW}Please answer y or n...${NC}";;
		esac
	done
	echo "${GREEN}Made Makefile${NC}"

	# Ask for subfolder creation
	while true; do
		read -p "[36mWould you like to create subfolders for src/incl/obj? (y/n):[0m " yn
		case $yn in
			[Yy]* ) mkdir $DIR/src; mkdir $DIR/obj; mkdir $DIR/incl; break;;
			[Nn]* ) break;;
			* ) echo "${YELLOW}Please answer y or n...${NC}";;
		esac
	done
	echo "${GREEN}Subfolders created${NC}"
	echo "Program will now exit, good luck on your project"
else
	echo "usage: sh $0 [-h or -help to know what the script do]"
	echo "		[-c or -create for create mode]"
fi
	exit 0
