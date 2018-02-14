/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vtennero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/27 12:02:00 by vtennero          #+#    #+#             */
/*   Updated: 2018/02/13 15:42:19 by vtennero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>

int	main(int ac, char **av)
{
	int		fd;
	char	**line;
	int		return_value;

	line = (char**)malloc(sizeof(char*));
	if (ac == 2)
	{
		fd = open(av[1], O_RDONLY);
		while ((return_value = get_next_line(fd, line)) == 1)
		{
			printf("%s\n", *line);
			//printf("%i\n%s\n", return_value, *line);
			if (fd >= 0)
				free(*line);
		}
		if (fd >= 0)
		{
			free(*line);
			free(line);
		}
		close(fd);
		while (1)
			;
	}
	return (0);
}
