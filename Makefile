CC=g++

PTHREADINCLUDE=C:/cygwin64/usr/i686-pc-mingw32/sys-root/mingw/include
EIGENINCLUDE=C:/vs_dev_lib/include
PTHREADLIB=C:/cygwin64/usr/i686-pc-mingw32/sys-root/mingw/lib/libpthread.a 

OPTIMIZE=-O3
CFLAGS=-large-address-aware $(OPTIMIZE) -pthread -I$(PTHREADINCLUDE) -I$(EIGENINCLUDE) -c -std=c++11 -Wall
LDFLAGS=$(PTHREADLIB) -lstdc++

SOURCEPATH=src
SOURCES=$(SOURCEPATH)/aabb.cpp \
		$(SOURCEPATH)/collision.cpp \
		$(SOURCEPATH)/cuboidfluidsource.cpp \
		$(SOURCEPATH)/fluidbrickgrid.cpp \
		$(SOURCEPATH)/fluidsimulation.cpp \
		$(SOURCEPATH)/fluidsimulationsavestate.cpp \
		$(SOURCEPATH)/fluidsource.cpp \
		$(SOURCEPATH)/grid3d.cpp \
		$(SOURCEPATH)/implicitpointprimitive.cpp \
		$(SOURCEPATH)/implicitsurfacescalarfield.cpp \
		$(SOURCEPATH)/interpolation.cpp \
		$(SOURCEPATH)/levelset.cpp \
		$(SOURCEPATH)/levelsetfield.cpp \
		$(SOURCEPATH)/logfile.cpp \
		$(SOURCEPATH)/macvelocityfield.cpp \
		$(SOURCEPATH)/main.cpp \
		$(SOURCEPATH)/particlemesher.cpp \
		$(SOURCEPATH)/polygonizer3d.cpp \
		$(SOURCEPATH)/sparseimplicitsurfacescalarfield.cpp \
		$(SOURCEPATH)/sparsepolygonizer3d.cpp \
		$(SOURCEPATH)/spatialpointgrid.cpp \
		$(SOURCEPATH)/sphericalfluidsource.cpp \
		$(SOURCEPATH)/stopwatch.cpp \
		$(SOURCEPATH)/surfacefield.cpp \
		$(SOURCEPATH)/threading.cpp \
		$(SOURCEPATH)/trianglemesh.cpp \
		$(SOURCEPATH)/turbulencefield.cpp \
		$(SOURCEPATH)/vmath.cpp
		
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=fluidsim

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@
	
clean:
	rm $(SOURCEPATH)/*.o $(EXECUTABLE)