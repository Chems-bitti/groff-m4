divert(-1)
  gpic.m4                       Initialization for gpic.

* Circuit_macros Version 9.6, copyright (c) 2021 J. D. Aplevich under      *
* the LaTeX Project Public Licence in file Licence.txt. The files of       *
* this distribution may be redistributed or modified provided that this    *
* copyright notice is included and provided that modifications are clearly *
* marked to distinguish them from this distribution.  There is no warranty *
* whatsoever for these files.                                              *

define(`m4picprocessor',gpic)
define(`m4postprocessor',tpic)

ifdef(`libgen_',,`include(libgen.m4)divert(-1)')dnl

define(`thinlines_',`linethick=0.4
  arrowwid = 0.05*2/3*scale; arrowht = 0.1*2/3*scale;')

define(`thicklines_',`linethick = 0.8
  arrowwid = 0.05*scale; arrowht = 0.1*scale;')

define(`linethick_',`linethick=ifelse(`$1',,`0.8',`$1')
  arrowwid = ifelse(`$1',,`0.05',linethick/0.8*0.05)*scale; dnl
  arrowht = ifelse(`$1',,`0.1',linethick/0.8*0.1)*scale;')

divert(0)dnl
