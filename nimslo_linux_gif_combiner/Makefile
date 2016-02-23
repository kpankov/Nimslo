CC=gcc
#CFLAGS=-g -O2 -Wall
CFLAGS=-Wall
LDFLAGS=
SOURCES=main.c combiner.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=bin/combiner

all: $(SOURCES) $(EXECUTABLE)
	
$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@
	
clean:
	rm -rf *.o EXECUTABLE 
