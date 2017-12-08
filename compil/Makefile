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

PATH_TO_MAINS = compil/mains/

MAIN = main_$3_$4

FLAGS = -Wall -Werror -Wextra

LIBFT_DIR = libft
LIBFT_NAME = libft.a

LIBFT = $(patsubst %, $(LIBFT_DIR)/%,$(LIBFT_NAME))

OBJ = get_next_line.o $(MAIN).o

SRC = get_next_line.c $(PATH_TO_MAINS)$(MAIN).c

.PHONY: all clean fclean re

all: $(NAME)

$(NAME) : lib
	@ gcc $(FLAGS) -g -c $(SRC) -I ./
	@ gcc $(FLAGS) -g -o $(NAME) $(OBJ) -L $(LIBFT_DIR) -lft

lib: $(LIBFT)

$(LIBFT):
	@ make -C $(LIBFT_DIR)
	@ make clean -C $(LIBFT_DIR)

clean:
	@ /bin/rm -f $(OBJ)

fclean: clean
	@ /bin/rm -f $(NAME)

re: fclean all
