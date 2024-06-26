# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gmunoz <gmunoz@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/06/19 16:48:58 by gmunoz            #+#    #+#              #
#    Updated: 2024/06/20 16:45:01 by gmunoz           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Color Aliases
DEFAULT = \033[0;39m
GRAY = \033[0;90m
RED = \033[0;91m
GREEN = \033[0;92m
YELLOW = \033[0;93m
BLUE = \033[0;94m
MAGENTA = \033[0;95m
CYAN = \033[0;96m
WHITE = \033[0;97m

# Key Codes for Linux
ESC = KEY_ESC=65307
W = KEY_W=119
A = KEY_A=97
S = KEY_S=115
D = KEY_D=100
UP = KEY_UP=65362
DOWN = KEY_DOWN=65364
LEFT = KEY_LEFT=65361
RIGHT = KEY_RIGHT=65363
R = KEY_R=114
Q = KEY_Q=113

#Properties for Linux
LEAKS =  valgrind --leak-check=full --show-leak-kinds=all -s -q 
LMLX = -lmlx -lXext -lX11
GAME = game_linux.c
RENDER = render_linux.c
GRATE = GAME_RATE=80
CDEBUG =

# Compiler
CC = gcc	

# Compiler flags
CFLAGS      = -Wall -Werror -Wextra -I/usr/include -Imlx_linux
MLX_FLAGS   = -Lmlx_linux -lmlx_Linux -L/usr/lib -Imlx_linux -lXext -lX11 -lm -lz

# Source files
SRCS = main.c

# Object files
OBJS = $(SRCS:.c=.o)

# Header file
HEADER = push_swap.h

# Executable name
NAME = so_long

# Default NAME
all: $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Link object files into the executable
$(NAME): $(OBJS)
	@$(MAKE) -C mlx_linux
	$(CC) $(OBJS) $(MLX_FLAGS) -o $(NAME)

# Clean up generated files
clean:
	@$(MAKE) clean -C mlx_linux
	rm -f $(OBJS)

# Clean up everything
fclean:
	rm -f $(NAME) $(OBJS)

# Re-compile everything
re: fclean all

.PHONY: all clean fclean re