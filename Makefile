#CC specifies which compiler we're using
CC = g++

#COMPILER_FLAGS specifies the additional compilation options we're using
# -w suppresses all warnings
CFLAGS = -w

DEPS = Socket.h Game.h
OBJ = Socket.o Game.o
#LINKER_FLAGS specifies the libraries we're linking against
LIBS =  -lpthread 
LIBSSDL=-lSDL2 -lSDL2_image -lSDL2_ttf

%.o: %.cc $(DEPS)
	$(CC) -g -c -o $@ $< $(CFLAGS)

all: cs cc

cs: $(OBJ) GameServer.o
	g++ -o $@ $^ $(CFLAGS) $(LIBS)

cc: $(OBJ) GameClient.o
	g++ -o $@ $^ $(CFLAGS) `pkg-config --cflags --libs sdl2` $(LIBS) $(LIBSSDL) 

.PHONY: clean

clean:
	rm -f *.o server client
#OBJS specifies which files to compile as part of the project
#OBJS = main.cc  MoruloBlestFighter.cc SDLGame.cc InputHandler.cc Vector2D.cc TexturesManager.cc FontsManager.cc Resources.cc Texture.cc Font.cc
#CC specifies which compiler we're using
#CC = g++
#LINKER_FLAGS specifies the libraries we're linking against
#LINKER_FLAGS =  -lSDL2 -lSDL2_image -lSDL2_ttf
#OBJ_NAME specifies the name of our exectuable
#OBJ_NAME = Hola  
#This is the target that compiles our executable
#all : $(OBJS)
#	$(CC) $(OBJS) $(COMPILER_FLAGS)  `pkg-config --cflags --libs sdl2` $(LINKER_FLAGS) -o $(OBJ_NAME)