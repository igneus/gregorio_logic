# PoC: Logic in Gregorio scores

This repository contains a proof of concept related to the discussion
([1](https://groups.google.com/d/msgid/gregorio-users/4fba1e2b-f5aa-40f2-9a34-2b42e7d33c50n%40googlegroups.com),
[2](https://groups.google.com/d/msgid/gregorio-users/5bb002d7-0d7b-49c4-af6d-3a18af214726n%40googlegroups.com))
about possible
introduction of logic constructs in the [gabc](http://gregorio-project.github.io/gabc/index.html)
chant notation language.
It demonstrates that functionality like conditional use of a part of a score
or inclusion of another file's contents is readily available from existing tools,
e.g. the C preprocessor, and there is no need to add such capabilities to the gabc
language itself.

## Building

Run `make` to build the example LaTeX document.

## How it works

`Makefile` orchestrates the build:

- `.gabc.cpp` files contain gabc code and C preprocessor directives
- `cpp` (the C preprocessor) processes the directives, producing `.gabc` files with pure gabc code
  (more than one different `.gabc` files may be produced from a single `.gabc.cpp` file,
  depending on its contents)
- the `.gabc` scores are included in the LaTeX document as usual
