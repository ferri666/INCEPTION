# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ffons-ti <ffons-ti@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/24 13:09:41 by ffons-ti          #+#    #+#              #
#    Updated: 2024/04/24 13:09:42 by ffons-ti         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all : up

up : 
	@sudo docker-compose -f ./srcs/docker-compose.yml up -d

down : 
	@sudo docker-compose -f ./srcs/docker-compose.yml down

stop : 
	@sudo docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@sudo docker-compose -f ./srcs/docker-compose.yml start

status : 
	@sudo docker ps
