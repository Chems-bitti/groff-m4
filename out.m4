.EQ
delim $$
.EN

.NH 1 "A basic OpAmp circuit"
.Fs
.PS
cct_init 
Origin : Here
S : opamp
line left from S.In1 ; 
line up
dot
{                         # opening curly braces save your position
	line right
	resistor; rlabel(,R sub F,)
	left_; b_current(i sub 2)
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
.Fe "Inverting amplifier"
.NH 2 "Another One"
.Fs
.PS
cct_init
Origin : Here
S : opamp
line left 0.1 from S.In1 
{
line up

	{
		line up 0.01 
		capacitor; llabel(,C,)
		line down  Here.y then to S.Out
	}
}
left_
resistor(left_); rlabel(,R sub G,) # You can allign components by giving them *direction*_ argument
dot; up_; llabel(,v sub in,);
line left 0.1 from S.In2
line down 0.1
ground
.PE 
.PS
cct_init	# Initialize libcct.m4 library
Origin : Here	# Define Origin string to indicate the current position
S : opamp	# Draw an opamp
line left 0.1 from S.In1 # Draw a line left from the inverting input of the opamp
{		# A curly brace saves your current position 
		line up 0.4 # Draw a line up
		capacitor; llabel(,C,) # Draw a capacitor and label it C
		# Here.y is the y coordinate of your current position
		# Going down Here.y units well take you back to the 0 height line
		# That 0 height line is where we declared our opamp
		# And since the opamps out posrt is in the middle of the op amp
		# the line going back to the Out port will be perfectly horizontal
		#line down Here.y then to S.Out 
		# To see a cool effect, comment the line above and uncomment the line below
		line down to S.Out
}
left_
resistor(left_); rlabel(,R sub G,) # You can allign components by giving them *direction*_ argument
dot; up_; llabel(,v sub in,);
line left 0.1 from S.In2
line down 0.1
ground
.PE 
.Fe "Two Integrators"
.Fs
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
move right 2           # try writing `move right 2 then to (Here.x, 0)` to understand how and when pic saves the Here variable
move to (Here.x, 0)
S2 : opamp 
.PE
.Fe "two adjacent figures"
.tc
