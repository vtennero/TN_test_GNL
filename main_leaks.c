/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tbailly- <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/26 21:15:47 by tbailly-          #+#    #+#             */
/*   Updated: 2017/12/06 20:11:20 by vtennero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <sys/stat.h>
#include <stdio.h>
#include "get_next_line.h"


#include<stdio.h>
int	main(int argc, char **argv)
{
	int		fd;
	int		a;
	char	**line;

	a = -1000;
	fd = -1000;
	line = NULL;
	if (argc != 2)
		return (0);
	line = (char**)malloc(sizeof(char*));
	fd = open(argv[1], O_RDONLY);
	//fd = 0;
	//a = get_next_line(fd, line);
	while ((get_next_line(fd, line)) == 1)
	{
		printf("%iLINE %s\n", a, *line);
		free(*line);
	}
	free(*line);
	/*a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);
	a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);
	a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);
	a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);
	a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);
	a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);
	a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);
	a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);
	a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);
	a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);
	a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);
	a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);
	a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);
	a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);
	a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);
	a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);
	a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);
	a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);
	a = get_next_line(fd, line);
	printf("%iLINE %s\n", a, *line);
	free(*line);)*/
	free(line);
	/*char 	*str;
	int		len = 50;

	str = (char *)malloc(1000 * 1000);
	*str = '\0';
	while (len--)
		strcat(str, "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in leo dignissim, gravida leo id, imperdiet urna. Aliquam magna nunc, maximus quis eleifend et, scelerisque non dolor. Suspendisse augue augue, tempus");
	if (str)
		write(fd, str, strlen(str));*/
	while (1)
		;
	return (0);
}
