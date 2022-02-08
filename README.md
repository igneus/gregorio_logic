Simple logic in Gregorio scores using the C preprocessor.

Run `make` to build example LaTeX document.

`Makefile` orchestrates the build:

- `.gabc.cpp` files contain gabc code and C preprocessor directives
- `cpp` (the C preprocessor) processes the directives, producing `.gabc` files with pure gabc code
  (more than one different `.gabc` files may be produced from a single `.gabc.cpp` file,
  depending on its contents)
- the `.gabc` scores are included in the document as usual
