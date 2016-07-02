FILES=blocksplitter.c cache.c deflate.c gzip_container.c hash.c katajainen.c lz77.c squeeze.c tree.c util.c zlib_container.c zopfli_lib.c woff.c

all: sfnt2woff-zopfli woff2sfnt-zopfli

sfnt2woff-zopfli: sfnt2woff.c $(FILES) Makefile
	$(CC) $(LDFLAGS) $(FILES) $< -o $@ -lz -lm

woff2sfnt-zopfli: woff2sfnt.c $(FILES) Makefile
	$(CC) $(LDFLAGS) $(FILES) $< -o $@ -lz -lm

clean:
	$(RM) -r *.o *.dSYM sfnt2woff-zopfli woff2sfnt-zopfli *.gch *.out
