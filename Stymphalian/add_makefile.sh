# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    add_makefile.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phtruong <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/05 13:48:58 by phtruong          #+#    #+#              #
#    Updated: 2019/04/05 14:45:22 by phtruong         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [ "$#" -ne 1 ] ; then
	echo "usage: sh $0 dir_path"
else
	DIR=$1
	PATH=${DIR}/Makefile
	read -p "Enter project name: " name
	echo "NAME = $name" > $PATH
	echo "CC = gcc -Wall -Wextra -Werror -I. -c" >> $PATH
	echo "INCL = ./libft/libft.a" >> $PATH
	echo "OBJS = *.o" >> $PATH
	echo "SRCS = *.c" >> $PATH
	echo "MAKE = make -C libft/ fclean && make -C libft/\n" >> $PATH
	echo "all:" >> $PATH
	echo '	@$(MAKE)'>> $PATH
	echo '	@$(CC) -o $(NAME) $(SRCS) $(INCL)' >> $PATH
	echo "" >> $PATH
	echo "clean:" >> $PATH
	echo '	@rm $(OBJS)' >> $PATH
	echo "" >> $PATH
	echo "fclean: clean" >>$PATH
	echo '	@rm $(NAME)' >> $PATH
	echo "" >> $PATH
	echo "re: fclean all" >> $PATH
fi
	exit 0
