# When using the bundled Zopfli library, this is a list of sources to compile.
# To use an external Zopfli library, override it with the path to a static
# library, or with something like -lzopfli.
ZOPFLI_LIBS=zopfli/blocksplitter.c \
	    zopfli/cache.c \
	    zopfli/deflate.c \
	    zopfli/gzip_container.c \
	    zopfli/hash.c \
	    zopfli/katajainen.c \
	    zopfli/lz77.c \
	    zopfli/squeeze.c \
	    zopfli/tree.c \
	    zopfli/util.c \
	    zopfli/zlib_container.c \
	    zopfli/zopfli_lib.c
# When not using the bundled Zopfli library, this should normally be overridden
# with the empty string to avoid finding bundled Zopfli headers.
ZOPFLI_CFLAGS=-Izopfli

FILES=woff.c

all: sfnt2woff-zopfli woff2sfnt-zopfli

sfnt2woff-zopfli: sfnt2woff.c $(FILES) Makefile
	$(CC) $(CPPFLAGS) $(CFLAGS) $(ZOPFLI_CFLAGS) \
		$(FILES) $< -o $@ \
		$(LDFLAGS) $(ZOPFLI_LIBS) -lz -lm

woff2sfnt-zopfli: woff2sfnt.c $(FILES) Makefile
	$(CC) $(CPPFLAGS) $(CFLAGS) $(ZOPFLI_CFLAGS) \
		$(FILES) $< -o $@ \
		$(LDFLAGS) $(ZOPFLI_LIBS) -lz -lm

clean:
	$(RM) -r *.o *.dSYM sfnt2woff-zopfli woff2sfnt-zopfli *.gch *.out
