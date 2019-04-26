# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    add_libft.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phtruong <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/05 13:13:31 by phtruong          #+#    #+#              #
#    Updated: 2019/04/05 15:58:31 by phtruong         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

if [ "$#" -ne 1 ] ; then
	echo "${RED}usage:${NC} sh $0 ${CYAN} project_path"
else
	read -p "Enter libft path you wish to use: " DIR
	PRO=$1
	echo "Pulling libft from $DIR to $PRO"
	cp -R $DIR $PRO
fi
	exit 0
