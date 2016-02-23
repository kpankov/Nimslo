CC=gcc
CFLAGS=-g -O2 -Wall
LDFLAGS=
SOURCES=main.c getarg.c qprintf.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=bin/makegif

all: $(SOURCES) $(EXECUTABLE)
	
$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@ -lgif -Wl,-rpath,/usr/local/lib

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@
	
clean:
	rm -rf *.o EXECUTABLE 

#gcc -o bin/makegif.elf libgetarg.a main.o getarg.o qprintf.o /usr/local/lib/libgif.a
