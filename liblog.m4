divert(-1)
   liblog.m4                    Logic gates

* Circuit_macros Version 9.6, copyright (c) 2021 J. D. Aplevich under      *
* the LaTeX Project Public Licence in file Licence.txt. The files of       *
* this distribution may be redistributed or modified provided that this    *
* copyright notice is included and provided that modifications are clearly *
* marked to distinguish them from this distribution.  There is no warranty *
* whatsoever for these files.                                              *

define(`liblog_')

ifdef(`libgen_',,`include(libgen.m4)divert(-1)')
ifdef(`libcct_',,`include(libcct.m4)divert(-1)')

`Notes: ==================================================================
  Gates other than BUFFER and NOT have an optional integer argument N
  that sets the number of input locations, which then have labels In1
  to InN.

  BUFFER and NOT gates have In1 only.  If there is a first argument, it
  is a line specification and the gate is drawn along the line as for a
  two-terminal element.

  NEGATED inputs are obtained if the second argument is N (uppercase n).

  DEBUGGING: The statement
     print "`$0'($@)" ;
   inserted into a macro will display the macro name and current arguments
 ========================================================================='

                               `Nonzero parameter for logic size and grid mesh'
define(`L_unit',`(linewid/10)')

                               `Dimensions in L_units, also for external use:'
define(`G_hht',3)              `gate half-height'
define(`AND_ht',`(2*G_hht)')   `gate heights and widths ...'
define(`AND_wd',7)
define(`BUF_ht',4)
define(`BUF_wd',3.5)
define(`OR_rad',7)             `OR input radius'
define(`XOR_off',1)            `XOR and NXOR parameter'
define(`N_diam',(3/2))         `not-circle diameter'
define(`N_rad',`(N_diam/2)')   `not-circle radius'
define(`NOT_rad',`(N_rad*L_unit)') `scaled radius eg line chop NOT_rad'
define(`H_ht',2)               `Hysteresis symbol dimen'
define(`Mx_pins',6)            `max number of gate input pins without extensions
                                Possibly 4 is better for negated inputs'
define(`FF_wid',12)            `Bistable (flipflop)'
define(`FF_ht',18)
define(`Mux_wid',8)            `Multiplexer defaults'
define(`Mux_ht',18)

define(`lg_plen',4)            `Logic pin'
define(`lg_pinsep',`(3*L_unit)')  `logic pin separation in logic units'
define(`lg_chipwd',`(18*L_unit)') `default chip width'
define(`lg_pintxt',
 `"ifxfig(`$1',`ifsvg(`svg_small(`$1',75)',`sp_{\scriptsize `$1'}sp_')')"')
                               `Logic pin text with bar where possible'
define(`lg_bartxt',`iflatex(`$\overline{\hbox{`$1'}}$',
 `ifsvg(`svg_ol(`$1')',`$1')')')
                               `The comma has to be at the top level'
define(`m4_pattocomma',`patsubst(`$1',`$2',`,')')

                               `Scale grid coordinates to world coordinates'
define(`grid_',`(vscal_(L_unit,`$1',`$2'))')
                               `Scale and rotate grid coords to world coords'
define(`svec_',`vec_(vscal_(L_unit,`$1',`$2'))')
                               `Relative svec_'
define(`rsvec_',`Here+svec_(`$1',`$2')')

                                `NOT_circle
                                 convenience for drawing NOT circles'
define(`NOT_circle',`circle diam N_diam*L_unit')

                                `LH_symbol([U|D|L|R|degrees][I])
                                 I=inverted
                                 logical hysteresis symbol'
define(`LH_symbol',`[ define(`m4LH',`$1') dnl
  sc_draw(`m4LH',I,`define(`m4Hs',-H_ht)',`define(`m4Hs',H_ht)')setdir_(m4LH,R)
  line to svec_(H_ht,0) \
    then to svec_(1.1*H_ht,m4Hs)
  line from rsvec_(0.4*H_ht,0) \
         to rsvec_(-0.6*H_ht,0) \
    then to rsvec_(-0.7*H_ht,-(m4Hs))
 `$2'; resetdir_ ] ')

                                `LT_symbol(U|D|L|R|degrees)
                                 triangle_symbol'
define(`LT_symbol', `[ setdir_(`$1',R)
  line to svec_(0,H_ht*5/8) then to svec_(H_ht,0) \
    then to svec_(0,-H_ht*5/8) then to Here
  `$2'; resetdir_ ] ')

                                `BOX_gate(inputs,output,swid,sht,label)
                                 drawn in the current direction
                                 args 3 and 4 are L_unit values
                                 inputs=[P|N]* output=P|N'
define(`BOX_gate',`dnl
define(`m4m',`ifelse(`$1',,2,len(`$1'))')define(`m4a',`$1')dnl
define(`m4h',`ifelse(`$3',,AND_wd,`$3')')dnl
define(`m4v',`ifelse(`$4',,AND_wd,`$4')')dnl
[ Box: [Outline: line to svec_(0,m4v/2) then to svec_(m4h,m4v/2) \
    then to svec_(m4h,-m4v/2) then to svec_(0,-m4v/2) then to (0,0) ] \
    with .Outline.start at (0,0)
  ifelse(`$5',,,`{ move to Box.n+(0,-5pt__)
    m4lstring($5,"ifsvg(`svg_small($5,75)',`{\scriptsize$ $5 $}')") }')
  IOdefs(from svec_(0,m4v/2) to svec_(0,-m4v/2),In,`$1',R)
  Out: svec_(m4h,0) ifelse(`$2',N,`+svec_(N_diam,0)
    N_Out: NOT_circle \
      at Out-svec_(N_rad,0)'); `$6']')

                                `AND_gate(n,[N][B],wid,ht)
                                 drawn in the current direction
                                 0 <= n <= 16; N=negated inputs, B=box shape
                                 or
                                 AND_gate(chars,[B],wid,ht)
                                  arg1 is one or more of N|P '
define(`AND_gate',`define(`m4arg1',ifelse(`$1',,2,`$1'))dnl
ifelse(ifinstr(m4arg1,N,1)`'ifinstr(m4arg1,P,1),,
`m4dupstr(ifinstr(`$2',N,N,P),m4arg1,`m4PN')',`define(`m4PN',m4arg1)')dnl
ifinstr(`$2',B,
`BOX_gate(m4PN,ifinstr(`$2',N,N,P),ifelse(`$3',,,`($3)/(L_unit)'),
  ifelse(`$4',,,`($4)/(L_unit)'),ifsvg(`&```amp''';',`\&'),`$5')',
`AND_gen(m4PN,ifelse(`$2',N,N)IBAONESEC,`$3',`$4',`$5')')')

                                `NAND_gate(n,[N][B],wid,ht)
                                 0 <= n <= 16; N=negated inputs, B=box shape
                                 or
                                 NAND_gate(chars,[B],wid,ht)
                                  arg1 is one or more of N|P '
define(`NAND_gate',`define(`m4arg1',ifelse(`$1',,2,`$1'))dnl
ifelse(ifinstr(m4arg1,N,1)`'ifinstr(m4arg1,P,1),,
`m4dupstr(ifinstr(`$2',N,N,P),m4arg1,`m4PN')',`define(`m4PN',m4arg1)')dnl
ifinstr(`$2',B,
`BOX_gate(m4PN,ifelse(`$2',N,N,P),ifelse(`$3',,,`($3)/(L_unit)'),
  ifelse(`$4',,,`($4)/(L_unit)'),ifsvg(`&```amp''';',`\&'),`$5')',
`AND_gen(m4PN,ifelse(`$2',N,N)IBANONESEC,`$3',`$4',`$5')')')

                                `AND_gen(n,chars,[wid,[ht]])
                                 0 <= n <= 16
                                 B=base and straight sides; A=Arc;
                                 [N]NE,[N]SE,[N]I,[N]N,[N]S=inputs or circles,
                                 [N]O=output; C=center location
                                 or
                                 AND_gen(chars,chars,[wid,[ht]])
                                  arg1 is one or more of N|P
                                    eg PPPP defines 4 inputs,
                                    NPNP negates the first and third;
                                  arg2 as above except [N]I is ignored '
define(`AND_gen',`define(`m4arg1',ifelse(`$1',,2,`$1'))dnl
ifelse(ifinstr(m4arg1,N,1)`'ifinstr(m4arg1,P,1),,
 `m4dupstr(ifinstr(`$2',N,N,P),m4arg1,`m4PN')',`define(`m4PN',m4arg1)')dnl
  define(`m4hor',`ifelse(`$3',,AND_wd,`($3)/(L_unit)')')dnl
  define(`m4ver',`ifelse(`$4',,ifelse(`$3',,AND_ht,AND_ht/(AND_wd)*m4hor),
   `($4)/(L_unit)')')define(`dna_',ifelse(`$2',,IBAONESEC,`$2'))dnl
 [ sc_draw(`dna_',B,`Bm: line from svec_(m4hor-m4ver/2,-m4ver/2) \
     to svec_(0,-m4ver/2) \
     then to svec_(0,m4ver/2) then \
     to svec_(m4hor-m4ver/2,m4ver/2)
     ')dnl
  sc_draw(`dna_',A,`Arc: arc cw rad m4ver/2 \
     to rsvec_(0,-m4ver) \
     with .c at rsvec_(0,-m4ver/2)
     ')dnl
  sc_draw(`dna_',NNE,
   `NNE: svec_(m4hor-m4ver/2,0)+svec_(Rect_(m4ver/2+N_diam,45))
    N_NNE: NOT_circle \
      at svec_(m4hor-m4ver/2,0)+svec_(Rect_(m4ver/2+N_rad,45))
    ')dnl
  sc_draw(`dna_',NSE,
   `NSE: svec_(m4hor-m4ver/2,0)+svec_(Rect_(m4ver/2+N_diam,-45))
    N_NSE: NOT_circle \
      at svec_(m4hor-m4ver/2,0)+svec_(Rect_(m4ver/2+N_rad,-45))
     ')dnl
  sc_draw(`dna_',NE, `NE: svec_(m4hor-m4ver/2,0)+svec_(Rect_(m4ver/2,45))
     ')dnl
  ifelse(ifinstr(`$1',N,1)`'ifinstr(`$1',P,1),,
   `sc_draw(`dna_',NI, `m4A_defs(ifelse(`$1',,2,`$1'),N)')
     ')dnl
  sc_draw(`dna_',SE, `SE: svec_(m4hor-m4ver/2,0)+svec_(Rect_(m4ver/2,-45))
     ')dnl
  sc_draw(`dna_',NN, `N_NN: NOT_circle \
     at svec_((m4hor-m4ver/2)/2,m4ver/2+N_rad)
    NN: svec_((m4hor-m4ver/2)/2,m4ver/2+N_diam)
     ')dnl
  sc_draw(`dna_',NS, `N_NS: NOT_circle \
     at svec_((m4hor-m4ver/2)/2,-m4ver/2-N_rad)
    NS: svec_((m4hor-m4ver/2)/2,-m4ver/2-N_diam)
     ')dnl
  sc_draw(`dna_',NO, `N_Out: NOT_circle \
    at svec_(m4hor+N_rad,0)
    Out: svec_(m4hor+N_diam,0)
     ')dnl
  sc_draw(`dna_',O, `Out: svec_(m4hor,0)
     ')dnl
  sc_draw(`dna_',N, `N: svec_(0,m4ver/2)
     ')dnl
  ifelse(ifinstr(`$1',N,1)`'ifinstr(`$1',P,1),,
   `sc_draw(`dna_',I, `m4A_defs(ifelse(`$1',,2,`$1'))')',
   `m4A_defs(`$1')')
  sc_draw(`dna_',S, `S: svec_(0,-m4ver/2)
   ')dnl
  sc_draw(`dna_',C, `C: svec_(m4hor/2,0)')
  `$5']')

                                `Input locations, flat face
                                 m4A_defs(n,[N]) or m4A_defs(string)
                                 string = one or more N|P
                                 otherwise n inputs (negated if arg2 is N)
                                 Input points are defined as Inx
                                 and NOT circles as N_Inx where x is integer'
                                `What about the IOdefs macro?'
define(`m4A_defs',`define(`m4arg1',ifelse(`$1',,2,`$1'))dnl
  ifelse(ifinstr(m4arg1,N,1)`'ifinstr(m4arg1,P,1),,
   `m4dupstr(ifinstr(`$2',N,N,P),m4arg1,`m4AI')define(`m4AnI',m4arg1)',
   `define(`m4AI',m4arg1)define(`m4AnI',len(m4arg1))')dnl
  define(`m4m',`m4ver/2/min(m4AnI,Mx_pins-1)*min(m4AnI,3*(Mx_pins-1))')dnl
  ifelse(eval(m4AnI>Mx_pins),1,
   `line from svec_(0, m4m) \
     to svec_(0,m4ver/2)
    line from svec_(0,-m4m) \
     to svec_(0,-m4ver/2)')
  for_(1,m4AnI,1,`ifelse(substr(m4AI,0,1),N,
   `N_In`'m4x: NOT_circle at \
      svec_(-N_rad,m4ver/min(m4AnI,Mx_pins-1)*((m4AnI+1)/2-m4x))
    In`'m4x: svec_(-N_diam,m4ver/min(m4AnI,Mx_pins-1)*((m4AnI+1)/2-m4x)) ',
   `In`'m4x: svec_(0,m4ver/min(m4AnI,Mx_pins-1)*((m4AnI+1)/2-m4x))')dnl
    define(`m4AI',substr(m4AI,1)) ') ')

                                `OR_gate or NOR_gate or XOR_gate or NXOR_gate
                                 drawn in the current direction
                                 args = (n,[N][B],wid,ht)
                                 0 <= n <= 16; N=negated inputs, B=box shape
                                 or
                                 args = (chars,[B],wid,ht)
                                  arg1 is one or more of N|P '
define(`OR_gate',`m4_OR(OR,$@)')
define(`NOR_gate',`m4_OR(NOR,$@)')
define(`XOR_gate',`m4_OR(XOR,$@)')
define(`NXOR_gate',`m4_OR(NXOR,$@)')

define(`m4_OR',`define(`m4arg1',ifelse(`$2',,2,`$2'))dnl
ifelse(ifinstr(m4arg1,N,1)`'ifinstr(m4arg1,P,1),,
 `m4dupstr(ifinstr(`$3',N,N,P),m4arg1,`m4PN')',`define(`m4PN',m4arg1)')dnl
ifinstr(`$3',B,
`BOX_gate(m4PN,ifinstr(`$3',N,N,P),
  ifelse(`$4',,,`($4)/(L_unit)'),ifelse(`$5',,,`($5)/(L_unit)'),
  ifinstr(`$1',XOR,`=',`ifsvg(`>=1',`\geq 1')'),`$6')',
`OR_gen(m4PN,
 ifinstr(`$1',XOR,P)`'ifelse(`$3',N,N)IBA`'ifelse(substr(`$1',0,1),N,N)ONESEC,
 shift(shift(shift($@))))')')

                                `OR_gen(n,chars,[wid,[ht]])
                                 0 <= n <= 16
                                 B=base and straight sides; A=Arc;
                                 [N]NE,[N]SE,[N]I,[N]N,[N]S=inputs or circles,
                                 [N]P=XOR arc; [N]O=output; C=center
                                 or
                                 OR_gen(chars,chars,[wid,[ht]])
                                  arg1 is one or more of N|P
                                    eg PPPP defines 4 inputs,
                                    NPNP negates the first and third;
                                  arg2 as above except [N]I is ignored '
define(`OR_gen',`[define(`m4arg1',ifelse(`$1',,2,`$1'))dnl
ifelse(ifinstr(m4arg1,N,1)`'ifinstr(m4arg1,P,1),,
 `m4dupstr(ifinstr(`$2',N,N,P),m4arg1,`m4PN')',`define(`m4PN',m4arg1)')dnl
  define(`m4hor',`ifelse(`$3',,AND_wd,`($3)/(L_unit)')')define(`m4o',0)dnl
  define(`m4ver',`ifelse(`$4',,ifelse(`$3',,AND_ht,AND_ht/(AND_wd)*m4hor),
   `($4)/(L_unit)')')define(`dna_',ifelse(`$2',,IBAONESEC,`$2'))dnl
  sc_draw(`dna_',P,`define(`m4o',XOR_off*m4ver/(AND_ht))dnl
    Parc: arc cw from svec_(0,m4ver/2) \
     to svec_(0,-m4ver/2) \
      with .c at svec_(-sqrt((OR_rad*m4ver/(AND_ht))^2-(m4ver/2)^2),0)
     ')dnl
  sc_draw(`dna_',B,dnl
   `Bt: line from svec_(m4o+m4hor/3,m4ver/2) \
     to svec_(m4o,m4ver/2) ifdpic(chop 0 chop -hlth)
    ArcB: arc cw to svec_(m4o,-m4ver/2) \
      with .c at svec_(m4o-sqrt((OR_rad*m4ver/(AND_ht))^2-(m4ver/2)^2),0)
    Bb: line to svec_(m4o+m4hor/3,-m4ver/2) ifdpic(chop -hlth chop 0)
    ')dnl
  sc_draw(`dna_',A,`define(`m4m',`((m4hor*2/3)^2-(m4ver/2)^2)/(m4ver)')dnl
   ArcN: arc  cw from svec_(m4o+m4hor/3, m4ver/2) \
     to svec_(m4o+m4hor,0) \
     with .c at svec_(m4o+m4hor/3,-m4m)
   ArcS: arc ccw from svec_(m4o+m4hor/3,-m4ver/2) \
     to svec_(m4o+m4hor,0) \
     with .c at svec_(m4o+m4hor/3,m4m)
    ')dnl
  sc_draw(`dna_',NNE,
   `N_NNE: NOT_circle \
      at svec_(m4o+m4hor/3,-m4m)+svec_(Rect_(m4ver/2+m4m+N_rad,60))
    NNE: svec_(m4o+m4hor/3,-m4m)+svec_(Rect_(m4ver/2+m4m+N_diam,60))
    ')dnl
  sc_draw(`dna_',NSE,
   `N_NSE: NOT_circle \
      at svec_(m4o+m4hor/3,m4m)+svec_(Rect_(m4ver/2+m4m+N_rad,-60))
    NSE: svec_(m4o+m4hor/3,m4m)+svec_(Rect_(m4ver/2+m4m+N_diam,-60))
    ')dnl
  sc_draw(`dna_',NE, `NE: svec_(m4o+m4hor/3,-m4m)+svec_(Rect_(m4ver/2+m4m,60))
    ')dnl
  sc_draw(`dna_',SE, `SE: svec_(m4o+m4hor/3,m4m)+svec_(Rect_(m4ver/2+m4m,-60))
    ')dnl
  ifelse(ifinstr(`$1',N,1)`'ifinstr(`$1',P,1),,
   `sc_draw(`dna_',NI, `m4O_defs(ifelse(`$1',,2,`$1'),N)')
    ')dnl
  sc_draw(`dna_',NN, `N_NN: NOT_circle \
     at svec_(m4o+m4hor/6,m4ver/2+N_rad)
    NN: svec_(m4o+m4hor/6,m4ver/2+N_diam)
    ')dnl
  sc_draw(`dna_',NS, `N_NS: NOT_circle \
     at svec_(m4o+m4hor/6,-m4ver/2-N_rad)
    NS: svec_(m4o+m4hor/6,-m4ver/2-N_diam)
    ')dnl
  sc_draw(`dna_',NO, `N_Out: NOT_circle \
    at svec_(m4o+m4hor+N_rad,0)
    Out: svec_(m4o+m4hor+N_diam,0)
    ')dnl
  sc_draw(`dna_',O, `Out: svec_(m4o+m4hor,0)
    ')dnl
  sc_draw(`dna_',N, `N: svec_(m4o+m4hor/6,m4ver/2)
    ')dnl
  ifelse(ifinstr(`$1',N,1)`'ifinstr(`$1',P,1),,
   `sc_draw(`dna_',I, `m4O_defs(ifelse(`$1',,2,`$1'))')',
   `m4O_defs(`$1')')
  sc_draw(`dna_',S, `S: svec_(m4o+m4hor/6,-m4ver/2)
    ')dnl
  sc_draw(`dna_',C, `C: svec_(m4o+m4hor/2,0)')
  `$5']')

                                `Input locations, curved face
                                 m4O_defs(n,[N]) or m4O_defs(string)
                                 string = one or more N|P
                                 otherwise n inputs (negated if arg2 is N)
                                 Input points are defined as Inx
                                 and NOT circles as N_Inx where x is integer'
define(`m4O_defs',`define(`m4arg1',ifelse(`$1',,2,`$1'))dnl
  ifelse(ifinstr(m4arg1,N,1)`'ifinstr(m4arg1,P,1),,
   `m4dupstr(ifinstr(`$2',N,N,P),m4arg1,`m4OI')define(`m4OnI',m4arg1)',
   `define(`m4OI',m4arg1)define(`m4OnI',len(m4arg1))')dnl
  define(`m4om',`m4ver/2/min(m4OnI,Mx_pins-1)*min(m4OnI,3*(Mx_pins-1))')dnl
  ifelse(eval(m4OnI>Mx_pins),1,
   `arc ccw from svec_(0,m4ver/2) \
     to svec_(0,m4ver) + M4O_pos(m4om-m4ver) \
      with .c at svec_(-M4O_dst,m4ver)
    arc cw from svec_(0,-m4ver/2) \
     to svec_(0,-m4ver) +M4O_pos(-(m4om-m4ver))\
      with .c at svec_(-M4O_dst,-m4ver)
    ')dnl
  define(`m4on',`(eval((m4OnI-Mx_pins+1)/2))')dnl
  for_(1,m4OnI,1,
   `define(`m4oq',`m4ver/2/min(m4OnI,Mx_pins-1)*(m4OnI+1-2*m4x)')dnl
    In`'m4x: ifelse(eval(m4x<=m4on),1,`svec_(0, m4ver)+M4O_pos(m4oq-m4ver)',
      eval(m4x>(m4OnI-m4on)),1,       `svec_(0,-m4ver)+M4O_pos(m4oq+m4ver)',
      `M4O_pos(m4oq)')
    ifelse(substr(m4OI,0,1),N,
     `N_In`'m4x: NOT_circle \
        at In`'m4x+svec_(-N_rad,0)
      In`'m4x: In`'m4x+svec_(-N_diam,0)
      ')dnl
    define(`m4OI',substr(m4OI,1))dnl
    ')
  ')
define(`M4O_dst',`sqrt((OR_rad*m4ver/(AND_ht))^2-(m4ver/2)^2)')
define(`M4O_pos',`svec_(-M4O_dst+sqrt((OR_rad*m4ver/(AND_ht))^2-(`$1')^2),
 `$1')')

                                `IOdefs(linespec,label,[P|N]*,L|R)
                                 Distribute named locations with optional NOT
                                 circles along a line
                                 eg IOdefs(up 1,Z,PNN,R) defines Z1 at 1/6
                                 along the line, NOT circles N_Z2 and N_Z3 to
                                 the right at 1/2 and 5/6 along the line with
                                 Z2 and Z3 labeled at their right edges'
define(`IOdefs',`define(`m4dm',`ifelse(`$3',,1,len(`$3'))')
  define(`m4da',`$3')define(`m4dv',`ifelse(`$2',,In,`$2')')
  M4TL: move `$1'
  M4PL: vperp(M4TL,L_unit)
  for_(1,m4dm,1,
   `m4dv`'m4x: ((m4x-1/2)/m4dm between M4TL.start and M4TL.end) dnl
    ifelse(substr(m4da,0,1),N,`\
      ifelse(`$4',R,-,+)(M4PL.x*N_diam,M4PL.y*N_diam)
      {N_`'m4dv`'m4x: NOT_circle \
        at m4dv`'m4x ifelse(`$4',R,+,-)(M4PL.x*N_rad,M4PL.y*N_rad)}')
    define(`m4da',substr(m4da,1))') ')

                                `BUFFER_gen(chars,wd,ht,[N|P]*,[N|P]*,[N|P]*)
                                 chars: T=triangle (default),
                                 [N]O=output location Out (NO draws circle
                                  N_Out);
                                 [N]I,[N]N,[N]S,[N]NE,[N]SE input locations
                                 C=centre location.  Args 4-6 define In, NE,
                                 and SE argument sequences'
define(`BUFFER_gen',
 `define(`m4h',`ifelse(`$2',,BUF_wd,`($2)/(L_unit)')')define(`m4y',m4h)dnl
  define(`m4v',`ifelse(`$3',,BUF_ht,`($3)/(L_unit)')')dnl
  define(`dna_',ifelse(`$1',,ITOCNESE,`$1'))dnl
  define(`m4z',`N_rad/vlength(m4h,m4v/2)')dnl
 [sc_draw(`dna_',T,`Tm: line from svec_(m4h,0) \
     to svec_(0,-m4v/2) \
     then to svec_(0,m4v/2) \
     then to svec_(m4h,0)
     Tc: svec_(m4h/2,0)
    ')dnl
  sc_draw(`dna_',NNE,`N_NNE: NOT_circle \
      at svec_(m4h/2,m4v/4)+svec_(m4v/2*m4z,m4h*m4z)
    NNE: svec_(m4h/2,m4v/4)+svec_(m4v*m4z,m4h*2*m4z)
    ')dnl
  sc_draw(`dna_',NSE,`N_NSE: NOT_circle \
      at svec_(m4h/2,-m4v/4)-svec_(-m4v/2*m4z,m4h*m4z)
    NSE: svec_(m4h/2,-m4v/4)-svec_(-m4v*m4z,m4h*2*m4z)
    ')dnl
  sc_draw(`dna_',NI,`define(`m4y',m4y+N_diam) In1: svec_(-N_diam,0)
    N_In1: NOT_circle \
      at svec_(-N_rad,0)
    ')dnl
  sc_draw(`dna_',NE, `NE: svec_(m4h/2,m4v/4)
    ')dnl
  sc_draw(`dna_',SE, `SE: svec_(m4h/2,-m4v/4)
    ')dnl
  sc_draw(`dna_',NN, `N_NN: NOT_circle \
     at svec_(0,m4v/2+N_rad)
    NN: svec_(0,m4v/2+N_diam)
    ')dnl
  sc_draw(`dna_',NS, `N_NS: NOT_circle \
     at svec_(0,-m4v/2-N_rad)
    NS: svec_(0,-m4v/2-N_diam)
    ')dnl
  sc_draw(`dna_',NO,`define(`m4y',m4y+N_diam) Out: svec_(m4h+N_diam,0)
    N_Out: NOT_circle \
     at svec_(m4h+N_rad,0)
    ')dnl
  sc_draw(`dna_',N, `N: svec_(0,m4v/2)
    ')dnl
  sc_draw(`dna_',S, `S: svec_(0,-m4v/2)
    ')dnl
  sc_draw(`dna_',O, `Out: svec_(m4h,0)
    ')dnl
  sc_draw(`dna_',I, `In1: (0,0)
    ')dnl
  sc_draw(`dna_',C, `C: svec_(m4h/3,0)
    ')dnl
  ifelse(`$4',,,`IOdefs(from svec_(0,m4v/2) to svec_(0,-m4v/2),In,`$4',R)')
  ifelse(`$5',,,`IOdefs(from svec_(0,m4v/2) to svec_(m4h,0),NE,`$5')')
  ifelse(`$6',,,`IOdefs(from svec_(0,-m4v/2) to svec_(m4h,0),SE,`$6',R)')
  `$7']')

                                `BUFFER_gate(linespec,[N|B],wid,ht,
                                   [N|P]*,[N|P]*)
                                 When linespec is blank then the element is
                                 composite and In1, Out, C, NE, and SE are
                                 defined; otherwise the element is drawn as
                                 two-terminal
                                 arg2: B=box gate'
                                 Args 5 and 6 define NE and SE argument
                                 sequences'
define(`BUFFER_gate',`ifinstr(`$2',B,
 `BOX_gate(ifinstr(`$2',N,N,P),P,ifelse(`$3',,,`($3)/(L_unit)'),
    ifelse(`$4',,,`($4)/(L_unit)'),1,`$5')',
 `ifelse(`$1',,
   `BUFFER_gen(ifelse(`$2',N,N)ITOCNESE,`$3',`$4',,`$5',`$6',`$7')',
   `eleminit_(`$1')
    { BUFFER_gen(ifelse(`$2',N,N)ITOC,`$3',`$4',,`$5',`$6',`$7') \
        with .Tc at last line.c }
    { line to last [].In1; line from last [].Out to 2nd last line.end }
    line invis to rvec_(rp_len,0)')')')

                                `NOT_gate(linespec,[B][N|n],wid,ht)
                                 When linespec is blank then the element is
                                 composite and In1, Out, C, NE, and SE are
                                 defined; otherwise the element is drawn as
                                 two-terminal
                                 arg2: B=box gate, N=negated input and
                                 output, n=negated input only'
define(`NOT_gate',`ifinstr(`$2',B,
 `BOX_gate(ifinstr(`$2',N,N,`$2',n,N,P),ifinstr(`$2',n,P,N),
    ifelse(`$3',,,`($3)/(L_unit)'),ifelse(`$4',,,`($4)/(L_unit)'),1,`$5')',
 `ifelse(`$1',,
   `BUFFER_gen(ifinstr(`$2',N,N,`$2',n,N)IT`'ifinstr(`$2',n,,N)OCNESE,
      `$3',`$4',,,,`$5')',
   `eleminit_(`$1')
    { BUFFER_gen(ifinstr(`$2',N,N,`$2',n,N)IT`'ifinstr(`$2',n,,N)OC,
      `$3',`$4',,,,`$5') \
        with .C at last line.c }
    { line to last [].In1; line from last [].Out to 2nd last line.end }
    line invis to rvec_(rp_len,0)')')')

                                `The comprehensive logic pin:
   lg_pin(location, label, Picname, n|e|s|w [L|M|I|O][N][E], pinno, optlen)
     label=text (indicating logical pin function, usually)
     Picname=pic label for referring to the pin
     n|e|s|w=orientation (north, east, south, west)
     L=active low out; M=active low in; I=inward arrow; O=outward arrow
     N=negated (NOT-circle); E=edge trigger'
define(`lg_pin',`ifelse(`$1',,,`move to $1')
  define(`dna_',`substr(`$4',1)')define(`m4lE',)define(`m4lch',0)dnl
  define(`m4ld',`ifelse(`$4',,e,`substr(`$4',0,1)')')dnl
  define(`m4lph',`ifelse(m4ld,n,0,m4ld,w,-1,m4ld,s,0,1)')dnl
  define(`m4lpv',`ifelse(m4ld,n,1,m4ld,w,0,m4ld,s,-1,0)')dnl
  define(`m4lpl',`ifelse(`$6',,`lg_plen',(`$6')/L_unit)')dnl
  sc_draw(`dna_',E,`define(`m4lE',1)dnl
    { line from rsvec_(lp_xy(0,N_rad)) \
      to rsvec_(lp_xy(-N_diam*sqrt(3)/2,0)) then to rsvec_(lp_xy(0,-N_rad)) }')
  ifelse(`$2',,,
   `{ lg_pintxt(`$2') ifelse(m4ld,w,`ljust_', m4ld,n,`below_',
      m4ld,s,`above_',`rjust_') at Here dnl
      ifxfig(`+(lp_xy(-0.72bp__,0))') dnl
      ifelse(m4lE,1,`+svec_(lp_xy(-N_diam*sqrt(3)/2,0))') }')
  sc_draw(`dna_',N,`define(`m4lch',N_diam*L_unit)
    { NOT_circle \
        at rsvec_(lp_xy(N_rad,0)) }')
  sc_draw(`dna_',L,`define(`m4lch',N_rad*2.5*L_unit)
    {line from rsvec_(lp_xy(0,
      ifelse(m4ld,w,-,m4ld,s,-)N_rad*3/2)) to rsvec_(lp_xy(N_rad*2.5,0)) \
      then to Here }')
  sc_draw(`dna_',M,`define(`m4lch',N_rad*2.5*L_unit)
    { line to rsvec_(lp_xy(N_rad*2.5,
      ifelse(m4ld,w,-,m4ld,s,-)N_rad*3/2)) then to rsvec_(lp_xy(N_rad*2.5,0)) \
        then to Here}')
  {ifelse(`$3',,,`$3':) line to rsvec_(lp_xy(m4lpl,0)) chop m4lch chop 0 dnl
   ifinstr(dna_,I,` <- wid linethick*5.6bp__ ht linethick*7.2bp__ ')dnl
   ifinstr(dna_,O,` -> wid linethick*5.6bp__ ht linethick*7.2bp__ ')
   ifelse(`$5',,,`move to last line.c; lg_pintxt(`$5') dnl
     ifelse(m4ld,n,`rjust_', m4ld,w,`above_',m4ld,e,`above_',`rjust_')') 
   } ')
define(`lp_xy',`vrot_(`$1',`$2',m4lph,m4lpv)')

                                `Mux(ni, label,
                                  [L][B|H|X][N[n]|S[n]][[N]OE],wid,ht)
                                  ni = number of inputs (default 2)
                                  The input pins are lines named
                                  In0, In1, ... In<ni-1>
                                 chars:
                                   L reverses pin numbering,
                                   B pin number labels in binary form,
                                   H pin number labels in hex form,
                                   X disable pin labels
                                   N[n] puts pin Sel or pins Sel0 .. Seln
                                    at the top (with respect to the drawing
                                    direction)
                                   S[n] puts the Sel inputs at the
                                   bottom (default)
                                   OE adds the OE input, NOE negated '
define(`Mux',`[
  define(`m4Mwid',`ifelse(`$4',,Mux_wid,((`$4')/(L_unit)))')dnl
  define(`m4Mht',`ifelse(`$5',,Mux_ht,((`$5')/(L_unit)))')dnl
  W: (0,0)
  C: svec_(m4Mwid/2,0)
  E: svec_(m4Mwid,0)
  NW: svec_(0,m4Mht/2)
  SW: svec_(0,-m4Mht/2)
  NE: svec_(m4Mwid,m4Mht/2-2)
  SE: svec_(m4Mwid,-m4Mht/2+2)
  line from W to NW then to NE then to SE then to SW then to W
  ifelse(`$2',,,`"ifsvg(`svg_small($2,75)',`\scriptsize $2')" at C')
  lg_pin(E,,Out,e)
  define(`m4Mdna',`$3')define(`m4MOE')dnl
  sc_draw(`m4Mdna',L,`define(`m4ML',-)',`define(`m4ML')')dnl
  define(`m4MN')define(`m4MSel',S)dnl
  sc_draw(`m4Mdna',B,`define(`m4MN',B)')dnl
  sc_draw(`m4Mdna',H,`define(`m4MN',H)')dnl
  sc_draw(`m4Mdna',X,`define(`m4MN',X)')dnl
  sc_draw(`m4Mdna',NOE,`define(`m4MOE',N)')dnl
  sc_draw(`m4Mdna',OE,`define(`m4MOE',O)')dnl
  sc_draw(`m4Mdna',N,`define(`m4MSel',N)')dnl
  sc_draw(`m4Mdna',S,`define(`m4MSel',S)')dnl
  define(`m4Mn',`ifelse(`$1',,2,`ifelse(m4MOE,,`$1',incr(eval(`$1')))')')dnl
  ifinstr(m4MSel,N,                             dnl Draw Sel pins
   `ifelse(m4Mdna,,`lg_pin((0.5 between NW and NE),,Sel,n)',`for_(1,m4Mdna,1,`
      lg_pin((m4x-0.5)/m4Mdna between NW and NE,,Sel`'eval(m4x-1),n)')')',
   `ifelse(m4Mdna,,`lg_pin((0.5 between SW and SE),,Sel,s)',`for_(1,m4Mdna,1,`
      lg_pin((m4x-0.5)/m4Mdna between SW and SE,,Sel`'eval(m4x-1),s)')')')
  for_(1,m4Mn,1,`lg_pin(                        dnl Draw In pins
     svec_(0,m4ML`'m4Mht*(0.5+(0.5-m4x)/m4Mn)),
     define(`m4MNO',`ifelse(m4x,m4Mn,ifelse(m4MOE,,,N))')dnl
     ifelse(m4MNO,,
      `ifelse(m4MN,X,,
         m4MN,B,`define(`m4dg',`ifelse(eval(`$1'>8),1,4,eval(`$1'>4),1,3,
           eval(`$1'>2),1,2,1)') binary_(decr(m4x),m4dg)',
         m4MN,H,`define(`m4dg',`ifelse(eval(`$1'>16),1,2,1)')dnl
           hexadecimal_(decr(m4x),m4dg)',
         decr(m4x))',
      `ifelse(m4MN,X,,`ifelse(m4MOE,N,lg_bartxt(OE),OE)')'),
     ifelse(m4MNO,,In`'decr(m4x),ifelse(m4MOE,N,N)OE),
     w`'ifelse(m4MNO,,,ifelse(m4MOE,N,N)))')
  `$6']')

                                `Demux(no, label,
                                  [L][B|H|X][N[n]|S[n]][[N]OE],wid,ht)
                                  no = number of outputs (default 2)
                                  The output pins are lines named
                                  Out0, Out1, ... Out<ni-1>
                                 chars:
                                  L reverses pin numbering,
                                  B displays binary pin numbers,
                                  H displays hexadecimal pin numbers,
                                  X disable pin labels
                                  N[n] puts Sel or Sel0 .. Seln at the top
                                   (with respect to the drawing direction)
                                  S[n] puts the Sel inputs at the
                                  bottom (default)
                                  OE adds the OE input, NOE negated '
define(`Demux',`[
  define(`m4Dwid',`ifelse(`$4',,Mux_wid,((`$4')/(L_unit)))')dnl
  define(`m4Dht',`ifelse(`$5',,Mux_ht,((`$5')/(L_unit)))')dnl
  W: (0,0)
  C: svec_(m4Dwid/2,0)
  E: svec_(m4Dwid,0)
  NW: svec_(0,m4Dht/2-2)
  SW: svec_(0,-m4Dht/2+2)
  NE: svec_(m4Dwid,m4Dht/2)
  SE: svec_(m4Dwid,-m4Dht/2)
  line from W to NW then to NE then to SE then to SW then to W
  ifelse(`$2',,,`"ifsvg(`svg_small($2,75)',`\scriptsize $2')" at C')
#  lg pin(location, label, Picname, n|e|s|w [L|M|I|O][N][E], pinno, optlen)
  lg_pin(W,,In,w)
  define(`m4Ddna',`$3')define(`m4DOE')dnl
  sc_draw(`m4Ddna',L,`define(`m4DL',-)',`define(`m4DL')')dnl
  define(`m4DN')define(`m4DSel',S)dnl
  sc_draw(`m4Ddna',B,`define(`m4DN',B)')dnl
  sc_draw(`m4Ddna',H,`define(`m4DN',H)')dnl
  sc_draw(`m4Ddna',X,`define(`m4DN',X)')dnl
  sc_draw(`m4Ddna',NOE,`define(`m4DOE',N)')dnl
  sc_draw(`m4Ddna',OE,`define(`m4DOE',O)')dnl
  sc_draw(`m4Ddna',N,`define(`m4DSel',N)')dnl
  sc_draw(`m4Ddna',S,`define(`m4DSel',S)')dnl
  define(`m4Dn',`ifelse(`$1',,2,`$1')')dnl
  ifinstr(m4DSel,N,
   `ifelse(m4Ddna,,`lg_pin((0.5 between NW and NE),,Sel,n)',`for_(1,m4Ddna,1,`
      lg_pin((m4x-0.5)/m4Ddna between NW and NE,,Sel`'eval(m4x-1),n)')')',
   `ifelse(m4Ddna,,`lg_pin((0.5 between SW and SE),,Sel,s)',`for_(1,m4Ddna,1,`
      lg_pin((m4x-0.5)/m4Ddna between SW and SE,,Sel`'eval(m4x-1),s)')')')
#  lg pin(location, label, Picname, n|e|s|w [L|M|I|O][N][E], pinno, optlen)
  for_(1,m4Dn,1,`lg_pin(
    svec_(m4Dwid,m4DL`'m4Dht*(0.5+(0.5-m4x)/m4Dn)),
    ifelse(m4DN,X,,
      m4DN,B,`define(`m4dg',`ifelse(eval(`$1'>8),1,4,eval(`$1'>4),1,3,
        eval(`$1'>2),1,2,1)') binary_(decr(m4x),m4dg)',
      m4DN,H,`define(`m4dg',`ifelse(eval(`$1'>16),1,2,1)')dnl
        hexadecimal_(decr(m4x),m4dg)',
      decr(m4x)),
    Out`'decr(m4x),
    e)')
  ifelse(m4DOE,,,`ifelse(m4DOE,N,
   `lg_pin(svec_(0,m4Dht*(0.5+(1-m4Dn)/m4Dn)),lg_bartxt(OE),NOE,wN)',
   `lg_pin(svec_(0,m4Dht*(0.5+(1-m4Dn)/m4Dn)),OE,OE,w)')')
  `$6']')

###########################################################################
                              Autogate allowable functions (plus the ~ operator)
define(`And',`_AutoGate(AND,$@)')
define(`Or',`_AutoGate(OR,$@)')
define(`Not',`_AutoGate(NOT,$@)')
define(`NNot',`_AutoGate(NNOT,$@)')
define(`Buffer',`_AutoGate(BUFFER,$@)')
define(`Xor',`_AutoGate(XOR,$@)')
define(`Nand',`_AutoGate(NAND,$@)')
define(`Nor',`_AutoGate(NOR,$@)')
define(`Nxor',`_AutoGate(NXOR,$@)')
dnl                           Custom subcircuit template:
dnl define(`Mygate',`_AutoGate(My,$@)')
dnl define(`My_gate',`[ ...
dnl   Out: ...
dnl   In1: ...
dnl   In2: ... ]')
dnl                           Not gate with negated input for NNOT above
define(`NNOT_gate',`BUFFER_gate(,N)')

                              Style parameters
define(`gatelineth',linethick)   #define(`gatelineth',1.0) use absolute pt
define(`lineth',linethick)       #define(`lineth',0.5)
define(`autoinputsep',`(BUF_ht*L_unit*5/4)') # distance between inputs
define(`autovsep',`L_unit')      # vertical separation between input gates

##########

                              Draw the gate with input sublayer Sg containing
                              gates G1, G2, ...
define(`AutoGate',`[ pushdef(`m4nargs',0)dnl
  lu = L_unit define(`m4dirt',m4dir)
dnl                           Count the arguments (inputs) (could use $# )
  Loopover_(`arg',`define(`m4nargs',incr(m4nargs))',shift($@))dnl
 `#' m4Delch(`$1') gate(m4nargs)
#                             Draw the gate
  linethick = gatelineth
  ifelse(m4Delch(`$1'),NOT,`Q: NOT_gate()',
    m4Delch(`$1'),BUFFER,`Q: BUFFER_gate()',
   `Q: m4Delch($1)_gate(m4nargs)') `#' End Q
  linethick = lineth
  ifelse(substr(m4Delch(`$1'),0,1),N,
   `Out: Q.Out',
   `line thick lineth from Q.Out m4dirt N_diam*L_unit; Out: Here')
  pushdef(`AutoOutNames',m4Path.Out)
  T: ifelse(m4dirt,right,`Q.w-(2*lu,0)',`Q.e+(2*lu,0)')
#                             Sublayer Sg containing gates G1, G2,... with
#                             output vertical median at the height of Q.c
  Sg: [ pushdef(`m4_nct',0)dnl
    pushdef(`m4Path',m4Path.Sg)dnl
    Loopover_(`arg',
     `define(`m4_nct',incr(m4_nct))dnl
#                             Variable or a sublayer gate
#                             Inputs are labelled In<var>_N or In<var>_X
#                             Remove initial white space; detect a name or gate
      pushdef(`m4Path',m4Path.G`'m4_nct)dnl
      m4ifboolvar_(arg,
       `G`'m4_nct: [dnl
         ifelse(substr(arg,0,1),~,
          `define(`m4xg',substr(arg,1))dnl
           pushdef(`m4InNames',m4Path.In`'m4xg`'_N)define(N_`'m4xg)dnl
           In`'m4xg`'_N: Here',
          `pushdef(`m4InNames',m4Path.In`'arg`'_X)define(X_`'arg)dnl
           In`'arg`'_X: Here ')
         Out: Here ] dnl
           ht ifelse(m4nargs,1,`2*autovsep',`abs(Q.In1.y-Q.In2.y)-autovsep')',
       `pushdef(`AutoOutNames',m4Path.Out)dnl
        G`'m4_nct: m4Delch(arg)') ifelse(m4_nct,1,,`ifelse(m4dirt,right, \
           `with .ne at last [].se',`with .nw at last [].sw')+(0,-autovsep)')
      popdef(`m4Path') ',
      shift($@))
    MidOut: 0.5 between G`'eval((m4_nct+1)/2).Out and G`'eval((m4_nct+2)/2).Out
    popdef(`m4_nct')dnl
    popdef(`m4Path')dnl
    ] with .MidOut at T+(ifelse(m4dirt,right,-)m4nargs*lu,0) # end Sg
#                             Draw the connecting lines
  define(`m4hhv',`(m4nargs-1)/2')dnl
  ifelse(m4dirt,right,
   `for_(1,m4nargs,1,`line thick lineth from Q.In`'m4x \
      left Q.In`'m4x.x-T.x+(m4hhv-abs(m4x-m4hhv-1))*lu \
      then up Sg.G`'m4x.Out.y-Q.In`'m4x.y \
      then to Sg.G`'m4x.Out')',
   `for_(1,m4nargs,1,`line thick lineth from Q.In`'eval(m4nargs+1-m4x) \
      right T.x-Q.In`'eval(m4nargs+1-m4x).x+(m4hhv-abs(m4x-m4hhv-1))*lu \
      then up Sg.G`'m4x.Out.y-Q.In`'eval(m4nargs+1-m4x).y \
      then to Sg.G`'m4x.Out')')
  popdef(`m4nargs') m4xpand(m4dirt`'_) ]')

define(`m4ifboolvar_',
`ifelse(substr(`$1',0,1),_,`$3',`ifdef(`$1',`$3',`$2')')')

                              Empty a stack while nonblank, executing arg2
define(`m4stackdump',`ifdef(`$1',`ifelse($1,,`popdef(`$1')',
`$2`'popdef(`$1')m4stackdump(`$1',`$2')')')')dnl

define(`DrawIn',`
#                             Draw and label input $1
  PrevInput: PrevInput-ifdef(`m4LI',`(0,autoinputsep)',
   `(ifelse(m4dir,left,-)autoinputsep,0)')
  In`'$1: PrevInput define(`m4dirt',m4dir)
ifinstr(`$2',N,
` line thick lineth from PrevInput ifdef(`m4LI',m4dir`'_,down_) dimen_/2
  linethick = gatelineth
  NOT_gate
  linethick = lineth
  InNt`'$1: Here',
 `line thick lineth from PrevInput ifdef(`m4LI',m4dir,down) dimen_/4
  Int`'$1: Here')
  m4xpand(m4dirt`'_)
  ')
define(`DrawInNotIn',`
#                             Draw and label input $1 inverted and uninverted.
  PrevInput: PrevInput-ifdef(`m4LI',`(0,autoinputsep)',
   `(ifelse(m4dir,left,-)autoinputsep*2,0)')
  In`'$1: PrevInput define(`m4dirt',m4dir)
  line thick lineth from PrevInput ifdef(`m4LI',m4dir,down) dimen_/4
  ifdef(`m4LI',`PrevInput: PrevInput-(0,autoinputsep)')
  Int`'$1: dot
  line thick lineth ifdef(`m4LI',down,m4dir) autoinputsep \
    then ifdef(`m4LI',m4dir`'_,down_) dimen_/4
  linethick = gatelineth
  NOT_gate
  linethick = lineth
  InNt`'$1: Here;  m4xpand(m4dirt`'_)
  ')

dnl                          `Autologic(Boolean function, ****Obsolete
dnl                            [N[oconnect]][L[eftinputs]][R][V][;offset=val])'

`     Example:               Autologic(`Nor(`And(x,y)',`And(~x,z)')')
      Second example, (the same function): 
                             Autologic(ZNor(ZAnd(x,y),ZAnd(~x,z)))
'
define(`Autologic',
 `print `"*** Circuit_macros warning: Autologic is obsolete; use Autologix"'
  Autologix($@)')
############################

                             `Autologix(FunctionSpec;FunctionSpec;... ,
                                [M[irror]]
                                [N[oconnect]]
                                [L[eftinputs]]
                                [R][V]
                                [;offset=val])
                              FunctionSpec =
                                Boolean-fn(args) [@ location attribute]'
`                        e.g. HalfAdder: Autologix(Xor(x,y);And(x,y),LVR)

      Drawing single gates is not enough; more general Boolean expressions
      in function notation can be drawn automatically.  This macro draws
      one or more trees of gates with the output or outputs
      (roots) to the right (on the left if the M[irror] option is used).
      The predefined functions are And, Or, Not, Nand, Nor, Xor, Nxor,
      and Buffer, and may be nested; e.g., Or(And(x,~y),And(~x,y)).
      Function notation does not model internal connections such as
      feedback.  However, internal nodes can be accessed.

      The exact appearance of a tree depends on the order in which
      terms and variables appear in the expressions.  Gates can be placed
      relative to previously drawn objects using the @ location construct;
      e.g. @with .nw at last [].sw+(0,-dimen_).

      Autologix locates the distinct input variables (with NOT gates for
      variables preceded by ~) in a row or column and connects them to
      the internal gates.  If x1 (for example) appears as a variable,
      then the corresponding input location is Inx1.

      Inputs are placed in a row from right to left by default, in the
      order in which the variables first appear in the expressions.
      An R in the second argument reverses their order and a V reverses
      the order in which variables are scanned in the expresssions. An
      N in the second argument draws the expression tree or trees only,
      suppresses drawing of the inputs, and defines the gate inputs as
      In1, In2, ...

      Placing inputs in a column on the left using the L option introduces
      graphic complexity that is incompletely handled. Hand tuning
      may be required for complex expressions; putting offset=value in
      arg2 shifts the array of inputs.  Time will tell whether this can
      be improved.

      Arbitrary subcircuits with inputs In1, In2, ... on the left and at
      least one output Out on the right can be included (see the example
      containing SRff).

      Internal blocks:
      Fx contains all the FunctionSpec trees; the input connections
        are drawn external to Fx
      Each Txi contains an input variable or a function tree
      Function tree i is drawn by the `AutoGate' macro.
'
define(`Autologix',
`[ # Auto logix
dnl                           Split arg1 into FunctionSpecs
 undefine(`m4BooleanR')stacksplit_(`m4BooleanR',`$1',;)dnl
dnl
 ifinstr(`$2',L,`define(`m4LI')',`undefine(`m4LI')')dnl
 undefine(`m4InNames')undefine(`AutoOutNames')define(`m4Path',)dnl
 define(`m4nbf',0)undefine(`m4BooleanFn')undefine(`m4locattr')dnl
dnl                           Separate functions from location attributes
 stackexec_(`m4BooleanR',,
  `define(`m4nbf',incr(m4nbf))define(`m4xi',regexp(m4BooleanR,[a-zA-Z_~]))dnl
   ifinstr(m4BooleanR,@,`define(`m4xc',index(m4BooleanR,@))dnl
     pushdef(`m4BooleanFn',substr(m4BooleanR,m4xi,eval(m4xc-m4xi)))dnl
     pushdef(`m4locattr',substr(m4BooleanR,incr(m4xc)))',
    `pushdef(`m4BooleanFn',substr(m4BooleanR,m4xi))dnl
     pushdef(`m4locattr')')dnl
 ')dnl
dnl
dnl                           Sublayer of functions, outputs Out1, Out2,..
 pushdef(`m4Path',ifelse(m4Path,,,m4Path.)Fx)
Fx: [ define(`m4fno',0)dnl
 ifinstr(`$2',M,`left_ define(`m4corner',e)',`right_ define(`m4corner',w)')
dnl
 stackexec_(`m4BooleanFn',,
 `define(`m4fno',incr(m4fno))dnl
  pushdef(`m4Path',m4Path.Tx`'m4fno)dnl
dnl                           Simple variable or gate
  m4ifboolvar_(m4BooleanFn,
   `Tx`'m4fno: [ifelse(substr(m4BooleanFn,0,1),~,
       `define(`m4xg',substr(m4BooleanFn,1))dnl
        pushdef(`m4InNames',m4Path.In`'m4xg`'_N)define(N_`'m4xg)
        In`'m4xg`'_N: Here',
       `pushdef(`m4InNames',m4Path.In`'m4BooleanFn`'_X)dnl
        define(X_`'m4BooleanFn)dnl
        In`'m4BooleanFn`'_X: Here'); Out: Here ] ht 2*autovsep',
   `Tx`'m4fno: m4Delch(m4BooleanFn)') ifelse(m4fno,1,,
    `ifelse(m4locattr,,`with .n`'ifinstr(`$2',M,w,e) \
       at Tx`'eval(m4fno-1).s`'ifinstr(`$2',M,w,e)+(0,-dimen_/4)',
     m4locattr)')dnl
  pushdef(`AutoOutNames',m4Path.Out)dnl
  popdef(`m4locattr') `#' End Tx`'m4fno
  popdef(`m4Path')dnl
dnl                           Functions drawn
dnl                           Out and Out1, Out2, ...
  pushdef(`AutoOutNames',m4Path.Out`'m4fno)dnl
  Out`'m4fno: Tx`'m4fno.Out
  ifelse(m4nbf,1,`; Out: Tx1.Out')
 ') ] `#' End Fx
  popdef(`m4Path')dnl
  stackreverse_(`m4InNames')dnl
  define(`M4TopInput',m4InNames)dnl
dnl
dnl                           Delete blank names; mark top and bottom inputs
  stackexec_(`m4InNames',,`ifelse(m4InNames,,,
   `pushdef(`m4R',m4InNames)define(`m4bn',basename_(m4R))dnl
    ifdef(Top`'m4bn,,`define(Top`'m4bn,m4R)')define(Bot`'m4bn,m4R)')')
dnl
dnl                           Check V option
  ifinstr(`$2',V,
   `stackexec_(`m4R',`m4TAL')stackexec_(`m4TAL',`m4InNames')',
   `stackexec_(`m4R',`m4InNames')')
dnl
dnl                           Count and extract bare input names
  undefine(`m4r')undefine(`m4f')define(`m4nargs',0)undefine(`m4N_')dnl
  stackexec_(`m4InNames',`m4R',
   `define(`m4nargs',incr(m4nargs))define(`m4bn',basename_(`m4InNames'))dnl
    ifelse(substr(m4bn,decr(len(m4bn))),N,`define(`m4N_')')dnl
    pushdef(`m4r',substr(m4bn,2,eval(len(m4bn)-4)))')dnl
  stackexec_(`m4R',`m4InNames')stackexec_(`m4r',`m4f')
dnl
dnl                           Unique bare input names in forward order
  stackexec_(`m4f',,`ifdef(D_`'m4f,,`pushdef(`m4r',m4f)define(D_`'m4f)')')
  stackexec_(`m4r',`m4f',`undefine(D_`'m4r)')
dnl
dnl                           Optional reverse of bare name order
  ifinstr(`$2',R,`stackreverse_(`m4f')')
dnl                           Get the offset=value if any 
  setkey_($2,offset,0)dnl
dnl                           Place reference for row or column of inputs
PrevInput: ifdef(`m4LI',dnl
 `ifinstr(`$2',M,
  `(Fx.e.x+dimen_/2+m4nargs*2*L_unit`'ifdef(`m4N_',`+(BUF_wd+N_diam)*L_unit'),\
     M4TopInput.y+autoinputsep+m4offset)',
  `(Fx.w.x-dimen_/2-m4nargs*2*L_unit`'ifdef(`m4N_',`-(BUF_wd+N_diam)*L_unit'),\
     M4TopInput.y+autoinputsep+m4offset)')',
 `ifinstr(`$2',M,
  `Fx.ne+(-(autoinputsep/2+dimen_/4+m4offset),dimen_`'ifdef(`m4N_',,/4))',
  `Fx.nw+(  autoinputsep/2+dimen_/4+m4offset, dimen_`'ifdef(`m4N_',,/4))')')
dnl
#                             Draw inputs right to left or top to bottom
  stackexec_(`m4f',`m4r',`ifinstr(`$2',N,,`ifdef(X_`'m4f,
   `ifdef(N_`'m4f,`DrawInNotIn(m4f)',`DrawIn(m4f)')',`DrawIn(m4f,N)')')')
  stackexec_(`m4r',,`undefine(N_`'m4r)undefine(X_`'m4r)')
dnl
dnl                           Show the internal inputs in comment lines
`# Internal input names' (m4nargs):dnl
stackexec_(`m4InNames',`m4R',`
`#' m4InNames')
stackexec_(`m4R',`m4InNames')
dnl
#                             Promote the In and Out locations to the top level
  define(`m4ix',0)dnl
  stackexec_(`AutoOutNames',,`define(`m4ix',incr(m4ix))
    Out`'m4ix: AutoOutNames')
  define(`m4ix',0)dnl
  stackexec_(`m4InNames',`m4R',`define(`m4ix',incr(m4ix))
   In`'m4ix: m4InNames')
  stackexec_(`m4R',`m4InNames')
#                             Connect the gates to the inputs and clean up
  ifinstr(`$2',N,,
  `m4AutoConnex(Fx,`m4InNames',ifdef(`m4LI',`ifinstr(`$2',V,Top,Bot)',Bot))')
  stackexec_(`m4TAL',,
  `define(`m4bn',basename_(m4TAL))undefine(Bot`'m4bn)undefine(Top`'m4bn)')
#                             Define the inputs
  ifelse(m4nbf,1,`Out: Fx.Out')
  for_(1,m4nbf,1,`Out`'m4x: Fx.Out`'m4x')
  `$3' ] ')

define(`m4AutoConnex',`define(`m4cx',0)dnl
define(`m4ltn',`substr(`$2',decr(len(`$2')))')dnl
stackexec_(`$2',`m4TAL',
`define(`m4ltn',substr($2,decr(len($2))))dnl
ifelse(ifelse(m4ltn,N,T,m4ltn,X,T),T,
`define(`m4bn',basename_($2))dnl
define(`m4hn',substr(m4bn,2,eval(len(m4bn)-4)))dnl
define(`m4cx',incr(m4cx))dnl
ifdef(`m4LI',
 `Vx: ($1.w.x-(m4nargs-m4cx)*L_unit*2,$2.y)
  Tx: In`'ifelse(m4ltn,N,N)t`'m4hn
  line thick lineth from $2 to Vx \
    then to (Vx,Tx) ifelse($2,m4xpand($3`'m4bn),` then to Tx',`
    dot') ',
 `Tx: In`'ifelse(m4ltn,N,N)t`'m4hn
  line thick lineth from $2 \
    to (Tx,$2) ifelse($2,m4xpand($3`'m4bn),` then to Tx',`
   dot')')
 ')dnl
')')

############################

                             `FlipFlop( D|T|RS|JK, label, boxspec, pinlength )'
define(`FlipFlop',`ifelse(
`$1',D, `FlipFlopX(`$3',`$2',
  : D:PinD;E:CK:PinCK, , :Q:PinQ;:lg_bartxt(Q):PinNQ,,`$4',`$5')',
`$1',T, `FlipFlopX(`$3',`$2',
  : T:PinT;E:CK:PinCK, , :Q:PinQ;:lg_bartxt(Q):PinNQ,,`$4',`$5')',
`$1',RS, `FlipFlopX(`$3',`$2',
  : R:PinR;: S:PinS,    , :Q:PinQ;:lg_bartxt(Q):PinNQ,,`$4',`$5')',
`$1',SR, `FlipFlopX(`$3',`$2',
  : S:PinS;: R:PinR,    , :Q:PinQ;:lg_bartxt(Q):PinNQ,,`$4',`$5')',
`$1',JK, `FlipFlopX(`$3',`$2',
   : J:PinJ;NE:CK:PinCK;: K:PinK, N:CLR:PinCLR,
   :Q:PinQ;:lg_bartxt(Q):PinNQ, N:PR:PinPR,`$4',`$5')',
`FlipFlopX(`$3',`$2', ::Pin;, , :Q:PinQ;:lg_bartxt(Q):PinNQ,,`$4',`$5')')')

                             `FlipFlopX( boxspec, center label,
                                leftpins, toppins, rightpins, bottompins,
                                pinlength)
                              General flipflop. Arg1 modifies the
                              box (labelled Chip) default specification.
                              Each of args 3 to 6 is null or a string of
                              pinspecs separated by semicolons (;).
                              A pinspec is either empty (null) or of the form
                              [pinopts]:[label[:Picname]]. The first colon (:)
                              draws the pin.  Pins are placed top to bottom
                              or left to right along the box edges with null
                              pinspecs counted for placement. Pins are named
                              by side and number by default; eg W1, W2, ...,
                              N1, N2, ..., E1, ..., S1, ... ; however, if
                              :Picname is present in a pinspec then Picname
                              replaces the default name. A pinspec label is text
                              placed at the pin base. Semicolons are not
                              allowed in labels; use eg \char59{} instead.
                              To put a bar over a label, use lg_bartxt(label).
                              The pinopts are [L|M|I|O][N][E]
                                 L=active low out; M=active low in;
                                 I=inward arrow; O=outward arrow;
                                 N=pin with not circle; E=edge trigger
                              Optional arg7 is the length of pins'
define(`FlipFlopX',`[
 Chip: box wid_ FF_wid*L_unit ht_ FF_ht*L_unit `$1'
dnl                           Center label
 ifelse(`$2',,,"ifsvg(`svg_small($2,75)',`\scriptsize $2')" at Chip.c)
 ifelse(`$7',,,`pushdef(`lg_plen',(`$7')/L_unit)')dnl
 ifelse(`$3',,,
  `m4_ffside(`(m4x-0.5)/m4_pc between Chip.nw_ and Chip.sw_',`$3',W,w)')
 ifelse(`$4',,,
  `m4_ffside(`(m4x-0.5)/m4_pc between Chip.nw_ and Chip.ne_',`$4',N,n)')
 ifelse(`$5',,,
  `m4_ffside(`(m4x-0.5)/m4_pc between Chip.ne_ and Chip.se_',`$5',E,e)')
 ifelse(`$6',,,
  `m4_ffside(`(m4x-0.5)/m4_pc between Chip.sw_ and Chip.se_',`$6',S,s)')
 ifelse(`$7',,,`popdef(`lg_plen')')dnl
 `$8' ]')
dnl                          `Stack, count, and draw the pins on the given side'
define(`m4_ffside',
`stacksplit_(`m4pr',`$2',;)define(`m4_pc',0)dnl
 stackexec_(`m4pr',`m4pspec',`define(`m4_pc',incr(m4_pc))')dnl
 for_(1,m4_pc,1,
 `ifinstr(m4pspec,:,
    `m4drawpin(`$1',`$3'm4x,`$4'm4_pattocomma(m4pspec,:))')dnl
  popdef(`m4pspec')')')dnl
define(`m4drawpin',`lg_pin(`$1',`$4',ifelse(`$5',,`$2',`$5'),`$3')')

###########################################################################

divert(0)dnl
