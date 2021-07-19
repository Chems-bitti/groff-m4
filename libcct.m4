divert(-1)
  libcct.m4

* Circuit_macros Version 9.6, copyright (c) 2021 J. D. Aplevich under      *
* the LaTeX Project Public Licence in file Licence.txt. The files of       *
* this distribution may be redistributed or modified provided that this    *
* copyright notice is included and provided that modifications are clearly *
* marked to distinguish them from this distribution.  There is no warranty *
* whatsoever for these files.                                              *

define(`libcct_')
ifdef(`libgen_',,`include(libgen.m4)divert(-1)')

`==============================================================================
HINTS:

THE ARGUMENTS of circuit elements are optional; if omitted, default values
   are assumed.

TWO-TERMINAL ELEMENTS are constructed as follows, with variations:

   # Draw the initial invisible line (default length rp_len), and set the
   #   direction cosines:
   eleminit_(`$1')

   # Element body height and width
   define(`m4v',...)define(`m4h',...)

   # Visible lines:
   { line to rvec_(rp_len/2-m4h/2,0)
     (element body lines)
     line to rvec_(rp_len/2-m4h/2,0) }

   # The invisible body block:
   {[box invis ht_ m4v wid_ m4h ] at rvec_(rp_len/2,0)}

   # The final invisible line:
   line to rvec_(rp_len,0) invis

A side effect of the eleminit_ macro is to change the current drawing angle.

NON-TWO-TERMINAL ELEMENTS are usually constructed within a block:

   set dimension parameters
   [ set size and direction from the initial linespec argument
     set orientation
     draw internal elements
     define internal locations
     ]

   If there is a linespec argument, it determines orientation
   but not the placement of the element, since [] blocks are placed
   as if they were boxes.

==============================================================================
CUSTOMIZATIONS:

   The non-two-terminal circuit elements enclosed in [] blocks allow
   a final argument not shown in the argument list.  The last argument is
   expanded just before exit from the [] block to allow custom additions
   to the elements.

   Subcomponents of a circuit element are drawn selectively according
   to a "dna_" string and a sequence of calls to sc_draw(`dna_',arg2,arg3,arg4).
   If the second argument of sc_draw is a substring of the first, it is deleted
   from the first and the third argument is expanded, otherwise the fourth
   argument (which may be null) is expanded.

==============================================================================

DEBUGGING: The statement
     print "`$0'($@)" ;
   inserted into a macro will display the macro name and current arguments
   Similarly, the m4 macro m4msg( text ) will display the text during m4
   processing.

==============================================================================
 This file redefines default arrow dimensions and the dotrad_ macro.
=============================================================================='

                                `capacitor( linespec,chars,R,height,wid )
                                 Arg2 chars:
                                  [d]F or blank: flat plates; d=hatched fill
                                  [d]C = polarized, curved plate; d=variable
                                  E = polarized rectangular plates
                                  K = filled rectangular plates
                                  M = rectangular plates
                                  N = one rectangular plate
                                  P = alternate polarized
                                  + = polarity sign to right of drawing dir
                                  +L =polarity sign to left
                                 arg3 = R: reversed orientation
                                 arg4 = height (defaults F: dimen_/3;
                                          C,P: dimen_/4; E,K: dimen_/5)
                                 arg5 = wid (defaults F: height*0.3;
                                          C,P: height*0.4; E,K: height) '
define(`capacitor',
`ifelse(`$3',R,`reversed(`capacitor',`$1',`$2',,shift(shift(shift($@))))',
 `eleminit_(`$1')
  define(`dna_',`ifelse(`$2',,F,`$2')')dnl
 { sc_draw(`dna_',F,
   `define(`m4cht',`ifelse(`$4',,`dimen_/3',`($4)')')dnl
    define(`m4cwd',`ifelse(`$5',,`m4cht*0.3',`($5)')')dnl
      line to rvec_(rp_len/2-m4cwd/2,0)
      {line from rvec_(0,-m4cht/2) \
          to rvec_(0,m4cht/2)}
      ifelse(m4a,d,`for_(1,3,1,{line from rvec_(0,m4cwd*(m4x-5/2)) \
        to rvec_(m4cwd,m4cwd*(m4x-3/2))})')
      move to rvec_(m4cwd,0)
      {line from rvec_(0,-m4cht/2) \
          to rvec_(0,m4cht/2)}
      line to rvec_(rp_len/2-m4cwd/2,0) ')
  sc_draw(`dna_',C,
   `define(`m4cht',`ifelse(`$4',,`dimen_/4',`($4)')')dnl
    define(`m4cwd',`ifelse(`$5',,`m4cht*0.4',`($5)')')dnl
    define(`m4cr',`dimen_*0.25')dnl
     line to rvec_(rp_len/2-m4cwd/2,0)
     {line from rvec_(0,-m4cht/2) \
          to rvec_(0,m4cht/2)}
     {arc cw ifelse(m4a,d,-> wid lthick*4 ht lthick*4) \
        from rvec_(m4cwd,-m4cht/2) \
          to rvec_(m4cwd,m4cht/2) \
        with .c at rvec_(m4cwd+sqrt((m4cr)^2-(m4cht/2)^2),0) }
     line from last arc.c+vec_(-m4cr,0) \
          to rvec_(rp_len/2+m4cwd/2,0) ')
  sc_draw(`dna_',P,
   `define(`m4cht',`ifelse(`$4',,`dimen_/4',`($4)')')dnl
    define(`m4cwd',`ifelse(`$5',,`m4cht*0.4',`($5)')')dnl
    define(`m4cr',`dimen_*0.25')dnl
     line to rvec_(rp_len/2-m4cwd/2,0)
     {line from rvec_(m4cwd,-m4cht/2) \
          to rvec_(0,-m4cht/2) \
        then to rvec_(0,m4cht/2) \
        then to rvec_(m4cwd,m4cht/2) }
     {line from rvec_(m4cwd*2/3,-m4cht*3/8) \
          to rvec_(m4cwd*2/3,m4cht*3/8)}
     line from rvec_(m4cwd*2/3,0) \
          to rvec_(rp_len/2+m4cwd/2,0) ')
  sc_draw(`dna_',E,
   `define(`m4cht',`ifelse(`$4',,`dimen_/5',`($4)')')dnl
    define(`m4cwd',`ifelse(`$5',,`m4cht',`($5)')')dnl
    define(`m4cs',`(m4cwd/3.2)')dnl
     line to rvec_(rp_len/2-m4cwd/2,0)
     m4linethicktemp = linethick; thinlines_
     { lbox(m4cs,m4cht) }
     move to rvec_(m4cwd,0)
     {ifsvg(`lbox(-m4cs,m4cht,fill_(0))',`m4fshade(m4fill,lbox(-m4cs,m4cht))')}
     linethick_(m4linethicktemp)
     line to rvec_(rp_len/2-m4cwd/2,0) ')
  sc_draw(`dna_',M,
   `define(`m4cht',`ifelse(`$4',,`dimen_/5',`($4)')')dnl
    define(`m4cwd',`ifelse(`$5',,`m4cht',`($5)')')dnl
    define(`m4cs',`(m4cwd/3.2)')dnl
     line to rvec_(rp_len/2-m4cwd/2,0)
     m4linethicktemp = linethick; thinlines_
     { lbox(m4cs,m4cht) }
     move to rvec_(m4cwd,0)
     { lbox(-m4cs,m4cht) }
     linethick_(m4linethicktemp)
     line to rvec_(rp_len/2-m4cwd/2,0) ')
  sc_draw(`dna_',K,
   `define(`m4cht',`ifelse(`$4',,`dimen_/5',`($4)')')dnl
    define(`m4cwd',`ifelse(`$5',,`m4cht',`($5)')')dnl
    define(`m4cs',`(m4cwd/3.2)')dnl
      line to rvec_(rp_len/2-m4cwd/2,0)
      {ifsvg(`lbox(m4cs,m4cht,fill_(0))',`m4fshade(m4fill,lbox(m4cs,m4cht))')}
      move to rvec_(m4cwd,0)
      {ifsvg(`lbox(-m4cs,m4cht,fill_(0))',`m4fshade(m4fill,lbox(-m4cs,m4cht))')}
      line to rvec_(rp_len/2-m4cwd/2,0) ')
  sc_draw(`dna_',N,
   `define(`m4cht',`ifelse(`$4',,`dimen_/5',`($4)')')dnl
    define(`m4cwd',`ifelse(`$5',,`m4cht*2/3',`($5)')')dnl
    define(`m4cs',`(m4cwd/3.2*3/2)')dnl
      line to rvec_(rp_len/2-m4cwd/2,0)
      { lbox(m4cs,m4cht) }
      move to rvec_(m4cwd,0)
      {line from rvec_(0,m4cht/2) to rvec_(0,-m4cht/2) }
      line to rvec_(rp_len/2-m4cwd/2,0) ')
  }
  ifinstr(`$2',+L,
   `{ move to rvec_(rp_len/2-m4cwd/2-m4cht/3,m4cht/3)
      {line thick 0.5 from rvec_(m4cht/6,0) \
          to rvec_(-m4cht/6,0)}
      line thick 0.5 from rvec_(0,m4cht/6) \
          to rvec_(0,-m4cht/6)}',
   `$2',+,
   `{ move to rvec_(rp_len/2-m4cwd/2-m4cht/3,-m4cht/3)
      {line thick 0.5 from rvec_(m4cht/6,0) \
          to rvec_(-m4cht/6,0)}
      line thick 0.5 from rvec_(0,m4cht/6) \
          to rvec_(0,-m4cht/6)}')
  {[box invis ht_ m4cht wid_ m4cwd ] at rvec_(rp_len/2,0)}
  line to rvec_(rp_len,0) invis ')')

                                `resistor( linespec, cycles, chars, cycle wid)
                                 cycles: default 3
                                 chars : E=ebox
                                         ES=ebox with slash
                                         Q=offset
                                         H=squared
                                         N=IEEE (default)
                                         B=not burnable
                                         V=varistor variant
                                         R=to right of drawing direction
                                 arg4: cycle width (default dimen_/6)'
define(`resistor',
`define(`m4h',`ifelse(`$4',,`dimen_/6',`($4)')/4')dnl
 ifinstr(
 `$2',E,
   `ebox(`$1',shift(shift($@)))',
 `$3',ES,
   `ebox(`$1',shift(shift(shift($@))))
    {line from last line.c+vec_(m4wd*0.3,m4ht/2) \
            to last line.c+vec_(-m4wd*0.3,-m4ht/2)}
    line invis from 2nd last line.start to 2nd last line.end',
 `$3',E,
   `ebox(`$1',shift(shift(shift($@))))',
 `$3',V,
   `M4_varistor($@)',
 `define(`dna_',ifelse(`$3',,N,`$3',R,N,`$3'))dnl
  eleminit_(`$1')
  sc_draw(`dna_',N,
   `define(`m4n',`ifelse(`$2',,6,`eval(2*($2))')')dnl  Default resistor:
    define(`m4v',2)dnl
    if m4h*m4n*2 > rp_len then { eleminit_(to rvec_(m4h*m4n*2,0)) }
    tr_xy_init(last line.c, m4h, sc_draw(`dna_',R,-))dnl
    { line from last line.start to tr_xy(-m4n,0)\
      for_(2,m4n,2,
        `then to tr_xy(eval(2*m4x-3-m4n), m4v) \
         then to tr_xy(eval(2*m4x-1-m4n),-m4v) \')dnl
         then to tr_xy(m4n, 0) \
         then to last line.end
      [box invis ht_ m4h*m4v*2 wid_ m4h*m4n*2] at 2nd last line.c
      }')
  sc_draw(`dna_',Q,
   `define(`m4n',`ifelse(`$2',,6,`eval(2*($2))')')dnl
    define(`m4v',2)dnl
    if m4h*m4n*2 > rp_len then { eleminit_(to rvec_(m4h*m4n*2,0)) }
    tr_xy_init(last line.c, m4h, sc_draw(`dna_',R,-))dnl
    { line from last line.start to tr_xy(-m4n,0)\
      for_(2,m4n,2,
       `then to tr_xy(eval(2*m4x-2-m4n), m4v*2) \
        then to tr_xy(eval(2*m4x-m4n),0) \')dnl
        then to tr_xy(m4n, 0) \
        then to last line.end
      [box invis ht_ m4h*m4v*2 wid_ m4h*m4n*2] at 2nd last line.c + ta_xy(0,m4v)
      }')
  sc_draw(`dna_',H,
   `define(`m4n',`ifelse(`$2',,5,`eval(2*($2)-1)')')dnl
    define(`m4hh',`m4h*6/5')dnl
    define(`m4v',7/3)dnl
    if m4hh*m4n*2 > rp_len then { eleminit_(to rvec_(m4hh*m4n*2,0)) }
    tr_xy_init(last line.c, m4hh, sc_draw(`dna_',R,-))dnl
    { line from last line.start to tr_xy(-m4n,0)\
      for_(-m4n,m4n,2,
       `ifelse(eval(((m4x+m4n)/2)%2),0,
         `then to tr_xy(m4x,m4v) \
          then to tr_xy(eval(m4x+2),m4v) \',
         `then to tr_xy(m4x,0) \
          ifelse(m4x,m4n,,`then to tr_xy(eval(m4x+2),0)')\')')dnl
      then to tr_xy(m4n, 0) \
      then to last line.end
      [box invis ht_ m4hh*m4v wid_ m4hh*m4n*2] at 2nd last line.c+(0,m4hh*m4v/2)
      }')
  sc_draw(`dna_',B,
   `resistor(`$1',`$2',dna_,`$4'); M4LBC: last line.c
    m4lbwd = last [].wid_+lthick*2; m4lbht = last [].ht_+lthick*2
    [lbox(m4lbwd,m4lbht,thick 0.4)] with .c at M4LBC
    [lbox(m4lbwd+2bp__,m4lbht+2bp__,thick 0.4)] with .c at M4LBC ')
#
  line invis from 2nd last line.start to 2nd last line.end ')')

define(`M4_varistor',`eleminit_(`$1')
   define(`m4wd',`dimen_/2')dnl
   define(`m4ht',`dimen_/4')dnl
   {line to rvec_(max(0,rp_len/2-m4wd/2),0)
   {m4fshade(m4fill,line to rvec_(0,ifinstr(`$3',R,,-)m4ht/2) \
        then to rvec_(m4wd/2,0) \
        then to Here)}
    move to rvec_(m4wd,0)
    m4fshade(m4fill,line to rvec_(0,ifinstr(`$3',R,-)m4ht/2) \
        then to rvec_(-m4wd/2,0) \
        then to Here)
    line to rvec_(max(0,rp_len/2-m4wd/2),0) }
  {[box invis ht_ m4ht wid_ m4wd] at rvec_(rp_len/2,0)}
   line to rvec_(rp_len,0) invis ')

                         `potentiometer(linespec, cycles,
                            fractional pos, length, fractional pos, length,...)
                          Resistor in a block, tapped at fractional positions
                          with specified (possibly negative) arrow lengths.
                          Taps are labelled T1, T2, ...
                          Uses side effects of resistor macro'
define(`potentiometer',`[R: resistor(`$1',`$2')
  Start: R.start; End: R.end; C: 0.5 between Start and End
  m4pot_arrows(1,ifelse(`$3',,0.5,`$3'),ifelse(`$4',,`dimen_*5/12',`$4'),
  shift(shift(shift(shift($@)))))] ')
define(`m4pot_arrows',`ifelse(`$2',,,`
  x = (`$2')*2*m4n+1; x = (int(x)%4)+(x-int(x))
  M4_Tmp: `$2' between last [].c-vec_(prod_(m4n,m4h),0) \
    and last [].c+vec_(prod_(m4n,m4h),0)
  T`$1': M4_Tmp + vec_(0,ifelse(`$3',,`dimen_*5/12',`$3'))
  { arrow from T`$1' to M4_Tmp+vec_(0,m4h*m4v*(1-(x-2)*sign(x-2))) }
  m4pot_arrows(incr($1),shift(shift(shift($@))))')')

                         `KelvinR(cycles,[R],cycle wid)
                          IEEE resistor with kelvin taps added
                          if arg1 is blank then a [] block is used'
define(`KelvinR',`[
  M4R: resistor(,`$1',,`$3') define(`m4kRm',`ifinstr(`$2',R,-,+)')
  { dot(at tr_xy(-m4n,0),lthick)
    line to tr_xy(-m4n-1,m4kRm`'2) then to tr_xy(-m4n-1,m4kRm`'4)
    T1: Here
    dot(at tr_xy(m4n,0),lthick)
    line to tr_xy(m4n+1,m4kRm`'2) then to tr_xy(m4n+1,m4kRm`'4)
    T2: Here }
  Start: M4R.start; End: M4R.end; C: M4R.c
  `$4' ]') ')

                         `FTcap(chars)
                          Feed-through capacitor; composite element
                          derived from a two-terminal element.
                          Defined points: .Start, .End, .C
                          chars: A|B|C|D element type'
define(`FTcap',`[ define(`FTctyp',`ifelse(`$1',,A,`$1')')dnl
  ifelse(FTctyp,A,
   `capacitor(to vec_(dimen_*2/3,0))
    Start: last line.start; End: last line.end; C: last line.c
    Conductor: line from C+vec_(0,dimen_/3) to C+vec_(0,-dimen_/3)
    T1: last line.start; T2: last line.end',
  FTctyp,B,
   `capacitor(to vec_(dimen_*2/3,0),C)
    Start: last line.start; End: last line.end; C: last line.c
    r = last arc.rad-hlth
    T1: (0.5 between 2nd line.end and last arc.c-vec_(r,0)) + vec_(0,dimen_/3)
    T2: T1+(0,-dimen_*2/3)
    Conductor: line from T1 to T2',
  FTctyp,C,
   `line to vec_(dimen_*2/3,0)
    Start: last line.start; End: last line.end; C: last line.c
    rp_a = rp_ang
    capacitor(from C to C-vec_(0,dimen_/10),C)
    point_(rp_a)
    line from last line.end to last line.end-vec_(0,dimen_/3)
    T: Here',
  FTctyp,D,
   `Start: Here
    capacitor(to rvec_(dimen_/3,0),C)
    C: Here
    { line to rvec_(0,-dimen_/3); T: Here }
    End: rvec_(dimen_/3,0)
    rp_a = rp_ang
    capacitor(from End to Here,C)
    point_(rp_a)')
  `$2' ]')

                         `addtaps([ahead | type=ahead;name=Name],
                            fractional pos, length, fractional pos, length,...)
                          Tap names are Tap1, Tap2, ...  or
                          Name1, Name2, ... if specified
                          ahead = blank or one of . - <- -> <-> '
define(`addtaps',`
ifelse(`$2',,`undefine(`m4tap_x')popdef(`m4type')popdef(`m4name')',
 `ifdef(`m4tap_x',`define(`m4tap_x',incr(m4tap_x))',
  `define(`m4tap_x',1) M4tap_w: last [].w_; M4tap_e: last [].e_
   setkey_(`$1',type,`$1',N)setkey_(`$1',name,Tap,N)dnl
   M4tap_xy: (last [].wid_,last [].ht_)')
  {define(`m4tapl',`ifelse(`$3',,`dimen_/3',`$3')')dnl
  move to (`$2' between M4tap_w and M4tap_e) + vec_(0,sign(m4tapl)*M4tap_xy.y/2)
  ifinstr(m4type,.,`{dot(,lthick)}define(`m4type')');dnl
  line ifelse(m4type,-,,m4type) to rvec_(0,m4tapl)
  m4name`'m4tap_x: Here }
  addtaps(,shift(shift(shift($@))))')')

                         `tapped(`two-terminal element', . | <- | -> | <-> ,
                            fractional pos, length, fractional pos, length,...)
                          Draw the two-terminal element and taps in a [] block'
define(`tapped',`[ $1
  Start: last line.start; End: last line.end; C: last line.c
  addtaps(shift($@)) ]')

                         `shielded(`two-terminal element',L|U, line attributes )
                            L= shield left half (wrt drawing direction)
                            R= shield right half (default both halves)'
define(`shielded',`[ $1
  Start: last line.start; End: last line.end; C: last line.c
  W: last line.c - vec_(last [].wid_/2+dimen_/8,0)
  E: last line.c + vec_(last [].wid_/2+dimen_/8,0)
  NW: last [].nw_ + vec_(-dimen_/8,dimen_/8)
  NE: last [].ne_ + vec_(dimen_/8,dimen_/8)
  SE: last [].se_ + vec_(dimen_/8,-dimen_/8)
  SW: last [].sw_ + vec_(-dimen_/8,-dimen_/8)
  ifinstr(`$2',L,`line from W to NW then to NE then to E dashed `$3'',
   `$2',R,`line from W to SW then to SE then to E dashed `$3'',
   `line from W to NW then to NE then to SE then to SW then to W dashed `$3'')
  `$4']')

                         `b_current( label, above_|below_, O[ut],
                            S[tart]|E[nd], frac )
                          Branch current for last-drawn element.  The arrowhead
                          is drawn frac (default 2/3) of the way between
                          the line end and element body.'
define(`b_current',
 `define(`m4y',`ifelse(`$5',,2/3,`($5)')')dnl
  define(`m4v',`ifinstr(`$4',E,
   `ifinstr(`$3',O,-)',`ifinstr(`$3',O,,-)')arrowht')dnl
  define(`m4h',`(rp_len-last [].wid_)/2')
  { move to last line.start+vec_(ifinstr(`$4',E,`rp_len-')dnl
    ifinstr(`$3',O,`(m4h-arrowht)*m4y',`(m4h*m4y+arrowht/3)'),0)
    arrow <- m4c_l to rvec_(m4v,0) ifelse(`$1',,,
   `m4lstring(`$1',"sp_`iflatex(`$ `$1'$',`$1')'sp_") \
     ifelse(`$2',,`above_',`$2')')}')

                                `larrow( label, <-, separation )
                                 Arrow alongside the left of the last-drawn
                                 element'
define(`larrow',`define(`m4h',`min(lin_leng(last line),linewid)/2')dnl
 define(`m4v',`ifelse(`$3',,`5pt__',`($3)')')dnl
 {arrow `$2' from last [].n_+vec_(-m4h,m4v) \
    to last [].n_+vec_(m4h,m4v) \
  m4lstring(`$1',"sp_`iflatex(`$ `$1'$',` $1')'sp_") above_}')

                                `rarrow( label, <-, separation )
                                 Arrow alongside the right of the last-drawn
                                 element'
define(`rarrow',`define(`m4h',`min(lin_leng(last line),linewid)/2')dnl
 define(`m4v',`ifelse(`$3',,`5pt__',`($3)')')dnl
 {arrow `$2' from last [].s_+vec_(-m4h,-m4v) \
    to last [].s_+vec_(m4h,-m4v) \
  m4lstring(`$1',"sp_`iflatex(`$ `$1'$',` $1')'sp_") below_}')

                                `inductor( linespec, W|L, cycles, M|P|K[n],
                                   loop wid )
                                 W=wide arcs (default narrow); L=looped arcs
                                 arg4= M[n]=metal core
                                       P[n]=(ferrite) powder core (dashed lines)
                                       K[n]=long-dashed core lines
                                       n=integer (default 2 lines)
                                 arg5 loop wid defaults W,L: dimen_/5,
                                                      other: dimen_/8'
define(`inductor',`eleminit_(`$1')
 define(`m4hlw',`ifelse(`$5',,`dimen_/10',`($5)/2')')dnl half loop wid
 define(`m4n',`ifelse(`$3',,4,`$3')')dnl
 ifelse(`$2',W, `define(`m4wd',((2*m4n-2)*m4c2t+2)*m4hlw)',
        `$2',L, `define(`m4wd',(m4n+1)*m4hlw)',
    `define(`m4ht',`ifelse(`$2',,`dimen_/16',`$2')')define(`m4wd',m4n*m4ht*2)')
 { line to rvec_((rp_len-m4wd)/2,0)
   ifelse(`$2',W,`m4Ibody', `$2',L,`m4Lbody', `m4ibody') with .S at Here
   line from last [].E to last [].E+vec_((rp_len-m4wd)/2,0) }
 ifelse(ifinstr(`$4',M,T,`$4',P,T,`$4',K,T),T,
  `define(`m4nL',ifelse(len(`$4'),1,2,substr(`$4',1)))dnl
   define(`m4hs',`(dimen_/24+(m4nL-1)*dimen_/16)')dnl
   m4m_core(rvec_(rp_len/2,0), m4wd, m4ht+dimen_/24, dimen_/16,
     ifinstr( `$4',P,`dashed m4wd/(2*m4n+1)',
              `$4',K,`dashed m4wd/(2*m4n+1)*3'), m4nL)
   {[box invis ht_ m4ht+m4hs+m4dp wid_ m4wd] \
     at rvec_(rp_len/2,(m4ht+m4hs-m4dp)/2)}')
 line to rvec_(rp_len,0) invis ')
                                `Wide loop inductor body'
define(`m4Ibody',`define(`m4ht',`(1+m4st)*m4hlw')dnl
 define(`m4dp',`(m4s2t-m4st)*m4hlw')dnl
   [S: Here; round
    arc cw from Here to rvec_(vscal_(m4hlw,m4ct+m4c2t,m4st-m4s2t)) \
       with .c at rvec_(vscal_(m4hlw,m4ct,m4st)); round
    for m4i=3 to m4n do { arc cw from Here to rvec_(vscal_(m4hlw,2*m4c2t,0)) \
       with .c at rvec_(vscal_(m4hlw,m4c2t,m4s2t)); round }
    arc cw from Here to rvec_(vscal_(m4hlw,m4ct+m4c2t,m4s2t-m4st)) \
       with .c at rvec_(vscal_(m4hlw,m4c2t,m4s2t)); round
    E: Here] ')
define(`m4ct',`Cos(25)')define(`m4st',`Sin(25)')
define(`m4c2t',`Cos(50)')define(`m4s2t',`Sin(50)')
                                `Looped inductor body'
define(`m4Lbody',`define(`m4ht',`m4hlw*10/8')define(`m4dp',`m4hlw/2')dnl
 [ S: Here; round
   spline ifdpic(0.55) \
        to rvec_(0,m4ht) for_(1,m4n,1,`\
    then to rvec_((m4x+0.3)*m4hlw, m4ht) \
    then to rvec_((m4x+0.3)*m4hlw,-m4dp) \
    then to rvec_((m4x-0.3)*m4hlw,-m4dp) \
    then to rvec_((m4x-0.3)*m4hlw, m4ht) \')\
    then to rvec_(m4wd,m4ht) \
    then to rvec_(m4wd,0); round; E: Here ] ')
                                `Narrow inductor body'
define(`m4ibody',`define(`m4dp',0)dnl
 ifelse(ifpstricks(T)`'ifmpost(T)`'ifpgf(T)`'ifsvg(T),T,
  `define(`m4y')',`undefine(`m4y')')dnl
   [ S: Here; ifdef(`m4y',`{line to rvec_(0,-hlth)};')
     for m4i=1 to m4n do {
       arc cw from Here to rvec_(m4ht*2,0) with .c at rvec_(m4ht,0)
       ifdef(`m4y',`{line to rvec_(0,-hlth)}') }; E: Here ] ')
                               `m4m_core(bottom center, length, ht offset,
                                 separation, linetype, nlines)
                                 nlines=lines for the metal core'
define(`m4m_core',`for_(1,`$6',1,`{M4Core`'m4x: line \
   from `$1'+vec_(-(`$2')/2,`$3'+(`$4')*(m4x-1)) \
     to `$1'+vec_( (`$2')/2,`$3'+(`$4')*(m4x-1)) `$5''})')

                                `transformer( linespec, L|R, np,
                                  [A|M[n]|P[n]|K[n]][W|L][D1|D2|D12|D21], ns )
                                 2-winding transformer or choke:
                                 np = number of primary arcs
                                 ns = number of secondary arcs
                                 A = air core;
                                 M[n] = metal core (default); n=number of lines
                                 P[n] = powder (dashed) core
                                 K[n] = long dashed core
                                 W = wide windings; L = looped windings
                                 D1: phase dots at P1 and S1 ends; D2: dots
                                 at P2 and S2 ends; D12: dots at P1 and S2
                                 ends; D21: dots at P2 and S1 ends'
define(`transformer', `[ P1: Here define(`m4drt',m4dir)
 define(`m4WL',`ifinstr(`$4',W,W,`ifinstr(`$4',L,L)')')dnl
 define(`m4np',`ifelse(`$3',,4,(`$3'))')dnl
 define(`m4ns',`ifelse(`$5',,4,(`$5'))')dnl
 ifelse(`$1',,`mvw = max(\
  ifelse(m4WL,W,`dimen_/5*((m4np-1)*m4c2t+m4ct)',`m4np*dimen_/8'),dimen_*2/3)
  move to P1+vec_(mvw,0)',
  move `$1' )
 P2: Here
 TP: 0.5 between P1 and P2
 L1: inductor(from ifelse(`$2',R,`P2 to P1',`P1 to P2'),m4WL,`$3')
 define(`m4WP',m4wd)dnl
 define(`m4t',`ifelse(m4WL,W,((2*m4ns-2)*m4c2t+2)*m4hlw,m4WL,L,(m4ns+1)*m4hlw,
                      m4ns*m4ht*2)')dnl
 ifinstr(`$4',A,
  `move to last line.c+vec_(0,m4ht*ifelse(m4WL,W,3,m4WL,L,3,4))',
  `define(`m4LL',`regexp(`$4',[MPK]\([0-9][0-9]*\),\1)')dnl
   define(`m4nL',`ifelse(m4LL,,2,m4LL)')dnl
   m4m_core(rvec_(-(rp_len/2),0), max(m4wd,m4t), m4ht+dimen_/12, dimen_/8,
     ifinstr( `$4',P,`dashed m4wd/(2*m4n+1)',
              `$4',K,`dashed m4wd/(2*m4n+1)*3'), m4nL)
   move to last line.c+vec_(0,m4ht+dimen_/12) ')
 TS: Here
 S2: rvec_( ifelse(`$2',R,-)(ifelse(`$5',,rp_len/2,m4t/2)), 0 )
 S1: 2 between S2 and Here
 L2: inductor(from ifelse(`$2',R,`S1 to S2',`S2 to S1'),m4WL,`$5')
 rpoint_(from P1 to P2) define(`m4WS',m4wd)
 ifinstr(`$4',D1,
   `m4trdot(P1,P2,-,m4WP,ifelse(`$2',R,-),D1:)
    ifinstr(`$4',D12,`m4trdot(S1,S2, ,m4WS,ifelse(`$2',R,,-),D2:)',
                     `m4trdot(S1,S2,-,m4WS,ifelse(`$2',R,,-),D2:)')',
  `$4',D2,
   `m4trdot(P1,P2,,m4WP,ifelse(`$2',R,-),D1:)
    ifinstr(`$4',D21,`m4trdot(S1,S2,-,m4WS,ifelse(`$2',R,,-),D2:)',
                     `m4trdot(S1,S2, ,m4WS,ifelse(`$2',R,,-),D2:)')')
  m4xpand(m4drt`'_)
 `$6' ]')
define(`m4trdot',`{`$6'dot(at (0.5 between `$1' and `$2') \
      +vec_(`$3'(`$4'+m4hlw)/2,`$5'dimen_/16), dotrad_/2)}')

                                `delay( linespec, width )'
define(`delay',`eleminit_(`$1')
 define(`m4ht',`ifelse(`$2',,`delay_rad_*2',`($2)')')dnl
 define(`m4wd',`m4ht*5/6')dnl
 { line to rvec_(rp_len/2-m4wd/2,0)
   { line from rvec_(m4ht/3,-m4ht/2) \
          to rvec_(0,-m4ht/2)\
       then to rvec_(0,m4ht/2) \
       then to rvec_(m4ht/3,m4ht/2)
     arc cw from Here to rvec_(0,-m4ht) with .c at rvec_(0,-m4ht/2) }
   move to rvec_(m4wd,0)
   line to rvec_(rp_len/2-m4wd/2,0) }
 { [box invis ht_ m4ht wid_ m4wd ] at rvec_(rp_len/2,0)}
 line to rvec_(rp_len,0) invis ')

                                `crystal xtal( linespec )'
define(`xtal',`eleminit_(`$1')
 define(`m4ht',`dimen_/4')define(`m4wd',`m4ht*2/3')define(`m4cs',`m4ht/3')dnl
 { line to rvec_(rp_len/2-m4wd/2,0)
   {line from rvec_(0,-m4ht/3) \
          to rvec_(0,m4ht/3)}
   { move to rvec_(m4wd/2-m4cs/2,0)
     line to rvec_(0,m4ht/2) \
       then to rvec_(m4cs,m4ht/2) \
       then to rvec_(m4cs,-m4ht/2) \
       then to rvec_(0,-m4ht/2) \
       then to Here }
   move to rvec_(m4wd,0)
   {line from rvec_(0,-m4ht/3) \
          to rvec_(0,m4ht/3)}
   line to rvec_(rp_len/2-m4wd/2,0) }
 {[box invis ht_ m4ht wid_ m4wd ] at rvec_(rp_len/2,0)}
 line to rvec_(rp_len,0) invis ')

                  `source( linespec,
                     V|v|I|i|AC|B|F|G|H|Q|L|N|P|R|S[C[r]|E[r]]]|T|X|U|other,
                     diameter, R, fill)
                     V = voltage source; v = alternate voltage source;
                     I = current source; i = alternate current source;
                     AC = AC source; B = bulb; F = fluorescent; G =
                     generator; H = step function; L = lamp;
                     N = neon; P = pulse; Q = charge; R = ramp; r = right
                     orientation; S = sinusoid; SC = quarter arc; SE =
                     arc; T = triangle; U = square-wave; X = interior X;
                     other = custom interior label or waveform;
                     arg 4: R = reversed polarity; 
                     arg 5 modifies the circle with e.g., color or fill'
define(`source',`ifelse(`$4',R,
 `reversed(`source',`$1',`$2',`$3',,shift(shift(shift(shift($@)))))',
 `eleminit_(`$1')
 define(`m4h',ifelse(`$3',,`sourcerad_',`($3)/2'))dnl
 ifelse(
 `$2',G,`m4_sourceGQ($@)',
 `$2',Q,`m4_sourceGQ($@)',
 `{ line to rvec_(rp_len/2-m4h,0)
    move to rvec_(m4h,0)
  { Src_C: circle rad m4h `$5' at Here }
  ifelse(`$2',,,
  `$2',F,`{ line from rvec_(-m4h,0) \
          to rvec_(-m4h/2,0)}
          { line from rvec_(-m4h/2,-m4h/2) \
          to rvec_(-m4h/2,m4h/2)}
          { line from rvec_(m4h/2,-m4h/2) \
          to rvec_(m4h/2,m4h/2)}
          { line from rvec_(m4h,0) \
          to rvec_(m4h/2,0)}',
  `$2',I,`{arrow from rvec_(-m4h*3/4,0) \
          to rvec_(m4h*3/4,0)}',
  `$2',i,`{line from rvec_(0,-m4h) \
          to rvec_(0,m4h)}',
  `$2',B,`{line from rvec_(-m4h,0) \
          to rvec_(-m4h*2/3,0)
           round
           arc ccw to rvec_(m4h*12/12,0) with .c at rvec_(m4h*12/24,0)
           arc ccw to rvec_(-m4h*2/3,0) with .c at rvec_(-m4h*1/3,0)
           arc ccw to rvec_(m4h*12/12,0) with .c at rvec_(m4h*12/24,0)
           round
           line to rvec_(m4h/3,0)}',
  `$2',H,`{ line from Here+(-m4h/2,-m4h/3) \
          to Here+(0,-m4h/3) \
             then to Here+(0,m4h/3) \
             then to Here+(m4h/2,m4h/3) }',
  `$2',L,`{line from rvec_(-m4h,0) \
          to rvec_(-m4h/4,0)
           round
           spline to rvec_(m4h/12,m4h*2/3) \
             then to rvec_(m4h*5/12,m4h*2/3) \
             then to rvec_(m4h/2,0)
           round
           line to rvec_(m4h*3/4,0)}',
  `$2',N,`{ {line from rvec_(-m4h,0) \
          to rvec_(-m4h/2,0)}
            for_(70,250,180,
            `{ line from rvec_(Rect_(m4h/2,-m4x)) \
          to rvec_(Rect_(m4h/2,m4x))
               round }
             { arc cw from rvec_(Rect_(m4h/2,m4x)) \
          to rvec_(Rect_(m4h/2,-m4x)) \
                 with .c at Here
               round }')
             {line from rvec_(m4h/2,0) \
          to rvec_(m4h,0)}}',
  `$2',V,`{"ifsvg(-,`$_-$')" at rvec_(-m4h/2,0) ifsvg(+(0,textht/10))}
          {"ifsvg(svg_small(+),`$_+$')" \
              at rvec_( m4h/2,0) ifsvg(+(0,textht/10))}',
  `$2',v,`{line from rvec_(-m4h,0) \
          to rvec_(m4h,0)}',
  `$2',AC,`{ACsymbol(,,,AR)}',
  `$2',P,`{ line from Here+(-m4h/2,-m4h/4) \
        to Here+(-m4h/4,-m4h/4) \
            then to Here+(-m4h/4,m4h/4) \
            then to Here+(m4h/4,m4h/4) \
            then to Here+(m4h/4,-m4h/4) \
            then to Here+(m4h/2,-m4h/4) }',
  `$2',U,`{ line from Here+(-m4h/2,0) \
        to Here+(-m4h/2,m4h/3) \
            then to Here+(0,m4h/3) \
            then to Here+(0,-m4h/3) \
            then to Here+(m4h/2,-m4h/3) \
            then to Here+(m4h/2,0) }',
  `$2',R,`{ line from Here+(-m4h*2/3,-m4h/3) \
        to Here+(m4h/3,m4h/2) \
            then to Here+(m4h/3,-m4h/3) }',
  `$2',SCr,`{ arc cw from rvec_(-m4h,0) \
     to rvec_(0,-m4h) \
     with .c at rvec_(-m4h,-m4h) }',
  `$2',SC,`{ arc from rvec_(-m4h,0) \
     to rvec_(0,m4h) \
     with .c at rvec_(-m4h,m4h) }',
  `$2',SEr,`{ arc cw from Cintersect(Here,m4h,rvec_(0,-2*m4h),1.8*m4h,R) \
     to Cintersect(Here,m4h,rvec_(0,-2*m4h),1.8*m4h) \
     with .c at rvec_(0,-2*m4h) }',
  `$2',SE,`{ arc from Cintersect(Here,m4h,rvec_(0,2*m4h),1.8*m4h) \
     to Cintersect(Here,m4h,rvec_(0,2*m4h),1.8*m4h,R) \
     with .c at rvec_(0,2*m4h) }',
  `$2',S,`{ACsymbol(,,,R)}',
  `$2',T,`{ line from Here+(-m4h*3/4,-m4h/4) \
        to Here+(-m4h/4,m4h/4) \
            then to Here+(m4h/4,-m4h/4) \
            then to Here+(m4h*3/4,m4h/4) }',
  `$2',X,`define(`m4v',`m4h/sqrt(2)')dnl
    {line from rvec_(-m4v,m4v) \
          to rvec_(m4v,-m4v)}
    {line from rvec_(-m4v,-m4v) \
          to rvec_(m4v,m4v)}',
  `{$2}' )
  line from rvec_(m4h,0) \
          to rvec_(rp_len/2,0)}
  { [box invis ht_ m4h*2 wid_ m4h*2] at rvec_(rp_len/2,0) } ')
  line to rvec_(rp_len,0) invis ')')
                    `Internal to source macro:'
define(`m4_sourceGQ',
 `m4sv = m4h*2/3
  m4sh = sqrt((m4h)^2-m4sv^2)
  { line to rvec_(rp_len/2-(m4h+m4sh),0)
   {Body:[ Cx: rvec_(m4h,0)
     ifelse(`$5',,,`{circle invis rad m4h `$5' with .c at Cx}')
     L: Cx+vec_(m4sh, m4sv) 
     R: Cx+vec_(m4sh,-m4sv)
     M1: Cx+vec_(-(m4h-m4sh)*3/5,0)
     ifelse(`$5',,,
      `{circle invis rad m4h `$5' with .c at Cx+vec_(m4sh*2,0)}')
     C1: circle rad m4h with .c at Cx
     C2: ifelse(`$2',G,`circle rad m4h',`arc rad m4h from R to L') \
       with .c at C1 +vec_(m4sh*2,0)
     M2: C2+vec_((m4h-m4sh)*3/5,0)
     ] at rvec_(m4h+m4sh,0)}
   line from rvec_((m4h+m4sh)*2,0) \
           to rvec_(rp_len/2+(m4h+m4sh),0) } ')

                    `ttmotor( linespec, string, diameter, brushwid, brushht )'
define(`ttmotor',`eleminit_(`$1')
  define(`m4r',ifelse(`$3',,`sourcerad_',`($3)/2'))dnl
  define(`m4w',ifelse(`$4',,`sourcerad_/4',`($4)'))dnl
  define(`m4h',ifelse(`$5',,`sourcerad_/2',`($5)'))dnl
  define(`m4cr',`(m4r-sqrt(max(m4r*m4r-m4h*m4h/4,0)))')dnl
  { line to rvec_(max(rp_len/2-m4r-m4w,0),0)
    { line from rvec_(m4w+m4cr,m4h/2) \
          to rvec_(0,m4h/2) \
        then to rvec_(0,-m4h/2) \
        then to rvec_(m4w+m4cr,-m4h/2) }
    { TTM_C: circle rad m4r \
       at rvec_(m4w+m4r,0) ifelse(`$2',,,`m4lstring($2,"$2")') }
    move to rvec_((m4w+m4r)*2,0)
    { line from rvec_(-m4w-m4cr,m4h/2) \
          to rvec_(0,m4h/2) \
        then to rvec_(0,-m4h/2) \
        then to rvec_(-m4w-m4cr,-m4h/2) }
    line to rvec_(max(rp_len/2-m4r-m4w,0), 0) }
  { [box invis ht_ m4r*2 wid_ (m4r+m4w)*2] at last circle.c }
  line to rvec_(rp_len,0) invis ')

                                `consource( linespec ,V|I|v|i|P, R )
                                 Controlled source
                                 Arg3:
                                  V= voltage
                                  I= current
                                  v= voltage type 2
                                  i= current type 2
                                  P= proximity sensor
                                 arg 4 can be used to modify the body with e.g.
                                   color or fill'
define(`consource',`ifelse(`$3',R,
 `reversed(`consource',`$1',`$2',,shift(shift(shift($@))))',
 `eleminit_(`$1')
  {line to rvec_(rp_len/2-csdim_,0)
   M4CSN: rvec_(csdim_,csdim_)
   M4CSS: rvec_(csdim_,-csdim_)
   M4CSE: rvec_(2*csdim_,0)
   M4CSW: Here 
   {line to M4CSN then to M4CSE then to M4CSS then to Here `$4'}
   ifelse(`$2',I,
    `{arrow from rvec_(csdim_/4,0) \
          to rvec_(csdim_*7/4,0)}',
   `$2',i,
    `{line from M4CSN to M4CSS}',
   `$2',V,
    `{"iflatex(`$-$',-)" at rvec_(csdim_*0.5,0) ifsvg(+(0,textht/10))}
     {"iflatex(`$+$',+)" at rvec_(csdim_*1.5,0) ifsvg(+(0,textht/10))}',
   `$2',v,
    `{line to M4CSE} ',
   `$2',P,
    `{ Proxim(2*csdim_) at rvec_(csdim_,0) }')
   line from M4CSE to rvec_(rp_len/2+csdim_,0) }
  {[box invis ht_ 2*csdim_ wid_ 2*csdim_] at rvec_(rp_len/2,0)}
  line to rvec_(rp_len,0) invis ')')

                        `Proxim(size, U|D|L|R|degrees)
                          Proximity symbol
                          Arg2 default: current direction'
define(`Proxim',`[
 define(`m4prwid',`ifelse(`$1',,(dimen_/2),`($1)')')dnl
 setdir_(ifelse(`$2',,`ifdef(`m4a_',rp_ang*rtod_,0)',`$2'))
 M4PRN: rvec_(0, m4prwid/2)
 M4PRE: rvec_(m4prwid/2,0)
 M4PRS: rvec_(0,-m4prwid/2)
 M4PRW: rvec_(-m4prwid/2,0)
 { line from 1/2 between M4PRN and M4PRE to M4PRE then to M4PRS \
    then to M4PRW then to M4PRN then to 1/2 between M4PRN and M4PRE }
 { line from 1/4 between M4PRW and M4PRN to 1/4 between M4PRE and M4PRN }
 { line from 1/4 between M4PRW and M4PRS to 1/4 between M4PRE and M4PRS }
 `$3'; resetdir_ ]')

                        `Magn(len, ht, U|D|L|R|degrees)
                          Magnetic relay action symbol'
define(`Magn',`[
 define(`m4mawi2',`ifelse(`$1',,(dimen_/4),`(($1)/2)')')dnl
 define(`m4mah2',`ifelse(`$2',,(dimen_/8),`(($2)/2)')')dnl
 setdir_(ifelse(`$3',,`ifdef(`m4a_',rp_ang*rtod_,0)',`$3'))
 m4fshade(0, line from vec_( 0, m4mah2) \
                    to vec_( m4mawi2, m4mah2) \
               then to vec_( m4mawi2,-m4mah2) \
               then to vec_( m4mawi2/2,-m4mah2) \
               then to vec_( m4mawi2/2,0) \
               then to vec_(-m4mawi2/2,0) \
               then to vec_(-m4mawi2/2,-m4mah2) \
               then to vec_(-m4mawi2,-m4mah2) \
               then to vec_(-m4mawi2, m4mah2) \
               then to vec_( 0, m4mah2))
 `$4'; resetdir_ ]')

                                `battery( linespec, n, R )
                                 Arg 3: reversed polarity'
define(`battery',`ifelse(`$3',R,
 `reversed(`battery',`$1',`$2',,shift(shift(shift($@))))',
 `eleminit_(`$1')
  define(`m4n',`ifelse(`$2',,1,(`$2'))')define(`m4cs',`dimen_/12')dnl
  define(`m4wd',`m4cs*(m4n*2-1)')define(`m4ht',`dimen_/2')dnl
  { line to rvec_(rp_len/2-m4wd/2,0)
    for m4i = 0 to 2*(m4n-1) by 2 do {
      { line from rvec_(m4i*m4cs,m4ht/4) \
        to rvec_(m4i*m4cs,-m4ht/4) }
      { line from rvec_((m4i+1)*m4cs,m4ht/2) \
        to rvec_((m4i+1)*m4cs,-m4ht/2) } }
    line from rvec_(m4wd,0) \
          to rvec_(rp_len/2+m4wd/2,0) }
  {[box invis ht_ m4ht wid_ m4wd] at rvec_(rp_len/2,0)}
  line to rvec_(rp_len,0) invis ')')

                                `ebox(linespec, length, ht, greyvalue)
                                 Box element; length and ht are relative to
                                 the direction of linespec'
define(`ebox',`eleminit_(`$1')
   define(`m4wd',ifelse(`$2',,`dimen_/2',`($2)'))dnl
   define(`m4ht',ifelse(`$3',,`dimen_/5',`($3)'))dnl
   {line to rvec_(max(0,rp_len/2-m4wd/2),0)
    ifelse(`$4',,`lbox(m4wd,m4ht)',`m4fshade(`$4',lbox(m4wd,m4ht))')
    line to rvec_(max(0,rp_len/2-m4wd/2),0)}
  {[box invis ht_ m4ht wid_ m4wd] at rvec_(rp_len/2,0)}
   line to rvec_(rp_len,0) invis ')

                                `fuse( linespec, chars, wid, ht )
                                 chars dA|B|C|D|S|SB|HB|HC or dA (=D)'
define(`fuse',`eleminit_(`$1')
  define(`m4fusetype',`ifelse(`$2',,A,`$2',D,dA,`$2')')dnl
  define(`m4ht',ifelse(`$4',,`dimen_/5'ifinstr(`$2',H,*5/3),`($4)'))dnl
  define(`m4d',ifinstr(`$2',H,`m4ht/5',0))dnl
  define(`m4wd',ifelse(`$3',,`m4ht*2',`($3)'))dnl
  {line to rvec_(max(0,rp_len/2-m4wd/2),0)
  sc_draw(`m4fusetype',HB,
   `{move to rvec_(m4d,0); lbox(m4wd-2*m4d,m4ht-2*m4d)}
    {lbox(m4wd,m4ht)}
    line to rvec_(m4wd+max(0,rp_len/2-m4wd/2),0)')
  sc_draw(`m4fusetype',HC,
   `{move to rvec_(m4d,0); {lbox(m4wd-2*m4d,m4ht-2*m4d)}
    {line from rvec_((m4wd-2*m4d)/5,m4ht/2-m4d) \
            to rvec_((m4wd-2*m4d)/5,-m4ht/2+m4d)}
    line from rvec_((m4wd-2*m4d)*4/5,m4ht/2-m4d) \
            to rvec_((m4wd-2*m4d)*4/5,-m4ht/2+m4d) }
    {lbox(m4wd,m4ht)}
    move to rvec_(m4wd,0); line to rvec_(max(0,rp_len/2-m4wd/2),0)')
  sc_draw(`m4fusetype',A,
   `arc  cw to rvec_(m4ht,0) rad m4ht/2 with .c at rvec_(m4ht/2,0)dnl
    ifelse(m4a,d,`; {dot(at last arc.start,,1)}')
    arc ccw to rvec_(m4ht,0) rad m4ht/2 with .c at rvec_(m4ht/2,0)
    line to rvec_(max(0,rp_len/2-m4wd/2),0)dnl
    ifelse(m4a,d,`; dot(at last line.start,,1)')')
  sc_draw(`m4fusetype',SB,
   `{lbox(m4wd,m4ht)}
    {line to rvec_(m4wd+max(0,rp_len/2-m4wd/2),0)}
    {m4fshade(m4fill,lbox(m4wd/5,m4ht))}
    move to rvec_(m4wd,0); line to rvec_(max(0,rp_len/2-m4wd/2),0)')
  sc_draw(`m4fusetype',B,
   `{lbox(m4wd,m4ht)}
    line to rvec_(m4wd+max(0,rp_len/2-m4wd/2),0)')
  sc_draw(`m4fusetype',C,
   `{lbox(m4wd,m4ht)}
    {line from rvec_(m4wd/5,-m4ht/2) \
          to rvec_(m4wd/5,m4ht/2)}
    {line from rvec_(m4wd*4/5,-m4ht/2) \
          to rvec_(m4wd*4/5,m4ht/2)}
    move to rvec_(m4wd,0); line to rvec_(max(0,rp_len/2-m4wd/2),0)')
  sc_draw(`m4fusetype',S,
   `{lbox(m4wd,m4ht)}
    {m4fshade(m4fill,lbox(m4wd/5,m4ht))}
    move to rvec_(m4wd,0); line to rvec_(max(0,rp_len/2-m4wd/2),0)')
  }
  {[box invis ht_ m4ht wid_ m4wd] at rvec_(rp_len/2,0)}
   line to rvec_(rp_len,0) invis ')

                                `arrester( linespec, [G|E|S][D[L|R]],
                                   len[:arrowhead ht], ht[:arrowhead wid] )
                                 arg2 chars:
                                   G= spark gap (default)
                                   g= general (dots)
                                   E= gas discharge
                                   S= box enclosure
                                   C= carbon block
                                   A= electrolytic cell
                                   H= horn gap
                                   P= protective gap
                                   s= sphere gap
                                   F= film element
                                   M= multigap
                                 modifiers:
                                   R= right orientation
                                   L= left orientation
                                   D= 3-terminal element for S, E only with
                                      terminals A, B, G'
define(`arrester',
 `define(`m4rdna',`patsubst(`$2',D\|L\|R)')dnl
  ifelse(m4rdna,,`define(`m4rdna',G)')dnl
  define(`m4rL',ifinstr(`$2',L,-))dnl
  define(`m4rR',ifinstr(`$2',R,-))dnl

  define(`m4aht',`m4Rightstr(`$3',arrowht*2/3)')dnl
  define(`m4awd',`m4Rightstr(`$3',arrowwid*4/3)')dnl

  define(`m4wd',
   `ifinstr(m4rdna,C,`m4Leftstr(`$3',dimen_/3)',
    m4rdna,F,`m4Leftstr(`$3',dimen_/3)',
    m4rdna,s,`m4Leftstr(`$3',dimen_/4)',
    m4rdna,E,`m4Leftstr(`$3',dimen_*5/8)',
    `m4Leftstr(`$3',dimen_/2)')')dnl

  define(`m4ht',
   `ifinstr(Loopover_(`Z',`ifinstr(m4rdna,Z,T)',C,A,s),T,
      `m4Leftstr(`$4',dimen_/4)',
    ifinstr(m4rdna,F,T),T,`m4Leftstr(`$4',dimen_/3)',
    `m4Leftstr(`$4',dimen_/5)')')dnl

  ifinstr(`$2',D,
   `[ define(`m4LL',m4rL)dnl
      ifinstr(m4rdna,S,
       `R: arrester(ifelse(`$1',,`to rvec_(dimen_,0)'),m4rdna,shift(shift($@)))
        Gb: line from R.c+vec_(0,m4LL m4ht/2) to R.c+vec_(0,m4LL (-m4ht*3/2)) ',
      m4rdna,E,
       `R: arrester(ifelse(`$1',,`to rvec_(dimen_,0)'),m4rdna,shift(shift($@)))
        Gb: line from R.c+vec_(0,m4LL m4wd/8) to R.c+vec_(0,m4LL (-m4wd*3/4)) ')
      A: R.start; B: R.end; C: R.c; G: Here ]',

   `eleminit_(`$1',elen_)
    {line to rvec_(max(0,rp_len/2-m4wd/2),0)
    {[ Orig: Here
    ifinstr(m4rdna,G,
     `{arrow to rvec_(m4aht,0) wid m4awd ht m4aht}
      move to rvec_(m4wd,0)
      arrow to rvec_(-m4aht,0) wid m4awd ht m4aht',
    m4rdna,g,
     `{dot(at rvec_(dotrad_,0))}; dot(at rvec_(m4wd-dotrad_,0))',
    m4rdna,M,
     `{dot(at rvec_(dotrad_,0))}
      {dot(at rvec_(m4wd/2,0))};  dot(at rvec_(m4wd-dotrad_,0))',
    m4rdna,C,
     `lbox(m4wd/3,m4ht); move to rvec_(m4wd/3,0)
      lbox(m4wd/3,m4ht)',
    m4rdna,A,
     `{line to rvec_(m4wd/4,0)}
      for_(1,3,1,`line from rvec_(0,m4ht/2) to rvec_(m4wd/4,0) \
        then to rvec_(0,-m4ht/2); move to rvec_(m4wd/4,m4ht/2)
        ifelse(m4x,3,,move to rvec_(m4wd/8,0))') ',
    m4rdna,H,
     `line to rvec_(m4ht,0); round
      {arc ifelse(m4rR,-,,c)cw from Here to rvec_(-m4ht,m4rR m4ht) \
        with .c at rvec_(-m4ht,0)}
      move to rvec_(m4wd-2*m4ht,0); round
      {arc ifelse(m4rR,-,c)cw from Here to rvec_(m4ht,m4rR m4ht) \
        with .c at rvec_(m4ht,0)}
      line to rvec_(m4ht,0)',
    m4rdna,P,
     `{open_arrow(to rvec_(m4aht,0),m4awd,m4aht)}
      move to rvec_(m4wd,0)
      open_arrow(to rvec_(-m4aht,0),m4awd,m4aht)',
    m4rdna,s,
     `{line to rvec_(m4ht/2*(sqrt(2)-1),0)}
      {arc from rvec_(0,-m4ht/2) to rvec_(0,m4ht/2) \
        with .c at rvec_(-m4ht/2,0)}
      move to rvec_(m4wd,0)
      {arc from rvec_(0,m4ht/2) to rvec_(0,-m4ht/2) \
        with .c at rvec_(m4ht/2,0)}
      {line to rvec_(-m4ht/2*(sqrt(2)-1),0)}',
    m4rdna,F,
     `{line from rvec_(0,m4ht/2) to rvec_(0,-m4ht/2)}
      {line from rvec_(m4wd/2,m4ht/2) to rvec_(m4wd/2,-m4ht/2)}
      line from rvec_(m4wd,m4ht/2) to rvec_(m4wd,-m4ht/2)',
    m4rdna,S,
      `{lbox(m4wd,m4ht)}
       arrow to rvec_(m4wd/2,0) wid m4awd ht m4aht',
    m4rdna,E,
     `{circle diam m4wd at rvec_(m4wd/2,0)}
      {arrow to rvec_(m4wd*3/8,0) wid m4awd ht m4aht}
      {arrow <- from rvec_(m4wd*5/8,0) to rvec_(m4wd,0) wid m4awd ht m4aht}
      dot(at rvec_(m4wd*6/8,m4wd/4),dotrad_*2/3) ')
      ] with .Orig at Here }
    line from rvec_(m4wd,0) to rvec_(max(0,rp_len/2+m4wd/2),0) }
    line invis to rvec_(rp_len,0)')
  ')

                                `memristor( linespec, wid, ht )'
define(`memristor',`eleminit_(`$1')
  define(`m4ht',ifelse(`$3',,`dimen_/5',`($3)'))define(`m4htx',`m4ht/4')dnl
  define(`m4wd',ifelse(`$2',,`dimen_/2',`($2)'))define(`m4wdx',`m4wd*4/25')dnl
  { line to rvec_(max(0,rp_len/2-m4wd/2),0)
    {[lbox(m4wd,m4ht)] at rvec_(m4wd/2,0)}
    line to rvec_(m4wdx,0) \
       then to rvec_(m4wdx,m4htx) \
       then to rvec_(m4wdx*2,m4htx) \
       then to rvec_(m4wdx*2,-m4htx) \
       then to rvec_(m4wdx*3,-m4htx) \
       then to rvec_(m4wdx*3,m4htx) \
       then to rvec_(m4wdx*4,m4htx) \
       then to rvec_(m4wdx*4,0) \
       then to rvec_(m4wdx*5,0)
    m4fshade(m4fill,lbox(m4wd/4,m4ht))
    line to rvec_(max(0,rp_len/2-m4wd/2),0) }
  line invis to rvec_(rp_len,0)')

                            `pvcell( linespec, wid, ht )'
define(`pvcell',`eleminit_(`$1')
  define(`m4wd',ifelse(`$2',,`dimen_/2',`($2)'))dnl 
  define(`m4ht',ifelse(`$3',,`dimen_/5',`($3)'))dnl
  { line to rvec_(max(0,rp_len/2-m4wd/2),0)
    {[lbox(m4wd,m4ht)] at rvec_(m4wd/2,0)}
    {line from rvec_(0,-m4ht/2) to rvec_(m4wd/3,0) then to rvec_(0,m4ht/2)}
    move to rvec_(m4wd,0); line to rvec_(max(0,rp_len/2-m4wd/2),0) }
  line invis to rvec_(rp_len,0)')

                                `heater( linespec, nparts, wid, ht )'
define(`heater',`eleminit_(`$1')
  define(`m4hn',ifelse(`$2',,4,`$2'))dnl
  define(`m4wd',ifelse(`$3',,`dimen_/2',`($3)'))dnl
  define(`m4ht',ifelse(`$4',,`dimen_/5',`($4)'))dnl
  { line to rvec_(max(0,rp_len/2-m4wd/2),0)
    {[lbox(m4wd,m4ht)] at rvec_(m4wd/2,0)}
    for m4ix=1 to m4hn-1 do {
      {line from rvec_(m4ix*m4wd/(m4hn),m4ht/2) \
          to rvec_(m4ix*m4wd/(m4hn),-m4ht/2)}}
    line from rvec_(m4wd,0) \
          to rvec_(max(0,rp_len/2+m4wd/2),0) }
  line invis to rvec_(rp_len,0)')

                                `thermocouple(linespec, wid, ht, L|R)
                                 R=right orientation'
define(`thermocouple',`eleminit_(`$1')
   define(`m4wd',ifelse(`$2',,`dimen_/5',`($2)'))dnl
   define(`m4ht',ifelse(`$3',,`dimen_/2',`($3)'))dnl
   define(`m4ths',`ifinstr(`$4',R,-)')dnl
   {line to rvec_(max(0,rp_len/2-m4wd/2),0) \
    then to rvec_(max(0,rp_len/2-m4wd/2),m4ths`'(m4ht-m4wd/2)) \
    then to rvec_(rp_len/2,m4ths`'m4ht) \
    then to rvec_(max(0,rp_len/2-m4wd/2)+m4wd,m4ths`'(m4ht-m4wd/2)) \
    then to rvec_(max(0,rp_len/2-m4wd/2)+m4wd,0) \
    then to rvec_(rp_len,0)}
  { dot(at rvec_(rp_len/2,m4ths`'m4ht)) }
  {[box invis ht_ m4ht wid_ m4wd] at rvec_(rp_len/2,m4ths`'m4ht/2)}
   line to rvec_(rp_len,0) invis ')

                                `lamp(linespec,[R])'
define(`lamp',`define(`m4ng',ifinstr(`$2',R,-))define(`m4hw',`dimen_/10')dnl
define(`m4dp',(m4ng`'m4hw/2))define(`m4ht',(m4ng`'dimen_/8))dnl
eleminit_(`$1')
 { line to rvec_(rp_len/2-m4hw,0) \
     then to rvec_(rp_len/2-m4hw,m4ng`'dimen_/3.2)
   spline ifdpic(ctension_) to rvec_(0,m4ht) \
      then to rvec_(1.3*m4hw, m4ht) \
      then to rvec_(1.3*m4hw,-m4dp) \
      then to rvec_(0.7*m4hw,-m4dp) \
      then to rvec_(0.7*m4hw, m4ht) \
      then to rvec_(2*m4hw,m4ht) \
      then to rvec_(2*m4hw,0)
   line to rvec_(0,-(m4ng`'dimen_/3.2)) \
      then to rvec_(rp_len/2-m4hw,-(m4ng`'dimen_/3.2)) }
   { [ circle rad dimen_/5 ] at rvec_(rp_len/2,m4ng`'dimen_/3.2) }
   line invis to rvec_(rp_len,0) ')

                                `cbreaker( linespec, L|R, D|Th|TS )
                                 circuit breaker to left or right of linespec,
                                 D=with dots; Th=thermal; TS=squared thermal'
define(`cbreaker',`ifinstr(`$3',T,
   `tbreaker($@)',
   `mbreaker($@)')')

define(`tbreaker',`eleminit_(`$1') define(`m4ho',0)
 {ifinstr(`$3',TS,
  `define(`m4h',`dimen_/5')define(`m4v',`m4h/2')define(`m4ho',`m4v/2')dnl
   m4j = max(0,rp_len/2-m4h/2)
   line to rvec_(m4j,0) \
    then to rvec_(m4j,ifelse(`$2',R,-)m4h/2) \
    then to rvec_(m4j+m4h,ifelse(`$2',R,-)m4h/2) \
    then to rvec_(m4j+m4h,0) \
    then to rvec_(m4j*2+m4h,0) ',
  `define(`m4h',`dimen_*2/5')define(`m4v',`m4h/2')define(`m4ho',0)dnl
   m4j = max(0,rp_len/2-m4h/2)
   line to rvec_(m4j,0)
   {round
    arc cw to rvec_( m4h/4,0)+vec_(Rect_(m4h/4,-75)) with .c at rvec_( m4h/4,0)}
   move to rvec_(m4h,0)
   {round
    arc cw to rvec_(-m4h/4,0)+vec_(Rect_(m4h/4,105)) with .c at rvec_(-m4h/4,0)}
   line to rvec_(m4j,0)
 ') }
 {[box invis ht_ m4v wid_ m4h ] at rvec_(rp_len/2,ifelse(`$2',R,-)m4ho) }
  line to rvec_(rp_len,0) invis ')

define(`mbreaker',`eleminit_(`$1') define(`m4R',`ifelse(`$2',R,-)')
  define(`m4h',`dimen_/3') define(`m4cr',`((m4h+2*dimen_/32)*5/8)')dnl
  define(`m4ht',`(m4cr-sqrt(m4cr^2-(m4h/2+dimen_/32)^2)+dimen_/16)')dnl
  {line to rvec_(max(0,rp_len/2-m4h/2),0)
  {ifelse(`$3',D,`dot(,,1)
   move to rvec_(0,m4R`'dotrad_);')dnl
   arc ifelse(`$2',R,c)cw from rvec_(-dimen_/32,m4R`'dimen_/16) \
     to rvec_(m4h+dimen_/32,m4R`'dimen_/16) rad m4cr \
     with .c at rvec_(m4h/2,m4R`'(m4ht-m4cr))}
  {line from rvec_(m4h,0) \
          to rvec_(m4h+max(0,rp_len/2-m4h/2),0)
   ifelse(`$3',D,`dot(at last line.start,,1)') }
  [box invis ht_ m4ht ifelse(`$3',D,`+2*dotrad_') wid_ m4h+dimen_/16] \
    at rvec_(m4h/2,m4R`'(m4ht/2)) }
  line to rvec_(rp_len,0) invis ')

                                `gap( linespec,fill,A )
                                 Gap with filled dots e.g.
                                 gap(down_ linewid/2,1); rlabel(+,v_1,-)
                                 A: chopped arrow between dots'
define(`gap',`eleminit_(`$1')
  dot(,,ifelse(`$2',,0,`$2')); dot(at last line.end,,ifelse(`$2',,0,`$2'))
  ifelse(`$3',A,
   `{arrow from last line.start to last line.end chop dotrad_*3}')
  {[box invis ht_ 0 wid_ min(rp_len,(dimen_*4/9+rp_len)/3)] at last line.c}
  ')

                                `arrowline( linespec )
                                 line with midpoint arrowhead
                                 e.g. arrowline(up 1 dotted); llabel(,I_2)'
define(`arrowline',`line ifelse(`$1',,`to rvec_(elen_,0)',`$1')
  { eleminit_(from last line.start to last line.end) }
  { arrow from last line.start to last line.end \
      chop lin_leng(last line)/2-arrowht/2
   [box invis ht_ arrowwid wid_ arrowht] at last line.c }')

                          `ground( at position, T|stem length, N|F|S|L|P[A]|E,
                                     D|U|L|R|degrees)
                                 T=truncated stem; N=normal ground,
                                 F=frame, S=signal, L=low-noise, P=protective,
                                 E=European; PA=protective alternate
                                 Down (default), Up, Left, Right, angle (deg)'
define(`ground',`box invis ht 0 wid 0 with .c ifelse(`$1',,`at Here',`$1')
  define(`m4v',`dimen_/6')define(`m4h',`dimen_/16')dnl
  {setdir_(ifelse(`$4',,-90,`$4'))
  ifelse(`$2',,`line from last box.c to rvec_(dimen_/4,0)',
    `$2',T,,`line from last box.c to rvec_(`$2',0)')
  ifelse(`$3',F,
    `{line from rvec_(dimen_/8,m4v-dimen_/12) \
          to rvec_(0,m4v) \
       then to rvec_(0,-m4v) \
       then to rvec_(dimen_/8,-m4v-dimen_/12)}
     line to rvec_(dimen_/8,-dimen_/12)',
  `$3',S,
    `{line to rvec_(0,m4v) \
       then to rvec_(m4v*1.5,0) \
       then to rvec_(0,-m4v) \
       then to Here }',
  `$3',Q,
    `{shade(0,line to rvec_(0,m4v) \
       then to rvec_(m4v*1.5,0) \
       then to rvec_(0,-m4v) \
       then to Here) }',
  `$3',L,
    `{move to rvec_(m4h,0)
      arc cw rad m4v*3/2 from rvec_(Rect_(m4v*3/2,-60)) \
        to rvec_(Rect_(m4v*3/2,60)) with .c at Here}
     ground(,T,,`$4')',
  `$3',PA,
    `{Grnd_T: line to rvec_(0,m4v*1.6) \
       then to rvec_(5.5*m4h,0) \
       then to rvec_(0,-m4v*1.6) \
       then to Here}
     ground(at rvec_(m4h,0),T,,`$4')',
  `$3',P,
    `{Grnd_C: circle rad m4v*3/2 at rvec_(m4h,0)}
     ground(,T,,`$4')',
  `$3',E,
    `{line from rvec_(0,m4v*2/3) \
          to rvec_(0,-m4v*2/3) thick linethick*2}',
  `{line from rvec_(0,m4v) \
          to rvec_(0,-m4v)}
   {line from rvec_(m4h,dimen_/9) \
          to rvec_(m4h,-dimen_/9)}
   line from rvec_(2*m4h,dimen_/14) \
          to rvec_(2*m4h,-dimen_/14)')
   resetdir_} ')

                        `antenna(at position, T|stem length, A|L|T|S|D|P|F,
                                   U|D|L|R|degrees)
                                 arg2=T: truncate stem
                                 arg3= A=aerial; L=loop, T=triangle, S=diamond,
                                       D=dipole, P=phased, F=fork;
                                 up (default), down, left, right, angle (deg)'
define(`antenna',`[ T: Here
  define(`m4v',`dimen_/2')define(`m4h',`dimen_/12')dnl
  define(`m4atype',ifelse(`$3',,A,`$3'))dnl
  setdir_(ifelse(`$4',,90,`$4'))
  ifelse(
  m4atype,L,
   `T1: rvec_(0,m4h); T2: rvec_(0,-m4h)
    ifelse(`$2',,`move to rvec_(m4h*2,0)', `$2',T,,`move to rvec_(`$2',0)')
    line from T1 to rvec_(0,m4h) \
       then to rvec_(0,m4v/2) \
       then to rvec_(m4v-m4h,m4v/2) \
       then to rvec_(m4v-m4h,-m4v/2+m4h) \
       then to rvec_(m4h,-m4v/2+m4h) \
       then to rvec_(m4h,m4v/2-m4h) \
       then to rvec_(m4v,m4v/2-m4h) \
       then to rvec_(m4v,-m4v/2) \
       then to rvec_(0,-m4v/2) \
       then to rvec_(0,-m4h) \
       then to T2',
  m4atype,T,
   `ifelse(`$2',,`move to rvec_(m4h*2,0)', `$2',T,,`move to rvec_(`$2',0)')
    line to rvec_(m4v*3/4,m4v*sqrt(3)/4) \
      then to rvec_(m4v*3/4,-m4v*sqrt(3)/4) \
      then to Here
    line from rvec_(m4v*3/4,0) \
        to T',
  m4atype,S,
   `T1: rvec_(0,m4h); T2: rvec_(0,-m4h)
    ifelse(`$2',,`move to rvec_(m4h*2,0)', `$2',T,,`move to rvec_(`$2',0)')
    line from T1 to rvec_(0,m4h) \
       then to rvec_(m4v*3/4-m4h,m4v*3/4) \
       then to rvec_(2*m4v*3/4-m4h,0) \
       then to rvec_(m4v*3/4-m4h,-m4v*3/4) \
       then to rvec_(0,-m4h) \
       then to T2',
  m4atype,D,
   `T1: rvec_(0,m4h); T2: rvec_(0,-m4h)
    ifelse(`$2',,`move to rvec_(m4v,0)', `$2',T,,`move to rvec_(`$2',0)')
    { line from T1 to rvec_(0,m4h) \
       then to rvec_(0,m4h*3) }
    { line from T2 to rvec_(0,-m4h) \
       then to rvec_(0,-m4h*3) }',
  m4atype,P,
   `ifelse(`$2',,`move to rvec_(m4h*2/3,0)', `$2',T,,`move to rvec_(`$2',0)')
    line from T to Here
    { line from rvec_(0,-m4v/3) \
          to rvec_(0,m4v/3) }
    { line from rvec_(m4h,-m4v*2/3) \
          to rvec_(m4h,m4v*2/3) }',
  m4atype,F,
   `ifelse(`$2',,`move to rvec_(m4h*2,0)', `$2',T,,`move to rvec_(`$2',0)')
    { line from rvec_(m4v*3/4,m4v*sqrt(3)/4) \
          to rvec_(0,m4v*sqrt(3)/4) \
        then to rvec_(0,-m4v*sqrt(3)/4) \
        then to rvec_(m4v*3/4,-m4v*sqrt(3)/4)}
    line from rvec_(m4v*3/4,0) \
        to T',
  m4atype,A,
   `ifelse(`$2',,`move to rvec_(m4h*2,0)', `$2',T,,`move to rvec_(`$2',0)')
    { line from rvec_(m4v*3/4, m4v*sqrt(3)/4) to Here \
        then to rvec_(m4v*3/4,-m4v*sqrt(3)/4) }
    line from rvec_(m4v*3/4,0) \
        to T')
   `$5'; resetdir_ ] with .T ifelse(`$1',,`at Here',`$1')
 move to last [].T')

                                `switch( linespec,L|R,[O|C][D],L|B|D )
                                 Wrapper for bswitch, lswitch, dswitch
                                 R=right orientation (default L=left)
                                 if arg4=blank or L:
                                 arg3 = [O|C][D][K][A]
                                   D = circle at contact and hinge (dD = hinge
                                       only, uD = contact only)
                                   K=closed switch;
                                   A=arrowhead on switch blade;
                                   O=opening arrow; C=closing arrow
                                 if arg4=B (button switch): arg3 = O|C
                                   O=normally open; C=normally closed
                                 if arg4=D: arg3 = same as for dswitch'
define(`switch',`ifelse(
 `$4',, `lswitch(`$1',`$2',`$3')',
 `$4',L,`lswitch(`$1',`$2',`$3')',
 `$4',B,`bswitch(`$1',`$2',`$3')',
 `$4',D,`define(`m4qna_',`$3')dnl
  define(`m4rna_',W`'ifinstr(`$2',C,dBK,B)`'m4qna_)dnl
  dswitch(`$1',`$2',m4rna_)')')

                                `bswitch( linespec,L|R,chars ) pushbutton switch
                                 R=right orientation (default L=left)
                                 chars: O= normally open, C=normally closed'
define(`bswitch',`eleminit_(`$1') dnl
 define(`m4h',`dimen_/3') define(`m4cs',`0.069186*dimen_')dnl (2.5pt)
 define(`m4v',`ifelse(`$2',R,-m4cs,m4cs)')define(`dna_',`$3') dnl
 {line to rvec_(rp_len/2-m4h/2,0) chop 0 chop m4cs}
 { Bsw_T1: circle rad m4cs at rvec_(rp_len/2-m4h/2,0); move to last circle
   { Bsw_T2: circle rad m4cs at rvec_(m4h,0) }; ifelse(`$4',,,`{`$4'}')
   sc_draw(`dna_',C,dnl
    `{ line from rvec_(-m4cs,-(m4v)) \
          to rvec_(m4h+m4cs,-(m4v)) }
     { line from rvec_(m4h/2,-(m4v)) \
          to rvec_(m4h/2,m4v*3) }
     {[box invis ht_ 4*m4cs wid_ m4h+2*m4cs] at rvec_(m4h/2,m4v)}',
    `{ line from rvec_(-m4cs,m4v*2.5) \
          to rvec_(m4h+m4cs,m4v*2.5) }
     { line from rvec_(m4h/2,m4v*2.5) \
          to rvec_(m4h/2,m4v*4.5) }
     {[box invis ht_ 5.5*m4cs wid_ m4h+2*m4cs] at rvec_(m4h/2,m4v*1.75)}')
   line from rvec_(m4h,0) \
          to rvec_(m4h/2+rp_len/2,0) chop m4cs chop 0 }
 line to rvec_(rp_len,0) invis ')

                                `lswitch( linespec,L|R,chars ) knife switch
                                 R=right orientation (default L=left)
                                 chars=[O|C][[ud]D][K][A]
                                   D = circle at contact and hinge (dD = hinge
                                       only, uD = contact only)
                                   K=closed switch;
                                   A=arrowhead on switch blade;
                                   O=opening arrow; C=closing arrow'
define(`lswitch',`eleminit_(`$1') dnl
 define(`m4v',`dimen_/4')define(`m4cs',`dimen_/4*Sin(10)')dnl
 define(`dna_',`$3')define(`m4d',-1)define(`m4k',15)dnl
 m4t1 = arrowht; m4t2 = arrowwid;
 arrowht = dimen_/0.75*0.08; arrowwid = dimen_/0.75*0.053
 {line to rvec_(rp_len/2-dimen_/6,0)
  sc_draw(`dna_',K,`define(`m4k',25)dnl
    {{ifinstr(`$3',A,arrow m4c_l,line) \
     to LCtangent(Here,rvec_(dimen_/3,0),dotrad_,`$2') chop 0 chop -dotrad_}
     line from rvec_(dimen_/3,0) to rvec_(dimen_/3,ifelse(`$2',R,-)dotrad_)}',
   `{ifinstr(`$3',A,arrow m4c_l,line) \
      to rvec_(dimen_/4,ifelse(`$2',R,-)dimen_/4)}')
  sc_draw(`dna_',C,`{ arc <- m4c_l ifelse(`$2',R,,`c')cw \
      from rvec_(Rect_(dimen_/4,ifelse(`$2',R,,-)m4k))\
      to rvec_(Rect_(dimen_/4,ifelse(`$2',R,-)60)) \
      with .c at rvec_(Rect_(-dimen_/4,ifelse(`$2',R,-)(60-m4k)/2)) }')
  sc_draw(`dna_',O, `{ arc -> m4c_l ifelse(`$2',R,,`c')cw \
      from rvec_(Rect_(dimen_/4,ifelse(`$2',R,,-)10))\
      to rvec_(Rect_(dimen_/4,ifelse(`$2',R,-)75)) \
      with .c at rvec_(Rect_(-dimen_/4,ifelse(`$2',R,-)(75-10)/2)) }') }
 {{line from rvec_(rp_len/2+dimen_/6,0) \
          to rvec_(rp_len,0) }
  sc_draw(`dna_',D,
   `ifelse(m4a,u,,`dot(at rvec_(rp_len/2-dimen_/6,0),,1)')
    ifelse(m4a,d,,`dot(at last line.start,,1)')') }
 { [box invis ht_ dimen_/4+m4cs wid_ dimen_/3] \
     with .c at rvec_(rp_len/2,ifelse(`$2',R,-)(m4v-(m4cs))/2)}
 arrowht = m4t1 ; arrowwid = m4t2;  ifelse(`$4',,,`{`$4'}')
 line to rvec_(rp_len,0) invis ')

                                `dswitch(linespec,R,W[ud]B[K] chars)
                                 Comprehensive IEEE-IEC single-pole switch:
                                 arg2=R: orient to the right of drawing dir
                                 arg 3:
                                   blank means WB by default
                                   W=baseline
                                   B=contact blade
                                   Bm= mirror blade
                                   Bo=contact blade more widely open
                                   dB=contact blade to the right of direction
                                   K=vertical closing contact line
                                     use WdBK for a normally-closed switch
                                   Cb = circuit breaker function (IEC S00219)
                                   Co = contactor function (IEC S00218)
                                   C = external operating mechanism
                                   D = circle at contact and hinge (dD = hinge
                                       only, uD = contact only)
                                   DI = Disconnector; isolator (IEC S00288)
                                   E = emergency button
                                   EL = early close (or late open)
                                   LE = late close (or early open)
                                   F = fused
                                   H = time delay closing
                                   uH = time delay opening
                                   HH = time delay opening and closing
                                   K = vertical closing contact
                                   L = limit
                                   M = maintained (latched)
                                   MM = momentary contact on make
                                   MR = momentary contact on release
                                   MMR = momentary contact on make and release
                                   O = hand operation button
                                   P = pushbutton
                                   Pr[T|M] = proximity [touch-sensitive or
                                       magnetically controlled]
                                   R = time-delay operating arm
                                   Sd = Switch-disconnector
                                   Th = thermal control linkage
                                   Tr = tripping
                                   Y = pull switch
                                   Z = turn switch'
define(`dswitch',`eleminit_(`$1')
define(`dna_',ifelse(`$3',,WB,`$3'))dnl
define(`m4R',`ifelse(`$2',R,-)')define(`m4sc',`dimen_/24')dnl
 tr_xy_init(last line.c,m4sc,m4R)
 M4T: M4_xyO; M4B: M4T
 { line to tr_xy(-4,0)
   line from tr_xy(4,0) \
        to 2nd last line.end
  sc_draw(`dna_',Bm,
   `define(`m4c',ifelse(m4a,d,-))dnl
    M4B: line from tr_xy(-4,0) \
          to tr_xy(5.0,m4c`'4.5)
    line invis from M4B.start to M4B.end chop 0 chop -m4_xyU*5/4
    m4fshade(0,circle rad m4_xyU*5/4 at last line .end)
    M4Q: 2 between M4_xyO and M4B.c')
  sc_draw(`dna_',Bo,
   `define(`m4c',ifelse(m4a,d,-))dnl
    M4B: line from tr_xy(-4,0) \
          to tr_xy(4,m4c`'13/sqrt(3))
    M4Q: 2 between M4_xyO and M4B.c')
  sc_draw(`dna_',B,
   `define(`m4c',ifelse(m4a,d,-))dnl
    M4B: line from tr_xy(-4,0) \
          to tr_xy(5.0,m4c`'4.5)
    M4Q: 2 between M4_xyO and M4B.c')
  sc_draw(`dna_',Cb,
   `line from tr_xy(2,-2) to tr_xy(6, 2)
    line from tr_xy(2, 2) to tr_xy(6,-2)
    M4Q: tr_xy(0,-2) ')
  sc_draw(`dna_',Co,`ifelse(m4R,-,
   `M4Arc: arc ifelse(m4c,-,,c)cw from tr_xy(4,0) \
          to tr_xy(8,0) with .c at tr_xy(6,0)',
   `M4Arc: arc ifelse(m4c,-,c)cw from tr_xy(4,0) \
          to tr_xy(8,0) with .c at tr_xy(6,0)') ')
  sc_draw(`dna_',MMR,
   `line from tr_xy(6,1.16) \
          to tr_xy(4,0) \
       then to tr_xy(6,-1.16)')
  sc_draw(`dna_',MM,
   `line from tr_xy(5,0) \
          to tr_xy(4,0) \
       then to tr_xy(6,1.16)')
  sc_draw(`dna_',MR,
   `line from tr_xy(5,0) \
          to tr_xy(4,0) \
       then to tr_xy(6,-1.16)')
  sc_draw(`dna_',DI,
   `line from tr_xy(4,2) to tr_xy(4,-2)
    M4Q: tr_xy(0,-2) ')
  sc_draw(`dna_',D,
   `ifelse(m4a,u,,`dot(at tr_xy(-4,0),,1)')
    ifelse(m4a,d,,`dot(at tr_xy(4,0),,1)')')
  sc_draw(`dna_',EL,
   `line from 0.99 along_(M4B) \
        to M4B.end \
      then to M4B.end + ta_xy(vperp(M4B,m4c`'2.5,R))')
  sc_draw(`dna_',LE,
   `line from 0.99 along_(M4B) \
        to M4B.end \
      then to M4B.end + ta_xy(vperp(M4B,m4c`'2.5))')
  sc_draw(`dna_',K,
   `line from tr_xy(4,0) \
          to tr_xy(4,m4c`'5)')
  sc_draw(`dna_',F,
   `M4dT: 1/8 along_(M4B); M4dQ: 5/8 along_(M4B)
    line from M4dT to M4dT + ta_xy(neg_(m4c)1/2,1) \
      then to M4dQ + ta_xy(neg_(m4c)1/2,1) \
      then to M4dQ + ta_xy(m4c`'1/2,-1) \
      then to M4dT + ta_xy(m4c`'1/2,-1) \
      then to M4dT ')
  sc_draw(`dna_',L,
   `M4dT: 11/16 along_(M4B) define(`m4e',ifelse(m4a,d,-))
    line from 5/16 along_(M4B) \
      to M4dT + ta_xy(neg_(m4e)1,ifelse(m4c,m4e,,-)2) \
      then to M4dT')
  sc_draw(`dna_',Sd,
   `dot(at tr_xy(4,0),m4_xyU*3/2,1)
    line from tr_xy(4,2)+vec_(m4_xyU*3/2,0) \
      to tr_xy(4,-2)+vec_(m4_xyU*3/2,0)
    M4Q: tr_xy(0,-2) ')
  sc_draw(`dna_',Th,
   `define(`m4t',ifelse(m4a,d,-))dnl
    M4T: M4B.c+ta_xy(0,m4t`'12)
    line from M4B.c to M4B.c+ta_xy(0,m4t`'4.5) \
       then to M4B.c+ta_xy(3,m4t`'4.5) \
       then to M4B.c+ta_xy(3,m4t`'7.5) \
       then to M4B.c+ta_xy(0,m4t`'7.5) \
       then to M4T ')
  sc_draw(`dna_',Tr,
   `m4angtmp = rp_ang; point_(lin_ang(M4B))
    M4dT1: 0.4 along_(M4B); M4dT2: 0.65 along_(M4B)
    m4dTr = distance(M4dT1,M4dT2)
    move to M4dT1+vec_(0,m4c`'m4dTr/2)
    m4fshade(0,lbox(m4dTr,m4dTr))
    point_(m4angtmp) ')
  sc_draw(`dna_',PrM,
   `M4T: Proxim(dimen_/3) at M4B.c+ta_xy(0,ifelse(m4a,d,-)8)
    line dashed dimen_/16 from M4B.c to M4T chop 0 chop dimen_/6
    Magn(dimen_/3,dimen_/6) at M4T+vec_(0,ifelse(m4a,d,-)dimen_/4)')
  sc_draw(`dna_',M,
   `define(`m4t',ifelse(m4a,d,-))dnl
    M4T: M4B.c+ta_xy(0,m4t`'12)
    line dashed 1.5*m4sc from M4B.c to M4B.c+ta_xy(0,m4t`'4.5)
    line to M4B.c+ta_xy(-3,m4t`'6) \
       then to M4B.c+ta_xy(0,m4t`'7.5)
    line dashed 1.5*m4sc to M4T ')
  sc_draw(`dna_',C,
   `M4T: M4B.c+ta_xy(0,ifelse(m4a,d,-)12)
    line dashed from M4B.c to M4T ')
  sc_draw(`dna_',O,
   `line from M4T + ta_xy(-2.5,0) \
        to M4T + ta_xy(2.5,0) ')
  sc_draw(`dna_',PrT,
   `M4T: Proxim(dimen_/3) at M4B.c+ta_xy(0,ifelse(m4a,d,-)8)
    line dashed dimen_/16 from M4B.c to M4T chop 0 chop dimen_/6
    line to rvec_(dimen_/4,0) with .c at M4T+vec_(0,ifelse(m4a,d,-)dimen_/6)')
  sc_draw(`dna_',Pr,
   `M4T: Proxim(dimen_/3) at M4B.c+ta_xy(0,ifelse(m4a,d,-)8)
    line dashed dimen_/16 from M4B.c to M4T chop 0 chop dimen_/6 ')
  sc_draw(`dna_',P,
   `line from M4T + ta_xy(-2.5,-2.5) \
        to M4T + ta_xy(-2.5,0) \
      then to M4T + ta_xy(2.5,0) \
      then to M4T + ta_xy(2.5,-2.5) ')
  sc_draw(`dna_',Y,
   `line from M4T + ta_xy(-2.5,2.5) \
        to M4T + ta_xy(-2.5,0) \
      then to M4T + ta_xy(2.5,0) \
      then to M4T + ta_xy(2.5,2.5) ')
  sc_draw(`dna_',Z,
   `line from M4T + ta_xy(-2.5,-2.5) \
        to M4T + ta_xy(-2.5,0) \
      then to M4T + ta_xy(2.5,0) \
      then to M4T + ta_xy(2.5,2.5) ')
  sc_draw(`dna_',R,
   `define(`m4t',ifelse(m4a,d,-))dnl
    M4dT: 5/12 along_(M4B); M4dQ: 7/12 along_(M4B)
    line from M4dT to M4dT + ta_xy(0,m4t`'12)
    line from M4dQ to M4dQ + ta_xy(0,m4t`'(neg_(m4c)sqrt(3)/2+12))
    M4T: 1/2 between Here and 2nd last line.end ')
  sc_draw(`dna_',HH,
   `arc ifelse(m4R,-,c)cw \
      from M4T+ta_xy(3,3/2) \
        to M4T+ta_xy(-3,3/2) with .c at M4T+ta_xy(0,4.0)
    arc ifelse(m4R,,c)cw \
      from M4T+ta_xy(3,-3/2) \
        to M4T+ta_xy(-3,-3/2) \
      with .c at M4T+ta_xy(0,-4.0) ')
  sc_draw(`dna_',H,
   `define(`m4t',ifelse(m4a,d,-))dnl
    arc ifelse(m4t,m4R,,c)cw \
      from M4T+ta_xy(3,m4t`'3/2) \
        to M4T+ta_xy(-3,m4t`'3/2) \
      with .c at M4T + ta_xy(0,m4t`'4.0) ')
  sc_draw(`dna_',E,
   `line from M4T + ta_xy(-2.5,0) \
        to M4T + ta_xy(2.5,0)
    arc ifelse(m4R,-,,c)cw to last line.start with .c at M4T + ta_xy(0,-1.5) ')
    M4dQ: M4Q - (M4_xyO.x,M4_xyO.y)
  M4dT: M4T - (M4_xyO.x,M4_xyO.y)
  if M4dQ.x*M4dT.x + M4dQ.y*M4dT.y > 0 then { M4Q: M4_xyO }
  [ box invis ht_ distance(M4T,M4Q) wid_ 8*m4sc ] \
      with .c at 0.5 between M4T and M4Q
 }
 line to rvec_(rp_len,0) invis ')

                                `amp( linespec,size )
                                 Amplifier'
define(`amp',`eleminit_(`$1') define(`m4wd',`ifelse(`$2',,`dimen_',`($2)')')dnl
 {line to rvec_(max(0,rp_len/2-m4wd/2),0)
   line from rvec_(m4wd,0) \
          to rvec_(0,m4wd/2) \
       then to rvec_(0,-m4wd/2) \
       then to rvec_(m4wd,0) \
       then to rvec_(max(m4wd,rp_len/2+m4wd/2),0) }
 {[box invis ht_ m4wd wid_ m4wd] at rvec_(max(m4wd,rp_len)/2,0)}
 line to rvec_(max(rp_len,m4wd),0) invis ')

                                `integrator( linespec,size )'
define(`integrator',`eleminit_(`$1')
 define(`m4wd',`ifelse(`$2',,`dimen_',`($2)')')dnl
 {line from rvec_(m4wd/4,m4wd/2) \
          to rvec_(0,m4wd/2) \
       then to rvec_(0,-m4wd/2) \
       then to rvec_(m4wd/4,-m4wd/2) }
 {line from rvec_(m4wd*5/4,0) \
          to rvec_(m4wd/4,m4wd/2) \
    then to rvec_(m4wd/4,-m4wd/2) \
    then to rvec_(m4wd*5/4,0) \
    then to rvec_(max(rp_len,m4wd*5/4),0) }
 { [box invis ht_ m4wd wid_ m4wd*5/4] at rvec_(m4wd*5/8,0) }
 line to rvec_(max(rp_len,m4wd*5/4),0) invis ')

                                `opamp(linespec,
                                  - label, + label, size, chars)
                                   drawn as a []:
                                   defined positions:
                                     W, N, E, S, Out, E1, E2, In1, In2
                                   chars:
                                     P: power connections V1,V2
                                     R: labels at In1,In2 swapped
                                     T: truncated point '
define(`opamp',
`[define(`m4v',`ifelse(`$4',,`dimen_',`($4)')')define(`m4h',`m4v')dnl
define(`dna_',`$5')dnl
  eleminit_(`$1',max(elen_-m4h/4,m4h))
 W: Here
 N: vec_(0,m4v/2)
 S: vec_(0,-m4v/2)
 E: vec_(m4h,0)
 C: vec_(m4h/2,0)
 { sc_draw(`dna_',T,
    `line to N then to 0.75 between N and E \
       then to 0.75 between S and E then to S then to W
     line from 0.75 between W and E to E',
    `line to N then to E then to S then to W; move to E')
   if rp_len > m4h then { line to rvec_(rp_len-m4h,0) }
 Out: Here }
 NE: vec_(m4h/2,m4v/4); E1: NE
 SE: vec_(m4h/2,-m4v/4); E2: SE
 In1: vec_(0,m4v/4)
 In2: vec_(0,-m4v/4)
   { move to In`'ifinstr(dna_,R,2,1)
     ifelse(`$2',,"ifsvg(-,`$-$')" \
       at rvec_(4pt__,0) ifsvg(+(0,textht/10)),m4lstring(`$2',"`$2'"))}
   { move to In`'ifinstr(dna_,R,1,2)
     ifelse(`$3',,"ifsvg(+,`$+$')" \
       at rvec_(4pt__,0) ifsvg(+(0,textht/10)),m4lstring(`$3',"`$3'"))}
 sc_draw(`dna_',P,
   `{line from E1 to (vec_(m4h/2,m4v/4+m4v/8));    V1: Here}
    {line from E2 to (vec_(m4h/2,-(m4v/4+m4v/8))); V2: Here}')
 `$6' ] ')

                                `dac(width,height,nIn,nN,nOut,nS)'
define(`dac',`[
  define(`dac_ht',`ifelse(`$2',,(dimen_),`$2')')dnl
  define(`dac_wd',`ifelse(`$1',,(dimen_+dac_ht/2),`$1')')dnl
In: Here
C:  rvec_((dac_wd-dac_ht/2)/2,0)
NE: rvec_(dac_wd-dac_ht/2, dac_ht/2)
Out:rvec_(dac_wd,0)
SE: rvec_(dac_wd-dac_ht/2,-dac_ht/2)
NW: rvec_(0,dac_ht/2)
SW: rvec_(0,-dac_ht/2)
  define(`m4dn',ifelse(`$3',,1,`eval($3)'))dnl
  for_(1,m4dn,1,`In`'m4x: NW-vec_(0,dac_ht*(2*m4x-1)/(2*m4dn))')dnl
  define(`m4dn',ifelse(`$4',,1,`eval($4)'))dnl
  for_(1,m4dn,1,`N`'m4x: NW+vec_((dac_wd-dac_ht/2)*m4x/(m4dn+1),0)')dnl
  define(`m4dn',ifelse(`$5',,1,`eval($5)'))dnl
  for_(1,m4dn,1,`r = eval(2*m4x-1)/eval(m4dn*2)
    Out`'m4x: Out-vec_(ifelse(eval((2*m4x-1)<m4dn),1,,-)dac_ht*(0.5-r),
      dac_ht*(0.5-r))')dnl
  define(`m4dn',ifelse(`$6',,1,`eval($6)'))dnl
  for_(1,m4dn,1,`S`'m4x: SW+vec_((dac_wd-dac_ht/2)*m4x/(m4dn+1),0)')dnl
  line to NW then to NE then to Out then to SE then to SW then to Here
  `$7']')

                                `adc(width,height,nIn,nN,nOut,nS)'
define(`adc',`[
  define(`adc_ht',`ifelse(`$2',,(dimen_),`$2')')dnl
  define(`adc_wd',`ifelse(`$1',,(dimen_+adc_ht/2),`$1')')dnl
In: Here
C:  rvec_(adc_ht/4+adc_wd/2,0)
NE: rvec_(adc_wd, adc_ht/2)
Out:rvec_(adc_wd,0)
SE: rvec_(adc_wd,-adc_ht/2)
NW: rvec_(adc_ht/2, adc_ht/2)
SW: rvec_(adc_ht/2,-adc_ht/2)
  define(`m4dn',ifelse(`$3',,1,`eval($3)'))dnl
  for_(1,m4dn,1,`r = eval(2*m4x-1)/eval(m4dn*2)
    In`'m4x: In+vec_(ifelse(eval((2*m4x-1)<m4dn),1,,-)adc_ht*(0.5-r),
      adc_ht*(0.5-r))')dnl
  define(`m4dn',ifelse(`$4',,1,`eval($4)'))dnl
  for_(1,m4dn,1,`N`'m4x: NW+vec_((adc_wd-adc_ht/2)*m4x/(m4dn+1),0)')dnl
  define(`m4dn',ifelse(`$5',,1,`eval($5)'))dnl
  for_(1,m4dn,1,`Out`'m4x: NE-vec_(0,adc_ht*(2*m4x-1)/(2*m4dn))')dnl
  define(`m4dn',ifelse(`$6',,1,`eval($6)'))dnl
  for_(1,m4dn,1,`S`'m4x: SW+vec_((adc_wd-adc_ht/2)*m4x/(m4dn+1),0)')dnl
  line from Out to SE then to SW then to In then to NW then to NE then to Out
  `$7']')

                               `diode(linespec,
                                 B|CR|D|F|G|L|LE[R]|P[R]|S|Sh|T|V|v|w|Z|chars,
                                 [R][E])
                                 Adding K to arg2 draws open arrowheads
                                 Arg 3: R=reversed polarity, E=enclosure'
define(`diode',
`define(`m4dtype',`$3')sc_draw(`m4dtype',R,
 `reversed(`diode',`$1',`$2',m4dtype,shift(shift(shift($@))))',
 `eleminit_(`$1')dnl
  define(`dma_',`$2') ifelse(dma_,K,,
   `sc_draw(`dma_',K,`define(`m4ahd')',`define(`m4ahd',f)')')dnl
  ifelse(dma_,, `m4gen_d(LACR,m4ahd)',
         dma_,B,`m4gen_d(uLAZQuR,m4ahd)define(`m4dh',2*m4dh)',
         dma_,CR,`m4gen_d(LACRrb,m4ahd)',
         dma_,D,`m4gen_d(LuAHdQR,m4ahd)define(`m4dv',2*m4dv)',
         dma_,F,`m4gen_d(LFR,m4ahd)',
         dma_,G,`m4gen_d(uLAQuR,m4ahd)define(`m4dh',2*m4dh)',
         dma_,K,`m4gen_d(LACR)',
         dma_,L,`m4gen_d(LAcCR)',
         dma_,LE,`m4gen_d(LuEACR,m4ahd)',
         dma_,LER,`m4gen_d(LdEACR,m4ahd)',
         dma_,P,`m4gen_d(LuPACR,m4ahd)',
         dma_,PR,`m4gen_d(LdPACR,m4ahd)',
         dma_,S,`m4gen_d(LASR,m4ahd)',
         dma_,Sh,`m4gen_d(LFcCR,)',
         dma_,T,`m4gen_d(LATR,m4ahd)',
         dma_,V,`m4gen_d(LACXdR,m4ahd)',
         dma_,v,`m4gen_d(LACvdR,m4ahd)',
         dma_,w,`m4gen_d(LAdvXdR,m4ahd)',
         dma_,Z,`m4gen_d(LAZR,m4ahd)',
         `m4gen_d(patsubst(dma_,f),xtract(dma_,f,R,E))')
  sc_draw(`m4dtype',E,`define(`m4dh',`dimen_*0.7')define(`m4dv',`m4dh')dnl
    { Diode_Env: circle diam m4dh at rvec_(rp_len/2,0) }')
  define(`m4dm',
   `ifelse(dma_,S,`m4dv/4',
           dma_,Z,`(m4dv/4-linethick pt__/2)',
           dma_,v,`m4dv/4',
           dma_,w,`m4dv/4',
                  0)')dnl
 { [ box invis ht_ m4dv+linethick pt__*sqrt(3) wid_ m4dh+linethick pt__ + m4dm
     ] at rvec_(rp_len/2+m4dm/2,0) }
 line invis to rvec_(rp_len,0)')')

                               `m4gen_d(chars,[f][R][E]):
                                *This is an internal macro, subject to change*
                                *General: [u|d] for shift, R for orientation*
                                [u|d]A[c] arrowhead shifted up, down, or 0
                                [u|d]F[c] arrowhead open-sided (Shockley)
                                [u|d]B bar (gate) at arrowhead centre
                                [u|d]BB long bar (gate) at arrowhead centre
                                C vertical bar at right of arrowhead
                                [u|d]E em_arrows out
                                [u|d]F half arrowhead shifted
                                G gate for scr(,B), label G
                                rb current regulator bars
                                H double-length vertical bars
                                [u]L  left stem, uL = shortened
                                N thyristor gate at anode, label Ga
                                [u|d]P em_arrows
                                [u|d]Q[c] shifted left arrowhead [centerline]
                                [u]R  right stem, uR = shortened
                                S S-shape vertical bar
                                T T-diode vertical bar
                                W Thyristor gate from cathode, label G
                                X varicap diode-capacitor
                                [u|d]v varicap diode-capacitor curved plate
                                Y bilateral core
                                Z zener bar
                               arg 2: f= fill the arrowhead
                                      R=right orientation
                                      E=envelope flag '
define(`m4gen_d',`{dnl
  define(`m4dv',`dimen_/6')define(`m4dh',sqrt(3)*m4dv/2)dnl
  define(`ddna_',`ifelse(`$1',,`LACR',`$1')')dnl
  define(`ddf_',`ifelse(`$1',,f,`$2')')dnl
  define(`m4tR',`ifinstr(`$2',R,(-1),1)')dnl
  define(`m4dy',`(linethick pt__)*(sqrt(3)-1)/2')dnl
  M4_s: last line.start; M4_e: last line.end
  sc_draw(`ddna_',L,dnl            left stem, uL = shortened
   `line from M4_s to 0.5 between M4_s and M4_e \
      chop 0 chop m4dh`'ifelse(m4a,,/2)')
  dnl                              Elements drawn from left of body
  sc_draw(`ddna_',E,dnl            EM radiation arrows pointing out
   `ifelse(m4a,d,
     `{em_arrows(,rp_ang*rtod_-135) with .Tail at rvec_(-m4dh*0.3,-m4dv*0.8)}',
     `{em_arrows(,rp_ang*rtod_+135) with .Tail at rvec_(-m4dh*0.3,m4dv*0.8)}')')
  sc_draw(`ddna_',P,dnl            EM radiation arrows
   `ifelse(m4a,d,
     `{em_arrows(,rp_ang*rtod_+45) with .Head at rvec_(-m4dh*0.3,-m4dv*0.8)}',
     `{em_arrows(,rp_ang*rtod_-45) with .Head at rvec_(-m4dh*0.3, m4dv*0.8)}')')
  sc_draw(`ddna_',G,dnl            SCR gate
   `{Gm: line to ifinstr(`$2',E,2,3/2) between Here and \
     rvec_(m4dh,ifelse(m4a,d,-)m4dv/2) ifinstr(`$2',E,`then to \
       rvec_(m4dh*2,ifelse(m4a,d,-)sqrt((4*dimen_/10)^2-(m4dh*2)^2))')
     G: Here}')
  sc_draw(`ddna_',F,dnl            half arrowhead shifted up, down, or 0
   `sc_draw(`ddna_',Fc,`define(`m4Fc')')sc_draw(`ddna_',F,`undefine(`m4Fc')')dnl
    define(`m4dn',`ifelse(m4a,u,m4dv/2,m4a,d,-m4dv/2,0)')
    define(`m4dFline',`Gm: line from rvec_(0,m4tR*m4dn) \
           to rvec_(0,m4tR*(m4dn+m4dv/2)) \
      then to rvec_(m4dh-linethick pt__/2,m4tR*m4dn) \
      then to rvec_(0,m4tR*m4dn)')
    { ifinstr(ddf_,f,`m4fshade(m4fill,m4dFline)',`m4dFline')
    line to ifinstr(`$2',E,
     `rvec_(0,-(m4tR*sqrt((dimen_*0.7/2)^2-(m4dh/2)^2)))',
     `rvec_(0,-(m4tR*m4dv/2))')
     G: Here }
    ifdef(`m4Fc',`{line from rvec_(0,m4tR*m4dn) to rvec_(m4dh,m4tR*m4dn)}')
    move to rvec_(m4dh,0) ')
  ifinstr(ddna_,A,dnl              Arrowhead shifted up, down, or 0
   `sc_draw(`ddna_',Ac,`define(`m4Ac')')sc_draw(`ddna_',A,`undefine(`m4Ac')')dnl
    define(`m4dn',`ifelse(m4a,u,m4dv/2,m4a,d,-m4dv/2,0)')dnl
    define(`m4dFline',`line from rvec_(0,m4dn) \
             to rvec_(0,m4dn+m4dv/2) \
        then to rvec_(m4dh-linethick pt__/2,m4dn) \
        then to rvec_(0,m4dn-m4dv/2) \
        then to rvec_(0,m4dn)')
    { ifinstr(ddf_,f,`m4fshade(m4fill,m4dFline)',`m4dFline')}
    ifdef(`m4Ac',`{line from rvec_(0,m4dn) to rvec_(m4dh,m4dn)}')
    move to rvec_(m4dh,0) ')
  sc_draw(`ddna_',B,dnl            Perp bar at arrowhead centre
   `{ifelse(m4a,u,dnl              from arrow edge or across the centre line
     `Gm: line from        rvec_(-m4dh/2, m4dv/4) \
        to ifinstr(`$2',E,`rvec_(-m4dh/2, dimen_*0.35)',
                          `rvec_(-m4dh/2, m4dv*5/4+m4dy)')',
     m4a,d,
     `Gm: line from        rvec_(-m4dh/2,-m4dv/4) \
        to ifinstr(`$2',E,`rvec_(-m4dh/2,-dimen_*0.35)',
                          `rvec_(-m4dh/2,-m4dv*5/4-m4dy)')',
     `Gm: line from rvec_(-m4dh/2,-m4dv/2-m4dy) \
                 to rvec_(-m4dh/2, m4dv/2+m4dy)
      G: Gm.c')
     ifelse(m4a,,,G: last line.end) }')
  sc_draw(`ddna_',C,dnl            Vertical bar
   `{line from rvec_(0,-m4dv/2-m4dy) \
            to rvec_(0, m4dv/2+m4dy)}')
  m4gen_d2($@)dnl
  m4gen_d3($@)dnl
}') dnl              macro split to keep within m4 buffer size
  define(`m4gen_d2',`dnl
  dnl                             Elements drawn at right of body
  sc_draw(`ddna_',rb,dnl            Current regulator bars
   `{line from rvec_(-m4dv/4,-m4dv/2-m4dy) \
            to rvec_( m4dv/4,-m4dv/2-m4dy)}
    {line from rvec_(-m4dv/4,m4dv/2+m4dy) \
            to rvec_( m4dv/4,m4dv/2+m4dy)}')
  sc_draw(`ddna_',H,dnl            Double length double vertical bars
   `{line from rvec_(0,-m4dv-m4dy) \
            to rvec_(0, m4dv+m4dy)}
    {line from rvec_(-m4dh,-m4dv-m4dy) \
            to rvec_(-m4dh, m4dv+m4dy)}
    move to rvec_(-m4dh,0)')
  sc_draw(`ddna_',N,dnl            thyristor gate at anode, label Ga
   `{Gam: line from rvec_(-m4dh,-m4tR*m4dv/4) \
       to rvec_(-m4dh*2,-m4tR*m4dv*3/4) ifinstr(`$2',E,`then to \
       rvec_(-m4dh*2,-m4tR*sqrt((dimen_*0.7/2)^2-(m4dh*3/2)^2))')
     Ga: Here}')
  sc_draw(`ddna_',S,dnl            S-shape vertical bar
   `{line from rvec_(-m4dv/4,-m4dv/3) \
            to rvec_(-m4dv/4,-m4dv/2-m4dy) \
       then to rvec_(0,-m4dv/2-m4dy) \
       then to rvec_(0, m4dv/2+m4dy) \
       then to rvec_(m4dv/4,m4dv/2+m4dy) \
       then to rvec_(m4dv/4,m4dv/3)}')
  sc_draw(`ddna_',T,dnl            T-diode vertical bar
   `{line from rvec_(-m4dv/4,-m4dv/2-m4dy) \
            to rvec_(0,-m4dv/2-m4dy) \
       then to rvec_(0, m4dv/2+m4dy) \
       then to rvec_(-m4dv/4,m4dv/2+m4dy)}')
  sc_draw(`ddna_',v,dnl            Variable capacitor curved plate
   `ifelse(m4a,d,`define(`m4drad',`sqrt((m4dv/2+m4dy)^2+(m4dv)^2*3/4)')dnl
      {arc cw from rvec_(-(m4drad-m4dv*sqrt(3)/2), m4dv/2+m4dy) \
                to rvec_(-(m4drad-m4dv*sqrt(3)/2),-m4dv/2-m4dy) \
       with .c at rvec_(-m4drad,0)}',
     `{arc cw from rvec_(m4dv/3,-m4dv/2-m4dy) \
                to rvec_(m4dv/3, m4dv/2+m4dy) \
       with .c at rvec_(m4dv/3+m4dv*sqrt(3)/2,0)}
      {line from rvec_(m4dv/3+m4dv*sqrt(3)/2-last arc.rad,0) \
            to rvec_(m4dv/4,0)}')')
  sc_draw(`ddna_',W,dnl            cathode gate
   `{Gm: line from rvec_(0,m4tR*m4dv/4) \
       to rvec_(m4dh,m4tR*m4dv*3/4) ifinstr(`$2',E,
        `then to rvec_(m4dh,\
        m4tR*sqrt((dimen_*0.7/2)^2-(m4dh*3/2)^2))')
     G: Here}')
  sc_draw(`ddna_',X,dnl            Variable capacitor plate
   `{line from rvec_(m4dv/4,-m4dv/2-m4dy) \
            to rvec_(m4dv/4, m4dv/2+m4dy)}')
  sc_draw(`ddna_',Z,dnl            Zener bar
   `{line from rvec_(-m4dv/4,-m4dv/2-m4dy) \
            to rvec_(0,-m4dv/2-m4dy) \
       then to rvec_(0, m4dv/2+m4dy) \
       then to rvec_(m4dv/4,m4dv/2+m4dy)}')
  ifinstr(ddna_,Q,dnl              left arrowhead
   `sc_draw(`ddna_',Qc,`define(`m4Qc')')sc_draw(`ddna_',Q,`undefine(`m4Qc')')dnl
    define(`m4dn',`ifelse(m4a,u,m4dv/2,m4a,d,-m4dv/2,0)')dnl
    {move to rvec_(m4dh,0)
    define(`m4dFline',`line from rvec_(0,m4dn) \
             to rvec_(0,m4dn+m4dv/2) \
        then to rvec_(-(m4dh-linethick pt__/2),m4dn) \
        then to rvec_(0,m4dn-m4dv/2) \
        then to rvec_(0,m4dn) ')
    ifinstr(ddf_,f,`m4fshade(m4fill,m4dFline)',`m4dFline')}
    ifdef(`m4Qc',`{line from rvec_(0,m4dn) \
      to rvec_(-(m4dh-linethick pt__/2),m4dn)}')
    move to rvec_(m4dh,0)')dnl
') dnl              macro split to keep within m4 buffer size
  define(`m4gen_d3',`dnl
  sc_draw(`ddna_',Y,dnl            Bilateral switch
   `define(`m4vt',`(m4tR*m4dv/2)')dnl
      line from rvec_(0,-m4vt) to Here
      define(`m4dFline',`line to rvec_(0,m4vt) \
        then to rvec_(2*m4dh,0) \
        then to rvec_(2*m4dh,-m4vt) then to Here ')
      ifinstr(ddf_,f,`m4fshade(m4fill,m4dFline)',`m4dFline')
      line from rvec_(2*m4dh,m4vt) to rvec_(2*m4dh,0)
      { Gm: line from rvec_(-m4dh,m4vt) \
          to ifinstr(`$2',E,`rvec_(-m4dh,-m4tR*dimen_*0.35)',
                            `rvec_(-m4dh,-m4tR*m4dv*5/4)')
        G: Here }')
  sc_draw(`ddna_',R,dnl            right stem, uR = shortened
   `line from 0.5 between M4_s and M4_e to M4_e \
      chop m4dh ifelse(m4a,,/2,m4a,d,/2+m4dv/4) chop 0')
  ')dnl

                                `em_arrows( type,degrees,length)
                                 type=[N|I|E][D]  N=nonionizing, I=ionizing,
                                 E=simple; D=dot on arrow stem
                                 degrees = absolute arrow direction'
define(`em_arrows',`[ define(`m4dnm_',`ifelse($1,,N,$1)')dnl
  arrowhead = em_arrowhead
  define(`m4_len',
   `ifelse(`$3',,`dimen_*ifinstr(`$1',E,0.25,0.46)',`($3)')')
  ang = ifelse(`$2',,135,`($2)')*dtor_
  sc_draw(`m4dnm_',N,
   `{ A1: arrow m4c_l to rrot_(m4_len,0,ang) wid em_arrowwid ht em_arrowht }
    move to rrot_(0,-em_arrowwid*9/8,ang)
    { A2: arrow m4c_l to rrot_(m4_len,0,ang) wid em_arrowwid ht em_arrowht } ')
  sc_draw(`m4dnm_',I,`m4_rad_arr(A1)
    move to rrot_(0,-em_arrowwid*9/8,ang); m4_rad_arr(A2)')
  sc_draw(`m4dnm_',E,
   `{ A1: line to rrot_(m4_len,0,ang) \
        then to rrot_(m4_len-dimen_/18,dimen_/18,ang) }
    move to rrot_(0,-dimen_/8,ang)
    { A2: line to rrot_(m4_len,0,ang) \
        then to rrot_(m4_len-dimen_/18,dimen_/18,ang) }')
  sc_draw(`m4dnm_',D,`dot(at A1.start); dot(at A2.start)')
  Tail: 0.5 between A1.start and A2.start
  Head: 0.5 between A1.end and A2.end
  `$4']')
define(`m4_rad_arr',`{{`$1': line invis to rrot_(m4_len,0,ang)}
  for_(1,3,1,
   `arc ifelse(m4x,2,c)cw to rrot_(dimen_/10,0,ang) \
      with .c at rrot_(dimen_/20,0,ang)')
    arrow m4c_l to `$1'.end wid em_arrowwid ht em_arrowht*3/4 }')

                                `thyristor(linespec,
                                   [SCR|SCS|SUS|SBS|IEC][chars])
                                 Composite element in [ ] block
                                   SCR: silicon controlled rectifier (default)
                                   SCS: silicon controlled switch
                                   SUS: silicon unilateral switch
                                   SBS: silicon bilateral switch
                                   IEC: type IEC
                                 chars:
                                   A: arrowhead
                                   F: half arrowhead
                                   B: bidirectional diode
                                   E: adds envelope
                                   H: perpendicular gate, endpoint G
                                   N: anode gate, endpoint Ga
                                   R=right orientation
                                   U: centre line in diodes
                                   V: perpendicular gate at arrowhead centre
                                   K: use open arrowheads'
define(`thyristor',
 `define(`m4tharg',ifelse(`$2',,SCR,`$2')) dnl                        default
  define(`m4thtype',xtract(m4tharg,SCR,SCS,SUS,SBS,IEC))dnl
  ifelse(m4thtype,,`define(`m4thtype',xtract(m4tharg,B))')dnl
  define(`m4thx',`patsubst(m4tharg,m4thtype)')dnl        delete the type code
  sc_draw(`m4thx',R,`define(`m4thf',R)',`define(`m4thf')')dnl     orientation
  sc_draw(`m4thx',E,`define(`m4thf',m4thf`'E)')dnl                   envelope
  define(`m4thAc',xtract(m4thx,F,A))define(`m4thAc',patsubst(m4thAc,F,Fc))dnl
  define(`m4thAc',ifelse(m4thAc,,A,m4thAc)`'ifinstr(m4thx,U,c))dnl centerline
  define(`m4thf',m4thf`'ifinstr(m4thx,A,,m4thx,F,,m4thx,K,,f))dnl        fill
  ifelse(m4thtype,,
   `[define(`m4thyd',`dimen_*0.7') eleminit_(`$1',m4thyd); dnl   no type code
     A: last line.start; K: last line.end; T1:A; T2:K
     define(`m4tha',`patsubst(patsubst(patsubst(patsubst(m4thx,UA,Ac),V,B),
      H,ifinstr(m4thf,R,d,u)B),U,c)')dnl
     ifelse(xtract(m4tha,A,F,Q),,`define(`m4tha',m4tha`'A)dnl
      define(`m4thf',m4thf`'ifinstr(m4thx,K,,f))')dnl
     ifelse(xtract(m4tha,B,G,H,N,W),,`define(`m4tha',m4tha`'W)')dnl
     m4gen_d(LRC`'m4tha,m4thf)
     ifinstr(m4thf,E,`Env: circle diam m4thyd with .c at rvec_(rp_len/2,0)')
    `$3']',
    m4thtype,IEC,`bi_trans(`$1',
      ifinstr(m4thf,R,,R),uEdCBUT,xtract(m4thf,E),A:E;K:C;G:T;`$3')',
    `[define(`m4thyd',`dimen_*0.7') eleminit_(`$1',m4thyd)
      A: last line.start; K: last line.end; T1:A; T2:K
      ifelse(m4thtype,SCR,
       `m4gen_d(LCRW`'m4thAc,m4thf)',
      m4thtype,SCS,
       `m4gen_d(LCRWN`'m4thAc,m4thf)',
      m4thtype,SUS,
       `m4gen_d(LFR,m4thf)',
      m4thtype,SBS,
       `m4gen_d(uLYuR,m4thf)',
      m4thtype,B,`ifinstr(m4thf,R,
       `m4gen_d(LdG'xtract(m4thx,G)`dA`'m4thAc`'HuQ`'m4thAc`'R,m4thf)',
       `m4gen_d( LG'xtract(m4thx,G)`uA`'m4thAc`'HdQ`'m4thAc`'R,m4thf)')')
      ifinstr(m4thf,E,`Env: circle diam m4thyd with .c at rvec_(rp_len/2,0)')
     `$3']')')')

                                `scr(linespec, [R][E], label) and similar
                                 Place thyristor as a two-term element with
                                 arg 3 as label of the [] block'
define(`scr',`eleminit_(`$1'); M4_scrS: last line.start; M4_scrE: last line.end
  ifelse(`$3',,,`$3:') thyristor(from M4_scrS to M4_scrE,SCR`'`$2',`$4') \
    with .A at M4_scrS')
define(`scs',`eleminit_(`$1'); M4_scrS: last line.start; M4_scrE: last line.end
  ifelse(`$3',,,`$3:') thyristor(from M4_scrS to M4_scrE,SCS`'`$2'`',`$4') \
    with .A at M4_scrS')
define(`sus',`eleminit_(`$1'); M4_scrS: last line.start; M4_scrE: last line.end
  ifelse(`$3',,,`$3:') thyristor(from M4_scrS to M4_scrE,SUS`'`$2'`',`$4') \
    with .A at M4_scrS')
define(`sbs',`eleminit_(`$1'); M4_scrS: last line.start; M4_scrE: last line.end
  ifelse(`$3',,,`$3:') thyristor(from M4_scrS to M4_scrE,SBS`'`$2'`',`$4') \
    with .A at M4_scrS')

                                `tgate( linespec, [B][R|L] ) Transmission gate
                                 B= box form
                                 L= left orientation'
define(`tgate',`[ eleminit_(`$1') define(`m4tgm',ifinstr(`$2',L,-))
 A: last line.start
 B: last line.end
 C: last line.center
  ifinstr(`$2',B,
   `ebox(from A to B)
 Gb: C+vec_(0,m4tgm`'m4ht/2)
    L1: line from 2 between Gb and C to 4 between Gb and C',
   `m4gen_d(uLAQuR)
    Circle: circle thick max(4pt__,linethick/2) rad m4dh/4 \
      at C+vec_(0,m4tgm`'m4dh/4*4/3)
    L2: line from last circle+vec_(0,m4tgm`'m4dh/4) \
        to C+vec_(0,m4tgm`'m4dh*3/2)
 Gb: Here
    L3: line from C to C-vec_(0,m4tgm`'m4dh) ')
 G: Here
  `$3']')
                                `ptrans( linespec, [R|L] ) Pass transistor
                                 L= left orientation'
define(`ptrans',`[ eleminit_(`$1') define(`m4ptm',ifinstr(`$2',L,-))
  define(`m4pv',`dimen_/6')define(`m4pwd',m4pv*2)dnl
 A: last line.start; Start: A
 B: last line.end; End: B
 C: last line.center
    La1: line to rvec_(rp_len/2-m4pwd/2,0)
    { La2: line to rvec_(m4pwd,m4pv) \
       then to rvec_(m4pwd,neg_(m4pv)) \
       then to Here }
    { La3: line from rvec_(m4pwd,0) \
          to rvec_(0,m4pv) \
       then to rvec_(0,neg_(m4pv)) \
       then to rvec_(m4pwd,0)
    Circle: circle thick max(4pt__,linethick/2) rad m4pv/4 \
      at C+vec_(0,m4ptm`'m4pv*5/6)
    La4: line from last circle+vec_(0,m4ptm`'m4pv/4) \
        to C+vec_(0,m4ptm`'m4pv*2)
 Gb:Here
    La5: line from C-vec_(0,m4ptm`'m4pv/2) \
        to C-vec_(0,m4ptm`'m4pv*3/2)
 G: Here }
    La6: line from rvec_(m4pwd,0) \
        to B
  `$3']')
                                `tline( linespec, wid, len ) Transmission line'
define(`tline',`eleminit_(`$1')
   define(`m4v',`ifelse(`$2',,`dimen_/6',`($2)')')dnl
   define(`m4h',`ifelse(`$3',,`dimen_*2/3',min(rp_len-m4v/2,`$3'))')dnl
   {[box invis ht_ m4v wid_ m4h+m4v/2] at last line.c}
   {line from last line.c+vec_(m4h/2+m4v/4,0) \
        to last line.end}
   {line to 2nd last line.c+vec_(-m4h/2,0); round
    ifdpic(
    `line from rvec_(0,-m4v/2) \
          to rvec_(m4h,-m4v/2)
     spline 0.5523 to rvec_(m4v/4,0) \
       then to rvec_(m4v/4,m4v) \
          to rvec_(0,m4v)
     line to rvec_(-m4h,0)
     spline 0.5523 to rvec_(-m4v/4,0) \
       then to rvec_(-m4v/4,-m4v) \
       then to rvec_(m4v/4,-m4v) \
       then to rvec_(m4v/4,0) \
       then to Here',
    `line from rvec_(m4v/4,-m4v/2) \
          to rvec_(m4h-m4v/4,-m4v/2)
     spline to rvec_(m4v/2,0) \
       then to rvec_(m4v/2,m4v) \
       then to rvec_(0,m4v)
     line to rvec_(-m4h+m4v/2,0)
     spline to rvec_(-m4v/2,0) \
       then to rvec_(-m4v/2,-m4v) \
       then to rvec_(0,-m4v)\
       then to Here \
       then to rvec_(-m4v/2,0) \
       then to rvec_(-m4v/2,-m4v)\
       then to rvec_(0,-m4v)') }
   line to 5th last line.end invis ')

define(`m4_U',`dimen_/10')      `Semiconductor grid size'
define(`m4_Aht',`m4_U*10/6')    `Semiconductor arrowhead ht and wd'
define(`m4_Awd',`m4_U*10/9')

                                `Bipolar transistor bi_tr(linespec, L|R, P, E)'
define(`bi_tr',`bi_trans(`$1',`$2',ifelse(`$3',P,u,d)EBCBU,`$4',`$5')')

                                `Darlington(L|R, chars)
                                 arg2:
                                   E= envelope
                                   P= p-type,
                                   B1= internal base lead,
                                   R1= Q1 bias resistor; E1= ebox,
                                   R2= Q2 bias resistor; E2= ebox,
                                   D= damper diode
                                   Z= zener bias diode
                                 This macro would be somewhat simpler if the
                                 joints had not been mitred (using Along_ and
                                 mitre_)'
define(`Darlington', `[ rpoint_(dimen_/10) define(`m4DR',`ifinstr(`$1',R,-)')
   define(`m4Da',`$2') pushdef(`dimen_',((dimen_)*0.8))dnl Smaller internals
   hp_ang = rp_ang
   Q1: bi_trans(,`$1',ifinstr(m4Da,P,u,d)ECBU)
   E: Q1.E
   Q1B: line from Q1.Bulk.c to Q1.Bulk.c + vec_(0,m4DR`'m4_U)
   Q2: bi_trans(,`$1',ifinstr(m4Da,P,u,d)EBCBU) with .E at Here
   Mitre_(Q1B,Q2.Em0)
   B: Q2.B
   T: Q2.C+(Q2.Bulk.c.x-Q2.B.x,Q2.Bulk.c.y-Q2.B.y)
   QC: intersect_(Q2.C,T,Q1.E,Q1.C)
   C: QC
   L1: line from Along_(Q2.Cm0,hlth) to Q2.C then to QC then to Q1.C \
     then to Along_(Q1.Cm0,hlth)
   define(`m4DE1')sc_draw(`m4Da',E1,`define(`m4DE1',E)define(`m4Da',R1`'m4Da)')
   define(`m4DE2')sc_draw(`m4Da',E2,`define(`m4DE2',E)define(`m4Da',R2`'m4Da)')
   ifinstr(m4Da,E,
    `Env: circle rad 7.75*m4_U at Q1.Bulk.c+vec_(1.5*m4_U,m4DR`'(-0.1*m4_U))
     line from Q1.E to Q1.E+vec_(-2.2*m4_U,0); E: Here
     Mitre_(last line,Q1.Em0)
     line from QC to QC+vec_(2.2*m4_U,0); C: Here
     pushdef(`dotrad_',(dotrad_/2))dnl
     ifelse(ifinstr(m4Da,B1,T,m4Da,R1,T,m4Da,R2,T),T,`dot(at Q2.E)')
     ifelse(ifinstr(m4Da,R2,T,m4Da,Z,T),T,
      `dot(at Q2.Bulk.c+vec_(0,m4DR`'m4_U))')
     ifelse(ifinstr(m4Da,B1,T,m4Da,R1,T),T,`ifinstr(m4Da,R2,
      `dot(at Q2.E+vec_(-m4_U,0))')')
     ifinstr(m4Da,B1,
      `ifinstr(m4Da,R1,`dot(at Q2.E-vec_(3*m4_U,0))')
       B1: Q2.E+vec_(-3*m4_U,m4DR`'5.2*m4_U)
       line from B1 to Q2.E+vec_(-3*m4_U,0); corner')
     ifinstr(m4Da,Z,`dot(at QC+vec_(m4_U*3/2,0))')
     dot(at QC)
     ifinstr(m4Da,D,`dot(at Q1.E)')
     ifinstr(m4Da,R1,`dot(at Q1.E-vec_(m4_U,0))')
     popdef(`dotrad_')',
    `ifinstr(m4Da,B1,`move to Q2.E-vec_(3*m4_U,0); line to rvec_(-m4_U,0)
     B1: Here')') 
   ifelse(ifinstr(m4Da,B1,T,m4Da,R1,T,m4Da,R2,T),T,
    `line from Q2.E to Q2.E-vec_(m4_U,0)
     ifelse(ifinstr(m4Da,B1,T,m4Da,R1,T),T,
      `line to rvec_(-2*m4_U,0)
       ifinstr(m4Da,R1,
        `line to rvec_(-m4_U,0); corner pushdef(`dimen_',((dimen_)*0.6))
         R1: resistor(to Q1.E+vec_(-m4_U/0.6,0),,m4DE1) popdef(`dimen_')
         ifinstr(m4Da,E,,`corner;E: Here; line from Q1.E to E')
         point_(hp_ang)')')')
   ifinstr(m4Da,R2,
    `move to Q2.Bulk.c+vec_(0,m4DR`'m4_U)
     line to rvec_(-4*m4_U,0); corner
     pushdef(`dimen_',((dimen_)*0.6))dnl
     R2: resistor(to Q2.E+vec_(-m4_U/0.6,0),,m4DE2) popdef(`dimen_')
     point_(hp_ang)')
   ifinstr(m4Da,D,
    `DE: Q1.E + vec_(m4_U*3/2,m4DR`'(-m4_U*3/2))
     DS: QC - vec_(m4_U*3/2,m4DR`'m4_U*3/2)
     line from Q1.E to DE
     line from QC to DS
     mitre_(DS,DE,Q1.E)
     mitre_(DE,DS,QC)
     Diode: diode(ifinstr(m4Da,P,`from DS to DE',`from DE to DS'))
     point_(hp_ang)')
   ifinstr(m4Da,Z,
    `ifinstr(m4Da,E,,
      `line from QC to QC+vec_(m4_U*3/2,0); corner; C: Here')
     move to Q2.Bulk.c+vec_(0,m4DR`'m4_U)
     line to rvec_(2*m4_U,0) then to rvec_(4.5*m4_U,m4DR`'(-2*m4_U)) \
       then to rvec_(4.5*m4_U,m4DR`'(-2*m4_U-lthick/4))
     Zener: diode(ifinstr(m4Da,P,`to QC+vec_(m4_U*3/2,0)',
      `from QC+vec_(m4_U*3/2,0) to Here'),Z)
     point_(hp_ang)')
   popdef(`dimen_') `$4' ]')

                                `igbt(linespec, L|R, [L][[d]D])
                                 Arg 3: L = 2nd gate type, D = parallel diode,
                                 dD = dotted connections'
define(`igbt',`bi_trans(`$1',`$2',ifinstr(`$3',L,,GH)CBUdE`$3',,`$4')')

                                `Customizable bi_trans(linespec, L|R, chars, E)
                                 chars
                                   BU=bulk line
                                   B=base line and label
                                   uEn|dEn=emitters E0 to En
                                   uE|dE=emitter line
                                   Cn|uCn|dCn=collectors C0 to Cn (arrow u or d)
                                   C|uC|dC=collector line (arrow u or d)
                                   uT|dT=trigger line
                                   G=gate line and location
                                   H=gate line
                                   L=L-gate line and location
                                   S=Schottky
                                   [d]D=named parallel diode, d=connection dots'
define(`bi_trans',
 `define(`m4R',`ifelse(`$2',R,-)')define(`dna_',`ifelse(`$3',,BCuEBU,`$3')')dnl
  define(`m4n',0)define(`m4dE',)dnl
[ ifelse(`$1',,`tr_xy_init(,m4_U,m4R); E: tr_xy(-3,0); C: tr_xy(3,0)',
   `eleminit_(`$1'); tr_xy_init(last line.c,m4_U,m4R)
    E: last line.start; line from E to tr_xy(-3,0) \
        then to tr_xy(-3,0) + vec_( lthick*0.15,m4R`'lthick/3)
    C: E+vec_(rp_len,0); line from C to tr_xy(3,0) \
        then to tr_xy( 3,0) + vec_(-lthick*0.15,m4R`'lthick/3)')
  Bulk: line sc_draw(`dna_',BU,,invis) from tr_xy(-2,4) \
         to tr_xy(2,4)
  sc_draw(`dna_',B,
   `B: tr_xy(0,6.5); line from B to tr_xy(0,4)')
  for_(1,8,1,
   `sc_draw(`dna_',E`'m4x,`define(`m4n',m4x*1.5) define(`m4dE',m4a)
    m4bi_Em(m4x,m4a,E)
    line from tr_xy(-2,4) \
          to tr_xy(-2-m4n,4)
    Bulk: line invis from tr_xy(-2-m4n,4) \
        to Bulk.end')')
  sc_draw(`dna_',E,
   `define(`m4dE',m4a) m4bi_Em(0,m4a,E)')
  for_(1,8,1,
   `sc_draw(`dna_',C`'m4x,`define(`m4n',m4x*1.5)
    m4bi_Em(m4x,m4a,C)
    line from tr_xy(2,4) \
          to tr_xy(2+m4n,4)
    Bulk: line invis from Bulk.start to tr_xy(2+m4n,4)')')
  sc_draw(`dna_',C,
   `m4bi_Em(0,m4a,C)')
  sc_draw(`dna_',S,
   `Bulk: line invis from Bulk.start+ta_xy(-1,0) \
        to Bulk.end+ta_xy(1,0)
    S1: line from Bulk.end+ta_xy(-1,0) \
        to Bulk.end \
      then to Bulk.end+ta_xy(0,-0.5) \
       then to Bulk.end+ta_xy(-0.5,-0.5)
    S2: line from Bulk.start+ta_xy(1,0) \
        to Bulk.start \
      then to Bulk.start+ta_xy(0,0.5) \
       then to Bulk.start+ta_xy(0.5,0.5)')
  sc_draw(`dna_',T,
   `Tm: line from tr_xy(0,4) \
          to tr_xy(2/3,(4 ifelse(m4a,u,+,-)4/1.8*2/3))
    T: Here')
  sc_draw(`dna_',G,
   `G: tr_xy(0,6.5); line from G to tr_xy(0,4.7)')
  sc_draw(`dna_',H,
   `H1: line from tr_xy(-2,4.7) \
          to tr_xy(2,4.7)')
  sc_draw(`dna_',L,
   `G: tr_xy(-1.5,6.2); line from G to tr_xy(-1.5,4.7) \
       then to tr_xy(1.5,4.7)')
  sc_draw(`dna_',D,
   `D1: line from tr_xy(-5,0) \
          to tr_xy(-5,-4)
    D2: line from tr_xy( 5,0) \
          to tr_xy( 5,-4)
    ifelse(m4a,d,`dot(at tr_xy( 5,0)); dot(at tr_xy(-5,0))')
    Diode: diode(ifelse(m4dE,d,from,to) tr_xy(-5,-4) \
                 ifelse(m4dE,d,to,from) tr_xy( 5,-4))
    ifelse(m4dE,d,,rp_ang = rp_ang + pi_)
    ifelse(`$1',,`E: tr_xy(-5,0); line from E to tr_xy(-3,0);
                  C: tr_xy(5,0);  line from C to tr_xy(3,0)')')
  ifinstr(`$4',E,
   `A1: arc ifelse(`$2',R,c)cw from Bulk.end+ta_xy(-2,2.5) \
      to Bulk.end+ta_xy(-2,-5.5) with .c at Bulk.end+ta_xy(-2,-1.5)
    L1: line to Bulk.start+ta_xy(2,-5.5)
    A2: arc ifelse(`$2',R,c)cw to Bulk.start+ta_xy(2,2.5) \
      with .c at Bulk.start+ta_xy(2,-1.5)
    L2: line to Bulk.end+ta_xy(-2,2.5)')
  `$5'; manhattan ] ')
                                `emitters E0 ... En or collectors C0 ... Cn'
define(`m4bi_Em',
   ``$3'`$1': tr_xy(ifelse(`$3',E,-)(3+(`$1')*1.5),0)
    `$3'm`$1': line from `$3'`$1' to tr_xy(ifelse(`$3',E,-)(1.2+(`$1')*1.5),4)
    ifelse(`$2',,,`arrow m4c_l ht m4_Aht wid m4_Awd ifelse(`$2',d,<-) \
      from 1/4 between `$3'm`$1'.start and `$3'm`$1'.end \
      to 3/4 between `$3'm`$1'.start and `$3'm`$1'.end ')
    ifelse(eval(`$1'>0),1,`m4bi_Em(eval(`$1'-1),`$2',`$3')')')

                                `Unijunction transistor ujt(linespec, R,P,E)
                                   Bulk and terminals B1, B2, E defined
                                   arg 2: drawn to the right of curr direction
                                   arg 3: P-channel, default N
                                   arg 4: envelope'
define(`ujt',
`[ ifelse(`$1',,,`eleminit_($1)')
B1: Here
   ifelse(`$1',,,`line to rvec_(rp_len/2-m4_U*2,0)')
   Bl1: line to rvec_(0,ifelse(`$2',R,-)3.5*m4_U)
Bulk: line from rvec_(-m4_U*0.5,0) \
          to rvec_(m4_U*4.5,0)
   Bl2: line from Bulk.end+vec_(-m4_U/2,0) \
      to Bulk.end+vec_(-m4_U/2,ifelse(`$2',R,,-)3.5*m4_U) ifelse(`$1',,,`\
      then to Bulk.c+vec_(rp_len/2,ifelse(`$2',R,,-)3.5*m4_U)')
B2: Here
E:  Bulk.c+vec_(2*m4_U,ifelse(`$2',R,-)3.5*m4_U)
    E1: line from E to Bulk.center
    {arrow m4c_l from last line.ifelse(`$3',P,`end to 1',`start to 7')/8 \
      between last line.start and last line.end wid m4_Awd ht m4_Aht }
    ifelse(`$4',E,dnl
      `Env: circle rad 4*m4_U with .c at Bulk.c')
   `$5'; manhattan ] ')

                        `FETS:     j_fet(linespec, R, P, E )
                                   e_fet(linespec, R, P, E|S )
                                   d_fet(linespec, R, P, E|S )
                                   c_fet(linespec, R, P )
                                   g_fet(linespec, R, P, shade spec )
                                   with terminals S, D, G.
                                   arg 2: G pin drawn to right of curr direction
                                   arg 3: P-channel, default N
                                   arg 4: envelope or simplified'
define(`j_fet',`mosfet(`$1',`$2',ifelse(`$3',P,u,d)GSDF,`$4',`$5')')
                                  `Enhancement-mode FET e_fet(linespec,R,P,S,E)'
define(`e_fet',`mosfet(`$1',`$2',
  ifelse(`$4',S,`TFD'ifelse(`$3',P,u,d)S,`LEDSQ'ifelse(`$3',P,d,u)B),
    `$4',`$5')')
                                  `Depletion-mode FET d_fet(linespec,R,P,S,E)'
define(`d_fet',`mosfet(`$1',`$2',
  ifelse(`$4',S,`TFDR'ifelse(`$3',P,u,d)S,`LFDSQ'ifelse(`$3',P,d,u)B),
    `$4',`$5')')
                                  `Simplified switching c_fet(linespec,R,P)
                                   arg 3: negated G pin'
define(`c_fet',`mosfet(`$1',`$2',`ZSDF'ifelse(`$3',P,d)T,,`$4')')

                                  `Graphene FET g_fet(linespec,R,P,shadespec)'
define(`g_fet',`mosfet(`$1',`$2',ifinstr(`$3',P,d,u)SKTF,`$4',`$5') ')

                                  `Fe_fet(linespec,R,chars) FET with
                                    superimposed ferroelectric symbol:
                                    arg1, arg2, arg3 are as for mosfet'
define(`Fe_fet',`mosfet(`$1',`$2',ifelse(`$3',,SDFT,`$3'),,
  variable(,NN,60,dimen_/3,
    at (0.5 between S and D)+vec_(0,ifelse(`$2',R,-)4*m4_U)); `$4')')

 ` The comprehensive mosfet(linespec,R,BDEFGLQRSTXZ,E)
   Every drawn component is controlled by a letter or letter pair in arg 3;
   adding or changing elements is easily done by adding a test for a letter
   or letter sequence. The modifiers u and d are optional:
                               udB: center bulk connection pin; u or d arrow
                                 D: D pin and lead
                                 E: dashed substrate
                                 F: solid-line substrate
                               udG: G pin to substrate at source; u or d arrow
                               udH: G pin to substrate at center; u or d arrow
                                 K: graphene hexagon
                                 L: G pin to channel (kept for compatibility
                                    for now; the same as dM below)
                               udM: G pin to channel center or
                                    u: pin at drain end, d: pin at source end
                               udMn: gates G0 to Gn as above
                                Py: parallel diode
                                Pz: parallel zener diode
                                 Q: connect B pin to S pin
                                 R: thick channel
                               udS: S pin and lead; u or d arrow
                                dT: G pin to center of channel d: not circle
                                 X: XMOSFET terminal
                                 Z: simplified complementary MOS
                                 arg 2: body drawn to right of curr direction
                                 arg 4: envelope'
define(`mosfet',
 `define(`m4R',`ifelse(`$2',R,-)')dnl               right orientation flag
  define(`dna_',`ifelse(`$3',,DSEdMuBQ,`$3')')dnl
  define(`m4s',ifinstr(dna_,Z,2.5,3.5))dnl          size parameter
  define(`m4hs',2.5)define(`m4hhx',m4hs*sqrt(3))dnl hex side len
  define(`m4K',ifinstr(dna_,K,K))dnl
[ ifelse(`$1',,
   `tr_xy_init(,m4_U,m4R); ifinstr(dna_,K,
     `S: tr_xy(-m4hs,0); D: tr_xy(m4hs,0); W: S; E: D
      tr_xy_init(tr_xy(0,m4hhx/2-m4s),m4_U,m4R)',
     `S: tr_xy(-2,0); D: tr_xy(2,0)')',
   `eleminit_(`$1'); tr_xy_init(last line.c,m4_U,m4R)
    ifinstr(dna_,K,
     `S: last line.start; D: last line.end;
      W: tr_xy(-m4hs,0); line from S to W
      E: tr_xy( m4hs,0); line from D to E
      tr_xy_init(tr_xy(0,m4hhx/2-m4s),m4_U,m4R)',
     `S: last line.start; line from S to tr_xy(-2,0) \
           then to tr_xy(-2,0)+vec_(0,m4R`'linethick pt__)
      D: S+vec_(rp_len,0); line from D to tr_xy(2,0) \
         then to tr_xy(2,0)+vec_(0,m4R`'linethick pt__)')')
  sc_draw(`dna_',B,
   `B: tr_xy(0,0); Bl: line from B to tr_xy(0,m4s)
    ifelse(m4a,,,`arrow m4c_l ht m4_Aht wid m4_Awd ifelse(m4a,d,<-) \
      from tr_xy(0,m4s/2)-vec_(0,m4R`'m4_Aht/2) \
        to tr_xy(0,m4s/2)+vec_(0,m4R`'m4_Aht/2) ')')
  sc_draw(`dna_',D,
   `Dl: line from tr_xy(2,0) \
          to tr_xy(2,m4s)')
  sc_draw(`dna_',E,
   `Channel: line invis from tr_xy(-2.5,m4s) \
          to tr_xy(2.5,m4s)
    line from tr_xy(-2.5,m4s) \
          to tr_xy(-1,m4s)
    line from tr_xy(-0.5,m4s) \
          to tr_xy(0.5,m4s)
    line from tr_xy(1,m4s) \
          to tr_xy(2.5,m4s)')
  sc_draw(`dna_',F,
   `Channel: line from ifinstr(dna_,Z,
     `tr_xy(-2,m4s) \
          to tr_xy(2,m4s)',
     `tr_xy(-2.5,m4s) \
          to tr_xy(2.5,m4s)')')
  sc_draw(`dna_',G,
   `G: tr_xy(-2,(m4s+3.5))
    ifelse(m4a,,`Gl: line from tr_xy(-2,m4s) \
        to G',
           m4a,d,`Gl: arrow m4c_l from G to tr_xy(-2,m4s) ht m4_Aht wid m4_Awd',
           m4a,u,`Gl: line from tr_xy(-2,m4s) \
        to G; arrow m4c_l ht m4_Aht wid m4_Awd \
             from tr_xy(-2,(m4s+3-m4_Aht/(m4_U))) \
          to tr_xy(-2,(m4s+3))')')
  sc_draw(`dna_',H,
   `G: tr_xy(0,(m4s+4))
    ifelse(m4a,,`Hl: line from tr_xy(0,m4s) \
        to G',
           m4a,d,`Hl: arrow m4c_l from G to tr_xy(0,m4s) ht m4_Aht wid m4_Awd',
           m4a,u,`Hl: line from tr_xy(0,m4s) \
        to G; arrow m4c_l ht m4_Aht wid m4_Awd \
             from tr_xy(0,(m4s+3-m4_Aht/(m4_U))) \
          to tr_xy(0,(m4s+3))')')
  sc_draw(`dna_',K,
   `NW: W+ta_xy( m4hs/2, m4hhx/2)
    SW: W+ta_xy( m4hs/2,-m4hhx/2)
    SE: E+ta_xy(-m4hs/2,-m4hhx/2)
    NE: E+ta_xy(-m4hs/2, m4hhx/2)
    Kl: line from NW \
     to W then to SW then to SE then to E then to NE then to NW `$4'')
  sc_draw(`dna_',L,
   `G: tr_xy(-2,(m4s+3.5))
    Ll: line from tr_xy(2,(m4s+1)) \
          to tr_xy(-2,(m4s+1)) \
          then to G')
  for_(1,4,1,
   `sc_draw(`dna_',M`'m4x,`m4mo_Mm(m4x,m4a,`$4',ifinstr(dna_,Z,2,2.5))')')
  sc_draw(`dna_',M,`ifelse(
    m4a,, `G: tr_xy(0,(m4s+4))
           Glh: line from tr_xy(2,(m4s+1)) \
          to tr_xy(-2,(m4s+1))
           Glv: line from tr_xy(0,(m4s+1)) \
        to G',
    m4a,u,`G: tr_xy(2,(m4s+3.5))
           Gl: line from tr_xy(-2,(m4s+1)) \
          to tr_xy(2,(m4s+1)) \
          then to G',
    m4a,d,`G: tr_xy(-2,(m4s+3.5))
           Gl: line from tr_xy(2,(m4s+1)) \
          to tr_xy(-2,(m4s+1)) \
          then to G')')
  sc_draw(`dna_',Py,`pushdef(`m4pdd_mosfet')')
  sc_draw(`dna_',Pz,`pushdef(`m4pdd_mosfet',Z)')
  ifdef(`m4pdd_mosfet',
   `define(`m4q',m4a)dnl
    Diode: diode(ifelse(m4q,d,to,from) tr_xy(-2,-2) \
                 ifelse(m4q,d,from,to) tr_xy( 2,-2),m4pdd_mosfet)
    ifelse(m4q,d,rp_ang = rp_ang + pi_)
    line from tr_xy(-2,0) \
          to tr_xy(-2,-2) \
      then to tr_xy(2,-2) \
      then to tr_xy(2,0)
    popdef(`m4pdd_mosfet')')
  sc_draw(`dna_',Q,
   `Ql: line from tr_xy(0,0)+vec_(0,m4R`'linethick pt__) \
          to tr_xy(0,0) \
      then to tr_xy(-2,0) \
      then to tr_xy(-2,0)+vec_(0,m4R`'linethick pt__)')
  sc_draw(`dna_',R,
   `Rl: line thick 2*linethick from tr_xy(-2,m4s)\
         -vec_(0,m4R`'linethick*3/2 pt__) \
          to tr_xy(2,m4s)-vec_(0,m4R`'linethick*3/2 pt__) ')
  sc_draw(`dna_',S,`ifelse(m4K,K,
   `Sl: arrow m4c_l ht m4_Aht*2/3 wid m4_Awd \
     from ifelse(m4a,u,NW to W,W to NW)',
   `Sl: line from tr_xy(-2,0) \
          to tr_xy(-2,m4s)
    ifelse(m4a,,,`arrow m4c_l ht m4_Aht wid m4_Awd ifelse(m4a,d,<-) \
      from tr_xy(-2,m4s/2)-vec_(0,m4R`'m4_Aht/2) \
        to tr_xy(-2,m4s/2)+vec_(0,m4R`'m4_Aht/2) ')')')
  sc_draw(`dna_',T,
   `Tl: line from tr_xy(-2,(m4s+1)) \
          to tr_xy(2,(m4s+1))
    ifelse(m4a,d,`Nt: circle rad m4_U*2/3 with .c at tr_xy(0,(m4s+1+2/3))')
    Gl: line from tr_xy(0,`(m4s+1'`ifelse(m4a,d,+4/3))') \
           to tr_xy(0,(m4s+4)); G: Here')
  sc_draw(`dna_',X,dnl          From Matteo Agostinelli
   `B: tr_xy(0,0); Xv: line from B to tr_xy(0,m4s-1)
       Xh: line from tr_xy(-1.5,m4s-1) \
          to tr_xy(1.5,m4s-1)')
  ifelse(`$4',E,`Env: circle rad 4*m4_U with .c at tr_xy(0,m4s)')
  `$5'; manhattan ] ')
define(`m4mo_Mm',dnl                 (m4n,m4a,[E])
 `define(`m4mo_d',`eval((`$1')*2+1)')dnl
  for_(0,`$1',1,
   `define(`m4moc',`ifelse(`$2',u,
     ` (`$4')-`$4'*4*m4x/m4mo_d',`-`$4'+`$4'*4*m4x/m4mo_d')')dnl
    ifinstr(`$3',E,
     `M4moM: move from tr_xy(m4moc,m4s) to tr_xy(m4moc,m4s+1)
      G`'m4x: LCintersect(M4moM,tr_xy(0,m4s),4*m4_U,R)',
     `G`'m4x: tr_xy(m4moc,m4s+4)')
    Gm`'m4x: line from G`'m4x to tr_xy(m4moc,m4s+1) \
      then to tr_xy(m4moc`'ifelse(`$2',u,-,+)2*`$4'/m4mo_d,m4s+1) ') ')

                               `Macro-internal coordinates adjusted for L|R'
define(`ta_xy',`vec_(vscal_(m4_xyU,`$1',ifelse(`$2',0,0,m4_xyS`($2)')))')
                               `Relative adjusted macro-internal coordinates'
define(`tr_xy',`M4_xyO+vec_(vscal_(m4_xyU,`$1',ifelse(`$2',0,0,m4_xyS`($2)')))')
                               `Initialize tr_xy_init(origin,unit,-)'
define(`tr_xy_init',
`M4_xyO: ifelse(`$1',,Here,`$1')
define(`m4_xyU',`$2')dnl
define(`m4_xyS',`$3')')

                               `Extract substring plus preceding char if u or d'
define(`m4_dna',`define(`m4I_',index($1,`$2'))dnl
ifelse(m4I_,-1,`define(`m4t',0)',`define(`m4t',eval(m4I_+len($2)))dnl
define(`m4a',ifelse(substr($1,decr(m4I_),1),u,`define(`m4I_',decr(m4I_))'u,
                    substr($1,decr(m4I_),1),d,`define(`m4I_',decr(m4I_))'d))dnl
define(`$1',substr($1,0,m4I_)`'substr($1,m4t))')')dnl

                               `Conditional subcomponent draw
                                sc_draw(dna string, chars, iftrue, iffalse)'
define(`sc_draw',`m4_dna(`$1',`$2')ifelse(m4I_,-1,`$4',`$3')')

                               `Element labels at the start, centre, and end
                                of the last [] block (or a named [] block)
                                in the current direction.  Labels are
                                spaced and treated as math, but copied
                                literally if double quoted or defined
                                by sprintf.
                                Arg4 can be above, below, left, right
                                to supplement the default position.
                                Arg5 is the optional name of a [] block
                                and is last [] by default.'
                               `The hash (pound sign) is used in svg text so
                                we temporarily turn off comments for svg' 
define(`rlabel',`ifsvg(`changecom(,)')dnl
m4label(`$1',`$2',`$3',.s_,below_,`$4',`$5')`'ifsvg(`changecom(`#',)')')

define(`llabel',`ifsvg(`changecom(,)')dnl
m4label(`$1',`$2',`$3',.n_,above_,`$4',`$5')`'ifsvg(`changecom(`#',)')')

define(`clabel',`ifsvg(`changecom(,)')dnl
m4label(`$1',`$2',`$3',,,`$4',`$5')`'ifsvg(`changecom(`#',)')')
                   labels at centre and both ends of an element `dimen_' long
define(`m4label',`dnl
 ifelse(`$1',,,
  `{m4lstring(`$1',"sp_`'iflatex(`$ `$1'$',`$1')`'sp_") \
     at ifelse(`$7',,last [],`$7').w_ $5 rjust_ $6};')dnl
 ifelse(`$2',,,
  `{m4lstring(`$2',"sp_`'iflatex(`$ `$2'$',`$2')`'sp_") \
     at ifelse(`$7',,last [],`$7')$4 $5 $6};')dnl
 ifelse(`$3',,,
  `{m4lstring(`$3',"sp_`'iflatex(`$ `$3'$',`$3')`'sp_") \
     at ifelse(`$7',,last [],`$7').e_ $5 ljust_ $6};')dnl
 ')
                               `dlabel(long,lateral,label,label,label,chars)
                                Labels for oblique or aligned elements
                                long, lateral: dispacement from center
                                    with respect to drawing direction
                                chars:
                                  X displacement is from the centre of the last
                                    line rather than the centre of the last []
                                  L,R,A,B align labels ljust, rjust, above,
                                    or below (absolute) respectively'
define(`dlabel',`ifsvg(`changecom(,)')dnl
 define(`m4long_',`ifelse(`$1',,`dimen_',`($1)')')dnl
 define(`m4lat_',`ifelse(`$2',,`10bp__',`($2)')')dnl
 ifelse(`$3',,,
  `{m4lstring(`$3',"iflatex(`$ `$3'$',` $3')") \
     at last ifinstr(`$6',X,line,[]).c+vec_(-m4long_,m4lat_) \
     ifinstr(`$6',L,ljust,`$6',R,rjust) dnl
     ifinstr(`$6',A,above,`$6',B,below) };') dnl
 ifelse(`$4',,,
  `{m4lstring(`$4',"iflatex(`$ `$4'$',` $4')") \
     at last ifinstr(`$6',X,line,[]).c+vec_(0,m4lat_) \
     ifinstr(`$6',L,ljust,`$6',R,rjust) dnl
     ifinstr(`$6',A,above,`$6',B,below) };') dnl
 ifelse(`$5',,,
  `{m4lstring(`$5',"iflatex(`$ `$5'$',` $5')") \
     at last ifinstr(`$6',X,line,[]).c+vec_(m4long_,m4lat_) \
     ifinstr(`$6',L,ljust,`$6',R,rjust) dnl
     ifinstr(`$6',A,above,`$6',B,below) };') ifsvg(`changecom(`#',)')')

                               `eleminit_( linespec, default length )
                                compute element direction and length.
				                Eleminit_ defines the position, length,
				                and angle of two-terminal elements.  It calls
                                rpoint_ with its linespec or circuit-element
                                default. The rpoint_ macro draws the invisible
                                line determined by its argument, calculates the
                                length and angle, and gives the angle to the
                                point_ macro to set the rotation parameters used
                                by vec_ and rvec_.'
define(`eleminit_',
 `rpoint_(ifelse(`$1',,`to rvec_(ifelse(`$2',,`elen_',`$2'),0)',`$1'))')

                              `parallel_(`elementspec', `elementspec', ...
                               Parallel combination of two-terminal elements
                               in a [ ] block. Each elementspec is quoted and
                               of the form
                               [Sep=val;][Label:] element; [attributes]
                               where an attribute is of the form
                                [llabel(...);]|[rlabel(...);][b_current(...);]
                               Sep=val; in the first branch sets the default
                               separation of all branches to val; in a later
                               element Sep=val; applies only to that branch.
                               An element may have normal arguments but should
                               not change the drawing direction.
                               An argument may also be series_(args) or
                               parallel_(args) without attributes or quotes.
                               example:
                               define(`elen_',dimen_) setdir_(Down)
                               parallel_(
                                 `resistor;llabel(,R);inductor(,W);llabel(,L)',
                                 `capacitor;rlabel(,C)')
'
define(`parallel_',
`[ ifdef(`m4rp_ang',rp_ang = m4rp_ang;) pwid = 0
 stackargs_(`m4parR',$@) stackexec_(`m4parR',`m4parS')dnl
 define(`m4br',0) define(`m4parsep',`m4sepdefault')dnl
 stackdo_(`m4parS',
  `define(`m4pel',m4parS)
   setkey_(m4pel,Sep,m4parsep)dnl
   ifelse(m4br,0,`define(`m4parsep',m4Sep)')dnl
   ifinstr(m4pel,Sep=,`define(`m4pel',substr(m4pel,eval(index(m4pel,;)+1)))')
   E`'eval(m4br+1): [
     Start: Here
     m4pel
     End: Here
     C: 0.5 between Start and End
     ] ifelse(m4br,0,,`with .C at C`'m4br-vec_(0,m4Sep)')
   define(`m4br',incr(m4br))dnl
   Start`'m4br: E`'m4br.Start; End`'m4br: E`'m4br.End; C`'m4br: E`'m4br.C
   pwid = max(pwid,distance(Start`'m4br,End`'m4br))
   ')
 U: Vdiff_(End1,Start1)
 d = vlength(U.x,U.y); if d==0 then { d=1 } else { d = 1/d }
 Unit: Vsprod_(U,d)
 line from C1-(Vsprod_(Unit,pwid/2)) to C`'m4br-(Vsprod_(Unit,pwid/2)) \
   chop -lthick/2
 Start: last line.c
 line from C1+Vsprod_(Unit,pwid/2) to C`'m4br+Vsprod_(Unit,pwid/2) \
   chop -lthick/2
 End: last line.c; C: 0.5 between Start and End
 for_(1,m4br,1,`
   line from Start`'m4x to C`'m4x-Vsprod_(Unit,pwid/2)
   line from   End`'m4x to C`'m4x+Vsprod_(Unit,pwid/2)')
 ] with .Start at Here; move to last [].End
')

                               `par_( element, element, separation )
                                Parallel combination of two branches that have
                                the same direction and length. The
                                branch arguments must be quoted, e.g.
                                par_(`resistor',`capacitor',dimen_)'
` ***WARNING: this macro is considered obsolete'
define(`par_',`[Start: Here; r = ifelse(`$3',,`dimen_',`$3')
   { move to Start + vec_(0,r/2);  $1 }
   line from Start + vec_(0,r/2) \
        to Start + vec_(0,-r/2) ; $2
   line to rvec_(0,r)
   End: last line.c; `$4'] with .Start at Here
   move to last [].End')

                               `gpar_( element, element, separation )
                                Parallel combination of two branches that have
                                the same direction, e.g.:
                                down_; gpar_(
                                  resistor;llabel(,R_1);resistor;llabel(,R_2),
                                  capacitor;rlabel(,C))
                                This macro trades simplicity for generality
                                and robustness to gpic'
` ***WARNING: this macro is considered obsolete'
define(`gpar_',
 `[ M4_B1: Here; `$1'; M4_E1: Here
    M4_C: 0.5 between M4_B1 and M4_E1; eleminit_(from M4_B1 to M4_E1)
    E2:[ M4_B: Here; `$2';  M4_E: Here; `$4'] \
      with .c at M4_C + (rect_(ifelse(`$3',,`dimen_',`$3'),rp_ang-pi_/2))
    M4_B2: E2.M4_B; M4_E2: E2.M4_E
    s = distance(M4_B2,M4_E2)
    if rp_len*s == 0 then { r = 1 } else { r = (1+max(rp_len/s, s/rp_len))/2 }
    if rp_len < s then { Tmp:M4_B2; M4_B2:M4_B1; M4_B1:Tmp
                         Tmp:M4_E2; M4_E2:M4_E1; M4_E1:Tmp }
    line from M4_B2 to r between M4_E2 and M4_B2
  Start: 0.5 between Here and M4_B1; line to M4_B1
    line from M4_E2 to r between M4_B2 and M4_E2
  End: 0.5 between Here and M4_E1
  C: 0.5 between Start and End; line to M4_E1 ] with .Start at Here
    move to last [].End ')

define(`m4sepdefault',`dimen_') `Default separation in the parallel_ macro'
define(`m4lendefault',`dimen_') `Default length in the series_ macro'

                              `series_(elementspec, elementspec, ... )
                               Series combination in a [] block of elements
                               with shortened default length
                               An elementspec is of the form
                                [Label:] element; [attributes]
                               where an attribute is of the form
                                [llabel(...);]|[rlabel(...);][b_current(...);]
                               Internal points Start, End, and C are defined
                               automatically.'
define(`series_',
`[ pushdef(`elen_',m4lendefault)dnl
 stackargs_(`m4serR',$@) stackexec_(`m4serR',`m4serS')dnl
 ifdef(`m4rp_ang',rp_ang = m4rp_ang;) Start: Here
 stackdo_(`m4serS',`m4serS
') End: Here;
 C: 0.5 between Start and End
 popdef(`elen_')] with .Start at Here; move to last [].End
')

                                `reversed(`macro name in quotes', macro args)
                                 reverse polarity of two-terminal element'
define(`reversed',`eleminit_(`$2')
  $1(from last line.end to last line.start,shift(shift($@)))
  rp_ht = -rp_ht; rp_wid = -rp_wid; rp_ang = rp_ang - pi_
  line invis to last line.start ')

                                `resized(factor,`macro name in quotes',args)
                                 multiply element body size by factor'
define(`resized',`define(`m4resiztmp',dimen_)define(`dimen_',(dimen_)*(`$1'))dnl
  $2(shift(shift($@))) define(`dimen_',m4resiztmp)')

                                `variable(`element', type, [+|-]angle,
                                   length, at position)
                                 overlaid arrow or line on two-terminal element
                                 to show variablility:
                                 type = [A|P|L|[u]N|[u]NN][C|S]
                                 A=arrow; P=preset; L=linear; N=nonlinear;
                                 NN=symmetric nonlinear, u changes direction;
                                 C=continuous; S=setpwise.
                                 If arg3 begins with + or -, then the argument
                                 (typically -45) is relative to the current
                                 drawing angle. If arg5 is blank the symbol
                                 is placed over the last []'
define(`variable',`$1
 {[ define(`dna_',ifelse($2,,A,$2))define(`m4sgn',regexp(`$3',^ *[+-]))dnl
   ang = ifelse(m4sgn,-1,,rp_ang*rtod_) ifelse(`$3',,45,`$3')
   define(`m4a2',`ifelse(m4sgn,0,rp_ang-pi_/2,0)') dnl
   define(`m4a3',`ifelse(m4sgn,0,rp_ang,pi_/2)') dnl
   define(`m4tip',`dimen_/8')dnl
   T: (Rect_(ifelse(`$4',,`dimen_*0.8',`$4'),ang))
   sc_draw(`dna_',P,`Line: line to T; C: Line.c
     [line to (Rect_(m4tip,ang-90))] at Line.end')
   sc_draw(`dna_',L,`Line: line to T; C: Line.c')
   sc_draw(`dna_',NN,`C: 1/2 between Here and T
     ifelse(m4a,u,`Line: line  from Here+(rect_(-m4tip,m4a3)) to Here \
                     then to T then to T+(rect_( m4tip,m4a3))',
                  `Line: line from  Here+(rect_(-m4tip,m4a2)) to Here \
                     then to T then to T+(rect_( m4tip,m4a2))')')
   sc_draw(`dna_',N,`C: 1/2 between Here and T
     ifelse(m4a,u,`Line: line to T then to T+(rect_(m4tip,m4a3))',
                  `Line: line from T to Here \
                    then to Here+(rect_(-m4tip,m4a2))')')
   sc_draw(`dna_',A,`Line: arrow to T; C: Line.c')
   sc_draw(`dna_',C,`move to T+(dimen_*0.10,-dimen_*0.06)
     line to Here+(Rect_(m4tip,ang))')
   sc_draw(`dna_',S,`move to T+(dimen_*0.10,-dimen_*0.12)
     line up dimen_*0.06 then right dimen_*0.12 then up dimen_*0.06')
   `$6'] with .C ifelse(`$5',,at last [].c,`$5') } ')

                                `Line hopping over named lines,
                                 diverting left or right:
                                crossover(linespec,L|R,line_name,line_name,...)'
define(`hoprad_',`dimen_/12')
define(`crossover',`eleminit_(`$1')dnl
  M4_Tmp: last line.end
  m4_xover_(shift($@))dnl
  line to M4_Tmp')
define(`m4_xover_',
 `define(`m4_lt2',`ifelse(ifpstricks(T)`'ifmpost(T)`'ifpgf(T)`'ifsvg(T),T,
   `hlth',0)')dnl
  ifelse(`$2',,,
   `line to intersect_(last line.start,M4_Tmp,`$2'.start,`$2'.end)\
      chop 0 chop hoprad_-m4_lt2
    ifelse(`m4_lt2',0,,`move to rvec_(-m4_lt2,0)')
    arc ifelse(`$1',R,c)cw to rvec_(2*hoprad_,0) with .c at rvec_(hoprad_,0)
    ifelse(`m4_lt2',0,,`move to rvec_(-m4_lt2,0)')
    m4_xover_(`$1',shift(shift($@)))')')

                                `NPDT(npoles,chars) Double throw switch
                                 chars:
                                   R = right orientation'
define(`NPDT',`[define(`m4np',`ifelse(`$1',,1,`$1')')dnl
define(`m4xR',ifinstr(`$2',R,R))define(`m4SR',ifelse(m4xR,R,-))dnl
  for_(1,m4np,1,
   `{ L`'ifelse(eval(m4np>1),1,m4x): dot(at rvec_(-dimen_/3,0),,1) }
    { X: Here
      T`'ifelse(eval(m4np>1),1,m4x): circle invis rad dotrad_ at X
      lswitch(from X to X+vec_(dimen_/3,0),m4xR,D)
      R`'ifelse(eval(m4np>1),1,m4x): circle invis rad dotrad_ at Here }
    ifelse(eval(m4x<m4np),1,`move to rvec_(0,m4SR`'dimen_/2)') ')
  ifelse(eval(m4np>1),1,`move to vec_(dimen_/6,m4SR`'dimen_/10)
    DL: line dashed to rvec_(0,m4SR`'(m4np-3/4)*dimen_/2)') 
`$3']')


                                `relay(npoles,chars)
                                 arg1: Number of poles (max 10)
                                 chars:
                                   any of the relaycoil options and:
                                   O = normally open
                                   C = normally closed
                                   P = three-position
                                   none of above = double-throw (default)
                                   L = drawn left (default)
                                   R = drawn to right of drawing direction
                                   Th = thermal '
define(`relay',`[ define(`m4pm',`ifinstr(`$2',R,-)')dnl
  Coil: relaycoil(`$2') define(`m4rel',rcdna_)
  V1: Coil.V1
  V2: Coil.V2
  sc_draw(m4rel,Th,
   `{move to Coil #rvec_(-dimen_/8,0)
    line from rvec_(-dimen_/20,dimen_/6) \
    to rvec_(-dimen_/20,dimen_/20) \
      then to rvec_(dimen_/20,dimen_/20) \
    then to rvec_(dimen_/20,-dimen_/20) \
      then to rvec_(-dimen_/20,-dimen_/20) \
    then to rvec_(-dimen_/20,-dimen_/6)}')
  Cs: contacts(ifelse(`$1',,1,`$1'),D`'m4rel) with .O1 at Coil.B2 + \
     vec_(ifinstr(m4rel,P,-dimen_/5,0)+dimen_/4,m4pm`'(dimen_/4+dimen_/5))
  for_(1,ifelse(`$1',,1,`$1'),1,
   `P`'m4x: Cs.P`'m4x
    C`'m4x: Cs.C`'m4x
    O`'m4x: Cs.O`'m4x')
  `$3'] ')

                                `contacts(npoles,chars)
                                 chars:
                                   P= three position
                                   O|C= normally open, normally closed (default)
                                   R= right orientation (default left)
                                   I= open circles for contacts
                                   T= T contacts
                                   U= U contacts
                                   D= dashed line across armatures'
                                `e.g. contacts(1,5,O)'
define(`contacts',`[
  define(`m4np',`ifelse(`$1',,1,`$1')')dnl
  ifelse(eval(m4np>10),1,`define(`m4np',10)')dnl
  for_(1,m4np,1,
   `K`'m4x: contact(`$2') with .O at Here
    P`'m4x: circle invis rad dotrad_ at last [].P
    C`'m4x: last [].C
    O`'m4x: last [].O
    ifelse(m4x,m4np,,`move to last[].C+vec_(0,m4pm dimen_/4)')')
  ifelse(eval(m4np>1),1,`ifinstr(`$2',D,
   `DL: line dashed from K1.A.c to K`'m4np.A.c chop -dimen_/10')')
  `$3'] ')

                                `contact(chars [,R]) Relay contact switch
                                 Arg 2 deprecated, kept for compatibility
                                 chars:
                                  O|C= normally open, normally closed (default)
                                  I= open circles for contacts
                                  P= three position
                                  R= right orientation (default left)
                                  T= T contacts
                                  U = line contact'
define(`contact',`[ dnl
  define(`m4pm',`ifelse(ifinstr(`$1',R,R,`$2',R,R),R,-)')dnl
  define(`m4dr',`dotrad_')define(`m4TL',dimen_/12)dnl
  P: dot(,m4dr,1)
  T: P+vec_(dimen_/2-dimen_/12,0)
  ifinstr(`$1',P,`ifinstr(
  `$1',I,
   `{C: dot(at T+vec_(0,m4pm`'(dimen_/8+m4dr*2+lthick/2)),m4dr,1)}
    {O: dot(at T-vec_(0,m4pm`'(dimen_/8+m4dr*2+lthick/2)),m4dr,1)}
    A: line from P to ifinstr(
     `$1',O,`(LCtangent(P,O,dotrad_+lthick/2)) chop m4dr chop -m4dr',
     `$1',C,`(LCtangent(P,C,dotrad_+lthick/2,R)) chop m4dr chop -m4dr',
     `P+vec_(dimen_/2,0) chop m4dr chop 0')',
  `$1',U,
   `{C: T+vec_(m4TL*2,m4pm`'(dimen_/6))
     line from C to C-vec_(2*m4TL,0)}
    {O: T+vec_(m4TL*2,m4pm`'(-dimen_/6))
     line from O to O-vec_(2*m4TL,0)}
    A: line from P to ifinstr(
     `$1',O,`O-vec_(2*m4TL-dimen_/27,0) chop m4dr chop -m4dr',
     `$1',C,`C-vec_(2*m4TL-dimen_/27,0) chop m4dr chop -m4dr',
     `P+vec_(dimen_/2,0) chop m4dr chop 0')',
  `$1',T,
   `{CC: T+vec_(0,m4pm`'(dimen_/8+m4TL*2/3))
     C: line from CC+vec_(0,-m4TL) to CC+vec_(0,m4TL) } 
    {OO: T-vec_(0,m4pm`'(dimen_/8+m4TL*2/3))
     O: line from OO+vec_(0,-m4TL) to OO+vec_(0,m4TL) } 
     A: line from P to ifinstr(
      `$1',O,`1/6 between O.end and O.start chop m4dr chop -m4dr',
      `$1',C,`1/6 between C.start and C.end chop m4dr chop -m4dr',
      `P+vec_(dimen_/2,0) chop m4dr chop 0')',
   `{AC: arrow m4c_l <- ht dimen_/6 wid dimen_/6 \
      from T+vec_(0,m4pm`'dimen_/8) to T+vec_(0,m4pm`'dimen_*3/8) \
      then to T+vec_(dimen_/5,m4pm`'dimen_*3/8)
     C: Here}
    {AO: arrow m4c_l <- ht dimen_/6 wid dimen_/6 \
      from T-vec_(0,m4pm`'dimen_/8) to T+vec_(0,-(m4pm`'dimen_*3/8)) \
      then to T+vec_(dimen_/5,-(m4pm`'dimen_*3/8))
     O: Here}
    A: line from P to ifinstr(
     `$1',O,`AO.start chop m4dr chop -m4dr',
     `$1',C,`AC.start chop m4dr chop -m4dr',
     `P+vec_(dimen_/2,0) chop m4dr chop 0')') ', # end of P
   `A: line from P to P+vec_(dimen_/2,0) chop m4dr chop 0
    define(`m4CO',
     `ifinstr(`$1',C,`ifinstr(`$1',O,O)C',`ifinstr(`$1',O,O,OC)')')dnl
    ifinstr(m4CO,C,
    `move to T
     ifinstr(
     `$1',I,
      `{ C: dot(at rvec_(0,m4pm`'(m4dr+lthick/2)),m4dr,1) }
       ifinstr(m4CO,O,,`O: Here')',
     `$1',U,
      `{C: T+vec_(m4TL*2,m4pm`'(dimen_/6))
       line from C to C-vec_(2*m4TL,0)}
       ifinstr(m4CO,O,,`O: Here')',
     `$1',T,
      `CC: rvec_(0,m4pm`'(m4TL*2/3))
       { C: line from CC+vec_(0,-m4TL) to CC+(0,m4TL) }
       ifinstr(m4CO,O,,`O: T') ',
     `{AC: arrow m4c_l <- ht dimen_/6 wid dimen_/6 \
       to rvec_(0,m4pm`'dimen_/4) \
       then to rvec_(dimen_/5,m4pm`'dimen_/4)
      C: Here }
      O:rvec_(dimen_/5,0)') ')
    ifinstr(m4CO,O,
    `move to T+vec_(0,-(m4pm`'dimen_/8))
     ifinstr(
     `$1',I,
      `{O: dot(at rvec_(0,m4pm`'(-m4dr*2)),m4dr,1) }
       ifinstr(m4CO,C,,`C: T ')',
     `$1',U,
      `{O: T+vec_(m4TL*2,m4pm`'(-dimen_/6))
       line from O to O-vec_(2*m4TL,0)}
       ifinstr(m4CO,C,,`C: T ')',
     `$1',T,
      `{ OO: (rvec_(0,m4pm`'(-m4TL*2/3)))
       O: line from OO+vec_(0,-m4TL) to OO+vec_(0,m4TL)}
       ifinstr(m4CO,C,,`C: T ')',
     `{AO: arrow m4c_l <- ht dimen_/6 wid dimen_/6 \
       to rvec_(0,-(m4pm`'dimen_/4)) \
       then to rvec_(dimen_/5,-(m4pm`'dimen_/4))
       O: Here }
       ifinstr(m4CO,C,,`C: T+vec_(dimen_/5,0)') ') ')
    ')
 `$3'] ')


                            `relaycoil( chars, wid, ht, U|D|L|R|degrees )
                             chars: (see IEC 60617 S00305 - S00319)
                              X or default: external lines from A2 and B2
                              AX external lines at positions A1,A3
                              BX external lines at positions B1,B3
                              NX no lines at positions A1,A2,A3,B1,B2,B3
                              SO slow operating
                              SOR slow operating and release
                              SR slow release
                              HS high speed
                              NAC unaffected by AC current
                              AC AC current
                              ML mechanically latched
                              MR mechanically resonant
                              PC pulse counter
                              PO polarized
                              RM remanent
                              RH remanent
                              TH thermal
                              EL electronic'
define(`relaycoil',`[ ifelse(`$4',,,`setdir_(`$4')')
 define(`m4wd',ifelse(`$2',,`dimen_/4',`($2)'))dnl 
 define(`m4ht',ifelse(`$3',,`dimen_/2',`($3)'))dnl
 define(`m4LL',`ifinstr(`$4',NX,0,dimen_/3)')dnl
 define(`rcdna_',ifinstr(`$1',AX,,`$1',BX,,`$1',X,,X)`$1')dnl
 { lbox( m4wd, m4ht ) }
 { A1: rvec_(0,m4ht/4)
   A2: Here; V1: A2
   A3: rvec_(0,-m4ht/4) }
 { B1: rvec_(m4wd,m4ht/4)
   B2: rvec_(m4wd,0); V2: B2
   B3: rvec_(m4wd,-m4ht/4) }
   sc_draw(`rcdna_',AX,
    `{ line from A1 to A1+vec_(-dimen_/3,0); V1: Here
       line from A3 to A3+vec_(-dimen_/3,0); V2: Here }')
   sc_draw(`rcdna_',BX,
    `{ line from B1 to B1+vec_( dimen_/3,0); V1: Here
       line from B3 to B3+vec_( dimen_/3,0); V2: Here }')
   sc_draw(`rcdna_',NX)
   sc_draw(`rcdna_',X,
    `{ line to rvec_(-dimen_/3,0); V1: Here
      move to B2; line to rvec_(dimen_/3,0); V2: Here }')
   sc_draw(`rcdna_',SOR,
    `{ move to rvec_(0,-(m4ht*5/8)); {lbox(m4wd,m4ht/4)}
       {line from rvec_(0,-m4ht/8) to rvec_(m4wd, m4ht/8)}
       {line from rvec_(0, m4ht/8) to rvec_(m4wd,-m4ht/8)}
       {move to rvec_(0,-(m4ht)*3/8); m4fshade(0,lbox(m4wd,m4ht/4))}
       {move to rvec_(0,-(m4ht)/8)
        {line to rvec_(0,-m4ht/8)}
        {line from rvec_(m4wd,0) to rvec_(m4wd,-m4ht/8)}} }')
   sc_draw(`rcdna_',SO,
    `{ move to rvec_(0,-(m4ht*5/8)); {lbox(m4wd,m4ht/4)}
       {line from rvec_(0,-m4ht/8) to rvec_(m4wd, m4ht/8)}
       {line from rvec_(0, m4ht/8) to rvec_(m4wd,-m4ht/8)} }')
   sc_draw(`rcdna_',SR,
    `{ move to rvec_(0,-(m4ht*5/8)); m4fshade(0,lbox(m4wd,m4ht/4)) }')
   sc_draw(`rcdna_',HS,
    `{ move to rvec_(0,-(m4ht*5/8)); lbox(m4wd,m4ht/4) }
     { move to rvec_(m4wd/2,-(m4ht/2)); line to rvec_(0,-m4ht/4)} ')
   sc_draw(`rcdna_',NAC,
    `{ m4fshade(0,lbox(m4wd/4,m4ht)) }
     { move to rvec_(m4wd*3/4,0); m4fshade(0,lbox(m4wd/4,m4ht)) } ')
   sc_draw(`rcdna_',AC,
    `{ move to rvec_(0,-(m4ht*3/4)); { lbox(m4wd,m4ht/2) }
       move to rvec_(m4wd/2,0)
       ifgpic(
        `arc rad m4wd/3 cw from Here-(m4wd*2/3,0) \
         to Here with .c at Here-(m4wd/3,0)
         arc rad m4wd/3 ccw from Here to Here+(m4wd*2/3,0) with .c \
           at Here+(m4wd/3,0)',
        ` sinusoid(m4wd/3,twopi_/(m4wd*2/3),pi_/2,-m4wd/3,m4wd/3) \
           with .Origin at Here ') }')
   sc_draw(`rcdna_',ML,
    `{ move to rvec_(0,-(m4ht*11/16)); { lbox(m4wd,m4ht*3/8) }
       line from rvec_(0,m4ht*3/16) to rvec_(m4wd/2,-m4ht*3/16) \
         then to rvec_(m4wd,m4ht*3/16) } ')
   sc_draw(`rcdna_',MR,
    `{ move to rvec_(m4wd/2,m4ht/2)
       { m4tmp = rp_ang; dashline(to rvec_(0,m4ht*3/4),,m4ht*3/16,m4ht*3/32)
         point_(m4tmp)}
       move to rvec_(0,m4ht*3/8)
       ifgpic(
        `arc rad m4wd/2 cw from rvec_(-m4wd/2,0) \
         to Here with .c at rvec_(-m4wd/4,-m4wd/4)
         arc rad m4wd/2 ccw from Here to rvec_(m4wd/2,0) with .c \
           at rvec_(m4wd/4,m4wd/4)',
        `sinusoid(m4wd/6,twopi_/(m4wd),pi_/2,-m4wd/2,m4wd/2) \
           with .Origin at Here ') } ')
   sc_draw(`rcdna_',PC,
    `{ move to rvec_(0,m4ht/2+m4wd/2)
       { lbox(m4wd,m4wd) }
       circle diam m4wd/2 at rvec_(m4wd/2,0) } ')
   sc_draw(`rcdna_',PO,
    `{ move to rvec_(0,-(m4ht*5/8)); { lbox(m4wd,m4ht/4) }
       m4fshade(0, line to rvec_(0,m4ht/8) \
                then to rvec_(m4wd,m4ht/8) \
                then to rvec_(m4wd,-m4ht/8) \
                then to rvec_(m4wd*3/4,-m4ht/8) \
                then to rvec_(m4wd*3/4,0) \
                then to rvec_(m4wd/4,0) \
                then to rvec_(m4wd/4,-m4ht/8) \
                then to rvec_(0,-m4ht/8) \
                then to Here) } ')
   sc_draw(`rcdna_',RM,
    `{ move to rvec_(0,-(m4ht*5/8)); { lbox(m4wd,m4ht/4) }
       line from rvec_(0,m4ht/8) to rvec_(m4wd,-m4ht/8) }')
   sc_draw(`rcdna_',RH,
    `{ move to rvec_(0,-(m4ht*11/16)); { lbox(m4wd,m4ht*3/8) }
       line from rvec_(m4wd/4,m4ht/8) \
         to rvec_(m4wd/4,m4ht/32) \
         to rvec_(m4wd*3/4,-m4ht/32) \
         to rvec_(m4wd*3/4,-m4ht/8) }')
   sc_draw(`rcdna_',TH,
    `{  line to rvec_(m4wd/4,0) then to rvec_(m4wd/4,m4ht/4) \
        then to rvec_(m4wd*3/4,m4ht/4) \
        then to rvec_(m4wd*3/4,0) \
        then to rvec_(m4wd,0) }')
   sc_draw(`rcdna_',EL,
    `{ { line from rvec_(m4wd/4,0) to rvec_(m4wd*3/4,0) }
       { line from rvec_(m4wd*3/8,0) to rvec_(m4wd*3/16,m4ht*3/16) }
       { line from rvec_(m4wd*5/8,0) to rvec_(m4wd*13/16,m4ht*3/16) }
       { line from rvec_(m4wd/2,0) to rvec_(m4wd/2,-m4ht/4) } }')
   `$5'] ')

                                `reed(linespec,wid,ht,box attributes,[R][C])
                                 Enclosed two-terminal reed contact;
                                 R=right orientation;
                                 C=closed;
                                 e.g. reed(,,dimen_/5,shaded "lightgreen"'
define(`reed',`eleminit_(`$1')
   define(`m4wd',ifelse(`$2',,`dimen_*0.8',`($2)'))dnl
   define(`m4ht',ifelse(`$3',,`dimen_*0.3',`($3)'))dnl
   define(`m4ng',`ifinstr(`$5',R,-)')dnl
   {line to rvec_(max(0,rp_len/2-m4wd/2),0)
    {rotbox(m4wd,m4ht,$4,r=m4ht/2)}
    {line to rvec_(m4wd*0.2,0) then to \
      rvec_(m4wd*0.6,m4ng`'ifinstr(`$5',C,lthick,m4ht/3))} 
    line from rvec_(m4wd*0.5,0) to rvec_(m4wd,0)
    line to rvec_(max(0,rp_len/2-m4wd/2),0)}
  {[box invis ht_ m4ht wid_ m4wd] at rvec_(rp_len/2,0)}
   line to rvec_(rp_len,0) invis ')

                     `ccoax(at location,M|F,diameter)'
define(`ccoax',`[define(`m4cd',ifelse(`$3',,`dimen_*0.4',`$3'))dnl
  S: circle diam m4cd
  C: circle diam m4cd/3 fill_(ifinstr(`$2',F,1,0)) at S
  `$4'] with .c ifelse(`$1',,`at Here',`$1')')

                          `tconn( linespec, >|>>|<|<<|O[F], wid)
                           terminal connector
                                 O=node (circle); OF=filled circle
                                 > (default) or >> =output
                                 < or << =input
                                 arg3 is arrowhead width or circle diam'
define(`tconn',
 `define(`m4ph',`ifelse(`$3',,`dimen_/6',`($3)/2')')dnl
  define(`m4ps',`dimen_/8') define(`m4cd',`ifelse(`$3',,`dimen_/5',`$3')')dnl
  eleminit_(`$1',dimen_*3/4)
  M4Ss: last line.start; M4Se: last line.end
  ifelse(ifinstr(`$2',0,O,`$2'),O,
   `{circle diam m4cd ifinstr(`$2',OF,`fill_(0)') ifinstr(`$2',0F,`fill_(0)') \
       at (m4cd)/2/distance(M4Ss,M4Se) between M4Se and M4Ss}
    {line to last line.end chop 0 chop m4cd}',
 `$2',<<,
   `{line to last line.end chop 0 chop m4ps+m4ph
     {line from rvec_(m4ph,m4ph) to Here then to rvec_(m4ph,-m4ph)}
     move to rvec_(m4ps,0)
     line from rvec_(m4ph,m4ph) to Here then to rvec_(m4ph,-m4ph)}',
 `$2',<,
   `{line to last line.end chop 0 chop m4ph
     line from rvec_(m4ph,m4ph) to Here then to rvec_(m4ph,-m4ph)}',
 `$2',>>,
   `{line to last line.end chop 0 chop m4ps
     {line from rvec_(-m4ph,m4ph) to Here then to rvec_(-m4ph,-m4ph)}
     move to rvec_(m4ps,0)
     line from rvec_(-m4ph,m4ph) to Here then to rvec_(-m4ph,-m4ph)}',
 `{line to last line.end
   line from rvec_(-m4ph,m4ph) to Here then to rvec_(-m4ph,-m4ph)}')
  line invis to M4Se')

                          `tbox( text,wid,ht,<|>|<>,type )
                           Pointed terminal box.
                           text is placed at centre of rectangle in math mode
                           unless it starts with a double quote or sprintf
                           arg4= > point on right end (default)
                                 < point on left end; <> both ends
                           Defaults: wid dimen_*2/3 ht dimen_/3 
                           type= eg dotted outlined "red"
                           eg tbox(`$V_2$', 30pt__, 15pt__,,fill_(0.9) )' 
define(`tbox',`[ define(`m4td',`ifelse(`$4',,>,`$4')')
  pushdef(`m4tw2',`ifelse(`$2',,(dimen_*0.4),`(($2)/2)')')dnl
  pushdef(`m4th2',`ifelse(`$3',,(dimen_/6),`(($3)/2)')')dnl
  N: vec_(0,m4th2)
  NE: N+vec_(m4tw2 ifinstr(m4td,>,-m4th2),0)
  E: vec_(m4tw2,0)
  SE: NE+vec_(0,-m4th2*2)
  NW: N-vec_(m4tw2 ifinstr(m4td,<,-m4th2),0)
  W: vec_(-m4tw2,0)
  SW: NW+vec_(0,-m4th2*2)
  C: 0.5 between SW and NE
  line from N to NE ifinstr(m4td,>,then to E) then to SE \
    then to SW ifinstr(m4td,<,then to W) then to NW then to N `$5'
  move to C
  ifelse(`$1',,,`m4lstring(`$1',`"iflatex(`$ `$1'$',` $1')"')')
  `$6' popdef(`m4th2') popdef(`m4tw2') ]')

                          `pconnex(R|L|U|D|degrees,chars)
                           arg1: drawing direction
                           chars:
                            R=right orientation
                            M|F= male, female
                            A[B]|AC =115V 3-prong, B=box (default), C=circle
                            P= PC connector
                            D= 2-pin connector
                            G[B]|GC= 3-pin, B=default, C=circle
                            J= 110V 2-pin '
define(`pconnex',
 `[ define(`m4sgn',ifinstr(`$2',F,,-))define(`m4R_',ifinstr(`$2',R,-))dnl
  setdir_(`$1')
  define(`m4na_',`ifelse(`$2',,A,`$2')')dnl
  ifinstr(m4na_,A,`
    Base: ifinstr(m4na_,AC,`circle diam dimen_',`[lbox(dimen_,dimen_) ]')
    N: m4pconpin(dimen_/12,dimen_*0.3,m4na_) \
          at Base+vec_(m4sgn`'(-dimen_*0.2),m4R_`'dimen_*0.15)
    H: m4pconpin(dimen_/12,dimen_*0.25,m4na_) \
          at Base+vec_(m4sgn`'(dimen_*0.2),m4R_`'dimen_*0.15)
    gd = dimen_/12
    G: [ifelse(ifgpic(T)`'ifinstr(m4na_,F,,T),TT,
        `circle fill_(m4fill) rad gd at vec_(0,m4R_`'gd/2)
         box fill_(m4fill) wid 2*gd ht gd at vec_(0,0)',
        `arc ifinstr(m4na_,R,,c)cw rad gd from vec_(gd,m4R_`'gd/2) \
           to vec_(-gd,m4R_`'gd/2) with .c \
           at vec_(0,m4R_`'gd/2) ifinstr(m4na_,F,,
            `ifdef(`r_',`shaded rgbstring(r_,g_,b_)',`fill_(m4fill)')')
         line from vec_(-gd,m4R_`'gd/2) \
            to vec_(-gd,m4R_`'(-gd/2)) \
            then to vec_(gd,m4R_`'(-gd/2)) \
            then to vec_(gd,m4R_`'gd/2) ifinstr(m4na_,F,,
             `ifdef(`r_',`shaded rgbstring(r_,g_,b_)',`fill_(m4fill)')')')
         ] at Base+vec_(0,m4R_`'(-dimen_*0.25))',
  m4na_,P,
   `wd = dimen_; hd = wd*3/4
    Base: [line to vec_(-wd/2,0) \
      then to vec_(-wd/2,-hd*2/3) \
      then to vec_(-wd/2+hd/3,-hd) \
      then to vec_(wd/2-hd/3,-hd) \
      then to vec_(wd/2,-hd*2/3) \
      then to vec_(wd/2,0) \
      then to Here]
    N: m4pconpin(dimen_/12,dimen_*0.25,m4na_) \
          at Base+vec_(m4sgn`'(-dimen_*0.2),m4R_`'dimen_*0.15)
    H: m4pconpin(dimen_/12,dimen_*0.25,m4na_) \
          at Base+vec_(m4sgn`'(dimen_*0.2),m4R_`'dimen_*0.15)
    G: m4pconpin(dimen_/12,dimen_*0.20,m4na_) \
          at Base+vec_(0,m4R_`'(-dimen_*0.15))',
  m4na_,D,
   `wd = dimen_*1.2; hd = wd/2
    Base: [line to vec_(wd-hd,0)
      arc rad hd/2 ccw to rvec_(0,hd) with .c at rvec_(0,hd/2)
      line to rvec_(hd-wd,0)
      arc rad hd/2 ccw to rvec_(0,-hd) with .c at rvec_(0,-hd/2) ]
    H: m4pcrpin(dimen_/6,m4na_) at Base.c+vec_( (wd-hd)/2,0)
    N: m4pcrpin(dimen_/6,m4na_) at Base.c+vec_(-(wd-hd)/2,0)',
  m4na_,G,
   `wd = dimen_*1.3; hd = dimen_*1.2
    Base: ifinstr(m4na_,GC,`circle diam wd',
     `[line to vec_(wd/2,0) \
      then to vec_(wd/2,-hd*0.3) \
       then to vec_(hd*0.15,-hd) \
      then to vec_(-hd*0.15,-hd)\
       then to vec_(-wd/2,-hd*0.3) \
      then to vec_(-wd/2,0) \
      then to Here ]')
    H: m4pconpin(dimen_*0.25,dimen_/8,m4na_) \
         at Base.c+vec_(-dimen_/3,dimen_*0.3)
    N: m4pconpin(dimen_*0.25,dimen_/8,m4na_) \
         at Base.c+vec_( dimen_/3,dimen_*0.3)
    G: m4pconpin(dimen_/8,dimen_*0.25,m4na_) \
         at Base.c+vec_(0,-dimen_/3)',
  m4na_,J,
   `wd = dimen_; hd = wd/2
    Base: [line to vec_(wd/2,0) \
      then to vec_(wd/2,hd) \
      then to vec_(-wd/2,hd) \
      then to vec_(-wd/2,0) \
      then to Here ]
    H: m4pconpin(dimen_/12,dimen_*0.25,m4na_) at Base.c+vec_( wd/4,0)
    N: m4pconpin(dimen_/12,dimen_*0.25,m4na_) at Base.c+vec_(-wd/4,0)
    ')
  `$3' ; resetdir_ ]')
define(`m4pconpin',`[ifinstr(`$3',F,`lbox(`$1',`$2')',
 `m4fshade(m4fill,lbox(`$1',`$2'))')]')
define(`m4pcrpin',`[ifinstr(`$2',F,`circle diam `$1'',
 `m4fshade(m4fill,circle diam `$1')')]')

                          `Header(1|2,rows,wid,ht,type)
                            arg1: number of columns
                            arg2: pins per column
                            arg3,4: custom wid, ht
                            arg5: eg fill_(0.9)'
define(`Header',
`[define(`m4Hm',`ifelse(`$2',,2,`$2')')define(`m4Hn',`ifelse(`$1',,1,`$1')')dnl
  define(`m4Hw',`ifelse(`$3',,`m4Hn*L_unit*3',`($3)')')dnl
  define(`m4Hh',`ifelse(`$4',,`m4Hm*L_unit*3',`($4)')')dnl
  Block: rotbox(m4Hw,m4Hh,`$5')
  define(`m4Hct',1)dnl
  for_(1,m4Hm,1,
   `HeaderPin(Block.NW+vec_(L_unit*3/2,-(m4x-1/2)*m4Hh/m4Hm),
     eval(m4Hct-1), P`'m4Hct,w) define(`m4Hct',incr(m4Hct))
    ifelse(m4Hn,2,`HeaderPin(Block.NE+vec_(-L_unit*3/2,-(m4x-1/2)*m4Hh/m4Hm),
        1, P`'m4Hct,e) define(`m4Hct',incr(m4Hct))') ')
  `$6' ]')
                          `HeaderPin(location,type,Picname,
                            n|e|s|w,length)'
define(`HeaderPin',`define(`m4Hpl',`ifelse(`$5',,`lg_plen*L_unit',`$5')')dnl
  move to `$1'
  line to ifelse(`$4',n,`rvec_(0,m4Hpl)',
   `$4',e,`rvec_(m4Hpl,0)',`$4',s,`rvec_(0,-m4Hpl)',`rvec_(-m4Hpl,0)')
  ifelse(`$3',,,`$3': Here)
  ifelse(`$3',,,Pin`$3':) ifelse(`$2',0,
   `rotbox(L_unit,L_unit,fill_(1))',
   `circle diam L_unit fill_(1)') at last line.start ')

                    `nport(box specs; other commands,
                       nw,nn,ne,ns,
                       space ratio,pin lgth,style,other commands)
                     Default is a standard-box twoport.  Args 2 to 5 are
                     the number of ports to be drawn on w, n, e, s sides.
                     The port pins are named by side, number, and by a or b pin,
                     e.g. W1a, W1b, W2a, ... .  Arg 6 specifies the ratio of
                     port width to interport space (default 2), and arg 7 is
                     the pin length.  Set arg 8 to N to omit the dots on
                     the port pins. Arguments 1 and 9 allow customizations'
define(`nport',`[Box: box `$1'
  r = ifelse(`$6',,2.0,`$6')
  plg = ifelse(`$7',,`dimen_/4',`$7')
#                           `West side'
  define(`m4n',`ifelse(`$2'`$3'`$4'`$5',,1,`$2',,0,`($2)')')
  d = Box.ht/(m4n*(r+1)+1)
  move to Box.nw+(0,-d); down_
  m4portpins(-plg,d*r,d,W,`$8')
#                           `North side'
  ifelse(`$3',,,`define(`m4n',`($3)')
  d = Box.wid/(m4n*(r+1)+1)
  move to Box.nw+(d,0); right_
  m4portpins(plg,d*r,d,N,`$8')')
#                           `East side'
  define(`m4n',`ifelse(`$2'`$3'`$4'`$5',,1,`$4',,0,`($4)')')
  d = Box.ht/(m4n*(r+1)+1)
  move to Box.ne+(0,-d); down_
  m4portpins(plg,d*r,d,E,`$8')
#                           `South side'
  ifelse(`$5',,,`define(`m4n',`($5)')
  d = Box.wid/(m4n*(r+1)+1)
  move to Box.sw+(d,0); right_
  m4portpins(-plg,d*r,d,S,`$8')')
  `$9']')
define(`m4portpins',`for_(1,m4n,1,
 `{ if (`$1' != 0) then { line to rvec_(0,`$1') }
   `$4'`'m4x`'a: ifelse(xtract(`$5',N),N,Here,`dot') }
  move to rvec_(`$2',0)
  { if (`$1' != 0) then { line to rvec_(0,`$1') }
   `$4'`'m4x`'b: ifelse(xtract(`$5',N),N,Here,`dot') }
  ifelse(m4x,m4n,,`move to rvec_(`$3',0)')')')

                          `gyrator(box specs,space ratio,pin lgth,style)
                           Gyrator two-port wrapper for nport
                           e.g. gyrator(ht boxwid invis,,0,N)'
define(`gyrator',
 `define(`m4dna_',ifelse(xtract(`$4',V)`'xtract(`$4',H),,H`$4',`$4'))dnl
  sc_draw(`m4dna_',H,
   `nport(ifelse(`$1',,wid boxht,`$1'),1,,1,,`$2',`$3',`$4',
      line from (Box,W1a)+(-Box.wid/2,0) \
        left -Box.wid/4 then down W1a.y-W1b.y then right -Box.wid/4
        arcd(Box+(-Box.wid/4,0),(W1a.y-W1b.y)/3,-90,-270)
      line from (Box,W1a)+(Box.wid/2,0) \
        left Box.wid/4 then down W1a.y-W1b.y then right Box.wid/4
        arcd(Box+(Box.wid/4,0),(W1a.y-W1b.y)/3,90,270)
     `$5')')dnl
  sc_draw(`m4dna_',V,
   `nport(ifelse(`$1',,wid boxht,`$1'),,1,,1,`$2',`$3',`$4',
      line from (N1a,Box)+(0,-Box.ht/2) \
        down -Box.ht/4 then right N1b.x-N1a.x then up -Box.ht/4
        arcd(Box+(0,-Box.ht/4),(N1b.x-N1a.x)/3,-90+90,-90+270)
      line from (N1a,Box)+(0,Box.ht/2) \
        down Box.ht/4 then right N1b.x-N1a.x then up Box.ht/4
        arcd(Box+(0,Box.ht/4),(N1b.x-N1a.x)/3,90+90,90+270)
     `$5')') ')
                                `proximity(linespec)'
define(`proximity',`consource(`$1',P)')
                                `nullator(linespec, wid, ht)'
define(`nullator',`eleminit_(`$1')
   define(`m4wd',ifelse(`$2',,`dimen_/2',`($2)'))dnl
   define(`m4ht',ifelse(`$3',,`dimen_/4',`($3)'))dnl
   {line to rvec_(max(0,rp_len/2-m4wd/2),0)
    move to rvec_(m4wd/2,0)
    { spline ifdpic(0.58) from rvec_(ifdpic(0,-m4wd/20),m4ht/2) \
      to rvec_(m4wd/20*3,m4ht/2) \
      then to rvec_(m4wd/2,m4ht/4) \
      then to rvec_(m4wd/2,-m4ht/4) \
      then to rvec_(m4wd/20*3,-m4ht/2) \
      then to rvec_(-m4wd/20*3,-m4ht/2) \
      then to rvec_(-m4wd/2,-m4ht/4) \
      then to rvec_(-m4wd/2,m4ht/4) \
      then to rvec_(-m4wd/20*3,m4ht/2) \
      then to rvec_(ifdpic(0,m4wd/20),m4ht/2)
      }
    line from rvec_(m4wd/2,0) \
          to rvec_(max(0,rp_len/2),0)}
  {[box invis ht_ m4ht wid_ m4wd] at rvec_(rp_len/2,0)}
   line to rvec_(rp_len,0) invis ')
                                `norator(linespec, wid, ht)'
define(`norator',`eleminit_(`$1')
   define(`m4wd',ifelse(`$2',,`dimen_/2',`($2)'))dnl
   define(`m4ht',ifelse(`$3',,`dimen_/4',`($3)'))dnl
   {line to rvec_(max(0,rp_len/2-m4wd/2),0)
    move to rvec_(m4wd/2,0)
    for i=-1 to 1 by 2 do { {
      spline to rvec_(i*m4wd/4,m4ht/2) \
      then to rvec_(i*m4wd/2,m4ht/2) \
      then to rvec_(i*m4wd/2,-m4ht/2) \
      then to rvec_(i*m4wd/4,-m4ht/2) \
      then to Here } }
    line from rvec_(m4wd/2,0) \
          to rvec_(max(0,rp_len/2),0)}
  {[box invis ht_ m4ht wid_ m4wd] at rvec_(rp_len/2,0)}
   line to rvec_(rp_len,0) invis ')

                        `ACsymbol(at position, len, ht, [A]U|D|L|R|degrees)
                          Arg4: drawing direction (default: current direction)
                          Arg4 contains A: use arcs instead of sinusoid
                          A convenience for drawing a 1-cycle sinusoid,
                          e.g.  source; ACsymbol(at last [])'
define(`ACsymbol',`[ Origin: Here
 define(`m4range',`ifelse(`$2',,(dimen_/3),`($2)')')dnl
 define(`m4ACd',patsubst(`$4',A))dnl
 setdir_(ifelse(m4ACd,,`ifdef(`m4a_',rp_ang*rtod_,0)',m4ACd))
 Start: rvec_(-m4range/2,0)
 End:   rvec_( m4range/2,0)
 define(`m4amp',`ifelse(`$3',,`m4range/3',`($3)/2')')
 ifinstr(ifgpic(A)`$4',A,
  `{ arc ccw to Start with .c at rvec_(-m4range/4,-max(m4range/4-m4amp,0)) }
   { arc ccw to   End with .c at rvec_( m4range/4, max(m4range/4-m4amp,0)) }',
  `{ sinusoid(m4amp,twopi_/m4range,pi_/2,-m4range/2,m4range/2) \
     with .Origin at Origin } ')
 `$5'; resetdir_ ] with .Origin ifelse(`$1',,`at Here',`$1')')

                        `Deltasymbol(at position, keys, U|D|L|R|degrees)
                          keys: size=expr;
                          Arg4: drawing direction (default: Up)'
define(`Deltasymbol',`[ sq3 = sqrt(3)
 setkey_(`$2',size,dimen_/10)dnl
 setdir_(`$3',U)
 line from vec_(vscal_(m4size,-sq3,0)) to \
   vec_(vscal_(m4size,-sq3,1)) then to Here \
   then to vec_(vscal_(m4size,-sq3,-1)) \
   then to vec_(vscal_(m4size,-sq3,0))
 `$4'; resetdir_ ] ifelse(`$1',,`at Here',`$1')')

                        `Ysymbol(at position, keys, U|D|L|R|degrees)
                          keys: size=expr; type=G (grounded);
                          Arg4: drawing direction (default: Up)'
define(`Ysymbol',`[ sq3 = sqrt(3)
 setkeys_(`$2',`size:dimen_/10:; type::N')dnl
 setdir_(`$3',U)
 C: Here
 line from vec_(vscal_(m4size,-2/sq3,0)) to C
 { line from vec_(vscal_(m4size,1/sq3,1)) to C \
     then to vec_(vscal_(m4size,1/sq3,-1)) }
 ifelse(m4type,,,`line right_ m4size*3/2; corner
   pushdef(`dimen_',m4size*4) ground popdef(`dimen_') ')
 `$4'; resetdir_ ] ifelse(`$1',,`at Here',`$1')')

                        `DCsymbol(at position, len, ht, U|D|L|R|degrees)
                          Arg4: drawing direction (default: current direction)'
define(`DCsymbol',`[
 define(`m4wid',`ifelse(`$2',,(dimen_/3),`($2)')')dnl
 define(`m4ht',`ifelse(`$3',,`(m4wid/5)',`($3)')')
 setdir_(ifelse(`$4',,`ifdef(`m4a_',rp_ang*rtod_,0)',`$4'))
 Origin: rvec_(m4wid/2, m4ht/2)
 {line to rvec_(m4wid,0)}
 dashline(from rvec_(0, m4ht) to rvec_(m4wid, m4ht),,m4wid/4,m4wid/8) 
 `$5'; resetdir_ ] with .Origin ifelse(`$1',,`at Here',`$1')')

                    `n-terminal box
                     nterm(box specs; other commands,
                       nw,nn,ne,ns,
                       pin lgth,style,other commands)
                     The default is three-terminal.  Args 2 to 5 are
                     the number of pins to be drawn on W, N, E, S sides.
                     The pins are named by side and number, e.g. W1, W2, N1, ...
                     Arg 6 is the pin length.  Set arg 7 to N to omit the dots
                     on the pins. Arguments 1 and 8 allow customizations, e.g.
                     nterm(,,,,,,N,
                           "$a$" at Box.w ljust
                           "$b$" at Box.e rjust
                           "$c$" at Box.s above) '
define(`nterm',`[Box: box ifelse(`$1',,wid dimen_ ht dimen_*2/3,`$1')
  plg = ifelse(`$6',,`dimen_/4',`$6')
#                           `West side'
  define(`m4n',`ifelse(`$2'`$3'`$4'`$5',,1,`$2',,0,`($2)')')
  d = Box.ht/(m4n+1)
  move to Box.nw+(0,-d); down_
  m4termpins(-plg,d,W,`$7')
#                           `North side'
  ifelse(`$3',,,`define(`m4n',`($3)')
  d = Box.wid/(m4n+1)
  move to Box.nw+(d,0); right_
  m4termpins(plg,d,N,`$7')')
#                           `East side'
  define(`m4n',`ifelse(`$2'`$3'`$4'`$5',,1,`$4',,0,`($4)')')
  d = Box.ht/(m4n+1)
  move to Box.ne+(0,-d); down_
  m4termpins(plg,d,E,`$7')
#                           `South side'
  define(`m4n',`ifelse(`$2'`$3'`$4'`$5',,1,`$5',,0,`($5)')')
  d = Box.wid/(m4n+1)
  move to Box.sw+(d,0); right_
  m4termpins(-plg,d,S,`$7')
  `$8']')
define(`m4termpins',`for_(1,m4n,1,
 `{ if (`$1' != 0) then { line to rvec_(0,`$1') }
   `$3'`'m4x: ifelse(xtract(`$4',N),N,Here,`dot') }
  ifelse(m4x,m4n,,`move to rvec_(`$2',0)')')')

                          `speaker(U|D|L|R|degrees, vert size, type)
                           type=H horn'
define(`speaker',`[setdir_($1,R)
  define(`m4v',`ifelse(`$2',,`dimen_/3',`($2)/4')')dnl
  define(`m4h',`m4v*sqrt(2)')dnl
 ifelse(`$3',H,
  `{H1: line from rvec_(m4h,m4v/2) \
          to rvec_(m4h*3/2,m4v*7/8) \
    then to rvec_(m4h*3/2,-m4v*7/8) \
      then to rvec_(m4h,-m4v/2)}',
  `{H1: line from rvec_(m4h,m4v) \
          to rvec_(m4h*2,m4v*2) \
    then to rvec_(m4h*2,-m4v*2) \
      then to rvec_(m4h,-m4v)}')
 {lbox(m4h,m4v*2)}
 {Box: box invis ht_ m4v*2 wid_ m4h at rvec_(m4h/2,0)}
  In1: rvec_(0,m4v/2)
  In2: Here
  In3: rvec_(0,-m4v/2)
  In4: rvec_(m4h/4,m4v)
  In5: rvec_(m4h*3/4,m4v)
  In6: rvec_(m4h/4,-m4v)
  In7: rvec_(m4h*3/4,-m4v)
  `$4'; resetdir_ ]')

                                `bell(U|D|L|R|degrees, vert size)'
define(`bell',`[setdir_($1,R)
  define(`m4h',`ifelse(`$2',,`dimen_/2',`($2)')')dnl
 {lbox(m4h,m4h)}
 {Box: box invis ht_ m4h wid_ m4h at rvec_(m4h/2,0)}
 {Circle: circle diameter m4h at rvec_(m4h*3/2,0)}
  In1: rvec_(0,m4h/4)
  In2: Here
  In3: rvec_(0,-m4h/4)
  `$3'; resetdir_ ]')
                                `microphone(A|U|D|L|R|degrees, vert size)
                                  Arg1= A, upright mic
                                  Thanks to Arnold Knott'
define(`microphone',`ifinstr(`$1',A,
 `[ define(`m4sfact',`(ifelse(`$2',,dimen_,(`$2'))*8/5)')
  circlerad = m4sfact/1000
  cspace = m4sfact/100
  bwd = m4sfact/10
  bht = m4sfact/4+bwd
  Stand: line up m4sfact/5
  { arc from Here+(-bwd,bwd) to Here+(bwd,bwd) with .c at Here+(0,bwd)
    line up m4sfact/4-bwd from last arc.start
    line up m4sfact/4-bwd from last arc.end }
  Head: box rad bwd/2 ht bht wid bwd with .s at Here+(0,bwd/2)
  Inner: box rad bwd/2 ht bht/2+bwd/2 wid bwd with .n at Head.n
  move to Inner.s+(0,bwd/2)
  for i=1 to 4 do {
    for j=-1 to 1 do {
      { circle at Here+(3*j*cspace,(abs(j)-3)*cspace) }
      if j != 0 then {{ circle at Here+(j*3/2*cspace,0) }} }
    move up 5*cspace }; ]',
 `[setdir_($1,R)
   define(`m4h',`ifelse(`$2',,`dimen_/2',`($2)')')dnl
  {L1: line from rvec_(m4h,-m4h/2) \
           to rvec_(m4h,m4h/2)}
  {Circle: circle diameter m4h at rvec_(m4h/2,0)}
   In1: rvec_(m4h*(2-sqrt(3))/4,m4h/4)
   In2: Here
   In3: rvec_(m4h*(2-sqrt(3))/4,-m4h/4)
   `$3'; resetdir_ ]')')

                                `buzzer(U|D|L|R|degrees, vert size,[C])'
define(`buzzer',`[setdir_($1,R)
 ifelse(`$3',,
 `define(`m4h',`ifelse(`$2',,`dimen_/2',`($2)')')dnl
   {L1: line from rvec_(m4h,0) \
          to rvec_(m4h,m4h/2) \
     then to rvec_(0,m4h/2) \
      then to rvec_(0,-m4h/2) \
     then to rvec_(m4h,-m4h/2) \
      then to rvec_(m4h,0)}
   {Box: box invis ht_ m4h wid_ m4h at rvec_(m4h/2,0)}
   {L2: line from rvec_(m4h,m4h/2) \
          to rvec_(m4h,m4h/2)+vec_(Rect_(m4h,-75))}
   In1: rvec_(0,m4h/4)
   In2: Here
   In3: rvec_(0,-m4h/4)',
 `$3',C,`define(`m4h',`ifelse(`$2',,`(dimen_/3)',`(($2)/2)')')dnl
   {Face: line from rvec_(m4h,-m4h) \
          to rvec_(m4h,m4h)}
   {arc ccw from Face.end to Face.start with .c at Face.c}
   In1: rvec_(m4h-sqrt(m4h^2-(m4h/3)^2),m4h/3)
   In2: Here
   In3: rvec_(m4h-sqrt(m4h^2-(m4h/3)^2),-m4h/3)')
 `$4'; resetdir_ ]')
                                `earphone(U|D|L|R|degrees, size, [C][R])
                                 earphone pair if arg3 contains C'
define(`earphone',`[ setdir_($1,R)
  define(`m4h',`ifelse(`$2',,`dimen_',`($2)')')dnl
  ifinstr(`$3',C,
   `L: circle diam m4h*0.4
    R: circle diam m4h*0.4 at L+vec_(m4h,0)
    C: 0.5 between L and R
    N: C+(vscal_(m4h/2,Vperp(L,R)))
    Lx: Cintersect(L,L.rad,C,m4h/2,`$3')
    Rx: Cintersect(C,m4h/2,R,R.rad,`$3')
    arc ifinstr(`$3',R,c)cw rad m4h/2 from Lx to Rx with .c at C',
   `{lbox(m4h/3,m4h/2)}
    {Box: box invis ht_ m4h/2 wid_ m4h/3 at rvec_(m4h/6,0)}
    {L1: line thick 2*linethick from rvec_(m4h/3+linethick pt__,-m4h/3) \
           to rvec_(m4h/3+linethick pt__, m4h/3) }
    In1: rvec_(0,m4h/8)
    In2: Here
    In3: rvec_(0,-m4h/8)')
  `$4'; resetdir_ ]')
                               `Signal-flow graph macros: labeled node,
                                directed labeled chopped straight line,
                                directed labeled chopped arc, and a self
                                loop.  All are contained in [] blocks.'

                               `Signal-flow graph initialization macro
                         sfg_init(line len, node rad, arrowhd len, arrowhd wid)'
ifdef(`sfg_init',,
`define(`sfg_init',`cct_init
  sfg_wid = ifelse(`$1',,`(linewid/0.75*(2.5+0.25)/4)',(`$1'))# default line len
  sfg_rad = ifelse(`$2',,(0.25/4/2),(`$2'))  # node radius
  sfg_aht = ifelse(`$3',,(0.25/4),(`$3'))    # arrow height (arrowhead length)
  sfg_awid = ifelse(`$4',,`sfg_aht',(`$4'))  # arrowhead width
  ')')
                               `sfgline(linespec,
                                        text,sfgabove|sfgbelow|ljust|rjust,
                                        attributes)
                                Draw a straight line with linespec, chopped by
                                node radius, with optional label'
define(`sfgline',`eleminit_(`$1',sfg_wid)
[ L1: line to rvec_(rp_len,0) chop sfg_rad `$4'
Start: last line.start
End: Here
  move to last line.c
  ifelse(ifinstr(`$4',->,T,`$4',<-,T),,
   `{ arrow m4c_l ht sfg_aht wid sfg_awid from rvec_(-sfg_aht/2,0) \
        to rvec_(sfg_aht/2,0) }')
  ifelse(`$2',,,`"iflatex(`$ `$2'$',` $2')" ifelse(`$3',,`sfgabove',`$3')')
  ] with .Start at rvec_(sfg_rad,0)
  move to last [].End
  ')
                               `Like above_ or below_ but adding extra space
                                to put text above or below arrowheads or nodes'
define(`sfgabove',`at Here+(0,sfg_awid/2) above')
define(`sfgbelow',`at Here+(0,-sfg_awid/2) below')

                               `sfgnode(at pos,text,above_,circle options)
                                Node: a white circle, possibly labelled. The
                                default label position is inside if the
                                diameter is bigger than textht and textwid'
define(`sfgnode',
 `[C: circle fill_(1) rad sfg_rad ifelse(`$4',,`thickness 0.5',`$4')] with .c \
    ifelse(`$1',,`at rvec_(sfg_rad,0)',`$1')
  move to last [].c
  ifelse(`$2',,,
   `if 2*sfg_rad > Max(textwid,textht,10pt__) \
       then { {"iflatex(`$ `$2'$',` $2')" `$3'} } \
    else { {"iflatex(`$ `$2'$',` $2')" ifelse(`$3',,`sfgabove',`$3')} }')
  ')
                               `sfgarc(linespec,label,above_,cw|ccw,sfact)
                                An arc between nodes at the endpoints of the
                                linespec.  The resulting positions Start, End,
                                C (arc center) and M (arc midpoint) are defined.
                                The fifth argument scales the arc height above
                                its chord.'
define(`sfgarc',`eleminit_(`$1',sfg_wid)
[ Start: Here
  End: Start + vec_(rp_len,0)
    chordht = (rp_len/sqrt(2)-rp_len/2)ifelse(`$5',,,`*($5)')
    arcrd = (chordht^2+(rp_len)^2/4)/chordht/2
  C: 0.5 between Start and End; C: C+vec_(0,ifelse(`$4',ccw,,-)(arcrd-chordht))
  M: C + vec_( 0,ifelse(`$4',ccw,-)arcrd)
  ifelse(ifinstr(`$1',->,T)ifinstr(`$1',<-,T),,
   `arc -> m4c_l ifelse(`$4',ccw,ccw,cw) \
      from Cintersect(Start,sfg_rad,C,arcrd,ifelse(`$4',ccw,R)) \
      to Cintersect(C,arcrd,M,sfg_aht/2,ifelse(`$4',ccw,,R)) \
      ht sfg_aht wid sfg_awid with .c at C
    arc m4c_l ifelse(`$4',ccw,ccw,cw) from M \
      to Cintersect(C,arcrd,End,sfg_rad,ifelse(`$4',ccw,R)) with .c at C',
   `arc m4c_l patsubst(patsubst(`$1',.*<-,<-),->.*$,->) ifelse(`$4',ccw,ccw,cw)\
      from Cintersect(Start,sfg_rad,C,arcrd,ifelse(`$4',ccw,R)) \
      to Cintersect(C,arcrd,End,sfg_rad,ifelse(`$4',ccw,R)) with .c at C')
  ifelse(`$2',,,`{move to M; "iflatex(`$ `$2'$',` $2')" ifelse(`$3',,
   `sfgabove',`$3')}')
  ] with .Start at last line.start
  move to last line.end
  ')
                `sfgself(at position,U|D|L|R|degrees,label,above_,cw|ccw,sfact,
                         [-> | <- | <->])
                                A teardrop-shaped self-loop drawn at "angle"
                                degrees from "positon". The resulting Origin
                                and M (arc midpoint) are defined.  The sixth
                                argument scales the loop. The seventh puts
                                the arrowhead at the beginning, end, or both'
define(`sfgself',`[ Origin: Here
  setdir_(`$2',U)
  d = ifelse(`$6',,,`($6)*') sfg_wid/2; d = d * max(1,sfg_rad/(0.3605*d))
  { m4sfgselfcurve(-,
      ifelse(`$5',ccw,`ifinstr(`$7',<-,<-)',`ifinstr(`$7',->,<-)'))
    M: Here
    ifelse(`$7',,`{ arrow m4c_l from rvec_(0,ifelse(`$5',cw,,-)sfg_aht/2) \
           to rvec_(0,ifelse(`$5',cw,-)sfg_aht/2) ht sfg_aht wid sfg_awid }')
    ifelse(`$3',,,
     `"iflatex(`$ `$3'$',` $3')" ifelse(`$4',,`sfgabove',`$4')') }
  m4sfgselfcurve(,
      ifelse(`$5',ccw,`ifinstr(`$7',->,<-)',`ifinstr(`$7',<-,<-)'))
  resetdir_ ] with .Origin ifelse(`$1',,at Here,`$1')
  move to last [].Origin
  ')
define(`m4sfgselfcurve',`spline `$2' m4c_l from rvec_(Rect_(sfg_rad,`$1'30)) \
  to rvec_(0.3*d,`$1'0.2*d) \
      then to rvec_(0.6*d,`$1'0.35*d) \
  then to rvec_(0.9*d,`$1'0.35*d) \
  then to rvec_(d,`$1'0.2*d) \
      then to rvec_(d,0)')

                     `winding(L|R,diam, pitch, nturns, core wid, core color )
                      The complete spline is drawn, then parts of it are
                      overwritten with the background color (default
                      white).  Arg 1 contains R for right-handed winding.
                      Arg 4 must be an integer.
                      Arg 6 must be compatible with the postprocessor.
                      Requires a recent version of dpic or gpic'
define(`winding',`[ define(`m4rt',`ifinstr(`$1',R,-)')
  d = ifelse(`$2',,`dimen_',`$2')
  p = ifelse(`$3',,d/4,`$3')
  define(`m4n0',`ifelse(`$4',,1,`eval(`$4'-1)')')dnl
  w = ifelse(`$5',,d*3/4,`$5')
  W: spline from (0,0) to (0,0) dnl
  for_(0,m4n0,1,
   `then to vec_(m4rt`'(m4x*p),d) \
    then to vec_(m4rt`'(m4x*p+p/2),d) \
    then to vec_(m4rt`'(m4x*p+p/2),0)`'ifelse(m4x,m4n0,,` \
    then to vec_(m4rt`'(m4x*p+p),0) \')')
  if w > 0 then {
    dx = sign(p)*(linethick+0.5)/2 bp__
    vx = p*min(w/d/8+dx/p,0.25)
    for i=0 to m4n0 do {
      line color ifelse(`$6',,rgbstring(1,1,1),m4lstring(`$6',"`$6'")) \
        thick max(w/(1bp__)-linethick,0) \
        from vec_(m4rt`'(i*p-dx),d/2) \
          to vec_(m4rt`'(i*p+vx),d/2)
      dx = vx }
    }
  T1: W.ifinstr(`$1',R,end,start)
  T2: W.ifinstr(`$1',R,start,end)
  `$7']')

                     `tstrip(U|D|L|R|degrees, n, chars)
                      Terminal strip
                      n=integer number of terminals (default 4)
                      chars:
                       I=invisible terminals
                       C=circle terminals (default)
                       D=dot terminals
                       O=omitted internal lines
                       wid=val; total strip width
                       ht=val; strip height '
define(`tstrip',`[ setdir_(`$1')
  define(`m4n',`ifelse(`$2',,4,`eval($2)')')dnl
  ifelse(eval(m4n<1),1,`define(`m4n',1)')dnl
  setkey_(`$3',ht,dimen_/2)dnl
  setkey_(`$3',wid,m4n*m4ht*0.6)dnl
  {Box: [shade(1,lbox(m4wid,m4ht))] }
  bw = m4wid/(m4n)
  ifinstr(`$3',O,,`for i=1 to m4n-1 do {
   {move to rvec_(i*bw,-m4ht/2); line to rvec_(0,m4ht)}}')
  for_(1,m4n,1,`{T`'m4x: ifinstr(`$3',I,`rvec_((m4x-0.5)*bw,0)',
   `dot(at rvec_((m4x-0.5)*bw,0),,ifinstr(`$3',D,0,1))')
    {L`'m4x: T`'m4x+vec_(0,m4ht/2)}; {R`'m4x: T`'m4x+vec_(0,-m4ht/2)} }')
  `$4' popdef(`m4ht')popdef(`m4ht')
  resetdir_ ]')

                     `jack(U|D|L|R|degrees, chars)
                      Phone jack; arg1 sets drawing direction
                      chars:
                       L|LM|LB|LMB=long and aux contacts; M|B make|break arrows
                       S|SM|SB|SMB=short and aux contacts; M|B make|break arrows
                       R=right orientation with respect to drawing direction '
define(`jack',`[ setdir_(`$1')
  define(`dna_',`ifelse(`$2',,L,`$2',R,L,`$2')')dnl
  s=ifinstr(dna_,R,-1,1)
  ght = dimen_/2
  {Sleeve: [shade(1,lbox(dimen_/12,ght))] }
  G: Sleeve+vec_(0,-ght/2*s)
  F: Sleeve+vec_(dimen_/24,0)
  aht = dimen_/8
  Q: Sleeve+vec_(-dimen_*0.7,s*(ght*0.45-aht*3))
  define(`m4jbm',) m4auxcontacts(`dna_',L,s,)
  Q: Sleeve+vec_(-dimen_*0.7,(aht*3-ght*0.45)*s)
  define(`m4jbm',) m4auxcontacts(`dna_',S,-s,)
  `$3'; resetdir_ ] ')

define(`m4auxcontacts',`ifinstr($1,$2,
 `define(`m4I_',index($1,$2))dnl
  define(`m4abm',ifelse(substr($1,incr(m4I_),1),M,
    M`'ifelse(substr($1,eval(2+m4I_),1),B,B),
    substr($1,incr(m4I_),1),B,
    B`'ifelse(substr($1,eval(2+m4I_),1),M,M)))dnl
  define(`$1',substr($1,0,m4I_)`'substr($1,eval(m4I_+len(m4abm)+1)))dnl
  cht = aht*ifelse(ifinstr(m4jbm,M,T)`'ifinstr(m4abm,B,T),TT,3.9,3)
  Z: jackcontact(ifelse(`$2',S,0.5,0.6)*dimen_,m4abm`'ifelse($4,,,H),$3) \
    with .T at Q+vec_(0,$3*cht)
  $2`'$4: Z.T; Q: $2`'$4 define(`m4jbm',m4abm)
  ifinstr(m4abm,M, $2`'M`'$4: Z.M) ifinstr(m4abm,B,; $2`'B`'$4: Z.B)
  m4auxcontacts(`$1',$2,$3,ifelse($4,,1,`incr($4)'))')')

                     `jackcontact(length,chars,sign)
                      Phone jack contact to left
                      chars:
                       R: right orientation to drawing direction
                       M|B: make|break contact arrows '
define(`jackcontact',`[ Point: (0,0)
  line from Point ifinstr(`$2',H,`-vec_(dimen_/10,0)',
   `to vec_(-dimen_/16,neg_(`$3')*dimen_/16) \
    then to vec_(-dimen_/8,0) then') \
         to vec_(neg_(`$1'),0)
  T: dot(,,1)
  C: T+vec_(dimen_/5,0)
  ifinstr(`$2',H,`
    Connector: [shade(1,lbox(dimen_/24,cht))] \
      at T+vec_((`$1')-dimen_*0.16,neg_(`$3')*cht/2)')dnl
  ifinstr(`$2',M,`
    M: C+vec_(0,`$3'*aht*1.9)
    arrow m4c_l <- ht aht wid aht from C+vec_(0,`$3'*aht*0.4) \
      to M ')dnl
  ifinstr(`$2',B,`
    B: C+vec_(0,neg_(`$3')*aht*1.5)
    arrow m4c_l <- ht aht wid aht from C to B ') ; `$4' ] ')

                     `plug(U|D|L|R|degrees, chars)
                      Phone plug; arg1 sets drawing direction
                      chars:
                       2|3= two|three conductor
                       R= right orientation wrt drawing direction '
define(`plug',`[ setdir_(`$1')
  s=ifinstr(`$2',R,-1,1)
  ght = ifinstr(`$2',3,`dimen_*0.5',`dimen_*0.4')
  A: Here
  AA: line to rvec_(dimen_*0.3,0) \
      then to rvec_(dimen_*0.3,s*ght/3) \
    then to rvec_(dimen_*0.7,s*ght/3); TA: dot(,,1)
  ifinstr(`$2',3,`
    C: A+vec_(0,s*ght/2)
    TC: line from C to C+vec_(dimen_*0.6,0); TC: Here
    B: 2 between A and C',`B: A+vec_(0,s*ght)')
  BB: line from B to B+vec_(dimen_*0.3,0) \
    then to B+vec_(dimen_*0.3,-s*ght/3) \
    then to B+vec_(dimen_*0.6,-s*ght/3); TB: Here
  `$3'; resetdir_ ]')

                     `A dabble in quantum circuits:
                      SQUID(n,diameter,initial angle,cw|ccw)
                      Superconducting quantum interface device with
                      n junctions labeled J1, ... Jn placed around a
                      circle with initial angle -90 deg (by default)
                      with respect to the current drawing direction. The
                      default diameter is dimen_'
define(`SQUID',
`[ define(`m4sqn',`ifelse(`$1',,2,`$1')')dnl
 define(`m4ssz',`ifelse(`$2',,`dimen_',`$2')')dnl
 define(`m4sof',`ifelse(`$3',,-90,`$3')')dnl
 define(`m4ssg',`ifelse(`$4',,+,`$4',ccw,+,-)(m4x-1)/(m4sqn)*360')dnl
 define(`m4sxlen',C.rad/4)dnl

 C: circle diam m4ssz
 for_(1,m4sqn,1,
  `move to C+vec_(Rect_(C.rad,m4sof`'m4ssg))
   J`'m4x: Here
   { line from rvec_(Rect_(m4sxlen,m4sof`'m4ssg+45)) \
            to rvec_(Rect_(m4sxlen,m4sof`'m4ssg+225)) }
   { line from rvec_(Rect_(m4sxlen,m4sof`'m4ssg-45)) \
            to rvec_(Rect_(m4sxlen,m4sof`'m4ssg-225)) }')
 `$5' ]')

`==============================================================================
                                Customizations:
                                The size and style parameters below can be
                                tweaked, and the cct_init macro modified.'

                                Size and style parameters:
define(`dimen_',`linewid')           Default element body size unit

define(`sourcerad_',`(0.25*dimen_)') Source element default radius
define(`csdim_',`(0.3*dimen_)')      Controlled Source width/2
define(`elen_',`(1.5*dimen_)')       Default element length
define(`delay_rad_',`(0.35*dimen_)') Delay elements
define(`dotrad_',`(0.04*dimen_)')    Redefine dot size for circuits
define(`m4fill',0)                 Default fill for diode, fuse, ...
define(`em_arrowwid',`(dimen_/9)')  `em_arrows arrowhead width'
define(`em_arrowht',`(dimen_/7)')   `em_arrows arrowhead ht'
define(`em_arrowhead',1)            `em_arrows arrowhead style'

right_
divert(0)dnl
