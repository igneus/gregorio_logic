CPP=cpp -P

all: example.pdf

example.pdf: example.tex salva_nos.gabc salva_nos_paschal.gabc responsory.gabc
	lualatex example

# .gabc.cpp contain macros of the C preprocessor.
# Expand them to pure gabc files:

# single .gabc.cpp file produces different .gabc files based on defined macros
salva_nos.gabc: salva_nos.gabc.cpp
	$(CPP) salva_nos.gabc.cpp > salva_nos.gabc
salva_nos_paschal.gabc: salva_nos.gabc.cpp
	$(CPP) -DTEMPORE_PASCHALI salva_nos.gabc.cpp > salva_nos_paschal.gabc

# file including shared snippet
responsory.gabc: responsory.gabc.cpp doxology.gabc.cpp
	$(CPP) responsory.gabc.cpp > responsory.gabc
