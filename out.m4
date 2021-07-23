.EQ
delim $$
.EN

.PP
Test File
.PS
cct_init
Origin : Here
S : opamp
line left from S.In1 
line up
dot
{                         # opening curly braces save your position
	line right
	resistor; rlabel(,R sub F,)
	b_current(i sub 2)
	line down Here.y then to S.Out
	line right;
	dot; up_; rlabel(,v sub out,)        # up_ here is used for alligning text vertically
}                        # closing curly braces returns you to your saved position
line left 0.1
resistor(left_); llabel(,R sub G,)
b_current(i,,,E, 0.2)    # Try doing this after declaring a line to understand arrows (check the documentation too)
rarrow(v)
line left 0.2

dot; up_; llabel(,v sub in,) 
line left 0.2 from S.In2 then down 0.2
ground
.PE

.PS
cct_init
Origin : Here
S : opamp
line left 0.1 from S.In1 
{
line up

	{
		line up 0.4 
		capacitor; llabel(,C,)
		line down 0.4 
	}
	resistor; llabel(,R sub F,)
	line down Here.y then to S.Out
}
left_
resistor(left_); rlabel(,R sub G,) # You can allign components by giving them *direction*_ argument
.PE 
.PS
cct_init
source(down_); rlabel(-,v,+)
.PE

.PS
cct_init
Origin : Here
S : opamp
line left 0.1 from S.In1
{
	resistor(left_)
	ground
}
line up 0.2 
R : resistor(right_) 
line right 0.2 then down R.y
line left from S.In2
dot; rlabel(,V sub in,)
move right 2           # try writing `move right 2 then to (Here.x, 0)` to understand when does pic save the Here variable
move to (Here.x, 0)
S2 : opamp 
.PE
