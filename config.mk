# st version
VERSION = 0.6

# Customize below to fit your system

# paths
PREFIX = ${HOME}/.local
MANPREFIX = ${PREFIX}/share/man

X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

# includes and libs
INCS = -I. -I/usr/include -I${X11INC} \
       `pkg-config --cflags fontconfig` \
       `pkg-config --cflags freetype2`
LIBS = -L/usr/lib -L${X11LIB} \
	-lc -lrt \
	-lutil \
	-l:libXext.a \
	-l:libXft.a -l:libXrender.a -l:libX11.a -pthread -l:libxcb.a \
	-l:libXau.a -l:libXdmcp.a \
	-l:libfontconfig.a -l:libfreetype.a -l:libexpat.a -l:libz.a -l:libpng12.a \
	-ldl -lm

# flags
CPPFLAGS = -DVERSION=\"${VERSION}\" -D_XOPEN_SOURCE=600 -D_FORTIFY_SOURCE=2
CFLAGS += -g -std=c99 -pedantic -Wall -Wvariadic-macros -Os -ftrapv -ffunction-sections -fdata-sections -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security ${INCS} ${CPPFLAGS}
LDFLAGS += -g -Wl,--as-needed -Wl,-Bsymbolic-functions -Wl,-z,relro -Wl,-z,now -Wl,--hash-style=gnu -Wl,--no-copy-dt-needed-entries ${LIBS}

# compiler and linker
# CC = cc

