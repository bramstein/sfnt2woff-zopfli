FILES=blocksplitter.c cache.c deflate.c gzip_container.c hash.c katajainen.c lz77.c squeeze.c tree.c util.c zlib_container.c zopfli_lib.c woff.c

all: sfnt2woff woff2sfnt

sfnt2woff: sfnt2woff.c $(FILES) Makefile
	$(CC) $(LDFLAGS) $(FILES) $< -o $@ -lz

woff2sfnt: woff2sfnt.c $(FILES) Makefile
	$(CC) $(LDFLAGS) $(FILES) $< -o $@ -lz

clean:
	$(RM) -r *.o *.dSYM
