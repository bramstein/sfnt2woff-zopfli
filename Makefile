FILES=zopfli/blocksplitter.c zopfli/cache.c zopfli/deflate.c zopfli/gzip_container.c zopfli/hash.c zopfli/katajainen.c zopfli/lz77.c zopfli/squeeze.c zopfli/tree.c zopfli/util.c zopfli/zlib_container.c zopfli/zopfli_lib.c woff.c

all: sfnt2woff-zopfli woff2sfnt-zopfli

sfnt2woff-zopfli: sfnt2woff.c $(FILES) Makefile
	$(CC) -Izopfli $(LDFLAGS) $(FILES) $< -o $@ -lz -lm

woff2sfnt-zopfli: woff2sfnt.c $(FILES) Makefile
	$(CC) -Izopfli $(LDFLAGS) $(FILES) $< -o $@ -lz -lm

clean:
	$(RM) -r *.o *.dSYM sfnt2woff-zopfli woff2sfnt-zopfli *.gch *.out
