# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ssh.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phtruong <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/05/10 11:33:10 by phtruong          #+#    #+#              #
#    Updated: 2019/05/10 11:54:29 by phtruong         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [ "$1" == "user" ] ; then
	ssh nkone@127.0.0.1 -p3742
else
	echo "usage: sh $0 [user]"
fi
	exit 0
