
# M4 Macros for Electric Circuit Diagrams in GROFF
These are modified m4 configuration files for electric circuit diagrams with groff macros. The original files meant for Latex can be found on https://www.ctan.org/tex-archive/graphics/circuit_macros

## M4 macro documentation
The documentation can be found on https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.604.2295&rep=rep1&type=pdf. While this was intended for Latex, it works alright with groff, you only have to watch out for text formatting differences in labels.
## Instructions
1. Put libgen.m4 and libcct.m4 in any directory
2. Put gpic.m4 in any directory (can be same as libgen.m4 and libcct)
3. Change the `-I` argument inside chroff to the directory containing libcct.m4 and libgen.m4
4. Change gpic.m4 argument in chroff accordingly
and with that the setup is done. To test it:
1. Copy example from documentation or write your own in a `.m4` file
2. Run chroff <name_of_file_without extension>
3. check the PDF

For a quicker example, run `chroff out` after cloning this repository.
voilà.

## Caveats
This was made by an EE student and is a work in progress, so expect spaghetti shell script. I regularly use this for lab reports and will improve it whenever I discover problems.


