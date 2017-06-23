NAME = zadanie

$(NAME): $(NAME).o
	ld -o $(NAME) $(NAME).o
	rm $(NAME).o
	./$(NAME)

$(NAME).o: $(NAME).s
	as -g -o $(NAME).o $(NAME).s
