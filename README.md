
# M4 Macros for Electrical Circuit Diagrams in GROFF
These are modified m4 configuration files for electric circuit diagrams with groff macros. The original files meant for Latex can be found on https://www.ctan.org/tex-archive/graphics/circuit_macros.
This repo also includes a modified ms macro package `s.tmac` that adds a few things I like (Be sure to check s.tmac and the .m4 file in school/ for explanatory comments):
- A modified .NH macro for table of contents generation
- An automatic table of contents generator `.tc`: Unfortunately, starting today, table of content generation will require two or three parses of the file, the reason being that I output it to a text file that is then formatted on the page where you put the .tc commande. Check school/TD1.m4 for explanatory comments
- Figure titles and auto counter `.Fs and .Fe "title"`
- Table titles and auto counter, modified `.TS and .TE "title"`
- Figure and table index `.FT f` or `.FT t`, see school/TD1.m4 for comments
- Betters Lists `.Ls, .Li, and .Le`
- Code blocks in courier `.Ps and .Pe`
- `.Se`ction macro 

These things are heavily inspired (some modified, some not) from the extended macro package by Steve Talbott. Found on this O'Reilly book :
https://www.oreilly.com/library/view/unix-text-processing/9780810462915/Chapter17.html
The book is great, would recommend for people who want to get into text processing and roff in general.

## M4 macro documentation
The documentation can be found on https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.604.2295&rep=rep1&type=pdf. While this was intended for Latex, it works alright with groff, you only have to watch out for text formatting differences in labels.
## Instructions
If you would like to use my modified ms macros, change your /usr/share/groff/1.22.4/tmac/s.tmac to the one I have here. Note that out.m4 uses these modified macros so trying to use it may generate errors.
1. Put libgen.m4 and libcct.m4 in any directory
2. Put gpic.m4 in any directory (can be same as libgen.m4 and libcct)
3. Change the `-I` argument inside chroff to the directory containing libcct.m4 and libgen.m4
4. Change gpic.m4 argument in chroff accordingly
and with that the setup is done.

To test it:
1. Copy example from documentation or write your own in a `.m4` file
2. make sure to include eqn $$ delimiters in that .m4 file (check my out.m4)
3. Run `sudo chmod +x chroff`
4. Run chroff <name_of_file_without extension>
5. check the PDF

For a quicker example, `chmod +x chroff` and run `chroff out` after cloning this repository.
voilà.
# To do list
s.tmac :
- ~~Make a figure index that is generated after the table index~~
- ~~Have it so that I can choose which page to print which thing (toc on second page for example)~~
- *Good* pdf links
- make .tc macro more extensible
- make .FT macro more extensible

.m4 :
- Keep using this until I find something that doesn't work well and fix it
- maybe make better macros ?

## Caveats
This was made by an EE student and is a work in progress, so expect spaghetti shell script. I regularly use this for lab reports and will improve it whenever I discover problems.

# FAQ
> How do I source files for large documents/Books ?

I tried using .so in a `.ms` file but it didn't seem to work so well, so use
the `include(file)` macro in your main `.m4` file, here's the documentation
https://www.gnu.org/software/m4/manual/html_node/Include.html#Include


