divert(-1)
 
   libgen.m4                    Base macros for dpic and gpic diagrams

* Circuit_macros Version 9.6, copyright (c) 2021 J. D. Aplevich under      *
* the LaTeX Project Public Licence in file Licence.txt. The files of       *
* this distribution may be redistributed or modified provided that this    *
* copyright notice is included and provided that modifications are clearly *
* marked to distinguish them from this distribution.  There is no warranty *
* whatsoever for these files.                                              *

==========================================================================

define(`libgen_')
                                Change gpic to e.g., pgf or pstricks to
                                redefine the default configuration file:

ifdef(`m4picprocessor',,`include(gpic.m4)divert(-1)
define(`m4defaultproc',m4picprocessor)')

==========================================================================

                                HOMELIB_ is the absolute path to the directory
                                containing libgen.m4. Circuit macros do not
                                need it because m4 reads installation files
                                automatically if invoked correctly; this macro
                                allows the path to be passed to the pic
                                processor, e.g., put the following line in the
                                diagram source to read dpictools.pic:
                                  copy "HOMELIB_`'dpictools.pic"
                                or invoke the macro NeedDpicTools.
                                The following definition of HOMELIB_ works for
                                GNU m4 which defines `__file__'; otherwise
                                change the blank in the third line below to the
                                absolute path of the installation directory.
ifdef(`__file__',
`define(`HOMELIB_',patsubst(__file__,libgen\.m4,))',
`define(`HOMELIB_', )')
                                To use the Mingw-compiled version of dpic,
                                change HOMELIB_ to the absolute Windows path of
                                the installation folder, e.g.
dnl define(`HOMELIB_',`D:\Dwight\lib')

                               `NeedDpicTools( path )
                                If path is empty then HOMELIB_ is used
                                e.g. NeedDpicTools or NeedDpicTools(/home/lib/)'
define(`NeedDpicTools',`if "dpictools" != "1" then {
  ifelse(`$1',,`copy "HOMELIB_`'dpictools.pic"',`copy "`$1'dpictools.pic"')
  define(`dfitpoints__') define(`dfitcurve__')}') 

                                Processor shortcuts
define(`ifdpic',`ifelse(m4picprocessor,dpic,`$1',`$2')')
define(`ifgpic',`ifelse(m4picprocessor,gpic,`$1',`$2')')

define(`ifmfpic',`ifelse(m4postprocessor,mfpic,`$1',`$2')')
define(`ifmpost',`ifelse(m4postprocessor,mpost,`$1',`$2')')
define(`ifpdf',`ifelse(m4postprocessor,pdf,`$1',`$2')')
define(`ifpgf',`ifelse(m4postprocessor,pgf,`$1',`$2')')
define(`ifpostscript',`ifelse(m4postprocessor,postscript,`$1',`$2')')
define(`ifpstricks',`ifelse(m4postprocessor,pstricks,`$1',`$2')')
define(`ifsvg',`ifelse(m4postprocessor,svg,`$1',`$2')')
define(`iftpic',`ifelse(m4postprocessor,tpic,`$1',`$2')')
define(`ifxfig',`ifelse(m4postprocessor,xfig,`$1',`$2')')
define(`ifpsfrag',ifelse(ifdef(`psfrag',T,`ifdef(`psfrag_',T)'),T,`$1',`$2'))

                               `iflatex(latextrue,latexfalse)
                                Test for LaTeX text including
                                postscript with psfrag'
define(`iflatex',`ifelse(
 ifpdf(F)`'ifpostscript(`ifpsfrag(,F)')`'ifsvg(F)`'ifxfig(F),F,`$2',`$1')')
==========================================================================

                                Initializations (one of the following must
                                be invoked at the beginning of a diagram):

                                libcct.m4
ifdef(`cct_init',,
`define(`cct_init',
 `m4announceprocessor(`$0')
  ifdef(`libcct_',,`include(libcct.m4)')
  gen_init
  psset_(arrowsize=1.1pt 4,arrowlength=1.64,arrowinset=0)
dnl                             Customizations can be put here or in arg1
`$1'
`# cct'_init end
')')

                                libgen.m4
ifdef(`gen_init',,
`define(`gen_init',
 `m4announceprocessor(`$0')
  ifdef(`libgen_',,`include(libgen.m4)')

  define(`if_rpoint__')`define rpoint__' {
    rp_wid = last line.end.x-last line.start.x
    rp_ht = last line.end.y-last line.start.y
    rp_len = vlength(rp_wid,rp_ht); move to last line.start
ifgpic(`    if (rp_len == 0) then { rp_ang=0 } else {')dnl
    rp_ang = atan2(rp_ht,rp_wid)ifgpic(` }') }

  define(`rtod__',`57.295779513082323')`rtod_' = rtod__;dnl
  define(`dtor__',`0.017453292519943295')`dtor_' = dtor__
  define(`twopi__',`6.2831853071795862')`twopi_' = twopi__;dnl
  define(`pi__',`(twopi_/2)')`pi_' = pi__
  rp_ang = 0; right_
  define(`ctension_',`0.551784')dnl

  ifmpost(`defineRGBprimaries')
  ifpostscript(`defineRGBprimaries
    command " 0.8 setlinewidth"',
  `thicklines_')
  ifpstricks(M4PatchPSTricks)
  ifgpic(linethick = 0.8)
dnl                             Insert customizations as desired,
dnl                             e.g.  ifmpost(`  ...  ')  etc
ifdef(`local_init',`
`# local'_init begin
local_init
`# local'_init end
') `$1' dnl                     Customizations in arg1
`# gen'_init end
')')

                                darrow.m4
ifdef(`darrow_init',,
`define(`darrow_init',
 `m4announceprocessor(`$0')
   ifdef(`darrow_',,`include(darrow.m4)')
   gen_init
`$1'
`# darrow_init end'
')')

                                liblog.m4
ifdef(`log_init',,
`define(`log_init',
 `m4announceprocessor(`$0')
  ifdef(`liblog_',,`include(liblog.m4)')
  gen_init
`$1'
`# log_init end'
')')

                                lib3D.m4
ifdef(`threeD_init',,
`define(`threeD_init',
 `m4announceprocessor(`$0')
  ifdef(`lib3D_',,`include(lib3D.m4)')
  gen_init
  setview(20,20,0)
`$1'
`# threeD_init end'
')')

                                sfg graphs in libcct.m4
define(`sfg_init',`cct_init
  sfg_wid = ifelse(`$1',,`(linewid/0.75*(2.5+0.25)/4)',(`$1'))# default line len
  sfg_rad = ifelse(`$2',,(0.25/4/2),(`$2'))  # node radius
  sfg_aht = ifelse(`$3',,(0.25/4),(`$3'))    # arrow height (arrowhead length)
  sfg_awid = ifelse(`$4',,`sfg_aht',(`$4'))  # arrowhead width
  ')
==========================================================================

                                Pic SI defaults
                                Slightly smaller lengths than for inches
define(`SIdefaults',
`scale = 25.4                   # Coordinates in mm
                                # Set defaults to integer values of mm
 lineht = 12
 linewid = 12
 moveht = 12
 movewid = 12
 arcrad = 6
 circlerad = 6
 boxht = 12
 boxwid = 18
 ellipseht = 12
 ellipsewid = 18
 dashwid = 2
 maxpswid = 8.5*scale
 maxpsht = 11.5*scale
')

                               `Conditionally add mpost code for latex command'
define(`latexcommand',`command "ifmpost(verbatimtex) `$1' ifmpost(etex)"')

define(`m4announceprocessor',`dnl Do not change the format of the next line:
`#' `$1' Version 9.6: ifelse(m4picprocessor,gpic,`Gpic',
  m4postprocessor,pstricks,`PSTricks',
  m4postprocessor,pgf,`TikZ PGF',
  m4postprocessor,mfpic,`Mfpic',
  m4postprocessor,xfig,`Xfig',
  m4postprocessor,svg,`SVG',
  m4postprocessor,postscript,`Postscript',
  m4postprocessor,pdf,`PDF',
  m4postprocessor,mpost,`MetaPost',
  `Default') m4 macro settings.ifelse(m4defaultproc,gpic,`
`#' WARNING: Default m4 configuration file gpic.m4 assumed')')

                                Set environment direction
define(`right_',`define(`m4dir',right)define(`m4rp_ang',0)dnl
define(`m4a_',1)define(`m4b_',0)define(`m4c_',0)define(`m4d_',1) m4dir')

define(`left_',`define(`m4dir',left)define(`m4rp_ang',pi_)dnl
define(`m4a_',(-1))define(`m4b_',0)define(`m4c_',0)define(`m4d_',(-1)) m4dir')

define(`up_',`define(`m4dir',up)define(`m4rp_ang',(pi_/2))dnl
define(`m4a_',0)define(`m4b_',1)define(`m4c_',(-1))define(`m4d_',0) m4dir')

define(`down_',`define(`m4dir',down)define(`m4rp_ang',(-pi_/2))dnl
define(`m4a_',0)define(`m4b_',(-1))define(`m4c_',1)define(`m4d_',0) m4dir')

                               `savem4dir([`stackname'])
                                Save the current m4 direction parameters'
define(`savem4dir',`define(`m4ss_',`ifelse(`$1',,savm4dir`'_,`$1')')
pushdef(m4ss_`'_,m4dir)dnl
pushdef(m4ss_`'_,m4a_)dnl
pushdef(m4ss_`'_,m4b_)dnl
pushdef(m4ss_`'_,m4c_)dnl
pushdef(m4ss_`'_,m4d_)')
                               `restorem4dir([`stackname'])
                                Restore the current m4 direction parameters'
define(`restorem4dir',`define(`m4ss_',`ifelse(`$1',,savm4dir`'_,`$1')')
define(`m4d_',m4xpand(m4ss_`'_))popdef(m4ss_`'_)dnl
define(`m4c_',m4xpand(m4ss_`'_))popdef(m4ss_`'_)dnl
define(`m4b_',m4xpand(m4ss_`'_))popdef(m4ss_`'_)dnl
define(`m4a_',m4xpand(m4ss_`'_))popdef(m4ss_`'_)dnl
define(`m4dir',m4xpand(m4ss_`'_))popdef(m4ss_`'_)')

                                Manhattan direction cosines
define(`manhattan',`dnl
define(`m4a_',`ifelse(m4dir,left,-1,m4dir,up,0,m4dir,down,0,1)')dnl
define(`m4b_',`ifelse(m4dir,left,0,m4dir,up,1,m4dir,down,-1,0)')dnl
define(`m4c_',`neg_(m4b_)')dnl
define(`m4d_',`m4a_')')
                                Default current coordinates
define(`m4tx',Here.x)
define(`m4ty',Here.y)
                                Arbitrary direction cosines
                                `Point_(integer degrees,[D])'
                                `D in the second argument simplifies
                                 output for common angles and is useful
                                 for debug but requires care when
                                 the result is used inside dpic looping'
define(`Point_',`ifinstr(`$2',D,`ifelse(dnl
`$1',0,`rp_ang = 0; right_',
`$1',90,`rp_ang = pi_/2; up_',
`$1',-90,`rp_ang = -pi_/2; down_',
`$1',180,`rp_ang = pi_; left_',
`$1',-180,`rp_ang = pi_; left_',
`$1',270,`rp_ang = -pi_/2; down_',
`$1',-270,`rp_ang = pi_/2; up_',
`rp_ang = prod_(`$1',dtor_);dnl
define(`m4a_',cos(rp_ang))define(`m4b_',sin(rp_ang))dnl
define(`m4c_',(-sin(rp_ang)))define(`m4d_',cos(rp_ang))')',
`rp_ang = prod_(`$1',dtor_);undefine(`m4rp_ang')dnl
define(`m4a_',cos(rp_ang))define(`m4b_',sin(rp_ang))dnl
define(`m4c_',(-sin(rp_ang)))define(`m4d_',cos(rp_ang))')')

                        `setdir_( U|D|L|R|degrees,default R|L|U|D|degrees )
                                 set direction and default direction'
define(`setdir_',
 `pushdef(`m4sdir',`ifelse(`$1',,
   `ifelse(`$2',,`ifdef(`m4rp_ang',m4rp_ang*rtod_,R)',`$2')',`$1')')dnl
  m4sd_ang = rp_ang; pushdef(`m4tdir',m4dir)dnl
ifinstr(
 m4sdir,R,`rp_ang = 0; right_',
 m4sdir,L,`rp_ang = pi_; left_',
 m4sdir,U,`rp_ang = pi_/2; up_',
 m4sdir,D,`rp_ang = -pi_/2; down_',
`rp_ang = prod_(m4sdir,dtor_)undefine(`m4rp_ang')dnl
 define(`m4a_',cos(rp_ang))define(`m4b_',sin(rp_ang))dnl
 define(`m4c_',(-sin(rp_ang)))define(`m4d_',cos(rp_ang))');dnl
 popdef(`m4sdir')')
                                `restore direction'
define(`resetdir_',`m4xpand(m4tdir`'_) popdef(`m4tdir'); point_(m4sd_ang)')

                                `point_(radians)'
define(`point_',
`ifelse(`$1',rp_ang,,`rp_ang = `$1'')undefine(`m4rp_ang')
 define(`m4a_',cos(rp_ang))define(`m4b_',sin(rp_ang))dnl
 define(`m4c_',(-sin(rp_ang)))define(`m4d_',cos(rp_ang))dnl
')
                                `rpoint_( linespec )
                                (Gpic returns NaN for atan2(0,0)):'
define(`rpoint_',`line invis ifelse(`$1',,linewid/10,`$1')
  ifdef(`if_rpoint__',`rpoint__',
   `rp_wid = last line.end.x-last line.start.x
    rp_ht = last line.end.y-last line.start.y
    rp_len = vlength(rp_wid,rp_ht); move to last line.start
    ifgpic(`if (rp_len == 0) then { rp_ang=0 } else { ')dnl
    rp_ang = atan2(rp_ht,rp_wid) ifgpic(` }')')
  point_(rp_ang)' )
                        `direction_( U|D|L|R|degrees,default R|L|U|D|degrees )
                                obsolete but kept for compatibility'
define(`direction_',`setdir_($@)')

                                Evaluate the argument as a macro
define(`m4xpand',`$1')
                               `Enclose dpic position in parentheses 
                                to allow position expressions as arguments'
ifdpic(
`define(`M4Pos',`($1)')',
`define(`M4Pos',`$1')')
                               `Polar to rectangular coords, returning a pair
                                rect_(radius,radians)'
define(`rect_',`vscal_(`$1',cos(`$2'),sin(`$2'))')
                                `Rect_(radius,degrees)'
define(`Rect_',`vscal_(`$1',cosd(`$2'),sind(`$2'))')

                               `Rectangular to polar coords, returning a pair
                                polar_(x,y)'
define(`polar_',`vlength(`$1',`$2'),atan2(`$2',`$1')')
                                `Polar_(x,y)' returns degrees
define(`Polar_',`vlength(`$1',`$2'),rtod_*atan2(`$2',`$1')')

                               `arcr( position, radius,
                                      start radians, end radians,
                                      modifiers, ht)
                                Unique ccw arc. If arg 5 contains -> or <-
                                then a midpoint arrowhead of ht given by arg6
                                is added.  Modifiers following the macro apply
                                to the main arc only. Examples:
             arcr((5,0),0.5,0,pi_/2) 
             arcr((5,0),1,0,pi_/2,dotted outlined "red" -> wid 5bp__ ,4bp__) ->
'
define(`arcr',`define(`M4arcrC',`M4Pos(ifelse(`$1',,Here,`$1'))')dnl
 define(`m4arad',`ifelse(`$2',,arcrad,`$2')')dnl
 define(`m4Sang',`ifelse(`$3',,0,`$3')')dnl
 define(`m4Eang',`ifelse(`$4',,pi_/2,`$4')')dnl
 arc invis from M4arcrC+(rect_(m4arad,m4Sang)) \
             to M4arcrC+(rect_(m4arad,m4Eang)) \
    rad m4arad with .c at M4arcrC
 M4aCtr: last arc.c; M4aStart: last arc.start; M4aEnd: last arc.end
 ifelse(ifinstr(`$5',->,T,`$5',<-,T),T,
 `{ if m4arad == 0 then { m4and = arcrad } else { m4and = m4arad }
   m4aang = ifelse(`$6',,arrowht,`$6')/m4and
   m4ama = (m4Sang+(m4Eang))/2; if `$4' < `$3' then { m4ama = m4ama+pi_ }
   arc `$5' from M4aCtr+(rect_(m4arad,m4ama-m4aang/2)) \
              to M4aCtr+(rect_(m4arad,m4ama+m4aang/2)) rad m4arad \
      with .c at M4aCtr ifelse(`$6',,,ht `$6') }')
  arc patsubst(patsubst(`$5',->,),<-,) \
    from M4aStart to M4aEnd rad m4arad with .c at M4aCtr ')

                               `arcd( position, radius,
                                      start degrees, end degrees,
                                      attributes, ht)
                                Like arcr but with angles in degrees:
                                eg arcd(Here,0.5,0,90) dashed'
define(`arcd',`arcr(`$1',`$2',
 ifelse(`$3',,,(`$3')*dtor_),
 ifelse(`$4',,,(`$4')*dtor_),
 `$5',`$6')')

                               `arca(absolute chord linespec, ccw|cw, radius,
                                     modifiers)
                                Unique acute-angle arc, obtuse if radius is -ve,
                                drawn in a [] block.'
define(`arca',`[Chord: line invis `$1'
  dy = Chord.end.y-Chord.start.y; dx = Chord.end.x-Chord.start.x
  ssq = max(0,dx*dx+dy*dy)
  drad = max(sqrt(ssq)/2,ifelse(`$3',,arcrad,abs(`$3')))
  if ssq==0 then { dfac = 1 } else { dfac = sqrt(max(0,drad^2/ssq-0.25)) }
  ifelse(`$3',,,`dfac = sign(`$3')*dfac;')dnl
  arc `$2' `$4' from Chord.start to Chord.end rad drad \
    with .c at Chord.c ifelse(`$2',cw,-,+)(-dy*dfac,dx*dfac)
  Origin: (0,0) ] with .Origin at (0,0) ')

                               `Integer "for" loop with index variable m4x:
                                for_(initial,final,incr,`actions')
                                eg for_(0,10,2,`print m4x') '
define(`for_',`ifelse(eval(`$1'!=(`$2'+(`$3'))),1,`pushdef(`m4x',`$1') $4
  popdef(`m4x')for_(eval(`$1'+(`$3')),`$2',`$3',`$4')')')

                               `Integer m4 while loop: while_(`test',`actions')
                                eg define(`i',5)
                                  while_(`i>0',`print i; define(`i',decr(i))') '
define(`while_',`ifelse(eval($1),1,`$2`'while_(`$1',`$2')')')

                               `Loopover_(`variable',actions,value1,value2,...)
                                Repeat actions with variable set to each of
                                value1, value2, ... in succession, setting
                                macro m4Lx to 1, 2, ...; e.g.
                                Loopover_(`x',`print "m4Lx. x"',Tom,Dick,Mary)'
define(`Loopover_',`ifelse(`$3',,,
`pushdef(`$1',`$3')pushdef(`m4Lx',ifdef(`m4Lx',`incr(m4Lx)',1)) $2
Loopover_(`$1',`$2',shift(shift(shift($@))))popdef(`m4Lx')popdef(`$1')')')

                               `This is identical to Loopover_ and may be
                                  a preferred name'
                               `foreach_(`variable',actions,value1,value2,...)
                                Repeat actions with variable set to each of
                                value1, value2, ... in succession, setting
                                macro m4Lx to 1, 2, ...; e.g.
                                foreach_(`x',`print "m4Lx. x"',Tom,Dick,Mary)'
define(`foreach_',`ifelse(`$3',,,
`pushdef(`$1',`$3')pushdef(`m4Lx',ifdef(`m4Lx',`incr(m4Lx)',1)) $2
foreach_(`$1',`$2',shift(shift(shift($@))))popdef(`m4Lx')popdef(`$1')')')

                               `Transfer m4 stack to new stack performing arg3
                                 stackexec_(`Source',`Dest',`actions')'
define(`stackexec_',`ifdef(`$1',`$3`'dnl
ifelse(`$2',,,`pushdef(`$2',$1)')popdef(`$1')stackexec_(`$1',`$2',`$3')')')

                              Empty a stack to first blank, executing arg2
define(`stackdo_',`ifdef(`$1',`ifelse(`$1',,`popdef(`$1')',
`$2`'popdef(`$1')stackdo_(`$1',`$2')')')')dnl

                               `Print out m4 stack contents
                                 stackprint_(`Stackname' [,label])'
define(`stackprint_',`print ""
print ifelse(`$2',,"`stack `$1':'","`$2'")
stackexec_(`$1',`m4stp__',`
print ifelse(`$1',,"blank","`$1'")')
stackexec_(`m4stp__',`$1')')

                               `Message to the terminal during m4 execution'
define(`m4msg',`syscmd(echo "$@" >/dev/stderr)')
                               `Dump stack to the terminal during m4 execution'
define(`m4stackmsg',`stackexec_(`$1',`m4Btmp',
`syscmd(echo $1 >/dev/console)')dnl
stackexec_(`m4Btmp',`$1')')

                               `Copy m4 stack
                                 stackcopy_(`Source',`Dest',[`count'])'
define(`stackcopy_',`undefine(`$2')ifelse(`$3',,,`define(`$3',0)')dnl
stackexec_(`$1',`m4C__',`ifelse(`$3',,,`define(`$3',incr($3))')')dnl
stackexec_(`m4C__',`$1',`pushdef(`$2',m4C__)')')

                               `stackreverse_(`Stackname')
                                Reverse m4 stack'
define(`stackreverse_',`stackexec_(`$1',`m4R__')stackexec_(`m4R__',`m4S__')dnl
stackexec_(`m4S__',`$1')')

                               `stacksplit_(`Stackname',string,sep)
                                Stack fields of arg2 separated by nonblank
                                substring (default .) left to right'
define(`stacksplit_',`define(`m4sep',`ifelse(`$3',,.,`$3')')dnl
ifinstr(`$2',m4sep,`pushdef(`$1',substr(`$2',0,index(`$2',m4sep)))dnl
stacksplit_(`$1',substr(`$2',incr(index(`$2',m4sep))),m4sep)',
`pushdef(`$1',`$2')')')

                               `m4Leftstr(str,default) leftmost substring
                                to the left of : (arg2 if blank)'
define(`m4Leftstr',`ifelse(patsubst(`$1',:.*),,`$2',patsubst(`$1',:.*))')
                               `m4Rightstr(str,default) rightmost substring
                                to the right of : (arg2 if blank)'
define(`m4Rightstr',`ifinstr(`$1',:,
 `ifelse(patsubst(`$1',.*:),,`$2',`patsubst(`$1',.*:)')',`$2')')

                               `basename_(path,sep)
                                Extract rightmost name from arg2-separated
                                path, default dot (.)'
define(`basename_',`ifelse(index($1,ifelse(`$2',,.,`$2')),-1,`$1',
`basename_(substr($1,incr(index($1,ifelse(`$2',,.,`$2')))))')')

                               `stackargs_(`Stackname',args)
                                Stack arg2, arg3, ... onto the named stack'
define(`stackargs_',
`ifelse(`$2',,,`pushdef(`$1',`$2')stackargs_(`$1',shift(shift($@)))')')

                               `Intersect_(Name1,Name2)
                                Intersection of named lines' 
define(`Intersect_',`intersect_($1.start,$1.end,$2.start,$2.end)')

                               `intersect_(Start1,End1,Start2,End2)
                                Intersection of lines joining named positions'
define(`intersect_',`((($3.x-$1.x)*($3.y-$4.y)-($3.y-$1.y)*($3.x-$4.x))/\
   (($2.x-$1.x)*($3.y-$4.y)-($2.y-$1.y)*($3.x-$4.x))\
   between `$1' and `$2')')

                               `Dashed line drawn in detail
                                dashline(
                                  linespec,
                                  thickness|<-|->|<->|color,
                                  dash len,
                                  gap len,G)
                                Arg5=G ends (but does not start)
                                  the line with a gap
                                Note: can change default direction'
define(`dashline',`rpoint_(`$1')define(`m4opts',`$2')
  define(`m4dsh',`ifelse(`$3',,dashwid,abs(`$3'))')dnl
  define(`m4gap',`ifelse(`$4',,m4dsh/2,abs(`$4'))')dnl
  define(`m4lar',)define(`m4rar',)dnl
  ifelse(m4xtract(`m4opts',<->),1,`define(`m4lar',<-)define(`m4rar',->)',dnl
    m4xtract(`m4opts',<-),1,`define(`m4lar',<-)',dnl
    m4xtract(`m4opts',->),1,`define(`m4rar',->)')
  if (m4dsh+m4gap)==0 then { dashline_n = 1 } \
  else {dashline_n = max(1,\
    int(abs((rp_len ifelse(`$5',G,,+m4gap))/(m4dsh+m4gap))))}
  dashline_f = (rp_len-(dashline_n ifelse(`$5',G,,-1))*m4gap)/dashline_n
  for m4ti=1 to dashline_n do {
    if m4ti==1 then { line m4opts m4lar to rvec_(dashline_f,0) } \
    else { if m4ti==dashline_n then { line m4opts m4rar to rvec_(dashline_f,0)}\
    else { line m4opts to rvec_(dashline_f,0) }}
    ifelse(`$5',G,,
     `if m4ti < dashline_n then {')move to rvec_(m4gap,0)ifelse(`$5',G,,})
    } ')

                               `round(at location,line thickness,attributes)
                                filled circle for rounded corners'
define(`round',`{ circle thick ifelse(`$2',,`linethick/2',(`$2')/2) \
  diameter ifelse(`$2',,`linethick',`($2)')/2 pt__ \
  ifelse(`$1',,`at Here',`$1') $3} ifelse(`$1',,,`; move to last circle .c')')

                               `corner(line thickness,attributes,turn radians)
                                arg1 default: current thickness
                                arg2: e.g. outlined "string"; if arg2 starts
                                  with at position ... then a manhattan corner
                                  is drawn
                                arg3 default: filled square to make 90
                                  degree angle
                                arg3= radians (turn angle, +ve is ccw)'
define(`corner',`define(`m4lth',`ifelse(`$1',,linethick,`($1)')')dnl
define(`m4lfr',`(m4lth bp__)/lin_leng(last line)/2')dnl
  ifelse(substr(`$2',0,2),at,
   `line m4lth bp__ thick m4lth with .c $2; move to last line.c',
  `{ifelse(`$3',,
   `line thick m4lth from Along_(last line,m4lth bp__/2,R) \
      to 1+m4lfr along_(last line) $2',
   `line thick m4lth from Along_(last line,m4lth bp__/2,R) to Here \
      then to Here+(rect_((m4lth bp__/2),lin_ang(last line)+(`$3'))) $2')}' )')

                               `mitre_(Position1,Position2,Position3,
                                       length,line attributes)
                                eg mitre_(A,B,C) draws angle ABC with legs
                                of length arg4 (default linethick bp__/2)
                                sets Here to Position2'
define(`mitre_',`{[ define(`m4lth2',`ifelse(`$4',,hlth,`$4')')dnl
 M4mA: line invis from `$2' to `$1'
 M4mC: line invis from `$2' to `$3'
 line `$5' from Along_(M4mA,m4lth2) to `$2' then to Along_(M4mC,m4lth2)
 ] with .M4mA.start at `$2'}
 move to `$2'')

                               `Mitre_(Line1,Line2,length,line attributes)
                                eg mitre_(L,M) draws angle with legs
                                of length arg3 (default linethick bp__/2)
                                sets Here to intersection of Line1 and Line2'
define(`Mitre_',
 `M4TpA: `$1'.c
  M4TpB: Intersect_(`$1',`$2')
  M4TpC: `$2'.c
  mitre_(M4TpA,M4TpB,M4TpC,shift(shift($@)))')

                               `Technical drawing centerline:
                                centerline_(linespec, thickness|color,
                                  minimum long dash len, short dash len,
                                  gap len)'
define(`centerline_',`rpoint_(`$1')
  M4start: last line.start
  M4end: last line.end
  define(`m4h',`ifelse(`$3',,linewid,abs(`$3'))')dnl
  define(`m4v',`ifelse(`$4',,dashwid,abs(`$4'))')dnl
  define(`m4w',`ifelse(`$4',,dashwid/2,abs(`$5'))')dnl
  if (m4h+m4v+m4w*2)==0 then { centerline_n = 1 } \
  else { centerline_n = max(1,int(rp_len/(m4h+m4v+m4w*2))) }
  centerline_f = (rp_len-(centerline_n-1)*(m4v+m4w*2))/centerline_n
  for m4ti=1 to centerline_n do {
    line `$2' to rvec_(centerline_f,0)
    if m4ti < centerline_n then {
      move to rvec_(m4w,0)
      line `$2' to rvec_(m4v,0)
      move to rvec_(m4w,0)}
    }
  line invis from M4start to M4end
 ')

                               `m4xtract(str1,str2)
                                Return value 1 if str2 present in str1 else 0,
                                delete str2 from str1'
define(`m4xtract',`define(`m4I',index($1,`$2'))dnl
define(`$1',substr($1,0,m4I)`'substr($1,ifelse(m4I,-1,0,eval(m4I+len($2)))))dnl
ifelse(m4I,-1,0,1)')

                                Generalized attributes and coordinates that work
                                exactly provided the current direction is up,
                                down, left or right.  Macros for elements need
                                only be written once assuming a default
                                direction of right, say.

                                String attributes, default right
define(`above_',`ifelse(m4dir,right,above,m4dir,left,below,m4dir,up,rjust,ljust)')
define(`below_',`ifelse(m4dir,right,below,m4dir,left,above,m4dir,up,ljust,rjust)')
define(`ljust_',`ifelse(m4dir,right,ljust,m4dir,left,rjust,m4dir,up,above,below)')
define(`rjust_',`ifelse(m4dir,right,rjust,m4dir,left,ljust,m4dir,up,below,above)')
                                Dimensions: wid, ht
define(`wid_',`ifelse(m4dir,right,wid,m4dir,left,wid,m4dir,up,ht,ht)')
define(`ht_',`ifelse(m4dir,right,ht,m4dir,left,ht,m4dir,up,wid,wid)')
                                Compass corners
define(`n_',`ifelse(m4dir,right,n,m4dir,left,s,m4dir,up,w,e)')
define(`s_',`ifelse(m4dir,right,s,m4dir,left,t,m4dir,up,r,l)')
define(`w_',`ifelse(m4dir,right,w,m4dir,left,e,m4dir,up,s,n)')
define(`e_',`ifelse(m4dir,right,e,m4dir,left,w,m4dir,up,n,s)')
define(`ne_',`ifelse(m4dir,right,ne,m4dir,left,sw,m4dir,up,nw,se)')
define(`nw_',`ifelse(m4dir,right,nw,m4dir,left,se,m4dir,up,sw,ne)')
define(`sw_',`ifelse(m4dir,right,sw,m4dir,left,ne,m4dir,up,se,nw)')
define(`se_',`ifelse(m4dir,right,se,m4dir,left,nw,m4dir,up,ne,sw)')
define(`loc_',`ifelse(m4dir,right,($1,$2),m4dir,left,($1,$2),($2,$1))')
                                Directions
define(`rt_',`ifelse(m4dir,right,right,m4dir,left,left,m4dir,up,up,down)')
define(`dn_',`ifelse(m4dir,right,down,m4dir,left,up,m4dir,up,right,left)')
define(`lt_',`ifelse(m4dir,right,left,m4dir,left,right,m4dir,up,down,up)')
define(`up__',`ifelse(m4dir,right,up,m4dir,left,down,m4dir,up,left,right)')

                                Binary operations giving simplified readable
                                expressions for obvious cases.
define(`prod_',`ifelse($1,0,0,$1,-0,0,$2,0,0,$2,-0,0,$1,1,`$2',$2,1,`$1',
  $1,-1,`-($2)',$2,-1,`-($1)',`($1)*($2)')')
define(`sum_',`ifelse($1,0,`$2',$1,-0,`$2',$2,0,`$1',$2,-0,`$1',
  index($2,-),0,`$1$2',`($1+$2)')')
define(`diff_',`ifelse($2,0,`$1',$2,-0,`$1',$1,0,`-($2)',$1,-0,`-($2)',
  `($1-($2))')')
                                Like prod_ but parentheses are *not* added
                                to the first argument, which is assumed to be
                                a variable name without minus
define(`Prod_',`ifelse($1,0,0,$1,-0,0,$2,0,0,$2,-0,0,$1,1,`$2',$2,1,`$1',
  $1,-1,`-($2)',$2,-1,`-$1',`$1*($2)')')

                                Unary arithmetic operations (for single terms:
                                              use parentheses when necessary!)
define(`abs_',`ifelse(index($1,-),0,`substr($1,1)',`$1')')
define(`neg_',`ifelse($1,0,0,index($1,-),0,`substr($1,1)',-`$1')')
define(`sign_',`ifelse(index($1,-),0,-,)')

                               `Vector sum: Vsum_(A,B) evaluates to A+B with
                                dpic, A+(B.x,B.y) with gpic'
define(`Vsum_',`ifdpic(`$1'+`$2',
 ``$1'+(`$2'.x,`$2'.y)')')
                               `Vector difference: evaluates to A-(B) with
                                dpic, A-(B.x,B.y) with gpic'
define(`Vdiff_',`ifdpic(`$1'-(`$2'),
 ``$1'-(`$2'.x,`$2'.y)')')
                               `Product of vector and scalar: (V)*(s) with dpic,
                                (V.x*s,V.y*s) with gpic'
define(`Vsprod_',`ifdpic(`ifelse(`$2',0,0,`$2',1,(`$1'),(`$1')*(`$2'))',
 `(prod_(`$1'.x,`$2'),prod_(`$1'.y,`$2'))')')
                               `The x,y coordinate pair of a position'
define(`Vcoords_',`(`$1').x,(`$1').y')
                               `assign3([u],[v],[w],x,y,z); eg
                                assign3(u,v,w,cross3D(x1,y1,z1,x2,y2,z2))
                                assigns u = 4th arg, v = 5th arg, w = 6th arg,
                                for nonblank u, v, or w'
define(`assign3',
`ifelse(`$1',,,`$1' = `$4')
 ifelse(`$2',,,`$2' = `$5')
 ifelse(`$3',,,`$3' = `$6')')
                               `binary_(n,[m])
                                binary representation of n, padded to m bits
                                if arg2 is nonblank'
define(`binary_',`ifelse(`$2',,
   `ifelse(eval(`$1'/2>0),1,`binary_(eval(`$1'/2))')eval(`$1'%2)',
   `ifelse(eval(`$2'>1),1,`binary_(eval(`$1'/2),decr(`$2'))')eval(`$1'%2)')')

                               `hexadecimal_(n,[m])
                                hexadecimal value of n, padded to m hex digits
                                if arg2 is nonblank'
define(`hexadecimal_',`ifelse(`$2',,
   `ifelse(eval(`$1'/16>0),1,
     `hexadecimal_(eval(`$1'/16))')`'hex_digit(eval(`$1'%16))',
   `ifelse(eval(`$2'>1),1,
     `hexadecimal_(eval(`$1'/16),decr(`$2'))')`'hex_digit(eval(`$1'%16))')')

                               `hex_digit(n)
                                hexadecimal digit for 0 <= n <= 15'
define(`hex_digit',`ifelse(eval(`$1'<10),1,`$1',
   `$1',10,A,`$1',11,B,`$1',12,C,`$1',13,D,`$1',14,E,`$1',15,F)')

                                Vector rotation: returns a pair
                                `vrot_(x,y,ct,st)'
define(`vrot_',
  `diff_(prod_($3,$1),prod_($4,$2)),sum_(prod_($4,$1),prod_($3,$2))')
                                `rot_(x,y,t)'
define(`rot_',`vrot_($1,$2,cos($3),sin($3))')
                                `Rot_(X,deg) rotate location by degrees'
define(`Rot_',`vrot_($1.x,$1.y,cosd($2),sind($2))')
                                `rrot_(x,y,t)'
define(`rrot_',`Here+(rot_($1,$2,$3))')

                                Vector scaling: returns a pair
                                `vscal_(scalefactor,x,y)'
define(`vscal_',`prod_($1,$2),prod_($1,$3)')
                                Relative position
define(`rpos_',`Here+`$1'')
                                Absolute and relative vector determined by
                                current direction numbers
define(`vec_',
 `(sum_(prod_($1,m4a_),prod_($2,m4c_)),sum_(prod_($1,m4b_),prod_($2,m4d_)))')
define(`rvec_',`Here+vec_($1,$2)')

                                Sine and cosine of integer degrees with
                                simplified values for special cases
define(`Sin',`ifelse(eval(`$1'<0),1,`neg_(Sin(abs_(eval(`$1'))))',dnl
eval(`$1'>180),1,`Sin(eval(`$1'-360))',dnl
eval(`$1'>90),1,`Sin(eval(180-(`$1')))',dnl
eval(`$1'==90),1,1,eval(`$1'==30),1,0.5,eval(`$1'==0),1,0,sin((`$1')*`dtor_'))')
define(`Cos',`Sin(eval($1+90))')

                                Sine and cosine of arbitrary argument in degrees
define(`sind',`ifelse(`$1',0,0,`$1',90,1,`$1',-90,-1,sin((`$1')*`dtor_'))')
define(`cosd',`ifelse(`$1',0,1,`$1',90,0,`$1',-90, 0,cos((`$1')*`dtor_'))')

                                Constants
define(`dtor_',`ifdef(`dtor__',`dtor`'_',`0.017453292519943295')') Deg to rad
define(`rtod_',`ifdef(`rtod__',`rtod`'_',`57.295779513082323')')   Rad to deg
define(`twopi_',`ifdef(`twopi__',`twopi`'_',`6.2831853071795862')') 2*pi
define(`pi_',`ifdef(`pi__',`pi`'_',`(twopi_/2)')')                 pi
define(`E__',    `2.718281828459045')                              e
define(`log10E_',`0.434294481903252')                             `log10(E__)'

                                Max, min of an arbitrary number of arguments
define(`Max',`ifelse(`$2',,`$1',`max(`$1',Max(shift($@)))')')
define(`Min',`ifelse(`$2',,`$1',`min(`$1',Min(shift($@)))')')

                                Dpic May 2001 or later has these built in
ifgpic(`
define(`abs',`max(`$1',-(`$1'))')
define(`sign',`((`$1')/abs(`$1'))')
define(`floor',`int(`$1')')     `old versions of gpic use the floor function'
define(`Int_',`(sign(`$1')*int(abs(`$1')))')  `corrected int() fn'
define(`loge',`(log(`$1')/log10E_)')
define(`expe',`(exp((`$1')*log10E_))')
define(`tan', `(sin(`$1')/cos(`$1'))')
define(`acos',`atan2(sqrt(1-(`$1')^2),`$1')') `acos(ratio)'
define(`asin',`atan2(`$1',sqrt(1-(`$1')^2))') `asin(ratio)'
define(`pmod',`((((`$1')%(`$2'))+`$2')%(`$2'))') `+ve mod(M,N) eg pmod(-3,5)=2'
',`
define(`Int_',`int(`$1')')
')

define(`ceiling_',`(-floor(-(`$1')))')
define(`round_',`int(`$1'+sign(`$1')/2)')
define(`sqrta',`sqrt(abs(`$1'))')

define(`bp__', `*(scale/72)')    Absolute Adobe point
define(`pt__', `*(scale/72.27)') Absolute TeX point
define(`pc__', `*(12*scale/72.27)') Absolute Pica
define(`in__', `*scale')         Absolute inch
define(`cm__', `*(scale/2.54)')  Absolute cm
define(`mm__', `*(scale/25.4)')  Absolute mm
define(`px__', `*(scale/ifsvg(dpPPI,96))') Absolute pixels
define(`lthick',`(linethick bp__)') Current linethick in drawing units
define(`hlth',`(linethick bp__/2)') Half of current linethick in drawing units

                                `Use with \boxdim to get the dimensions of a
                                 TeX \hbox
                                 boxdim(label, h|w|d|v, default length)'
define(`boxdim',`ifelse(`$2',v,`sum_(boxdim(`$1',h,`$3'),boxdim(`$1',d,0))',
  ifdef(`$1_$2',`$1_$2',ifelse(`$3',,0,`$3')))')

                                `Automatic index generation:
                                 P[m4inx]; P[m4inx] ...  becomes P[1]; P[2] ...
                                 with m4x the final count'
define(`m4inx',`define(`m4x',ifdef(`m4x',`incr(m4x)',1))m4x')

                                `Drawing conveniences:'

                                `PtoL( position, U|D|L|R|deg, lgth )
                                 Generate a linespec from polar
                                 info. Evaluates to `from position to
                                 position+(Rect_(lgth,angle))' with lgth
                                 default dimen_ and angle from arg2'
define(`PtoL',`pushdef(`M4pos',ifelse(`$1',,Here,`$1'))dnl
  ifinstr(ifelse(`$2',,R,`$2'),R,`pushdef(`m4c',1)pushdef(`m4s',0)',
    `$2',U,`pushdef(`m4c',0)pushdef(`m4s',1)',
    `$2',L,`pushdef(`m4c',-1)pushdef(`m4s',0)',
    `$2',D,`pushdef(`m4c',0)pushdef(`m4s',-1)',
    `pushdef(`m4c',`cosd(`$2')')pushdef(`m4s',`sind(`$2')')')dnl
from M4pos to M4pos + (vscal_(ifelse(`$3',,dimen_,`$3'),m4c,m4s))dnl
popdef(`m4s',`m4c',`M4pos')')

                                `ToPos( position, U|D|L|R|deg, lgth )
                                 Generate a linespec from polar
                                 info. Evaluates to `from
                                 position-(Rect_(lgth,angle)) to position'
                                 with lgth default dimen_ and angle from arg2'
define(`ToPos',`pushdef(`M4pos',ifelse(`$1',,Here,`$1'))dnl
  ifinstr(ifelse(`$2',,R,`$2'),R,`pushdef(`m4c',1)pushdef(`m4s',0)',
    `$2',U,`pushdef(`m4c',0)pushdef(`m4s',1)',
    `$2',L,`pushdef(`m4c',-1)pushdef(`m4s',0)',
    `$2',D,`pushdef(`m4c',0)pushdef(`m4s',-1)',
    `pushdef(`m4c',`cosd(`$2')')pushdef(`m4s',`sind(`$2')')')dnl
from M4pos - (vscal_(ifelse(`$3',,dimen_,`$3'),m4c,m4s)) to M4pos dnl
popdef(`m4s',`m4c',`M4pos')')

                                `String conveniences start here:'
                                `xtract(string,substr1,substr2,...)
                                 extract substrings without deletion'
define(`xtract',`ifelse(index(`$1',`$2'),-1,,`$2')`'ifelse(`$3',,,
`xtract(`$1',shift(shift($@)))')')

                               `Test if in string
                                 ifinstr(str,substr,in,str,substr,in,...,notin)'
define(`ifinstr',`ifelse(`$2',,`$1',index(`$1',`$2'),-1,
 `ifinstr(shift(shift(shift($@))))',`$3')')

                                `m4dupstr(string,n,`name')
                                 Concatenate string n>0 times in name
                                 eg m4dupstr(P,4,`X') defines X to be PPPP'
define(`m4dupstr',`define(`$3',)for_(1,ifelse(`$2',,1,`$2'),1,
`define(`$3',$3`$1')dnl')')

                                `m4Delch(string,char)'
                                 Delete the first char (default _) from a string
                                 if the char matches arg2'
define(`m4Delch',
`ifelse(substr(`$1',0,1),ifelse(`$2',,_,`$2'),`substr(`$1',1)',`$1')')

                                `setkey_(string,key,default,[N])
                                 string contains semicolon-separated
                                 terms of the form key=val
                                 If string contains key=val; then
                                 pushdef(`m4key',(val)) otherwise use default.
                                 Nonblank arg4 omits the parentheses.'
define(`setkey_',
 `pushdef(`m4xt',index(`$1',`$2'=))ifelse(m4xt,-1,
   `pushdef(key_prefix`'$2,`ifelse(`$3',,,ifelse(`$4',,(`$3'),`$3'))')',
   `define(`m4sktmp',substr(`$1',eval(m4xt+len(`$2')+1)))dnl m4sktmp used later
    ifelse(index(m4sktmp,;),-1,
     `pushdef(key_prefix`'$2,ifelse(`$4',,(m4sktmp),m4sktmp))',
     `pushdef(key_prefix`'$2,ifelse(`$4',,(substr(m4sktmp,0,index(m4sktmp,;))),
                                  substr(m4sktmp,0,index(m4sktmp,;))))')')dnl
  popdef(`m4xt')')

define(`key_prefix',`m4')       # Could be locally redefined

                                `setkeys_(string,keysequence)
                                 Invoke setkey_ on each of a sequence of terms.
                                 keysequence is a ; -separated sequence
                                 of terms of the form
                                   identifier:default value:N
                                 containing 3 fields separated by : '
define(`setkeys_',`Loopover_(`M4Z',`setkey_(`$1',patsubst(M4Z,:,`,')) dnl',
                             patsubst(`$2',;,`,'))')

                                `String with exact typeset dimensions:
                                 Requires s_init(name), sinclude(filename.dim),
                                 boxdims.sty, and processing twice.  If there
                                 are two or more args they are given to
                                 sprintf(...); e.g. s_box($x^%g_%g$,3,4)'
define(`s_box',
`ifsvg(`ifelse(`$2',,,`sprintf(')"ifelse(index(`$1',"),0,
`substr(`$1',1,eval(len(`$1')-2))',`$1')"ifelse(`$2',,,`,shift($@))')',
`define(`m4_k',ifdef(`m4_k',incr(m4_k),1))dnl
ifelse(`$2',,,`sprintf(')"ifdef(`s_name',,`{\bf !!}')dnl
\boxdims{s_name`'_`'m4_k}{dnl
ifelse(index(`$1',"),0,`substr(`$1',1,eval(len(`$1')-2))',`$1')}dnl
"ifelse(`$2',,,`,shift($@))') \
 wid s_wd(,`textwid') ht s_ht(,`textht')+s_dp')')

define(`text_ang',90)
                                `r_text(text,degrees)
                                 (requires PSTricks, pgf, or svg)'
define(`r_text',`define(`m4txt',
`ifelse(index(`$1',"),0,`substr(`$1',1,eval(len(`$1')-2))',`$1')')dnl
ifelse(ifpstricks(T)`'ifpgf(T)`'ifsvg(T),T,
`define(`m4rtang',`ifelse(`$2',,90,`$2')')dnl
ifsvg(`svg_rot(m4rtang,"m4txt")')dnl
ifpstricks(`"\rput[c]{m4rtang}(0,0){m4txt}"')dnl
ifpgf(`"\pgftext[rotate=m4rtang]{m4txt}"')',"m4txt")')

                                `Like s_box but text is rotated text_ang degrees
                                 (requires PSTricks or pgf)'
define(`rs_box',
`define(`m4_k',ifdef(`m4_k',incr(m4_k),1))dnl
ifelse(`$2',,,`sprintf(')"ifdef(`s_name',,`{\bf !!}')dnl
\defboxdim{s_name`'_`'m4_k}{dnl
ifelse(index(`$1',"),0,`substr(`$1',1,eval(len(`$1')-2))',`$1')}dnl
ifpstricks(`\rput[c]{text_ang}(0,0)')ifpgf(`\pgftext[rotate=text_ang]'){dnl
ifelse(index(`$1',"),0,`substr(`$1',1,eval(len(`$1')-2))',`$1')}"dnl
ifelse(`$2',,,`,shift($@),shift($@))') \
 wid s_wd(,textwid)*cosd(text_ang) + (s_ht(,textht)+s_dp)*sind(text_ang) \
 ht (s_ht(,textht)+s_dp)*cosd(text_ang)+s_wd(,textwid)*sind(text_ang)')

                                `Initialize string index: s_init(name)'
define(`s_init',`define(`s_name',`$1')')

                                `Dimensions of the most recent s_box
                                 (or corresponding to the first argument)'
define(`s_ht',`boxdim(ifelse(`$1',,`s_name`'_`'m4_k',`$1'),h,`$2')')
define(`s_wd',`boxdim(ifelse(`$1',,`s_name`'_`'m4_k',`$1'),w,`$2')')
define(`s_dp',`boxdim(ifelse(`$1',,`s_name`'_`'m4_k',`$1'),d,`$2')')

                                `f_box( boxspec, labelargs ) Evaluates to
                                 box boxspec s_box(labelargs)
                                 or, if there is only one argument, to
                                 box invis fill_(1) s_box(arg1)
                                 Like s_box but overlays text on a box
                                 specified by the first argument, eg
                                 f_box( invis fill_(0.9), labelargs)'
define(`f_box',`box ifelse(`$2',,
 `invis fill_(1) s_box($1)',
 `$1 s_box(shift($@))')')

                                `dot(at location,radius,fill)'
define(`dotrad_',(0.02*scale))
define(`dot',`[define(`m4ft',`ifelse(`$3',,0,(`$3'))')dnl
  ifgpic(`circle rad ifelse(`$2',,`dotrad_',`$2') fill_(m4ft)',
  `ifdef(`r_',`rgbfill(r_+(1-r_)*m4ft, g_+(1-g_)*m4ft, b_+(1-b_)*m4ft,
    circle rad ifelse(`$2',,`dotrad_',`$2'))',
   `circle rad ifelse(`$2',,`dotrad_',`$2') fill_(m4ft)')') dnl
  `$4'] with .c ifelse(`$1',,`at Here',`$1')
  move to last [].c')
                                `cross(at location,size); assumes that a
                                 cross always has manhattan directions'
define(`crosswd_',`ifelse(`$2',,`(0.05*scale)',`($2)')')
define(`cross',`[{line from Here+(0,neg_(crosswd_)) to Here+(0,crosswd_)}
                  line from Here+(neg_(crosswd_),0) to Here+(crosswd_,0)
  `$3'] with .c ifelse(`$1',,`at Here',`$1'); move to last [].c')

                                `boxcoord(name,xfraction,yfraction)
                                 internal position in a named planar object'
define(`boxcoord',
  `(`$2' between `$1'.w and `$1'.e,`$3' between `$1'.s and `$1'.n)')

                                `shadebox(box boxspec,shadewid)' Shaded box
define(`shadebox',` $1
  m4t1 = linethick
  define(`m4h',`ifelse(`$2',,m4t1*5/4,`($2)')')dnl
  define(`m4v',`(m4h+m4t1)/2 bp__')dnl
  {line thickness m4h outlined "gray" from last box.sw+(m4v,neg_(m4v)) \
    to last box.se+(m4v,neg_(m4v)) then to last box.ne+(m4v,neg_(m4v))}
  {move to last box.se+(m4v,neg_(m4v))+(m4h/2 bp__,neg_(m4h)/2 bp__)}
  ')

                               `hatchbox(boxspec,hashsep,hatchspec,ang)'
                               `manhattan box with hatching at ang degrees'
define(`hatchbox',`[ a = pmod((ifelse(`$4',,45,`$4')+90),180)-90
  if a >=0 then { B: box invis `$1' with .nw at (0,0) } \
  else { B: box invis `$1' with .sw at (0,0) }
  ds = ifelse(`$2',,0.075*scale,`$2')
  ifelse(`$3',,`thicktemp = linethick; thinlines_')
  ca = cosd(a); sa = sind(a)
  if abs(a) < 0.1 then { for y = ds to B.ht by ds do {
    line from B.nw-(0,y) to B.ne-(0,y) } } \
  else { if abs(a-90) < 0.1 then { for x = ds to B.wid by ds do {
    line from B.nw+(x,0) to B.sw+(x,0) } } \
  else { d = min(B.wid,B.ht)/5
    if a>=0 then { T: B.nw
      for lp=1 to 0 by -1 do { T: T+(ds*sa,-ds*ca); Q: T+(ca*d,sa*d)
        S: (0,intersect_(T,Q,B.nw,B.sw).y)
        if (-S.y) > B.ht then { S: (intersect_(T,Q,B.sw,B.se).x,-B.ht) }
        F: (intersect_(T,S,B.nw,B.ne).x,0)
        if F.x > B.wid then { F: (B.wid,intersect_(T,S,B.ne,B.se).y) }
        lp=((-F.y)<=B.ht && F.x<=B.wid)
        # Use this with dpic-2017.08.24 or later:
#       if lp then { line from S to F `$3' }
        line from S*lp to F*lp `$3'
        }
    } else { T: B.sw
      for lp=1 to 0 by -1 do { T: T+(-ds*sa,ds*ca); Q: T+(-ca*d,-sa*d)
        S: intersect_(T,Q,B.nw,B.sw)
        if S.y > B.ht then { S: (intersect_(T,Q,B.nw,B.ne).x,B.ht) }
        F: intersect_(T,S,B.sw,B.se)
        if F.x > B.wid then { F: (B.wid,intersect_(T,S,B.ne,B.se).y) }
        lp=(F.y<=B.ht && F.x<=B.wid)
        # Use this with dpic-2017.08.24 or later:
#       if lp then { line from S to F `$3' }
        line from S*lp to F*lp `$3'
        }
      } } }
  ifelse(`$3',,`linethick_(thicktemp)')
  box wid B.wid ht B.ht at B `$1'
  `$5' ]' )

                                `lbox(wid,ht,type)
                                 box oriented in current direction;
                                 arg3= eg dotted'
define(`lbox',`pushdef(`m4bwd',ifelse(`$1',,boxwid,(`$1')))dnl
  pushdef(`m4bht',ifelse(`$2',,boxht,(`$2')))dnl
  line from rvec_(m4bwd,0) \
    to rvec_(m4bwd,m4bht/2) \
    then to rvec_(0,m4bht/2) \
    then to rvec_(0,neg_(m4bht)/2) \
    then to rvec_(m4bwd,neg_(m4bht)/2) \
    then to rvec_(m4bwd,0) `$3' dnl
    popdef(`m4bwd')popdef(`m4bht') ')

                                `rotbox(wid,ht,type,[r=val|t=val])
                                 box oriented in current direction in [] block;
                                 wd and ht are distances between line centers.
                                 type= eg dotted shaded "green"
                                 if arg4 is r=val then the corner radius is val
                                 if arg4 is t=val then a "superellipse"
                                 is drawn using a spline of tension val
                                 (dpic only),
                                 e.g. Point_(30); rotbox(,,dashed,t=0.8)
                                 If a spline is used, the bounding box is
                                 approximate'
define(`rotbox',`[
  pushdef(`m4bw2',ifelse(`$1',,(boxwid/2),`(($1)/2)'))dnl
  pushdef(`m4bh2',ifelse(`$2',,(boxht/2) ,`(($2)/2)'))dnl
  C: Here
  N: vec_(0, m4bh2)
  S: vec_(0,-m4bh2)
  E: vec_( m4bw2,0)
  W: vec_(-m4bw2,0)
  ifinstr(`$4',`r=',
   `setkey_(`$4',r,0)dnl
    brad = Min(m4r,m4bh2,m4bw2)
    sectors = 9
    C[0]: (m4bw2-brad,m4bh2-brad)
    C[1]: (-m4bw2+brad,m4bh2-brad)
    C[2]: (-m4bw2+brad,-m4bh2+brad)
    C[3]: (m4bw2-brad,-m4bh2+brad)
    for j=0 to 3 do {
      for i=0 to sectors do { T: C[j]+(Rect_(brad,j*90+i*90/sectors))
        P[i]: vec_(T.x,T.y) }
        fitpoints(P,sectors,0,Pf,j*(sectors+1)) }
    spline ctension_ `$3' from Pf[0] to Pf[1]
    for i=2 to 4*(sectors+1)-1 do { continue to Pf[i] }
    continue to Pf[0]
',
 `$4',`t=',
   `setkey_(`$4',t,0)dnl
    spline ifdpic(m4t) from E to vec_(m4bw2,m4bh2) \
      then to vec_(-m4bw2,m4bh2) \
      then to ifgpic(W `$3'; spline to) vec_(-m4bw2,-m4bh2) \
      then to vec_( m4bw2,-m4bh2) \
      then to E `$3' ',
 `NE: vec_( m4bw2,m4bh2)
  SE: vec_( m4bw2,-m4bh2)
  NW: vec_(-m4bw2,m4bh2)
  SW: vec_(-m4bw2,-m4bh2)
  Line: line from E to NE then to NW then to SW then to SE then to E `$3' ') dnl
  popdef(`m4bw2')popdef(`m4bh2') `$5' ]')

                                `rotellipse(wid,ht,type)
                                 ellipse oriented in current direction and
                                 enclosed in a [] block, e.g.
                                 Point_(45); rotellipse(,,dotted fill_(0.9))'
define(`rotellipse',
 `[define(`m4ehw',(ifelse(`$1',,ellipsewid,`($1)')/2))dnl
  define(`m4ehh',(ifelse(`$2',,ellipseht,`($2)')/2))dnl
  N: vec_(0,m4ehh); E: vec_(m4ehw,0); S: vec_(0,-m4ehh); W: vec_(-m4ehw,0)
  C: (0,0)
  spline ifdpic(
   `ctension_ from S to vec_(m4ehw,-m4ehh) \
      then to vec_(m4ehw,m4ehh) then to vec_(-m4ehw,m4ehh) \
      then to vec_(-m4ehw,-m4ehh) then to S',
   `from S to vec_(m4ehw/64,-m4ehh) \
      for_(1,31,1,
       `then to vec_(m4ehw*sin(twopi_*m4x/32),-m4ehh*cos(twopi_*m4x/32))\')\
      then to vec_(-m4ehw/64,-m4ehh) then to S') \
    `$3'] wid 2*sqrt((m4a_*m4ehw)^2+(m4b_*m4ehh)^2) \
      ht  2*sqrt((m4c_*m4ehw)^2+(m4d_*m4ehh)^2)')

                               `ellipsearc(wid,ht,startrads,endrads,
                                  rotangle,cw|ccw,linetype)
                                e.g. ellipsearc(2,1,0,pi_,pi_/4,,dashed)
                                arg5 is the angle of the wid axis
                                Internal locations Start, End, C'
define(`ellipsearc',`[ C: (0,0)
 a_earc = ifelse(`$1',,ellipsewid,`($1)')/2
 b_earc = ifelse(`$2',,ellipseht,`($2)')/2
 sa_earc = ifelse(`$3',,0,`$3')
 ea_earc = ifelse(`$4',,pi_/2,`$4')
 define(`m4ca',`ifelse(`$5',,1,cos(`$5'))')dnl
 define(`m4sa',`ifelse(`$5',,0,sin(`$5'))')dnl
 ifinstr(`$6',ccw,`define(`m4cw',ccw)',
  `ifinstr(`$6',cw,`define(`m4cw',cw)',`define(`m4cw',ccw)')')
 ifelse(m4cw,ccw,
  `if ea_earc < sa_earc then { ea_earc += twopi_ }',
  `if ea_earc > sa_earc then { ea_earc -= twopi_ }')
 n = max(4,floor(abs((ea_earc-sa_earc)/(10*dtor_)))+1)
 for i=0 to n do { aa = sa_earc+i/n*(ea_earc-sa_earc)
   P[i]: (vrot_(a_earc*cos(aa),b_earc*sin(aa),m4ca,m4sa)) }
 Start: P[0]
 End: P[n]
 fitcurve(P,n,`$7') ]')
				Small space for string justification
#efine(`sp_',`ifgpic(`')iflatex(`')')
define(`sp_',`ifgpic(`$~~$')')

                               `Select arg 1 if it begins with " or sprintf,
                                else arg 2'
define(`m4lstring',`ifelse(
 index(`$1',"),0,`$1',index(`$1',sprintf),0,`$1',`$2')')

                       `Dimensioning for diagrams:
                        dimension_(linespec, vert offset, label,
                                   D|H|W|blank width, tic offset, <-|->)
                        If arg 3 is s_box(...) or rs_box(...)
                        and arg4=D|H|W then arg4 means:
                           D: blank width is the diagonal length of arg3
                           H: blank width is height of arg3 + textoffset*2
                           W: blank width is width of arg3 + textoffset*2
                        otherwise: arg4 is absolute blank width
                        If arg 3 begins with [ it is copied verbatim '
define(`dimension_',`rpoint_(`$1') ; {
  define(`m4g',ifelse(`$4',,0,
   `$4',W,(s_wd + ifdpic(textoffset,`2 bp__')*2),
   `$4',H,(s_ht + s_dp + ifdpic(textoffset,`2 bp__')*2),
   `$4',D,vlength(s_wd,s_ht),`($4)'))dnl
  define(`m4h',`(rp_len ifelse((`$4'),(),,neg_(m4g)))')dnl
  ifelse((`$2'),(),,`if (`$2') != 0 then {
     m4toff = sign(`$2')*ifelse(`$5',,`3.6bp__',(`$5'))
     {move to rvec_(0,     m4toff)
    S_dimen_: line to rvec_(0,`$2')}
     {move to rvec_(rp_len,m4toff)
    E_dimen_: line to rvec_(0,`$2')}
     move to rvec_(0,`$2')
    AS_C: rvec_(rp_len/2,0) }')
  if m4h > 2*arrowht then {
      { AS_dimen_: line ifelse(`$6',,<-,index($6,<),0,<-) to rvec_(m4h/2,0)
        ifelse((`$4'),(),,`move to rvec_(m4g,0)')
        AE_dimen_: line ifelse(`$6',,->,eval(index($6,>)>0),1,->) \
          to rvec_(m4h/2,0) }
    } else {
      { AS_dimen_: arrow from rvec_(-arrowht*1.5,0) to Here
        AE_dimen_: arrow from rvec_(rp_len+arrowht*1.5,0) to rvec_(rp_len,0) }
    }
  ifelse(`$3',,,
    index(`$3',[),0,``$3' at rvec_(rp_len/2,0)',
    `m4lstring(`$3',"`$3'") at rvec_(rp_len/2,0)')
  }')
                       `Dimensioning for arcs:
                        arcdimension_(arcspec, outward radial offset, label,
                                   D|H|W|blank width, tic offset, <-|->)
                        Like dimension_ but arg1 defines the arc to be
                        dimensioned as "arc invis $1" and arg2 is the
                        outward radial distance, possibly negative, of the
                        dimensioning arrow. If arg 3 is s_box(...)
                        or rs_box(...) and arg4=D|H|W then arg4 means:
                           D: blank width is the diagonal length of arg3
                           H: blank width is height of arg3 + textoffset*2
                           W: blank width is width of arg3 + textoffset*2
                        otherwise: arg4 is absolute blank width '
define(`arcdimension_',`arc invis `$1' ; {
  M4ArcC: last arc.c
  m4Arcr = last arc.rad
  m4sang = atan2(last arc.start.y-M4ArcC.y,last arc.start.x-M4ArcC.x)
  m4eang = atan2(last arc.end.y-M4ArcC.y,last arc.end.x-M4ArcC.x)
  m4hang = (m4sang+m4eang)/2
  m4voff = ifelse(`$2',,0,`$2')
  m4hr = m4Arcr+m4voff
  define(`m4g',`ifelse(`$4',,0,
   `$4',W,(s_wd + ifdpic(textoffset,`2 bp__')*2),
   `$4',H,(s_ht + s_dp + ifdpic(textoffset,`2 bp__')*2),
   `$4',D,vlength(s_wd,s_ht),
          `($4)')')dnl
  m4ah = abs((m4eang-m4sang)*m4Arcr) ifelse(`$4',,,neg_(m4g))
  if m4voff != 0 then {
    m4toff = sign(m4voff)*ifelse(`$5',,`3.6bp__',(`$5'))
    { line from M4ArcC+(rect_(m4Arcr+m4toff,m4sang)) \
        to M4ArcC+(rect_(m4hr+m4toff,m4sang)) }
    { line from M4ArcC+(rect_(m4Arcr+m4toff,m4eang)) \
        to M4ArcC+(rect_(m4hr+m4toff,m4eang)) } }
  if m4ah > 2*arrowht then {
    define(`m4cw',`ifinstr(patsubst(|`$1'|,` ',|),|cw|,cw)')
    m4gang = ifelse(m4cw,,-)atan2(m4g/2,m4Arcr)
    { arc m4cw ifelse(`$6',,<-,index(`$6',<),0,<-) \
        from M4ArcC+(rect_(m4hr,m4sang)) \
        to   M4ArcC+(rect_(m4hr,m4hang+m4gang)) rad m4hr with .c at M4ArcC
      arc m4cw ifelse(`$6',,->,eval(index(`$6',>)>0),1,->) \
        from M4ArcC+(rect_(m4hr,m4hang-m4gang)) \
        to M4ArcC+(rect_(m4hr,m4eang)) rad m4hr with .c at M4ArcC }
    } else {
      m4aht = ifelse(m4cw,,-)atan2(arrowht*1.5,m4Arcr)
      { arc -> m4cw from M4ArcC+(rect_(m4hr,m4sang+m4aht)) \
          to M4ArcC+(rect_(m4hr,m4sang)) rad m4hr with .c at M4ArcC
        arc -> ifelse(m4cw,,cw) from M4ArcC+(rect_(m4hr,m4eang-m4aht)) \
          to M4ArcC+(rect_(m4hr,m4eang)) rad m4hr with .c at M4ArcC } }
  ifelse(`$3',,,`m4lstring(`$3',"`$3'") at M4ArcC+(rect_(m4hr,m4hang))')
  }')
                                `shade(gray value,closed line specs)
                                 Fill an arbitray closed curve with a gray value
                                 0=black, 1=white,
                                 (requires gpic, pstricks, or postscript out)'
define(`shade',`beginshade(`$1')
  `$2'
  endshade')

# Graduated shading is probably best done using the built-in functions
# of PSTricks or the somewhat equivalent tikz capabilities. Other
# postprocessors do not have the same functionality so the following
# demonstrates how it can be done in the pic language with m4 macros.
#
#                              `ShadedPolygon(vertexseq,line attributes,
#                                 sweep angle (degrees),colorseq)
#                               arg1 is a colon (:)-separated sequence of
#                               positions or position names, the vertices in
#                               order (cw or ccw) of the polygon.  Colored
#                               shade lines are drawn perpendicular to the
#                               sweep angle.  A colorseq is of the form
#                                     0,r0,g0,b0,
#                                 frac1,r1,g1,b1,
#                                 frac2,r2,g2,b2,
#                                 ...
#                                     1,rn,gn,bn'
#`e.g. ShadedPolygon((0,0):(0,1):(2,1):(2,0),,0, 0,1,1,1, 1,1,0,0)'
#
define(`ShadedPolygon',`[ Origin: Here
define ShadedPline { 
  if $`'1 > d[pL] then { qL = pL; pL = qL + 1; if pL > nverts then {pL = 1}
    dL = d[pL]-d[qL] }
  if $`'1 > d[pR] then { qR = pR; pR = qR - 1; if pR < 1 then {pR = nverts}
    dR = d[pR]-d[qR] }
  if (dL != 0) && (dR != 0) then {
    M4L: ($`'1-d[qL])/dL between V[qL] and V[pL]
    M4R: ($`'1-d[qR])/dR between V[qR] and V[pR]
    line outlined rgbstring($`'2,$`'3,$`'4) from M4L to M4R }
    }
  m4shadedpverts(V,1,patsubst(patsubst(`$1',`,',|),:,`,'))
  nverts = m4vx
  T: (Rect_(1,`$3'))
  p0 = 1; d[1] = T.x*V[1].x + T.y*V[1].y
  pm = 1
  for i=2 to nverts do { d[i] = T.x*V[i].x + T.y*V[i].y
    if d[i] < d[p0] then { p0 = i }
    if d[i] > d[pm] then { pm = i } }
  d0 = d[p0]; dmx = d[pm]-d0
  for i=1 to nverts do { d[i] = (d[i]-d0)/dmx }
  qL = p0; pL = qL + 1; if pL > nverts then { pL = 1 }; dL = d[pL]-d[qL]
  qR = p0; pR = qR - 1; if pR < 1 then { pR = nverts }; dR = d[pR]-d[qR]
  nlines = int(1.5*dmx/lthick)
  NeedDpicTools
  ShadeObject(ShadedPline,nlines,shift(shift(shift($@)))) \
    with .Origin at Origin
  Midpt: 0.5 between V[1] and V[nverts]
  line `$2' \
    from Midpt to for_(1,m4vx,1,`V[m4x] then to\') Midpt
  Start: V[p0]; End: V[pm] 
 ]')
define(`m4shadedpverts',`
ifelse($3,,,`$1[$2]: patsubst(`$3',|,`,') define(`m4vx',$2)
m4shadedpverts(`$1',incr(`$2'),shift(shift(shift($@))))')')

define(`color255',`int((`$1')*255+0.5),int((`$2')*255+0.5),int((`$3')*255+0.5)')

                                `like shade(,) but without the argument:
                                 beginshade(gray value)
                                   closed line specs
                                 endshade'
define(`beginshade',`define(`m4_shade',`ifelse(`$1',,`fillval',`($1)')')dnl
  ifelse(m4picprocessor,gpic,
   `command sprintf("`\special{sh %g}'",1-m4_shade)',
  m4postprocessor,mfpic,
   `ifelse(`$1',0,
    `command "\gfill\draw\lclosed"',
    `if (m4_shade<0.99) then {
      command sprintf(`"\shade[%gpt]\draw\lclosed"',expe((m4_shade-0.3)*2))}')',
  m4postprocessor,mpost,
   `command "def Y="',
  m4postprocessor,svg,
   `command sprintf(`"<g fill=\"rgb(%g,%g,%g)\">"',\
      color255(m4_shade,m4_shade,m4_shade) )',
  m4postprocessor,pgf,
   `command "\global\let\dpicshdraw=\dpicdraw\global\def\dpicdraw{}"
    command "\global\def\dpicstop{--}"
    command sprintf(`"\dpicshdraw[fill=white!%g!black]"',m4_shade*100)',
  m4postprocessor,pstricks,
   `command sprintf(`"\newgray{m4fillv}{%g}"',m4_shade)
    command sprintf(`"\pscustom[fillstyle=solid,fillcolor=m4fillv]{%%"')',
  m4postprocessor,postscript,
   `command `"/endstroke {}def /npath {}def newpath"'')dnl
')')

define(`endshade',
 `ifelse(m4postprocessor,pstricks,
   `command "}%"',
  m4postprocessor,postscript,
   `command sprintf(`" gsave %g setgray fill grestore"',m4_shade)
    command `"/endstroke {ostroke} def /npath {newpath} def endstroke"'',
  m4postprocessor,pgf,
   `command "cycle; \global\let\dpicdraw=\dpicshdraw\global\def\dpicstop{;}"',
  m4postprocessor,svg,
   `command "</g>"',
  m4postprocessor,mpost,
   `command "enddef; def drw= enddef; def X=--enddef;"
    command sprintf(`"fill Y cycle withcolor %gwhite;"',m4_shade)
    command "def drw=draw enddef; def X=;enddef; Y;"dnl
')')
                                `gshade(gray value,A,B,...,Z,A,B) (Note last
                                 two arguments).  Shade a polygon with named
                                 vertices, attempting to avoid sharp corners.'
define(`gshade',`m4tmp = linethick; linethick = 0
  shade(`$1',line from 0.5 between `$2' and `$3' \
  to gpolyline(.004,shift($@)) \
  then to 0.5 between `$2' and `$3')
  linethick = m4tmp')
define(`gpolyline',`1-(`$1') between `$2' and `$3' \
  then to `$1' between `$3' and `$4' ifelse(`$5',,,`\
  then to gpolyline(`$1',shift(shift($@)))')')

                                `m4fshade(gray value,closed curve) internal'
ifelse(m4picprocessor,gpic,
 `define`m4fshade',`shade(ifelse(`$1',,0,`$1'),`$2')')',
m4postprocessor,xfig,
 `define(`m4fshade',``$2' fill ifelse(`$1',,0,`$1')')',
 `define(`m4fshade',``$2' dnl
   ifdef(`r_',`shaded rgbstring(r_,g_,b_)',`fill ifelse(`$1',,0,`$1')')')')

ifelse(0,1,`
ifelse(m4picprocessor,gpic,
 `define`m4fshade',`shade(ifelse(`$1',,0,`$1'),`$2')')',
m4postprocessor,xfig,
 `define(`m4fshade',``$2' fill ifelse(`$1',,0,`$1')')',
m4postprocessor,pdf,
 `define(`m4fshade',``$2' dnl
   ifdef(`r_',`shaded(r_,g_,b_)',`fill ifelse(`$1',,0,`$1')')')',
m4postprocessor,svg,
 `define(`m4fshade',
  `ifdef(`r_',`rgbfill(color255(r_,g_,b_),`$2')',
               `shade(ifelse(`$1',,0,`$1'),`$2')')')',
`define(`m4fshade',
 `ifdef(`r_',`rgbfill(r_,g_,b_,`$2')',
             `shade(ifelse(`$1',,0,`$1'),`$2')')')')
')

                                `open_arrow(linespec, ht, wid, head attribs)
                                 arrow with outlined head'
define(`open_arrow',`arrow invis `$1'
  m4oatx = Here.x - last arrow.start.x; m4oaty = Here.y - last arrow.start.y
  m4oatr = (ifelse(`$3',,arrowwid,`$3'))/vlength(m4oatx,m4oaty)/2
  line from last arrow.start to Here chop 0 chop ifelse(`$2',,arrowht,`$2')
  line from last arrow.end to Here+(-m4oaty*m4oatr,m4oatx*m4oatr) \
    then to Here-(-m4oaty*m4oatr,m4oatx*m4oatr) \
    then to last arrow.end `$4'')

                                `elchop(E,A) chop for ellipses
                                 evaluates to "chop r" where r is the distance
                                 from the centre of ellipse E to the
                                 intersection of E with a line from E.c to A'
                                `e.g., E:ellipse at (0,0); A:(1,2)
                                 line from A to E chop 0 elchop(E,A)'
define(`elchop',`chop 0.5 * `$1'.wid * `$1'.ht * sqrt(\
        ((`$2'.x-`$1'.x)^2 + (`$2'.y-`$1'.y)^2) /\
        ( ((`$2'.x-`$1'.x)*`$1'.ht)^2 + ((`$2'.y-`$1'.y)*`$1'.wid)^2 ) ) ')

                                `vlength(x,y) 2-D vector length'
define(`vlength',`sqrt(abs((`$1')^2+(`$2')^2))')

                                `distance(Pos1,Pos2)' distance between positions
define(`distance',
 `vlength(M4Pos(`$1').x-M4Pos(`$2').x,M4Pos(`$1').y-M4Pos(`$2').y)')

                                `lin_leng(linear object)' calculates length
define(`lin_leng',`distance(`$1'.start,`$1'.end)')
                                `lin_ang(linear object)' calculates angle
define(`lin_ang',
 `atan2(`$1'.end.y-`$1'.start.y,`$1'.end.x-`$1'.start.x)')

                                `inner_prod(linear obj,linear obj)'
define(`inner_prod',`(sum_(dnl
  prod_(`$1'.end.x-`$1'.start.x,`$2'.end.x-`$2'.start.x),dnl
  prod_(`$1'.end.y-`$1'.start.y,`$2'.end.y-`$2'.start.y)))')

                                `vperp(linear object, length, [R] )
                                 Vector pair CCW (CW if arg3=R)
                                 perpendicular to linear object. The result
                                 has length
                                   1 if arg2 is blank
                                   of arg1 if arg2 is `0'
                                   arg2 otherwise'
define(`vperp',
`define(`m4pdx',`(`$1'.end.x-`$1'.start.x)')dnl
 define(`m4pdy',`(`$1'.end.y-`$1'.start.y)')dnl
 define(`m4pdl',`ifelse(`$2',,`/vlength(m4pdx,m4pdy)',`$2',0,,
  `*(`$2')/vlength(m4pdx,m4pdy)')')dnl
 ifinstr(`$3',R,
  `(m4pdy`'m4pdl),(-m4pdx`'m4pdl)',`(-m4pdy`'m4pdl),(m4pdx`'m4pdl)')')

                                `Vperp(Pos1,Pos2, length, [R])
                                 Vector pair CCW (CW if arg4=R)
                                 perpendicular to line joining two named
                                 positions.  The result has length
                                   1 if arg3 is blank
                                   distance arg1 to arg2 if arg3 is `0'
                                   arg3 otherwise'
define(`Vperp',
 `define(`m4pdx',`(`$2'.x-`$1'.x)')dnl
  define(`m4pdy',`(`$2'.y-`$1'.y)')dnl
  define(`m4pdl',`ifelse(`$3',,`/vlength(m4pdx,m4pdy)',`$3',0,,
   `*(`$3')/vlength(m4pdx,m4pdy)')')dnl
 ifinstr(`$4',R,
  `(m4pdy`'m4pdl),(-m4pdx`'m4pdl)',`(-m4pdy`'m4pdl),(m4pdx`'m4pdl)')')

                                `Equidist3(Pos1,Pos2,Pos3,Result,distance)
                                 Result is the name of the point equidistant
                                 from named Pos1, Pos2, Pos3
                                 arg4 nonblank: the common distance
                                 eg Equidist3(A,B,C,D)
                                    arc from A to C with .c at D'
define(`Equidist3',`
  M4tmp_P1: 0.5 between `$1' and `$2'
  M4tmp_T1: M4tmp_P1+(Vperp(`$1',`$2'))
  M4tmp_P2: 0.5 between `$2' and `$3'
  M4tmp_T2: M4tmp_P2+(Vperp(`$2',`$3'))
  `$4': intersect_(M4tmp_P1,M4tmp_T1,M4tmp_P2,M4tmp_T2)
  ifelse(`$5',,,`$5 = distance(`$4',`$1');') ')

                                `Cintersect(Pos1,rad1,Pos2,rad2,[R])
                                 Upper (lower if arg5=R) intersection of
                                 circles at Pos1 and Pos2, radius rad1 and rad2
                                 Supercedes obsolete cintersect which is kept
                                 for consistnecy'
define(`Cintersect',
 `define(`m4Cr1',`ifelse(`$2',,circlerad,(`$2'))')dnl
  define(`m4Cr2',`ifelse(`$4',,circlerad,(`$4'))')dnl
  define(`m4cdx',`(M4Pos(`$3').x-M4Pos(`$1').x)')dnl
  define(`m4cdy',`(M4Pos(`$3').y-M4Pos(`$1').y)')dnl
  define(`m4cls',`(m4cdx^2+m4cdy^2)')dnl
  define(`m4cq',`((m4cls+m4Cr1^2-m4Cr2^2)/2)')dnl
  (m4cq/m4cls between `$1' and `$3') ifinstr(`$5',R,-,+)\
   (vscal_(sqrt(max(0,m4cls*m4Cr1^2-m4cq^2))/m4cls,-m4cdy,m4cdx))')
define(`cintersect',`Cintersect($@)')

                                `LCintersect(Name of line,Centre,rad,[R])
                                 First (second if arg4 is R) intersection
                                 of a line V with a circle at C:
                                 solves |V.start+tV-C| = r '
ifdpic(
define(`LCintersect',
`define(`M4LcX',`$1'.start)define(`M4LcC',`($2)')dnl
define(`M4LcV',`(`$1'.end-M4LcX)')define(`M4LcD',`(M4LcX-M4LcC)')dnl
define(`m4Lca',`(M4LcV.x^2+M4LcV.y^2)')dnl
define(`m4Lcb',`(2*(M4LcV.x*M4LcD.x+M4LcV.y*M4LcD.y))')dnl
define(`m4Lcc',`(M4LcD.x^2+M4LcD.y^2-ifelse(`$3',,circlerad,`($3)')^2)')dnl
define(`m4Lct',
 `(-m4Lcb ifinstr(`$4',R,+,-) sqrta(m4Lcb^2-4*m4Lca*m4Lcc))/(2*m4Lca)')dnl
(m4Lct between `$1'.start and `$1'.end)')

                                `LEintersect(Name of line,
                                   Centre,ellipsewd,ellipseht, [R])
                                 First (second if arg5 is R) intersection
                                 of a line (or move) and ellipse at C'
define(`LEintersect',
`define(`M4LEX',`$1'.start)define(`M4LEC',`($2)')dnl
define(`M4LEV',`(`$1'.end-M4LEX)')define(`M4LED',`(M4LEX-M4LEC)')dnl
define(`m4LEqa',`(ifelse(`$3',,ellipsewid,`($3)')/2)')dnl
define(`m4LEqb',`(ifelse(`$4',,ellipseht,`($4)')/2)')dnl
define(`m4LEa',`(M4LEV.x^2/m4LEqa^2+M4LEV.y^2/m4LEqb^2)')dnl
define(`m4LEba',`(M4LEV.x*M4LED.x/m4LEqa^2+M4LEV.y*M4LED.y/m4LEqb^2)')dnl
define(`m4LEc',`(M4LED.x^2/m4LEqa^2+M4LED.y^2/m4LEqb^2-1)')dnl
define(`m4LEt',
 `(-m4LEba ifinstr(`$5',R,+,-) sqrta(m4LEba^2-m4LEa*m4LEc))/m4LEa')dnl
(m4LEt between `$1'.start and `$1'.end)')
)

                                `LCtangent(Pos,Center,rad,[R])
                                 Left (right if arg4=R) tangent point of line
                                 from Pos to circle at Center with radius arg3'
define(`LCtangent',`ifdpic(
`define(`m4dx',`((`$1').x-(`$2').x)')define(`m4dy',`((`$1').y-(`$2').y)')',
`define(`m4dx',`(`$1'.x-`$2'.x)')define(`m4dy',`(`$1'.y-`$2'.y)')')dnl
define(`m4lcr',`ifelse(`$3',,circlerad,`($3)')')dnl
define(`m4dsq',`(m4dx^2+m4dy^2)')dnl
(`$2'+\
(m4dx*m4lcr^2/m4dsq ifinstr(`$4',R,-,+)m4dy*m4lcr*sqrt(m4dsq-m4lcr^2)/m4dsq,\
 m4dy*m4lcr^2/m4dsq ifinstr(`$4',R,+,-)m4dx*m4lcr*sqrt(m4dsq-m4lcr^2)/m4dsq))')

                                `LEtangent(Pos,Center,ellipsewid,ellipseht,[R])
                                 Left (right if arg5=R) tangent point of line
                                 from Pos to ellipse at Center'
define(`LEtangent',
`define(`m4LEta',`(ifelse(`$3',,ellipsewid,`($3)')/2)')dnl
define(`m4LEtb',`(ifelse(`$4',,ellipseht, `($4)')/2)')dnl
define(`M4LP',`($1-($2))')dnl
define(`M4LET',`LCtangent((M4LP.x/m4LEta,M4LP.y/m4LEtb),`(0,0)',1,`$5')')dnl
(`$2'+(M4LET.x*m4LEta,M4LET.y*m4LEtb))')

                                `langle(Start,End)
                                 Angle relative to horizontal of a line
                                   between two points'
define(`langle',
`atan2(M4Pos(`$2').y-M4Pos(`$1').y,M4Pos(`$2').x-M4Pos(`$1').x)')

                                `ArcAngle(Pos1,Pos2,Pos3,
                                  radius,attributes,label)
                                 arc angle symbol drawn ccw at Pos2
                                 arg4: radius from Pos2
                                 arg5: line attributes, e.g. thick 0.4 ->
                                 arg6: label (or other object) at mid-arc
                                   e.g., ArcAngle(A,B,C,,,"$ABC$" ljust ) '
define(`ArcAngle',`arcr(`$2',ifelse(`$4',,arcrad,`$4'),
 langle(`$2',`$1'),langle(`$2',`$3'),`$5')
 ifelse(`$6',,,`move to `$2'+ (rect_(ifelse(`$4',,arcrad,`$4')+textoffset,
      (langle(`$2',`$1')+langle(`$2',`$3'))/2)); `$6'') ')

                                `RightAngle(Pos1,Pos2,Pos3,linelen,attributes)
                                 Draw a right angle symbol at Pos2
                                 arg4: size
                                 arg5: line attributes, e.g. outlined "gray"'
define(`RightAngle',
 `RightA_C: `$1'; RightA_N: `$2'; RightA_B: `$3'
define(`m4AngleLen',`ifelse(`$4',,linewid/5,`$4')')
 angleCNB = atan2(RightA_C.y-RightA_N.y,RightA_C.x-RightA_N.x)
 M4AB0: (RightA_B-RightA_N)/distance(RightA_B,RightA_N)
 M4CN0: (RightA_N-RightA_C)/distance(RightA_N,RightA_C)
 move to RightA_N - M4CN0*m4AngleLen
 line to Here + M4AB0*m4AngleLen then to RightA_N + M4AB0*m4AngleLen `$5'
')
                                `PerpTo(Pos,Line,Point)
                                 The point on Line of the perpendicular to Pos'
define(`PerpTo',
`PerpTo_T: move from `$1' to `$1'-(vperp(`$2'))
 ifelse(`$3',,PerpTo_P,`$3'): Intersect_(PerpTo_T,`$2') ')

                                `Convenience fraction along a linear obj'
define(`along_',`between `$1'.start and `$1'.end')

                                `Along_(LinearObj,distance,[R])
                                 position along a linear obj from start to end
                                 arg3=R: from end to start'
define(`Along_',`(ifelse(`$2',,1,`(`$2')/lin_leng(`$1')') between \
  `$1'.ifelse(`$3',R,end,start) and `$1'.ifelse(`$3',R,start,end))')

                                `showbox_(planar object,boxspec,P)
                                 Convenience to draw the bounding box of an obj
                                 (default last []),
                                 e.g. showbox_(B,dotted "Box B")'
define(`showbox_',`define(`M4obj',`ifelse(`$1',,last [],`$1')')dnl
  {box wid M4obj.wid ht M4obj.ht at M4obj `$2' ;}
   ifinstr(`$3',P,`{print (M4obj.wid,M4obj.ht)}')')

                                `use continue if dpic, otherwise line or other'
define(`contline',`ifdpic(continue,ifelse(`$1',,line,`$1'))')

                                `arcto(pos1,pos2,radius,attributes)
                                 line toward pos1 with arc toward pos2,
                                 similar to Postscript arcto.'
define(`arcto',
 `H_arcto: Here; X_arcto:`$1'; Y_arcto:`$2'
  U_arcto: X_arcto-(H_arcto.x,H_arcto.y)
  V_arcto: Y_arcto-(X_arcto.x,X_arcto.y)
  L_arcto: (vlength(U_arcto.x,U_arcto.y),vlength(V_arcto.x,V_arcto.y))
  S_arcto: (U_arcto.x*V_arcto.y-U_arcto.y*V_arcto.x, \
            U_arcto.x*V_arcto.x+U_arcto.y*V_arcto.y)
  if ("`$3'"=="") then { r_arcto = min(L_arcto.x,L_arcto.y)/2 } \
  else { r_arcto = `$3' }
  if (S_arcto.x==0) && (S_arcto.y==0) then { S_arcto:(r_arcto,0) } \
  else { S_arcto:(r_arcto,atan2(S_arcto.x,S_arcto.y)) }
  a_arcto = S_arcto.x*tan(abs(S_arcto.y)/2)
  if S_arcto.x*S_arcto.y*L_arcto.x*L_arcto.y == 0 \
  then { TX_arcto: X_arcto; TY_arcto: X_arcto; C_arcto: X_arcto } \
  else {
    TX_arcto: a_arcto/L_arcto.x between X_arcto and H_arcto
    TY_arcto: a_arcto/L_arcto.y between X_arcto and Y_arcto
    C_arcto: TX_arcto + (vscal_(sign(S_arcto.y)*S_arcto.x/L_arcto.x,
       -U_arcto.y,U_arcto.x)) }
  Arcto_line: line `$4' from H_arcto \
    to TX_arcto ifpstricks(`chop -min(1,linethick)bp__')
  if S_arcto.y >= 0 then { Arcto_arc: arc `$4' ccw rad r_arcto \
           from TX_arcto to TY_arcto with .c at C_arcto } \
  else { Arcto_arc: arc `$4'  cw rad r_arcto \
           from TX_arcto to TY_arcto with .c at C_arcto } ')

                                `m4scale_(linespec,[Bp,Pt,In,Cm]) 
                                 Draw a scale along a line for debugging' 
define(`m4scale_',`define(`m4SC',`ifelse(`$2',,I,`substr(`$2',0,1)')')dnl
  M4line: rpoint_(ifelse(`$1',,`to rvec_(5,0)',`$1'))
  m4slen = lin_leng(M4line)/(1 dnl
   ifelse(m4SC,B,bp__,m4SC,P,pt__,m4SC,I,,mm__))
  m4ltht = linethick
  thinlines_
  ifelse(ifelse(m4SC,B,T,m4SC,P,T),T,
   `define(`m4unit',`ifelse(m4SC,B,bp__,pt__)')dnl
    for i=10 to m4slen-9.9 by 10 do {
      line up 0.05 from M4line.start+vec_(i m4unit,0) }
    for i=50 to m4slen-49 by 100 do {
      line up 0.08 from M4line.start+vec_(i m4unit,0) }
    for i=0 to m4slen by 100 do {
      line up 0.1 from M4line.start+vec_(i m4unit,0)
      sprintf("%g",i) ht 8 m4unit at last line.start below }',
  m4SC,C,
   `for i=2 to m4slen-1 by 2 do {
      line up 0.05 from M4line.start+vec_(i mm__,0) }
    for i=0 to m4slen by 10 do {
      line up 0.1 from M4line.start+vec_(i mm__,0)
      sprintf("%g",i/10) ht 8bp__ at last line.start below }',
   `for i=1 to m4slen*10-0.9 do {
      line up 0.05 from M4line.start+vec_(i/10,0) }
    for i=0.5 to m4slen-0.49 by 0.5 do {
      line up 0.08 from M4line.start+vec_(i,0) }
    for i=0 to m4slen do {
      line up 0.1 from M4line.start+vec_(i,0)
      sprintf("%g",i) ht 8 bp__ at last line.start below }')
    linethick_(m4ltht)
    ')

                               `fitpoints(V,n,m,P,mP)'
                                Compute the controls in P[mP], P[mP+1]... for
                                the spline passing throught points V[m]...V[n]
                                Defines dpic macro dfitpoints() with the
                                same arguments'
ifdpic(`
define(`fitpoints',`defdfitpoints
  dfitpoints($@)')
define(`defdfitpoints',`ifdef(`dfitpoints__',,`define(`dfitpoints__')dnl
patsubst(`## pic fit curve macros
define dfitpoints {
  if "|3"=="" then { m_dfit=0 } else { m_dfit=|3 }
  if "|5"=="" then { mP_dfit=0 } else { mP_dfit=|5 }
  n_dfit = |2; np_dfit = n_dfit-m_dfit
  |4[mP_dfit]: |1[m_dfit]
  for i_dfit=m_dfit+1 to n_dfit-1 do {
    |4[mP_dfit+i_dfit-m_dfit]: |1[i_dfit]*(4/3) }
  |4[mP_dfit+np_dfit]: |1[n_dfit]
  |4[mP_dfit+1]: |4[mP_dfit+1]-|4[mP_dfit+0]/6    # forward substitution
  d_dfit[1] = 1
  for i_dfit = 2 to np_dfit-1 do { |4[mP_dfit+i_dfit]: \
    |4[mP_dfit+i_dfit]-|4[mP_dfit+i_dfit-1]/d_dfit[i_dfit-1]/6
    d_dfit[i_dfit] = 1-1/d_dfit[i_dfit-1]/36 }
  for i_dfit= np_dfit-1 to 1 by -1 do {    # backward substitution
    |4[mP_dfit+i_dfit]: \
    (|4[mP_dfit+i_dfit]-|4[mP_dfit+i_dfit+1]/6)/d_dfit[i_dfit] }
  }',|,$) ') ') ')

                               `fitcurve(V,n,linetype,m (default 0))
                                Draw a spline through V[m],...V[n]
                                linetype=eg dotted.  Works only with dpic.
                                The calculated control points P[i] satisfy
                                approximately:
                                P[0] = V[0]
                                P[i-1]/8 + P[i]*3/4 + P[i+1]/8 = V[i]
                                P[n] = V[n]
                                Defines dpic macro dfitcurve() with the
                                same arguments'
ifdpic(`
define(`fitcurve',`ifdef(`dfitcurve__',,`define(`dfitcurve__')dnl
defdfitpoints
patsubst(`define case_dfit { exec sprintf("|%g",floor(|1+0.5)+1); }
define dfitcurve { if "|4"=="" then { m_dfit=0 } else { m_dfit=|4 }
  n_dfit = |2; np_dfit = n_dfit-m_dfit
  M4P_[0]: |1[m_dfit]
  case_dfit( min(max(np_dfit,-1),3)+1,
    spline 0.551784 |3 from M4P_[0] to M4P_[0],
    spline 0.551784 |3 from M4P_[0] to |1[n_dfit],
    M4P_[3]: |1[n_dfit]; Q_dfit: (M4P_[3]-M4P_[0])/4 
    M4P_[1]: |1[m_dfit+1]-Q_dfit; M4P_[2]: |1[m_dfit+1]+Q_dfit
    spline 0.551784 |3 from M4P_[0] to M4P_[1] then to M4P_[2] then to M4P_[3],
    fitpoints(|1,|2,|4,M4P_,0)
                                  # draw using computed control points
    spline 0.551784 |3 from M4P_[0] to 11/32 between M4P_[0] and M4P_[1] \
       then to 5/32 between M4P_[1] and M4P_[2]
    for i_dfit=2 to np_dfit-2 do { continue to M4P_[i_dfit] }
    continue to 27/32 between M4P_[np_dfit-2] and M4P_[np_dfit-1] \
      then to 21/32 between M4P_[np_dfit-1] and M4P_[np_dfit] \
      then to M4P_[np_dfit]) }
` ## end fit curve defs'',|,$) ')
  dfitcurve($@) ')
')

                                `Sinusoids and lollipop signals
                                 Cosine( amplitude, freq, time, phase )'
define(`Cosine',`(`$1')*cos((`$2')*(`$3')ifelse((`$4'),(),,`+(`$4')'))')

                                `lpop(xcoord, ycoord, radius, fill, zeroht)
                                 for lollipop graphs'
define(`lpop',`dot(at (`$1',`$2'),`$3',`$4')
  line to (`$1',ifelse(`$5',,0,`$5')) chop ifelse(`$3',,`dotrad_',`$3') chop 0')

                                `sinc(x) the sinc function'
define(`sinc',`sin(max(pi_*abs(`$1'),1e-6))/max(pi_*abs(`$1'),1e-6)')

                        `sinusoid(amplitude, frequency, phase,
                                        tmin,tmax, linetype )
                         cosine curve in the current direction (only with dpic)
                         in [ ] brackets; e.g., to draw a dashed sine curve,
                         amplitude a, of n cycles over length 0 to x:
                         sinusoid(a,twopi_*n/x,-pi_/2,0,x,dashed) \
                           with [.Start|.End|.Origin] at position'
ifdpic(`
define(`sinusoid',
 `define(`m4s_a',`ifelse(`$1',,linewid,(`$1'))')dnl
  define(`m4s_ph',`ifelse(`$3',,0,(`$3'))')dnl
  define(`m4s_m',`ifelse(`$4',,0,(`$4'))')dnl
  define(`m4s_M',`ifelse(`$5',,linewid,(`$5'))')dnl
  [ Origin: (0,0)
  Tmin: vec_(m4s_m,0) ; Tmax: vec_(m4s_M,0)
  h = m4s_M-m4s_m
  ifelse(`$2',,`if h==0 then { f = twopi_ } else { f = twopi_/h }',`f = `$2'')
  tm = 2*f
  w0 = tm*m4s_m + 2*m4s_ph
  h0 = -m4_t_fun(-1,h,m4s_a/2)/h;
  n = (int(h/(twopi_/(tm/2)))+1)*12
  for i = 0 to n do {
    t = m4s_m+m4_t_fun(h0,h*i/n,m4s_a/2);
    M4S_[i]: vec_(t,Cosine(m4s_a,f,t,m4s_ph)) }
  Start: M4S_[0]
  End: M4S_[n]
  fitcurve(M4S_,n,`$6')
  `$7' ]')
  define(`m4_t_fun',
    `((`$1'+(`$3'))*(`$2')-(`$3')/tm*(sin(tm*(`$2')+w0)-sin(w0)))') ')

define(`def_bisect',`NeedDpicTools') # This macro is obsolete

                                `Colour routines:'
                                `graystring(value in [0,1])'
define(`graystring',`rgbstring(`$1',`$1',`$1')')

                                `rgbstring(color triple: values in [0,1])
                                   (example rgbstring(0.2,0.3,0.4) )
                                 or, when allowed by the postprocessor,
                                 rgbstring(color name)
                                   xcolor example: rgbstring(blue!20!black!30)
                                 evaluates to a string for use in
                                 `outlined string' or `shaded string'
                                 (mpost,PSTricks,pdf,tikz-pgf,postscript,svg
                                  only)'
ifelse(
m4postprocessor,pstricks,`define(`rgbstring',`ifelse(`$2',,`"$1"',
 `sprintf("{rgb,1:red,%7.5f;green,%7.5f;blue,%7.5f}",`$1',`$2',`$3')')')',
m4postprocessor,pgf,     `define(`rgbstring',`ifelse(`$2',,`"$1"',
 `sprintf("{rgb,1:red,%7.5f;green,%7.5f;blue,%7.5f}",`$1',`$2',`$3')')')',
m4postprocessor,svg,     `define(`rgbstring',
 `sprintf("rgb(%g,%g,%g)",color255(`$1',`$2',`$3'))')',
m4postprocessor,mpost,   `define(`rgbstring',`ifelse(`$2',,`"$1"',
 `sprintf("(%g,%g,%g)",`$1',`$2',`$3')')')',
m4postprocessor,pdf,     `define(`rgbstring',
 `sprintf("%g %g %g",`$1',`$2',`$3')')',
m4postprocessor,postscript,`define(`rgbstring',
 `sprintf("%g %g %g",`$1',`$2',`$3')')',
`define(`rgbstring',"")')

                                `setrgb(red value, green value, blue value,
                                   [name],[D][F])
                                 define colour for lines and text.
                                 arg5 (svg only): D=draw, F=fill
                                 SVG values are 0 to 255
                                 see also \usepackage{latexcolors} and
                                 latexcolor.com'
define(`setrgb',`pushdef(`r_',`$1')pushdef(`g_',`$2')pushdef(`b_',`$3')dnl
pushdef(`m4cl_',ifelse(`$4',,lcspec,`$4'))dnl
ifelse(m4postprocessor,pstricks,
 `command sprintf("\definecolor{m4cl_}{rgb}{%7.5f,%7.5f,%7.5f}%%",r_,g_,b_)
  command sprintf("\color[rgb]{%7.5f,%7.5f,%7.5f}%%",r_,g_,b_)
  command "\psset{linecolor=m4cl_}%%" ',
m4postprocessor,svg,`
 command "<g " \
 ifinstr(`$5',F,,
  `+ sprintf("stroke=\"rgb(%g,%g,%g)\" ",round_(r_),round_(g_),round_(b_))') \
 ifinstr(`$5',D,,
  `+   sprintf("fill=\"rgb(%g,%g,%g)\"", round_(r_),round_(g_),round_(b_))') \
 + ">"',
m4postprocessor,pgf,`
  command sprintf("\definecolor{m4cl_}{rgb}{%7.5f,%7.5f,%7.5f}%%",r_,g_,b_)
  command sprintf("\color[rgb]{%7.5f,%7.5f,%7.5f}%%",r_,g_,b_)
  ifdef(`m4pco',,
  `command "\global\let\dpiclidraw=\dpicdraw\global\let\dpicfidraw=\filldraw"
   command "\global\def\dpicdraw{\dpiclidraw[color=m4cl_]}"
   command "\global\def\filldraw{\dpicfidraw[color=m4cl_]}"pushdef(`m4pco')')',
m4postprocessor,mpost,`
  command "def drw=draw enddef; def X=lcolr;enddef;"
  command sprintf("def m4cl_=(%7.5f,%7.5f,%7.5f)enddef;",r_,g_,b_)
  command "def lcolr=withcolor m4cl_ enddef;"'
)')
                                `resetrgb: reset to previous colour definitions'
define(`resetrgb',`popdef(`m4cl_')popdef(`r_')popdef(`g_')popdef(`b_')dnl
ifelse(m4postprocessor,pstricks,`ifdef(`r_',
 `command sprintf("\definecolor{m4cl_}{rgb}{%7.5f,%7.5f,%7.5f}%%",r_,g_,b_)
  command sprintf("\color[rgb]{%7.5f,%7.5f,%7.5f}%%",r_,g_,b_)
  command "\psset{linecolor=m4cl_}%%" ',
 `command "\psset{linecolor=black}\color{black}%"') ',
m4postprocessor,svg,`
  command "</g>" ',
m4postprocessor,pgf,` popdef(`m4pco')
  ifdef(`m4pco',
   `command sprintf("\definecolor{lcspec}{rgb}{%7.5f,%7.5f,%7.5f}%%",r_,g_,b_)
    command sprintf("\color[rgb]{%7.5f,%7.5f,%7.5f}%%",r_,g_,b_)',
   `command "\color{black}\global\let\dpicdraw=\dpiclidraw%"
    command "\global\let\filldraw=\dpicfidraw"') ',
m4postprocessor,mpost,`
  command "def X=;enddef; def lcolr= enddef;"'
)')

                                `rgbdraw(color triple, drawing commands)
                                 SVG: 0 to 255'
define(`rgbdraw',`setrgb(`$1',`$2',`$3',,ifsvg(D))
shift(shift(shift($@)))
resetrgb
')
                                `rgbfill(color triple, closed path)
                                  (PSTricks,svg,pgf-tikz,mpost)
                                  SVG colors: 0 to 255 '
define(`rgbfill',`
ifelse(m4postprocessor,pstricks,
 `command sprintf("\definecolor{fcspec}{rgb}{%7.5f,%7.5f,%7.5f}%%",\
    `$1',`$2',`$3')
  command sprintf("\pscustom[fillcolor=fcspec,fillstyle=solid]{%%")
  shift(shift(shift($@)))
  command "}%"',
m4postprocessor,svg,
  `setrgb(`$1',`$2',`$3',,ifsvg(F))
   shift(shift(shift($@)))
   resetrgb',
m4postprocessor,pgf,
 `command \
    sprintf("\definecolor{fcspec}{rgb}{%7.5f,%7.5f,%7.5f}%%",`$1',`$2',`$3')
  command "\global\def\dpicstop{--}"
  command "\global\let\dpicfdraw=\dpicdraw\global\def\dpicdraw{}"
  command "\path[fill=fcspec]"
  {`$4'}
  command "cycle; \global\let\dpicdraw=\dpicfdraw\global\def\dpicstop{;}"
  `$4'',
m4postprocessor,mpost,
 `command "def Y="
  shift(shift(shift($@)))
  command "enddef; def drw= enddef; def X=--enddef;"
  command sprintf("fill Y cycle withcolor (%7.5f,%7.5f,%7.5f);",`$1',`$2',`$3')
  command "def drw=draw enddef; def X=;enddef; Y;"'
)')
                                Pstricks conditional command
define(`psset_',`ifpstricks(`dnl
command sprintf("\psset{$@}%%")
')')

                                Kludge for SVG color-filled line
ifsvg(
`define(`m4c_l',`ifdef(`r_',`colored rgbstring(r_,g_,b_)')')',
`define(`m4c_l',)')

                                Adjust fill value if gpic is used
define(`fill_',`dnl
 fill ifgpic(`1-(')ifelse(`$1',,fillval,`$1') ifgpic(`)')')

define(`m4dir',right)
define(`m4_k',0)

                                Define m4x_ etc for horiz and vert lines
manhattan
divert(0)dnl
