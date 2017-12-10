# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vtennero <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/06/17 15:16:05 by vtennero          #+#    #+#              #
#    Updated: 2017/12/07 15:32:33 by tbailly-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = test_gnl

FLAGS = -Wall -Werror -Wextra

LIBFT_DIR = libft
LIBFT_NAME = libft.a

LIBFT = $(patsubst %, $(LIBFT_DIR)/%,$(LIBFT_NAME))

OBJ = get_next_line.o main.o

.PHONY: all clean fclean re

all: $(NAME)

$(NAME) : lib
	@ clang $(FLAGS) -I libft/includes -o get_next_line.o -c get_next_line.c
	@ clang $(FLAGS) -I libft/includes -o main.o -c main.c
	@ clang -o $(NAME) $(OBJ) -I libft/includes -L libft/ -lft

lib: $(LIBFT)

$(LIBFT):
	@ make -C $(LIBFT_DIR)
	@ make clean -C $(LIBFT_DIR)

clean:
	@ /bin/rm -f $(OBJ)

fclean: clean
	@ /bin/rm -f $(NAME)

re: fclean all
