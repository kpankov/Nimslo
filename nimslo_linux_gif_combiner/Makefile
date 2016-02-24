CC=gcc
#CFLAGS=-g -O2 -Wall
CFLAGS=-g -Wall
LDFLAGS=-lm
SOURCES=main.c combiner.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=bin/combiner

all: $(SOURCES) $(EXECUTABLE)
	
$(EXECUTABLE): $(OBJECTS) 
	mkdir -p bin
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@
	
clean:
	rm -rf *.o EXECUTABLE
