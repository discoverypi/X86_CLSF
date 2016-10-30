#****************************************************************************
#
# Makefile for TinyXml test.
# Lee Thomason
# www.grinninglizard.com
#
# This is a GNU make (gmake) makefile
#****************************************************************************

# DEBUG can be set to YES to include debugging info, or NO otherwise
DEBUG          := NO

# PROFILE can be set to YES to include profiling info, or NO otherwise
PROFILE        := NO

# TINYXML_USE_STL can be used to turn on STL support. NO, then STL
# will not be used. YES will include the STL files.
TINYXML_USE_STL := YES

#****************************************************************************

PREFIX := /Pi/toolchain/tinyxml/work/pkg/toolsx

CC     := x86_64-cross-linux-gnu-gcc
CXX    := x86_64-cross-linux-gnu-g++
LD     := x86_64-cross-linux-gnu-g++
AR     := x86_64-cross-linux-gnu-ar rc
RANLIB := x86_64-cross-linux-gnu-ranlib

DEBUG_CFLAGS     := -Wall -Wno-format -g -DDEBUG -fPIC
RELEASE_CFLAGS   := -Wall -Wno-unknown-pragmas -Wno-format -O3 -fPIC 

LIBS		 :=

DEBUG_CXXFLAGS   := ${DEBUG_CFLAGS} 
RELEASE_CXXFLAGS := ${RELEASE_CFLAGS}

DEBUG_LDFLAGS    := -g
RELEASE_LDFLAGS  := -shared

ifeq (YES, ${DEBUG})
   CFLAGS       := ${DEBUG_CFLAGS}
   CXXFLAGS     := ${DEBUG_CXXFLAGS}
   LDFLAGS      := ${DEBUG_LDFLAGS}
else
   CFLAGS       := ${RELEASE_CFLAGS}
   CXXFLAGS     := ${RELEASE_CXXFLAGS}
   LDFLAGS      := ${RELEASE_LDFLAGS}
endif

ifeq (YES, ${PROFILE})
   CFLAGS   := ${CFLAGS} -pg -O3
   CXXFLAGS := ${CXXFLAGS} -pg -O3
   LDFLAGS  := ${LDFLAGS} -pg
endif

#****************************************************************************
# Preprocessor directives
#****************************************************************************

ifeq (YES, ${TINYXML_USE_STL})
  DEFS := -DTIXML_USE_STL
else
  DEFS :=
endif

#****************************************************************************
# Include paths
#****************************************************************************

#INCS := -I/usr/include/g++-2 -I/usr/local/include
INCS :=


#****************************************************************************
# Makefile code common to all platforms
#****************************************************************************

CFLAGS   := ${CFLAGS}   ${DEFS}
CXXFLAGS := ${CXXFLAGS} ${DEFS}

#****************************************************************************
# Targets of the build
#****************************************************************************

OUTPUT := xmltest

SHLIB := libtinyxml.so.2.6.2

all: ${OUTPUT} ${SHLIB}

#****************************************************************************
# Source files
#****************************************************************************

SRCS := tinyxml.cpp tinyxmlparser.cpp xmltest.cpp tinyxmlerror.cpp tinystr.cpp

# Add on the sources for libraries
SRCS := ${SRCS}

OBJS := $(addsuffix .o,$(basename ${SRCS}))

#****************************************************************************
# Output
#****************************************************************************

${OUTPUT}: ${OBJS}
	${CXX} -o $@ ${LDFLAGS} ${OBJS} ${LIBS} ${EXTRA_LIBS}

${SHLIB}: ${OBJS}
	${CXX} ${LDFLAGS} -o ${SHLIB} ${OBJS}

#****************************************************************************
# common rules
#****************************************************************************

# Rules for compiling source files to object files
%.o : %.cpp
	${CXX} -c ${CXXFLAGS} ${INCS} $< -o $@

%.o : %.c
	${CC} -c ${CFLAGS} ${INCS} $< -o $@

dist:
	bash makedistlinux

clean:
	-rm -f core ${OBJS} ${OUTPUT} ${SHLIB}

depend:
	#makedepend ${INCS} ${SRCS}

install:
	install -m 0644 tinyxml.h $(PREFIX)/include/
	install -m 0644 tinystr.h $(PREFIX)/include/
	install -m 0755 ${SHLIB} $(PREFIX)/lib
	ln -sf ${SHLIB} $(PREFIX)/lib/libtinyxml.so
	ln -sf ${SHLIB} $(PREFIX)/lib/libtinyxml.so.0
	
tinyxml.o: tinyxml.h tinystr.h
tinyxmlparser.o: tinyxml.h tinystr.h
xmltest.o: tinyxml.h tinystr.h
tinyxmlerror.o: tinyxml.h tinystr.h
