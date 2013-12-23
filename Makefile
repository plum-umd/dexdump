CC = gcc

PRG = a.out

SRC = dexdump/DexDump.c dexdump/OpCodeNames.c \
	libdex/CmdUtils.c libdex/DexCatch.c libdex/DexClass.c \
	libdex/DexDataMap.c libdex/DexFile.c libdex/DexInlines.c \
	libdex/DexProto.c libdex/DexSwapVerify.c libdex/InstrUtils.c \
	libdex/Leb128.c libdex/OptInvocation.c libdex/sha1.c \
	libdex/SysUtil.c libdex/ZipArchive.c safe_iop/safe_iop.c

OBJ = $(SRC:.c=.o)

CFLAGS = -c -O3 -I.

LDFLAGS = -lz

all: $(SRC) $(PRG)

$(PRG): $(OBJ)
	$(CC) $(LDFLAGS) $(OBJ) -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -rf *.o dexdump/*.o libdex/*.o safe_iop/*.o a.out

