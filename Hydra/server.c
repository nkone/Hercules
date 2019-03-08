/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: phtruong <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/03/08 09:47:28 by phtruong          #+#    #+#             */
/*   Updated: 2019/03/08 14:38:24 by phtruong         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#define PORT 10000
#define BUFF_SIZE 100

struct sockaddr_in servaddr;

int	main(void)
{
	char	str[BUFF_SIZE];
	int		listen_fd;
	int		comm_fd;
	char	*ping;

	ping = "ping";
	listen_fd = socket(AF_INET, SOCK_STREAM, 0);
	servaddr.sin_family = AF_INET;
	servaddr.sin_addr.s_addr = htons(INADDR_ANY);
	servaddr.sin_port = htons(PORT);
	bind(listen_fd, (struct sockaddr *)&servaddr, sizeof(servaddr));
	listen(listen_fd, 3);
	comm_fd = accept(listen_fd, (struct sockaddr*)NULL, NULL);
	while (1)
	{
		bzero(str, BUFF_SIZE);
		read(comm_fd, str, BUFF_SIZE);
		printf("Echoing: |%s|\n", str);
		if (strcmp(str, ping) == 0)
			write(comm_fd, "pong pong\n", 10);
		else
			write(comm_fd, "If ping then pong pong\n", \
					sizeof("If ping then pong pong\n"));
	}
}
