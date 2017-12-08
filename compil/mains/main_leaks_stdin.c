/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vtennero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/27 12:02:00 by vtennero          #+#    #+#             */
/*   Updated: 2017/12/06 20:22:28 by vtennero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"
#include <stdio.h>
#include <fcntl.h>

int	main(void)
{
	int		fd;
	char	**line;
	int		return_value;

	line = (char**)malloc(sizeof(char*));
	fd = 0;
	while ((return_value = get_next_line(fd, line)) == 1)
	{
		printf("%s\n", *line);
		//printf("%i\n%s\n", return_value, *line);
		free(*line);
	}
	free(*line);
	free(line);
	while (1)
		;
	return (0);
}
