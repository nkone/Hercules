# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    author.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phtruong <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/05 10:23:26 by phtruong          #+#    #+#              #
#    Updated: 2019/04/05 21:02:06 by phtruong         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m' #no color

if [ "$#" -ne 1 ] ; then
	echo "${RED}usage:${NC} sh $0 ${CYAN}dir_path"
else
	DIR=$1
	read -p "Enter author: " USER
	echo $USER > $DIR/author
fi
	exit 0
