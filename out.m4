.EQ
delim $$
.EN
.PP
test

.PS 
cct_init 
elen = 0.75 
Origin: Here 
source(up_ elen); llabel(-,v sub s,+)
resistor(right_ elen); rlabel(,R,)
dot
{ 
capacitor(down_ to (Here,Origin)) 
rlabel(+,v,-); llabel(,C,)
dot
} 
line right_ elen*2/3
inductor(down_ Here.y-Origin.y); rlabel(,L,); b_current(i)
line to Origin
ground
.PE
.PS
cct_init
linewid = 2.0
linethick_(2.0)
R1: resistor
thinlines_
box dotted wid last [].wid ht last [].ht at last []
move to 0.85 between last [].sw and last [].se
spline <- down arrowht*2 right arrowht/2 then right 0.15; "\t last []" ljust
arrow <- down 0.3 from R1.start chop 0.05; "\t R1.start" below
arrow <- down 0.3 from R1.end chop 0.05; "\t R1.end" below
arrow <- down last [].c.y-last arrow.end.y from R1.c; "\t R1.centre" below
dimension_(from R1.start to R1.end,0.45,\t elen\_,0.4)
dimension_(right_ dimen_ from R1.c-(dimen_/2,0),0.3,\t dimen\_,0.5)
.PE
.PS
log_init
S: NOR_gate
left_
R: NOR_gate at S+(0,-L_unit*(AND_ht+1))
line from S.Out right L_unit*3 then down S.Out.y-R.In2.y then to R.In2
line from R.Out left L_unit*3 then up S.In2.y-R.Out.y then to S.In2
line left 4*L_unit from S.In1 ; "$S$sp_" rjust
line right 4*L_unit from R.In1 ; "sp_$R$" ljust
.PE
