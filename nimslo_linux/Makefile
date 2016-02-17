CC=g++

CPPFLAGS+= -c
CPPFLAGS+= -I ./include
#CPPFLAGS+= /usr/include/
CPPFLAGS+= `pkg-config opencv --cflags --libs`

LDFLAGS+= `pkg-config opencv --libs`
C_SRC=main.cpp
C_OBJS=$(C_SRC:.cpp=.o)
EXECUTABLE=bin/nimslo

all: $(C_SRC) $(EXECUTABLE)
	
$(EXECUTABLE): $(C_OBJS) 
	$(CC) $(LDFLAGS) $(C_OBJS) -o $@

.cpp.o:
	$(CC) $(CPPFLAGS) $< -o $@

clean:
	rm -rf *.o EXECUTABLE