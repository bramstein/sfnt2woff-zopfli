# Create WOFF files with Zopfli compression

This is a modified version of the [sfnt2woff utility](https://people.mozilla.org/~jkew/woff/) that uses Zopfli as a compression algorithm instead of zlib. This results in compression gains of — on average — 5-8% compared to regular WOFF files. Zopfli generates compressed output that is compatible with regular zlib compression so the resulting WOFF files can be used everywhere.

##Usage

To create a WOFF file from an OpenType files:

    > sfnt2woff [-v <maj>.<min>] [-m <metadata.xml>] [-p <private.dat>] <otffile>

Options:

    -v <maj>.<min>     set font version number (major and minor, both integers)
    -m <metadata.xml>  include metadata from <metadata.xml> (not validated)
    -p <private.dat>   include private data block

To decompress a WOFF file and write the OpenType file to stdout:

    > woff2sfnt [-v | -m | -p] <woff>

Options:

    -v   write font version to stdout
    -m   write WOFF metadata block to stdout
    -p   write private data block to stdout

## Compiling

To compile the utilities, run make:

    > make

This will compile two utilities `sfnt2woff` to convert OpenType files to WOFF and `woff2sfnt` to convert WOFF files back to OpenType files. If the build was succesful you can make them available on your system by copying the resulting executables to `/usr/local/bin` and making them executable (`chmod 755`).

## Licensing

The WOFF portion of the code is taken from [sfnt2woff](https://people.mozilla.org/~jkew/woff/), which is licensed under the MPL/GPL/LGPL. The [Zopfli implementation](https://code.google.com/p/zopfli/) is licensed under the Apache License. My modifications to `woff.c` are also licensed under the MPL/GPL/LGPL.

## Alternative

You can also use the [ttf2woff tool](http://wizard.ae.krakow.pl/~jb/ttf2woff/), which also converts OpenType files to WOFF using Zopfli, but is exclusively licensed under the GPL.
