all: example.pdf

example.pdf: example.tex salva_nos.gtex salva_nos_paschal.gtex responsory.gtex
	lualatex example

salva_nos.gtex: salva_nos.gabc
	gregorio salva_nos.gabc
salva_nos_paschal.gtex: salva_nos_paschal.gabc
	gregorio salva_nos_paschal.gabc
responsory.gtex: responsory.gabc
	gregorio responsory.gabc

# .gabc.cpp contain macros of the C preprocessor.
# Expand them to pure gabc files:

# single .gabc.cpp file produces different .gabc files based on defined macros
salva_nos.gabc: salva_nos.gabc.cpp
	cpp salva_nos.gabc.cpp > salva_nos.gabc
salva_nos_paschal.gabc: salva_nos.gabc.cpp
	cpp -DTEMPORE_PASCHALI salva_nos.gabc.cpp > salva_nos_paschal.gabc

# file including shared snippet
responsory.gabc: responsory.gabc.cpp doxology.gabc.cpp
	cpp -P responsory.gabc.cpp > responsory.gabc
