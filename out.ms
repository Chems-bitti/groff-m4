.EQ
delim $$
.EN

.PP
Test File
.PS
# cct_init Version 9.6: Gpic m4 macro settings.
  
  # gen_init Version 9.6: Gpic m4 macro settings.
  

  define rpoint__ {
    rp_wid = last line.end.x-last line.start.x
    rp_ht = last line.end.y-last line.start.y
    rp_len = sqrt(max((rp_wid)^2+(rp_ht)^2,-((rp_wid)^2+(rp_ht)^2))); move to last line.start
    if (rp_len == 0) then { rp_ang=0 } else {    rp_ang = atan2(rp_ht,rp_wid) } }

  rtod_ = 57.295779513082323;  dtor_ = 0.017453292519943295
  twopi_ = 6.2831853071795862;  pi_ = (twopi_/2)
  rp_ang = 0;  right
  
  
  linethick = 0.8
  arrowwid = 0.05*scale; arrowht = 0.1*scale;
  
  linethick = 0.8
  # gen_init end

  

# cct_init end

Origin : Here
S : [  line invis to Here+(max((1.5*linewid)-linewid/4,linewid),0)
  rpoint__
  
   
 W: Here
 N: ((linewid/2)*((-sin(rp_ang))),(linewid/2)*(cos(rp_ang)))
 S: ((-linewid/2)*((-sin(rp_ang))),(-linewid/2)*(cos(rp_ang)))
 E: ((linewid)*(cos(rp_ang)),(linewid)*(sin(rp_ang)))
 C: ((linewid/2)*(cos(rp_ang)),(linewid/2)*(sin(rp_ang)))
 { line to N then to E then to S then to W; move to E
   if rp_len > linewid then { line to Here+((rp_len-linewid)*(cos(rp_ang)),(rp_len-linewid)*(sin(rp_ang))) }
 Out: Here }
 NE: (((linewid/2)*(cos(rp_ang))+(linewid/4)*((-sin(rp_ang)))),((linewid/2)*(sin(rp_ang))+(linewid/4)*(cos(rp_ang)))); E1: NE
 SE: (((linewid/2)*(cos(rp_ang))+(-linewid/4)*((-sin(rp_ang)))),((linewid/2)*(sin(rp_ang))+(-linewid/4)*(cos(rp_ang)))); E2: SE
 In1: ((linewid/4)*((-sin(rp_ang))),(linewid/4)*(cos(rp_ang)))
 In2: ((-linewid/4)*((-sin(rp_ang))),(-linewid/4)*(cos(rp_ang)))
   { move to In1
     "$-$" \
       at Here+((4*(scale/72.27))*(cos(rp_ang)),(4*(scale/72.27))*(sin(rp_ang))) }
   { move to In2
     "$+$" \
       at Here+((4*(scale/72.27))*(cos(rp_ang)),(4*(scale/72.27))*(sin(rp_ang))) }
 
  ] 
line left from S.In1 
line up
[  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c
{                         # opening curly braces save your position
	line right
	   line invis to Here+(((1.5*linewid))*(cos(rp_ang)),((1.5*linewid))*(sin(rp_ang)))
  rpoint__
  
   
          if linewid/6/4*6*2 > rp_len then { line invis to Here+((linewid/6/4*6*2)*(cos(rp_ang)),(linewid/6/4*6*2)*(sin(rp_ang)))
  rpoint__
  
    }
    M4_xyO: last line.c
    { line from last line.start to M4_xyO+(((linewid/6/4)*(-6))*(cos(rp_ang)),((linewid/6/4)*(-6))*(sin(rp_ang)))\
       then to M4_xyO+((((linewid/6/4)*(-5))*(cos(rp_ang))+((linewid/6/4)*((2)))*((-sin(rp_ang)))),(((linewid/6/4)*(-5))*(sin(rp_ang))+((linewid/6/4)*((2)))*(cos(rp_ang)))) \
         then to M4_xyO+((((linewid/6/4)*(-3))*(cos(rp_ang))+((linewid/6/4)*((-2)))*((-sin(rp_ang)))),(((linewid/6/4)*(-3))*(sin(rp_ang))+((linewid/6/4)*((-2)))*(cos(rp_ang)))) \
   then to M4_xyO+(((-(linewid/6/4))*(cos(rp_ang))+((linewid/6/4)*((2)))*((-sin(rp_ang)))),((-(linewid/6/4))*(sin(rp_ang))+((linewid/6/4)*((2)))*(cos(rp_ang)))) \
         then to M4_xyO+(((linewid/6/4)*(cos(rp_ang))+((linewid/6/4)*((-2)))*((-sin(rp_ang)))),((linewid/6/4)*(sin(rp_ang))+((linewid/6/4)*((-2)))*(cos(rp_ang)))) \
   then to M4_xyO+((((linewid/6/4)*(3))*(cos(rp_ang))+((linewid/6/4)*((2)))*((-sin(rp_ang)))),(((linewid/6/4)*(3))*(sin(rp_ang))+((linewid/6/4)*((2)))*(cos(rp_ang)))) \
         then to M4_xyO+((((linewid/6/4)*(5))*(cos(rp_ang))+((linewid/6/4)*((-2)))*((-sin(rp_ang)))),(((linewid/6/4)*(5))*(sin(rp_ang))+((linewid/6/4)*((-2)))*(cos(rp_ang)))) \
           then to M4_xyO+(((linewid/6/4)*(6))*(cos(rp_ang)),((linewid/6/4)*(6))*(sin(rp_ang))) \
         then to last line.end
      [box invis ht linewid/6/4*2*2 wid linewid/6/4*6*2] at 2nd last line.c
      }
  
  
  
#
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~$$ R sub F$$~$" \
     at last [].s below };  
	    
  { move to last line.start+((((rp_len-last [].wid)/2*2/3+arrowht/3))*(cos(rp_ang)),(((rp_len-last [].wid)/2*2/3+arrowht/3))*(sin(rp_ang)))
    arrow <-  to Here+((-arrowht)*(cos(rp_ang)),(-arrowht)*(sin(rp_ang))) "$~$$ i sub 2$$~$" \
     above}
	line down Here.y then to S.Out
	line right;
	[  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c;  up;   {"$~$$ v sub out$$~$" \
     at last [].r ljust };          # up_ here is used for alligning text vertically
}                        # closing curly braces returns you to your saved position
line left 0.1
   line invis  left
  rpoint__
  
   
          if linewid/6/4*6*2 > rp_len then { line invis to Here+((linewid/6/4*6*2)*(cos(rp_ang)),(linewid/6/4*6*2)*(sin(rp_ang)))
  rpoint__
  
    }
    M4_xyO: last line.c
    { line from last line.start to M4_xyO+(((linewid/6/4)*(-6))*(cos(rp_ang)),((linewid/6/4)*(-6))*(sin(rp_ang)))\
       then to M4_xyO+((((linewid/6/4)*(-5))*(cos(rp_ang))+((linewid/6/4)*((2)))*((-sin(rp_ang)))),(((linewid/6/4)*(-5))*(sin(rp_ang))+((linewid/6/4)*((2)))*(cos(rp_ang)))) \
         then to M4_xyO+((((linewid/6/4)*(-3))*(cos(rp_ang))+((linewid/6/4)*((-2)))*((-sin(rp_ang)))),(((linewid/6/4)*(-3))*(sin(rp_ang))+((linewid/6/4)*((-2)))*(cos(rp_ang)))) \
   then to M4_xyO+(((-(linewid/6/4))*(cos(rp_ang))+((linewid/6/4)*((2)))*((-sin(rp_ang)))),((-(linewid/6/4))*(sin(rp_ang))+((linewid/6/4)*((2)))*(cos(rp_ang)))) \
         then to M4_xyO+(((linewid/6/4)*(cos(rp_ang))+((linewid/6/4)*((-2)))*((-sin(rp_ang)))),((linewid/6/4)*(sin(rp_ang))+((linewid/6/4)*((-2)))*(cos(rp_ang)))) \
   then to M4_xyO+((((linewid/6/4)*(3))*(cos(rp_ang))+((linewid/6/4)*((2)))*((-sin(rp_ang)))),(((linewid/6/4)*(3))*(sin(rp_ang))+((linewid/6/4)*((2)))*(cos(rp_ang)))) \
         then to M4_xyO+((((linewid/6/4)*(5))*(cos(rp_ang))+((linewid/6/4)*((-2)))*((-sin(rp_ang)))),(((linewid/6/4)*(5))*(sin(rp_ang))+((linewid/6/4)*((-2)))*(cos(rp_ang)))) \
           then to M4_xyO+(((linewid/6/4)*(6))*(cos(rp_ang)),((linewid/6/4)*(6))*(sin(rp_ang))) \
         then to last line.end
      [box invis ht linewid/6/4*2*2 wid linewid/6/4*6*2] at 2nd last line.c
      }
  
  
  
#
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~$$ R sub G$$~$" \
     at last [].s below };  
    
  { move to last line.start+((rp_len-    ((rp_len-last [].wid)/2*(0.2)+arrowht/3))*(cos(rp_ang)),(rp_len-    ((rp_len-last [].wid)/2*(0.2)+arrowht/3))*(sin(rp_ang)))
    arrow <-  to Here+((arrowht)*(cos(rp_ang)),(arrowht)*(sin(rp_ang))) "$~$$ i$$~$" \
     below}    # Try doing this after declaring a line to understand arrows (check the documentation too)
  {arrow  from last [].t+(((-min(sqrt(max((last line.start.x-last line.end.x)^2+(last line.start.y-last line.end.y)^2,-((last line.start.x-last line.end.x)^2+(last line.start.y-last line.end.y)^2))),linewid)/2)*(cos(rp_ang))+(-5*(scale/72.27))*((-sin(rp_ang)))),((-min(sqrt(max((last line.start.x-last line.end.x)^2+(last line.start.y-last line.end.y)^2,-((last line.start.x-last line.end.x)^2+(last line.start.y-last line.end.y)^2))),linewid)/2)*(sin(rp_ang))+(-5*(scale/72.27))*(cos(rp_ang)))) \
    to last [].t+(((min(sqrt(max((last line.start.x-last line.end.x)^2+(last line.start.y-last line.end.y)^2,-((last line.start.x-last line.end.x)^2+(last line.start.y-last line.end.y)^2))),linewid)/2)*(cos(rp_ang))+(-5*(scale/72.27))*((-sin(rp_ang)))),((min(sqrt(max((last line.start.x-last line.end.x)^2+(last line.start.y-last line.end.y)^2,-((last line.start.x-last line.end.x)^2+(last line.start.y-last line.end.y)^2))),linewid)/2)*(sin(rp_ang))+(-5*(scale/72.27))*(cos(rp_ang)))) \
  "$~$$ v$$~$" above}
line left 0.2

[  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c;  up;   {"$~$$ v sub in$$~$" \
     at last [].w rjust };   
line left 0.2 from S.In2 then down 0.2
box invis ht 0 wid 0 with .c at Here
    {  m4sd_ang = rp_ang; rp_ang = (-90)*(dtor_)  ; 
  line from last box.c to Here+((linewid/4)*(cos(rp_ang)),(linewid/4)*(sin(rp_ang)))
  {line from Here+((linewid/6)*((-sin(rp_ang))),(linewid/6)*(cos(rp_ang))) \
          to Here+((-linewid/6)*((-sin(rp_ang))),(-linewid/6)*(cos(rp_ang)))}
   {line from Here+(((linewid/16)*(cos(rp_ang))+(linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(linewid/9)*(cos(rp_ang)))) \
          to Here+(((linewid/16)*(cos(rp_ang))+(-linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(-linewid/9)*(cos(rp_ang))))}
   line from Here+(((2*linewid/16)*(cos(rp_ang))+(linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(linewid/14)*(cos(rp_ang)))) \
          to Here+(((2*linewid/16)*(cos(rp_ang))+(-linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(-linewid/14)*(cos(rp_ang))))
    up ; rp_ang = m4sd_ang
  } 
.PE

.PS
# cct_init Version 9.6: Gpic m4 macro settings.
  
  # gen_init Version 9.6: Gpic m4 macro settings.
  

  define rpoint__ {
    rp_wid = last line.end.x-last line.start.x
    rp_ht = last line.end.y-last line.start.y
    rp_len = sqrt(max((rp_wid)^2+(rp_ht)^2,-((rp_wid)^2+(rp_ht)^2))); move to last line.start
    if (rp_len == 0) then { rp_ang=0 } else {    rp_ang = atan2(rp_ht,rp_wid) } }

  rtod_ = 57.295779513082323;  dtor_ = 0.017453292519943295
  twopi_ = 6.2831853071795862;  pi_ = (twopi_/2)
  rp_ang = 0;  right
  
  
  linethick = 0.8
  arrowwid = 0.05*scale; arrowht = 0.1*scale;
  
  linethick = 0.8
  # gen_init end

  

# cct_init end

Origin : Here
S : [  line invis to Here+(max((1.5*linewid)-linewid/4,linewid),0)
  rpoint__
  
   
 W: Here
 N: ((linewid/2)*((-sin(rp_ang))),(linewid/2)*(cos(rp_ang)))
 S: ((-linewid/2)*((-sin(rp_ang))),(-linewid/2)*(cos(rp_ang)))
 E: ((linewid)*(cos(rp_ang)),(linewid)*(sin(rp_ang)))
 C: ((linewid/2)*(cos(rp_ang)),(linewid/2)*(sin(rp_ang)))
 { line to N then to E then to S then to W; move to E
   if rp_len > linewid then { line to Here+((rp_len-linewid)*(cos(rp_ang)),(rp_len-linewid)*(sin(rp_ang))) }
 Out: Here }
 NE: (((linewid/2)*(cos(rp_ang))+(linewid/4)*((-sin(rp_ang)))),((linewid/2)*(sin(rp_ang))+(linewid/4)*(cos(rp_ang)))); E1: NE
 SE: (((linewid/2)*(cos(rp_ang))+(-linewid/4)*((-sin(rp_ang)))),((linewid/2)*(sin(rp_ang))+(-linewid/4)*(cos(rp_ang)))); E2: SE
 In1: ((linewid/4)*((-sin(rp_ang))),(linewid/4)*(cos(rp_ang)))
 In2: ((-linewid/4)*((-sin(rp_ang))),(-linewid/4)*(cos(rp_ang)))
   { move to In1
     "$-$" \
       at Here+((4*(scale/72.27))*(cos(rp_ang)),(4*(scale/72.27))*(sin(rp_ang))) }
   { move to In2
     "$+$" \
       at Here+((4*(scale/72.27))*(cos(rp_ang)),(4*(scale/72.27))*(sin(rp_ang))) }
 
  ] 
line left 0.1 from S.In1 
{
line up

	{
		line up 0.4 
		line invis to Here+(((1.5*linewid))*(cos(rp_ang)),((1.5*linewid))*(sin(rp_ang)))
  rpoint__
  
   
   {           line to Here+((rp_len/2-linewid/3*0.3/2)*(cos(rp_ang)),(rp_len/2-linewid/3*0.3/2)*(sin(rp_ang)))
      {line from Here+((-linewid/3/2)*((-sin(rp_ang))),(-linewid/3/2)*(cos(rp_ang))) \
          to Here+((linewid/3/2)*((-sin(rp_ang))),(linewid/3/2)*(cos(rp_ang)))}
      
      move to Here+((linewid/3*0.3)*(cos(rp_ang)),(linewid/3*0.3)*(sin(rp_ang)))
      {line from Here+((-linewid/3/2)*((-sin(rp_ang))),(-linewid/3/2)*(cos(rp_ang))) \
          to Here+((linewid/3/2)*((-sin(rp_ang))),(linewid/3/2)*(cos(rp_ang)))}
      line to Here+((rp_len/2-linewid/3*0.3/2)*(cos(rp_ang)),(rp_len/2-linewid/3*0.3/2)*(sin(rp_ang))) 
  
  
  
  
  
  
  }
  
  {[box invis ht linewid/3 wid linewid/3*0.3 ] at Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang)))}
  line to Here+((rp_len)*(cos(rp_ang)),(rp_len)*(sin(rp_ang))) invis ;   {"$~$$ C$$~$" \
     at last [].n above };  
		line down 0.4 
	}
	   line invis to Here+(((1.5*linewid))*(cos(rp_ang)),((1.5*linewid))*(sin(rp_ang)))
  rpoint__
  
   
          if linewid/6/4*6*2 > rp_len then { line invis to Here+((linewid/6/4*6*2)*(cos(rp_ang)),(linewid/6/4*6*2)*(sin(rp_ang)))
  rpoint__
  
    }
    M4_xyO: last line.c
    { line from last line.start to M4_xyO+(((linewid/6/4)*(-6))*(cos(rp_ang)),((linewid/6/4)*(-6))*(sin(rp_ang)))\
       then to M4_xyO+((((linewid/6/4)*(-5))*(cos(rp_ang))+((linewid/6/4)*((2)))*((-sin(rp_ang)))),(((linewid/6/4)*(-5))*(sin(rp_ang))+((linewid/6/4)*((2)))*(cos(rp_ang)))) \
         then to M4_xyO+((((linewid/6/4)*(-3))*(cos(rp_ang))+((linewid/6/4)*((-2)))*((-sin(rp_ang)))),(((linewid/6/4)*(-3))*(sin(rp_ang))+((linewid/6/4)*((-2)))*(cos(rp_ang)))) \
   then to M4_xyO+(((-(linewid/6/4))*(cos(rp_ang))+((linewid/6/4)*((2)))*((-sin(rp_ang)))),((-(linewid/6/4))*(sin(rp_ang))+((linewid/6/4)*((2)))*(cos(rp_ang)))) \
         then to M4_xyO+(((linewid/6/4)*(cos(rp_ang))+((linewid/6/4)*((-2)))*((-sin(rp_ang)))),((linewid/6/4)*(sin(rp_ang))+((linewid/6/4)*((-2)))*(cos(rp_ang)))) \
   then to M4_xyO+((((linewid/6/4)*(3))*(cos(rp_ang))+((linewid/6/4)*((2)))*((-sin(rp_ang)))),(((linewid/6/4)*(3))*(sin(rp_ang))+((linewid/6/4)*((2)))*(cos(rp_ang)))) \
         then to M4_xyO+((((linewid/6/4)*(5))*(cos(rp_ang))+((linewid/6/4)*((-2)))*((-sin(rp_ang)))),(((linewid/6/4)*(5))*(sin(rp_ang))+((linewid/6/4)*((-2)))*(cos(rp_ang)))) \
           then to M4_xyO+(((linewid/6/4)*(6))*(cos(rp_ang)),((linewid/6/4)*(6))*(sin(rp_ang))) \
         then to last line.end
      [box invis ht linewid/6/4*2*2 wid linewid/6/4*6*2] at 2nd last line.c
      }
  
  
  
#
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~$$ R sub F$$~$" \
     at last [].n above };  
	line down Here.y then to S.Out
}
 left
   line invis  left
  rpoint__
  
   
          if linewid/6/4*6*2 > rp_len then { line invis to Here+((linewid/6/4*6*2)*(cos(rp_ang)),(linewid/6/4*6*2)*(sin(rp_ang)))
  rpoint__
  
    }
    M4_xyO: last line.c
    { line from last line.start to M4_xyO+(((linewid/6/4)*(-6))*(cos(rp_ang)),((linewid/6/4)*(-6))*(sin(rp_ang)))\
       then to M4_xyO+((((linewid/6/4)*(-5))*(cos(rp_ang))+((linewid/6/4)*((2)))*((-sin(rp_ang)))),(((linewid/6/4)*(-5))*(sin(rp_ang))+((linewid/6/4)*((2)))*(cos(rp_ang)))) \
         then to M4_xyO+((((linewid/6/4)*(-3))*(cos(rp_ang))+((linewid/6/4)*((-2)))*((-sin(rp_ang)))),(((linewid/6/4)*(-3))*(sin(rp_ang))+((linewid/6/4)*((-2)))*(cos(rp_ang)))) \
   then to M4_xyO+(((-(linewid/6/4))*(cos(rp_ang))+((linewid/6/4)*((2)))*((-sin(rp_ang)))),((-(linewid/6/4))*(sin(rp_ang))+((linewid/6/4)*((2)))*(cos(rp_ang)))) \
         then to M4_xyO+(((linewid/6/4)*(cos(rp_ang))+((linewid/6/4)*((-2)))*((-sin(rp_ang)))),((linewid/6/4)*(sin(rp_ang))+((linewid/6/4)*((-2)))*(cos(rp_ang)))) \
   then to M4_xyO+((((linewid/6/4)*(3))*(cos(rp_ang))+((linewid/6/4)*((2)))*((-sin(rp_ang)))),(((linewid/6/4)*(3))*(sin(rp_ang))+((linewid/6/4)*((2)))*(cos(rp_ang)))) \
         then to M4_xyO+((((linewid/6/4)*(5))*(cos(rp_ang))+((linewid/6/4)*((-2)))*((-sin(rp_ang)))),(((linewid/6/4)*(5))*(sin(rp_ang))+((linewid/6/4)*((-2)))*(cos(rp_ang)))) \
           then to M4_xyO+(((linewid/6/4)*(6))*(cos(rp_ang)),((linewid/6/4)*(6))*(sin(rp_ang))) \
         then to last line.end
      [box invis ht linewid/6/4*2*2 wid linewid/6/4*6*2] at 2nd last line.c
      }
  
  
  
#
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~$$ R sub G$$~$" \
     at last [].t above };   # You can allign components by giving them *direction*_ argument
.PE 
.PS
# cct_init Version 9.6: Gpic m4 macro settings.
  
  # gen_init Version 9.6: Gpic m4 macro settings.
  

  define rpoint__ {
    rp_wid = last line.end.x-last line.start.x
    rp_ht = last line.end.y-last line.start.y
    rp_len = sqrt(max((rp_wid)^2+(rp_ht)^2,-((rp_wid)^2+(rp_ht)^2))); move to last line.start
    if (rp_len == 0) then { rp_ang=0 } else {    rp_ang = atan2(rp_ht,rp_wid) } }

  rtod_ = 57.295779513082323;  dtor_ = 0.017453292519943295
  twopi_ = 6.2831853071795862;  pi_ = (twopi_/2)
  rp_ang = 0;  right
  
  
  linethick = 0.8
  arrowwid = 0.05*scale; arrowht = 0.1*scale;
  
  linethick = 0.8
  # gen_init end

  

# cct_init end

line invis  down
  rpoint__
  
   
  { line to Here+((rp_len/2-(0.25*linewid))*(cos(rp_ang)),(rp_len/2-(0.25*linewid))*(sin(rp_ang)))
    move to Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang)))
  { Src_C: circle rad (0.25*linewid)  at Here }
  
  line from Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang))) \
          to Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang)))}
  { [box invis wid (0.25*linewid)*2 ht (0.25*linewid)*2] at Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang))) } 
  line to Here+((rp_len)*(cos(rp_ang)),(rp_len)*(sin(rp_ang))) invis ;  {"$~$$ -$$~$" \
     at last [].n rjust above }; {"$~$$ v$$~$" \
     at last [].l rjust }; {"$~$$ +$$~$" \
     at last [].s rjust below }; 
.PE

.PS
# cct_init Version 9.6: Gpic m4 macro settings.
  
  # gen_init Version 9.6: Gpic m4 macro settings.
  

  define rpoint__ {
    rp_wid = last line.end.x-last line.start.x
    rp_ht = last line.end.y-last line.start.y
    rp_len = sqrt(max((rp_wid)^2+(rp_ht)^2,-((rp_wid)^2+(rp_ht)^2))); move to last line.start
    if (rp_len == 0) then { rp_ang=0 } else {    rp_ang = atan2(rp_ht,rp_wid) } }

  rtod_ = 57.295779513082323;  dtor_ = 0.017453292519943295
  twopi_ = 6.2831853071795862;  pi_ = (twopi_/2)
  rp_ang = 0;  right
  
  
  linethick = 0.8
  arrowwid = 0.05*scale; arrowht = 0.1*scale;
  
  linethick = 0.8
  # gen_init end

  

# cct_init end

Origin : Here
S : [  line invis to Here+(max((1.5*linewid)-linewid/4,linewid),0)
  rpoint__
  
   
 W: Here
 N: ((linewid/2)*((-sin(rp_ang))),(linewid/2)*(cos(rp_ang)))
 S: ((-linewid/2)*((-sin(rp_ang))),(-linewid/2)*(cos(rp_ang)))
 E: ((linewid)*(cos(rp_ang)),(linewid)*(sin(rp_ang)))
 C: ((linewid/2)*(cos(rp_ang)),(linewid/2)*(sin(rp_ang)))
 { line to N then to E then to S then to W; move to E
   if rp_len > linewid then { line to Here+((rp_len-linewid)*(cos(rp_ang)),(rp_len-linewid)*(sin(rp_ang))) }
 Out: Here }
 NE: (((linewid/2)*(cos(rp_ang))+(linewid/4)*((-sin(rp_ang)))),((linewid/2)*(sin(rp_ang))+(linewid/4)*(cos(rp_ang)))); E1: NE
 SE: (((linewid/2)*(cos(rp_ang))+(-linewid/4)*((-sin(rp_ang)))),((linewid/2)*(sin(rp_ang))+(-linewid/4)*(cos(rp_ang)))); E2: SE
 In1: ((linewid/4)*((-sin(rp_ang))),(linewid/4)*(cos(rp_ang)))
 In2: ((-linewid/4)*((-sin(rp_ang))),(-linewid/4)*(cos(rp_ang)))
   { move to In1
     "$-$" \
       at Here+((4*(scale/72.27))*(cos(rp_ang)),(4*(scale/72.27))*(sin(rp_ang))) }
   { move to In2
     "$+$" \
       at Here+((4*(scale/72.27))*(cos(rp_ang)),(4*(scale/72.27))*(sin(rp_ang))) }
 
  ] 
line left 0.1 from S.In1
{
	   line invis  left
  rpoint__
  
   
          if linewid/6/4*6*2 > rp_len then { line invis to Here+((linewid/6/4*6*2)*(cos(rp_ang)),(linewid/6/4*6*2)*(sin(rp_ang)))
  rpoint__
  
    }
    M4_xyO: last line.c
    { line from last line.start to M4_xyO+(((linewid/6/4)*(-6))*(cos(rp_ang)),((linewid/6/4)*(-6))*(sin(rp_ang)))\
       then to M4_xyO+((((linewid/6/4)*(-5))*(cos(rp_ang))+((linewid/6/4)*((2)))*((-sin(rp_ang)))),(((linewid/6/4)*(-5))*(sin(rp_ang))+((linewid/6/4)*((2)))*(cos(rp_ang)))) \
         then to M4_xyO+((((linewid/6/4)*(-3))*(cos(rp_ang))+((linewid/6/4)*((-2)))*((-sin(rp_ang)))),(((linewid/6/4)*(-3))*(sin(rp_ang))+((linewid/6/4)*((-2)))*(cos(rp_ang)))) \
   then to M4_xyO+(((-(linewid/6/4))*(cos(rp_ang))+((linewid/6/4)*((2)))*((-sin(rp_ang)))),((-(linewid/6/4))*(sin(rp_ang))+((linewid/6/4)*((2)))*(cos(rp_ang)))) \
         then to M4_xyO+(((linewid/6/4)*(cos(rp_ang))+((linewid/6/4)*((-2)))*((-sin(rp_ang)))),((linewid/6/4)*(sin(rp_ang))+((linewid/6/4)*((-2)))*(cos(rp_ang)))) \
   then to M4_xyO+((((linewid/6/4)*(3))*(cos(rp_ang))+((linewid/6/4)*((2)))*((-sin(rp_ang)))),(((linewid/6/4)*(3))*(sin(rp_ang))+((linewid/6/4)*((2)))*(cos(rp_ang)))) \
         then to M4_xyO+((((linewid/6/4)*(5))*(cos(rp_ang))+((linewid/6/4)*((-2)))*((-sin(rp_ang)))),(((linewid/6/4)*(5))*(sin(rp_ang))+((linewid/6/4)*((-2)))*(cos(rp_ang)))) \
           then to M4_xyO+(((linewid/6/4)*(6))*(cos(rp_ang)),((linewid/6/4)*(6))*(sin(rp_ang))) \
         then to last line.end
      [box invis ht linewid/6/4*2*2 wid linewid/6/4*6*2] at 2nd last line.c
      }
  
  
  
#
  line invis from 2nd last line.start to 2nd last line.end 
	box invis ht 0 wid 0 with .c at Here
    {  m4sd_ang = rp_ang; rp_ang = (-90)*(dtor_)  ; 
  line from last box.c to Here+((linewid/4)*(cos(rp_ang)),(linewid/4)*(sin(rp_ang)))
  {line from Here+((linewid/6)*((-sin(rp_ang))),(linewid/6)*(cos(rp_ang))) \
          to Here+((-linewid/6)*((-sin(rp_ang))),(-linewid/6)*(cos(rp_ang)))}
   {line from Here+(((linewid/16)*(cos(rp_ang))+(linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(linewid/9)*(cos(rp_ang)))) \
          to Here+(((linewid/16)*(cos(rp_ang))+(-linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(-linewid/9)*(cos(rp_ang))))}
   line from Here+(((2*linewid/16)*(cos(rp_ang))+(linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(linewid/14)*(cos(rp_ang)))) \
          to Here+(((2*linewid/16)*(cos(rp_ang))+(-linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(-linewid/14)*(cos(rp_ang))))
    left ; rp_ang = m4sd_ang
  } 
}
line up 0.2 
R :    line invis  right
  rpoint__
  
   
          if linewid/6/4*6*2 > rp_len then { line invis to Here+((linewid/6/4*6*2)*(cos(rp_ang)),(linewid/6/4*6*2)*(sin(rp_ang)))
  rpoint__
  
    }
    M4_xyO: last line.c
    { line from last line.start to M4_xyO+(((linewid/6/4)*(-6))*(cos(rp_ang)),((linewid/6/4)*(-6))*(sin(rp_ang)))\
       then to M4_xyO+((((linewid/6/4)*(-5))*(cos(rp_ang))+((linewid/6/4)*((2)))*((-sin(rp_ang)))),(((linewid/6/4)*(-5))*(sin(rp_ang))+((linewid/6/4)*((2)))*(cos(rp_ang)))) \
         then to M4_xyO+((((linewid/6/4)*(-3))*(cos(rp_ang))+((linewid/6/4)*((-2)))*((-sin(rp_ang)))),(((linewid/6/4)*(-3))*(sin(rp_ang))+((linewid/6/4)*((-2)))*(cos(rp_ang)))) \
   then to M4_xyO+(((-(linewid/6/4))*(cos(rp_ang))+((linewid/6/4)*((2)))*((-sin(rp_ang)))),((-(linewid/6/4))*(sin(rp_ang))+((linewid/6/4)*((2)))*(cos(rp_ang)))) \
         then to M4_xyO+(((linewid/6/4)*(cos(rp_ang))+((linewid/6/4)*((-2)))*((-sin(rp_ang)))),((linewid/6/4)*(sin(rp_ang))+((linewid/6/4)*((-2)))*(cos(rp_ang)))) \
   then to M4_xyO+((((linewid/6/4)*(3))*(cos(rp_ang))+((linewid/6/4)*((2)))*((-sin(rp_ang)))),(((linewid/6/4)*(3))*(sin(rp_ang))+((linewid/6/4)*((2)))*(cos(rp_ang)))) \
         then to M4_xyO+((((linewid/6/4)*(5))*(cos(rp_ang))+((linewid/6/4)*((-2)))*((-sin(rp_ang)))),(((linewid/6/4)*(5))*(sin(rp_ang))+((linewid/6/4)*((-2)))*(cos(rp_ang)))) \
           then to M4_xyO+(((linewid/6/4)*(6))*(cos(rp_ang)),((linewid/6/4)*(6))*(sin(rp_ang))) \
         then to last line.end
      [box invis ht linewid/6/4*2*2 wid linewid/6/4*6*2] at 2nd last line.c
      }
  
  
  
#
  line invis from 2nd last line.start to 2nd last line.end  
line right 0.2 then down R.y
line left from S.In2
[  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c;   {"$~$$ V sub in$$~$" \
     at last [].s below };  
move right 2           # try writing `move right 2 then to (Here.x, 0)` to understand when does pic save the Here variable
move to (Here.x, 0)
S2 : [  line invis to Here+((max((1.5*linewid)-linewid/4,linewid))*(cos(rp_ang)),(max((1.5*linewid)-linewid/4,linewid))*(sin(rp_ang)))
  rpoint__
  
   
 W: Here
 N: ((linewid/2)*((-sin(rp_ang))),(linewid/2)*(cos(rp_ang)))
 S: ((-linewid/2)*((-sin(rp_ang))),(-linewid/2)*(cos(rp_ang)))
 E: ((linewid)*(cos(rp_ang)),(linewid)*(sin(rp_ang)))
 C: ((linewid/2)*(cos(rp_ang)),(linewid/2)*(sin(rp_ang)))
 { line to N then to E then to S then to W; move to E
   if rp_len > linewid then { line to Here+((rp_len-linewid)*(cos(rp_ang)),(rp_len-linewid)*(sin(rp_ang))) }
 Out: Here }
 NE: (((linewid/2)*(cos(rp_ang))+(linewid/4)*((-sin(rp_ang)))),((linewid/2)*(sin(rp_ang))+(linewid/4)*(cos(rp_ang)))); E1: NE
 SE: (((linewid/2)*(cos(rp_ang))+(-linewid/4)*((-sin(rp_ang)))),((linewid/2)*(sin(rp_ang))+(-linewid/4)*(cos(rp_ang)))); E2: SE
 In1: ((linewid/4)*((-sin(rp_ang))),(linewid/4)*(cos(rp_ang)))
 In2: ((-linewid/4)*((-sin(rp_ang))),(-linewid/4)*(cos(rp_ang)))
   { move to In1
     "$-$" \
       at Here+((4*(scale/72.27))*(cos(rp_ang)),(4*(scale/72.27))*(sin(rp_ang))) }
   { move to In2
     "$+$" \
       at Here+((4*(scale/72.27))*(cos(rp_ang)),(4*(scale/72.27))*(sin(rp_ang))) }
 
  ]  
.PE
