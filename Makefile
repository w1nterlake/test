all: main.o
	g++ -o a.out $<
main.o: main.cpp
	g++ -c -o $@ $<