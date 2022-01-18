.\" TD1.pdf
.EQ
delim $$
.EN
.TL 
TD N°1 
 L'AOP en mono-alimentation
.AU

.AI
Sorbonne Université - Sciences et Ingénierie
 3e année de licence Électronique, Énergie Électrique, et Automatique
.bp
.NH 1 "Exercice n°1 : Amplificateur inverseur"
.PP
On considère le montage amplificateur inverseur suivant, l'AOP étant parfait et
alimenté en $+10V/0V$ :
.Fs
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
line up 0.1 from S.E1;   {"$~~$$ +10V$$~~$" \
     at last [].n above };  
line down 0.1 from S.E2; box invis ht 0 wid 0 with .c at Here
    {  m4sd_ang = rp_ang; rp_ang = (-90)*(dtor_)  ; 
  line from last box.c to Here+((linewid/4)*(cos(rp_ang)),(linewid/4)*(sin(rp_ang)))
  {line from Here+((linewid/6)*((-sin(rp_ang))),(linewid/6)*(cos(rp_ang))) \
          to Here+((-linewid/6)*((-sin(rp_ang))),(-linewid/6)*(cos(rp_ang)))}
   {line from Here+(((linewid/16)*(cos(rp_ang))+(linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(linewid/9)*(cos(rp_ang)))) \
          to Here+(((linewid/16)*(cos(rp_ang))+(-linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(-linewid/9)*(cos(rp_ang))))}
   line from Here+(((2*linewid/16)*(cos(rp_ang))+(linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(linewid/14)*(cos(rp_ang)))) \
          to Here+(((2*linewid/16)*(cos(rp_ang))+(-linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(-linewid/14)*(cos(rp_ang))))
    right ; rp_ang = m4sd_ang
  } 
line right 0.2 from S.Out; [  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c;   {"$~~$$ V sub out$$~~$" \
     at last [].n above };  
line up 0.7 from S.Out then left 0.2; 
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R sub 2$$~~$" \
     at last [].t above };  ;   {"$~~$$ 10k Omega$$~~$" \
     at last [].s below };  ;
line left 0.2;     
  { move to last line.start+((((rp_len-last [].wid)/2*2/3+arrowht/3))*(cos(rp_ang)),(((rp_len-last [].wid)/2*2/3+arrowht/3))*(sin(rp_ang)))
    arrow <-  to Here+((-arrowht)*(cos(rp_ang)),(-arrowht)*(sin(rp_ang))) "$~~$$ i sub 1$$~~$" \
     below}; line down Here.y-S.In1.y; [  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c;  {"$~~$$ n$$~~$" \
     at last [].e above ljust };   ;
line left 0.2 from S.In2 then down 0.2; [  circle rad (0.04*linewid)  fill 1-((1) )   ] with .c at Here
  move to last [].c;   {"$~~$$ V sub ref1$$~~$" \
     at last [].s below };  ;
line left from S.In1;     
  { move to last line.start+((rp_len-    ((rp_len-last [].wid)/2*2/3+arrowht/3))*(cos(rp_ang)),(rp_len-    ((rp_len-last [].wid)/2*2/3+arrowht/3))*(sin(rp_ang)))
    arrow <-  to Here+((arrowht)*(cos(rp_ang)),(arrowht)*(sin(rp_ang))) "$~~$$ i sub 2$$~~$" \
     below};
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R sub 1$$~~$" \
     at last [].t above };  ;
  {"$~~$$ 1k Omega$$~~$" \
     at last [].s below };  
line down 0.2; line invis  down
  rpoint__
  
   
  { line to Here+((rp_len/2-(0.25*linewid))*(cos(rp_ang)),(rp_len/2-(0.25*linewid))*(sin(rp_ang)))
    move to Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang)))
  { Src_C: circle rad (0.25*linewid)  at Here }
  
  line from Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang))) \
          to Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang)))}
  { [box invis wid (0.25*linewid)*2 ht (0.25*linewid)*2] at Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang))) } 
  line to Here+((rp_len)*(cos(rp_ang)),(rp_len)*(sin(rp_ang))) invis ;  {"$~~$$ +$$~~$" \
     at last [].n rjust above }; {"$~~$$ V sub in$$~~$" \
     at last [].l rjust }; {"$~~$$ -$$~~$" \
     at last [].s rjust below }; ; [  circle rad (0.04*linewid)  fill 1-((1) )   ] with .c at Here
  move to last [].c;   {"$~~$$ V sub ref2$$~~$" \
     at last [].e ljust };   
.PE
.Fe ""
.IP 1)
Etablir l'expression de $V sub out$ en fonction de $A$, $V sub in$, $V sub ref1$, $V sub ref2$ et des éléments du montage :
.LP
Soit $V sup +$ et $V sup -$, $i sup +$, et $i sup -$ les tensions et courants aux port $+$
et $-$ de l'AOP, $V sub out$ est défini comme:
.EQ
V sub out = A ( V sup + - V sup - )
.EN
l'AOP étant parfait, donc $A -> + inf$, on sait que $V sup + = V sup -$, aussi $i
sup + = i sup - = 0$. En appliquant la loi des nœud au nœud "$n$", on obtient :
.EQ
i sub 1 + i sub 2 = i sup - = 0
.EN
.EQ
{V sub out - V sup -} over {R sub 2} + {V sub in + V sub ref2 - V sup -} over
{R sub 1} = 0
.EN
.EQ
{V sub out - V sup - } over {R sub 2} = - V sub in over R sub 1  - V sub ref2 over R sub 1 + V sup - over R sub 1
.EN
Or $V sup - = V sup + = V sub ref1$, alors :
.EQ
V sub out over R sub 2 = - V sub in over R sub 1 - V sub ref2 over R sub 1 + V sub ref1 ( 1 over R sub 1 + 1 over R sub 2 )
.EN
.EQ
V sub out = - R sub 2 over R sub 1 ( V sub in + V sub ref2 ) + {R sub 1 + R sub
2} over {R sub 1} V sub ref1 =
left { matrix {
lcol {
- R sub 2 over R sub 1 V sub in~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"En régime alternatif"
above
-R sub 2 over R sub 1 V sub ref2 + {R sub 1 + R sub 2 } over {R sub 1} V sub
ref1 	"En régime continue"
}
}
.EN
.NH 1 "Exercice n°2 : Inverseur et filtre
.Fs
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
line up 0.1 from S.E1;   {"$~~$$ +12V$$~~$" \
     at last [].n above };  
line down 0.1 from S.E2; box invis ht 0 wid 0 with .c at Here
    {  m4sd_ang = rp_ang; rp_ang = (-90)*(dtor_)  ; 
  line from last box.c to Here+((linewid/4)*(cos(rp_ang)),(linewid/4)*(sin(rp_ang)))
  {line from Here+((linewid/6)*((-sin(rp_ang))),(linewid/6)*(cos(rp_ang))) \
          to Here+((-linewid/6)*((-sin(rp_ang))),(-linewid/6)*(cos(rp_ang)))}
   {line from Here+(((linewid/16)*(cos(rp_ang))+(linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(linewid/9)*(cos(rp_ang)))) \
          to Here+(((linewid/16)*(cos(rp_ang))+(-linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(-linewid/9)*(cos(rp_ang))))}
   line from Here+(((2*linewid/16)*(cos(rp_ang))+(linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(linewid/14)*(cos(rp_ang)))) \
          to Here+(((2*linewid/16)*(cos(rp_ang))+(-linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(-linewid/14)*(cos(rp_ang))))
    right ; rp_ang = m4sd_ang
  } 
line right 0.2 from S.Out; [  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c;   {"$~~$$ V sub out$$~~$" \
     at last [].n above };  
line up 0.7 from S.Out then left 0.2; 
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R sub 2$$~~$" \
     at last [].t above };  
line left 0.2;     
  { move to last line.start+((((rp_len-last [].wid)/2*2/3+arrowht/3))*(cos(rp_ang)),(((rp_len-last [].wid)/2*2/3+arrowht/3))*(sin(rp_ang)))
    arrow <-  to Here+((-arrowht)*(cos(rp_ang)),(-arrowht)*(sin(rp_ang))) "$~~$$ i sub 1$$~~$" \
     below}; line down Here.y-S.In1.y; [  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c;  {"$~~$$ n$$~~$" \
     at last [].e above ljust };   ;
line left 0.2 from S.In2 
{
	   line invis  down
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
      [box invis wid linewid/6/4*2*2 ht linewid/6/4*6*2] at 2nd last line.c
      }
  
  
  
#
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R$$~~$" \
     at last [].e ljust };  
	[  circle rad (0.04*linewid)  fill 1-((1) )   ] with .c at Here
  move to last [].c;   {"$~~$$ V sub ref$$~~$" \
     at last [].e ljust };  
}
 left;line invis to Here+(((1.5*linewid))*((-1)),0)
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
  line to Here+((rp_len)*(cos(rp_ang)),(rp_len)*(sin(rp_ang))) invis ;   {"$~~$$ C$$~~$" \
     at last [].s below };  ; [  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c; up;   {"$~~$$ V sub in$$~~$" \
     at last [].w rjust };  
line left from S.In1;  left;    
  { move to last line.start+((rp_len-    ((rp_len-last [].wid)/2*2/3+arrowht/3))*((-1)),0)
    arrow <-  to Here+((arrowht)*((-1)),0) "$~~$$ i sub 2$$~~$" \
     above};
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R sub 1$$~~$" \
     at last [].t above };  ; [  circle rad (0.04*linewid)  fill 1-((1) )   ] with .c at Here
  move to last [].c;  up;  {"$~~$$ V sub ref$$~~$" \
     at last [].w rjust };  ;
.PE
.Fe ""
.IP 1) 
Analyse en courant continue :
.LP
En courant continue, le schéma équivalent est le suivant :

.Fs
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
line up 0.1 from S.E1;   {"$~~$$ +12V$$~~$" \
     at last [].n above };  
line down 0.1 from S.E2; box invis ht 0 wid 0 with .c at Here
    {  m4sd_ang = rp_ang; rp_ang = (-90)*(dtor_)  ; 
  line from last box.c to Here+((linewid/4)*(cos(rp_ang)),(linewid/4)*(sin(rp_ang)))
  {line from Here+((linewid/6)*((-sin(rp_ang))),(linewid/6)*(cos(rp_ang))) \
          to Here+((-linewid/6)*((-sin(rp_ang))),(-linewid/6)*(cos(rp_ang)))}
   {line from Here+(((linewid/16)*(cos(rp_ang))+(linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(linewid/9)*(cos(rp_ang)))) \
          to Here+(((linewid/16)*(cos(rp_ang))+(-linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(-linewid/9)*(cos(rp_ang))))}
   line from Here+(((2*linewid/16)*(cos(rp_ang))+(linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(linewid/14)*(cos(rp_ang)))) \
          to Here+(((2*linewid/16)*(cos(rp_ang))+(-linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(-linewid/14)*(cos(rp_ang))))
    right ; rp_ang = m4sd_ang
  } 
line right 0.2 from S.Out; [  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c;   {"$~~$$ V sub out$$~~$" \
     at last [].n above };  
line up 0.7 from S.Out then left 0.2; 
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R sub 2$$~~$" \
     at last [].t above };  
line left 0.2;     
  { move to last line.start+((((rp_len-last [].wid)/2*2/3+arrowht/3))*(cos(rp_ang)),(((rp_len-last [].wid)/2*2/3+arrowht/3))*(sin(rp_ang)))
    arrow <-  to Here+((-arrowht)*(cos(rp_ang)),(-arrowht)*(sin(rp_ang))) "$~~$$ i sub 1$$~~$" \
     below}; line down Here.y-S.In1.y; [  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c;  {"$~~$$ n$$~~$" \
     at last [].e above ljust };   ;
line left 0.2 from S.In2 
{
	   line invis  down
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
      [box invis wid linewid/6/4*2*2 ht linewid/6/4*6*2] at 2nd last line.c
      }
  
  
  
#
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R$$~~$" \
     at last [].e ljust };  
	[  circle rad (0.04*linewid)  fill 1-((1) )   ] with .c at Here
  move to last [].c;   {"$~~$$ V sub ref$$~~$" \
     at last [].e ljust };  
}
line left from S.In1;  left;    
  { move to last line.start+((rp_len-    ((rp_len-last [].wid)/2*2/3+arrowht/3))*((-1)),0)
    arrow <-  to Here+((arrowht)*((-1)),0) "$~~$$ i sub 2$$~~$" \
     above};
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R sub 1$$~~$" \
     at last [].t above };  ; [  circle rad (0.04*linewid)  fill 1-((1) )   ] with .c at Here
  move to last [].c;  up;  {"$~~$$ V sub ref$$~~$" \
     at last [].w rjust };  ;
.PE
.Fe ""
On pourra déterminer l'expression de $V sub out$ de la même manière qu'à
l'exercice 1, on retrouve :
.EQ
i sub 1 + i sub 2 = 0
.EN
.EQ
{V sub out - V sup -} over {R sub 2} = - 1 over R sub 1 ( V sub ref - V sup - )
.EN
.EQ
V sub out = - R sub 2 over R sub 1 V sub ref + R sub 2 V sup - ( 1 over R sub 2
+ 1 over R sub 1 ) = - R sub 2 over R sub 1 V sub ref + {R sub 1 + R sub 2 } over {R sub 1} V sup -
.EN
Or $V sup +  = V sup - = V sub ref$, alors :
.EQ
V sub out = V sub ref
.EN
.bp
.IP 2) 
Analyse en courant alternatif :
.LP
Le schéma
.Fs
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
S : [  line invis to Here+(max((1.5*linewid)-(0.7)/4,(0.7)),0)
  rpoint__
  
   
 W: Here
 N: (((0.7)/2)*((-sin(rp_ang))),((0.7)/2)*(cos(rp_ang)))
 S: ((-(0.7)/2)*((-sin(rp_ang))),(-(0.7)/2)*(cos(rp_ang)))
 E: (((0.7))*(cos(rp_ang)),((0.7))*(sin(rp_ang)))
 C: (((0.7)/2)*(cos(rp_ang)),((0.7)/2)*(sin(rp_ang)))
 { line to N then to E then to S then to W; move to E
   if rp_len > (0.7) then { line to Here+((rp_len-(0.7))*(cos(rp_ang)),(rp_len-(0.7))*(sin(rp_ang))) }
 Out: Here }
 NE: ((((0.7)/2)*(cos(rp_ang))+((0.7)/4)*((-sin(rp_ang)))),(((0.7)/2)*(sin(rp_ang))+((0.7)/4)*(cos(rp_ang)))); E1: NE
 SE: ((((0.7)/2)*(cos(rp_ang))+(-(0.7)/4)*((-sin(rp_ang)))),(((0.7)/2)*(sin(rp_ang))+(-(0.7)/4)*(cos(rp_ang)))); E2: SE
 In1: (((0.7)/4)*((-sin(rp_ang))),((0.7)/4)*(cos(rp_ang)))
 In2: ((-(0.7)/4)*((-sin(rp_ang))),(-(0.7)/4)*(cos(rp_ang)))
   { move to In1
     "$-$" \
       at Here+((4*(scale/72.27))*(cos(rp_ang)),(4*(scale/72.27))*(sin(rp_ang))) }
   { move to In2
     "$+$" \
       at Here+((4*(scale/72.27))*(cos(rp_ang)),(4*(scale/72.27))*(sin(rp_ang))) }
 
  ] 
line up 0.1 from S.E1;   {"$~~$$ +12V$$~~$" \
     at last [].n above };  
line down 0.1 from S.E2; box invis ht 0 wid 0 with .c at Here
    {  m4sd_ang = rp_ang; rp_ang = (-90)*(dtor_)  ; 
  line from last box.c to Here+((linewid/4)*(cos(rp_ang)),(linewid/4)*(sin(rp_ang)))
  {line from Here+((linewid/6)*((-sin(rp_ang))),(linewid/6)*(cos(rp_ang))) \
          to Here+((-linewid/6)*((-sin(rp_ang))),(-linewid/6)*(cos(rp_ang)))}
   {line from Here+(((linewid/16)*(cos(rp_ang))+(linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(linewid/9)*(cos(rp_ang)))) \
          to Here+(((linewid/16)*(cos(rp_ang))+(-linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(-linewid/9)*(cos(rp_ang))))}
   line from Here+(((2*linewid/16)*(cos(rp_ang))+(linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(linewid/14)*(cos(rp_ang)))) \
          to Here+(((2*linewid/16)*(cos(rp_ang))+(-linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(-linewid/14)*(cos(rp_ang))))
    right ; rp_ang = m4sd_ang
  } 
line right 0.2 from S.Out; [  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c;   {"$~~$$ V sub out$$~~$" \
     at last [].n above };  
line up 0.7 from S.Out then left 0.2; 
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R sub 2$$~~$" \
     at last [].t above };  
line left 0.2;     
  { move to last line.start+((((rp_len-last [].wid)/2*2/3+arrowht/3))*(cos(rp_ang)),(((rp_len-last [].wid)/2*2/3+arrowht/3))*(sin(rp_ang)))
    arrow <-  to Here+((-arrowht)*(cos(rp_ang)),(-arrowht)*(sin(rp_ang))) "$~~$$ i sub 1$$~~$" \
     below}; line down Here.y-S.In1.y; [  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c;  {"$~~$$ n$$~~$" \
     at last [].e above ljust };   ;
line left 0.2 from S.In2 
{
	   line invis  down
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
      [box invis wid linewid/6/4*2*2 ht linewid/6/4*6*2] at 2nd last line.c
      }
  
  
  
#
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R$$~~$" \
     at last [].l rjust };  
	box invis ht 0 wid 0 with .c at Here
    {  m4sd_ang = rp_ang; rp_ang = (-90)*(dtor_)  ; 
  line from last box.c to Here+((linewid/4)*(cos(rp_ang)),(linewid/4)*(sin(rp_ang)))
  {line from Here+((linewid/6)*((-sin(rp_ang))),(linewid/6)*(cos(rp_ang))) \
          to Here+((-linewid/6)*((-sin(rp_ang))),(-linewid/6)*(cos(rp_ang)))}
   {line from Here+(((linewid/16)*(cos(rp_ang))+(linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(linewid/9)*(cos(rp_ang)))) \
          to Here+(((linewid/16)*(cos(rp_ang))+(-linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(-linewid/9)*(cos(rp_ang))))}
   line from Here+(((2*linewid/16)*(cos(rp_ang))+(linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(linewid/14)*(cos(rp_ang)))) \
          to Here+(((2*linewid/16)*(cos(rp_ang))+(-linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(-linewid/14)*(cos(rp_ang))))
    down ; rp_ang = m4sd_ang
  } 
}
 left;line invis to Here+(((1.5*linewid))*((-1)),0)
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
  line to Here+((rp_len)*(cos(rp_ang)),(rp_len)*(sin(rp_ang))) invis ;   {"$~~$$ C$$~~$" \
     at last [].s below };  ; [  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c; up;   {"$~~$$ V sub in$$~~$" \
     at last [].w rjust };  
line left from S.In1;  left;    
  { move to last line.start+((rp_len-    ((rp_len-last [].wid)/2*2/3+arrowht/3))*((-1)),0)
    arrow <-  to Here+((arrowht)*((-1)),0) "$~~$$ i sub 2$$~~$" \
     above};
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R sub 1$$~~$" \
     at last [].t above };  ; box invis ht 0 wid 0 with .c at Here
    {  m4sd_ang = rp_ang; rp_ang = (-90)*(dtor_)  ; 
  line from last box.c to Here+((linewid/4)*(cos(rp_ang)),(linewid/4)*(sin(rp_ang)))
  {line from Here+((linewid/6)*((-sin(rp_ang))),(linewid/6)*(cos(rp_ang))) \
          to Here+((-linewid/6)*((-sin(rp_ang))),(-linewid/6)*(cos(rp_ang)))}
   {line from Here+(((linewid/16)*(cos(rp_ang))+(linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(linewid/9)*(cos(rp_ang)))) \
          to Here+(((linewid/16)*(cos(rp_ang))+(-linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(-linewid/9)*(cos(rp_ang))))}
   line from Here+(((2*linewid/16)*(cos(rp_ang))+(linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(linewid/14)*(cos(rp_ang)))) \
          to Here+(((2*linewid/16)*(cos(rp_ang))+(-linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(-linewid/14)*(cos(rp_ang))))
    left ; rp_ang = m4sd_ang
  } ;
.PE
.Fe ""
.LP
De la même façon qu'à la question précédente :
.EQ
i sub 1 + i sub 2 = 0
.EN
.EQ
{V sub out - V sup -} over {R sub 2} + {0 - V sup -} over {R sub 1} = 0
.EN
.EQ
V sub out over R sub 2 = V sup - ( {R sub 1 + R sub 2} over {R sub 1 R sub 2}
.EN
.EQ
V sub out = {R sub 1 + R sub 2 } over {R sub 1} V sup -
.EN
Or $V sup - = V sup +$ avec :
.EQ
V sup + = {R} over {R + 1 over {j omega C}} V sub in = {j omega RC} over {j
omega RC + 1} V sub in
.EN
On en déduit :
.EQ
V sub out = {R sub 1 + R sub 2} over {R sub 1} {j omega RC} over {1 + j omega RC} V sub in
.EN
La fonction de transfert du système sera alors : 
.EQ
H( omega ) = V sub out over V sub in = {R sub 1 + R sub 2} over {R sub 1} {j omega RC} over {1 + j omega RC}
.EN
.NH 1 "Exercice n°3 : Amplificateur non inverseur"
.PP 
On considère le montage de la figure suivante, l'AOP étant parfait, possédant un gain différentiel fini $A = 2 times 10 sup 5$ et alimenté en $+10V/-10V$
.Fs
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
line up 0.1 from S.E1;   {"$~~$$ +10V$$~~$" \
     at last [].n above };  
line down 0.1 from S.E2;   {"$~~$$ -10V$$~~$" \
     at last [].s below };  
line right 0.2 from S.Out; [  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c
{
	line up 0.1; [  circle rad (0.04*linewid)  fill 1-((1) )   ] with .c at Here
  move to last [].c;   {"$~~$$ V sub s$$~~$" \
     at last [].n above };  
}
 right;   line invis to Here+((1.5*linewid),0)
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R sub s$$~~$" \
     at last [].n above };  ;   {"$~~$$ 75 Omega$$~~$" \
     at last [].s below };  ;     
  { move to last line.start+((((rp_len-last [].wid)/2*2/3+arrowht/3))*(cos(rp_ang)),(((rp_len-last [].wid)/2*2/3+arrowht/3))*(sin(rp_ang)))
    arrow <-  to Here+((-arrowht)*(cos(rp_ang)),(-arrowht)*(sin(rp_ang))) "$~~$$ i sub s$$~~$" \
     above};
[  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c;
{
	{
		line right 0.1
		[  circle rad (0.04*linewid)  fill 1-((1) )   ] with .c at Here
  move to last [].c; up;   {"$~~$$ V sub out$$~~$" \
     at last [].r ljust };  
	}
	RL :    line invis  down
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
      [box invis wid linewid/6/4*2*2 ht linewid/6/4*6*2] at 2nd last line.c
      }
  
  
  
#
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R sub L$$~~$" \
     at last [].l rjust };  ;
	box invis ht 0 wid 0 with .c at Here
    {  m4sd_ang = rp_ang; rp_ang = (-90)*(dtor_)  ; 
  line from last box.c to Here+((linewid/4)*(cos(rp_ang)),(linewid/4)*(sin(rp_ang)))
  {line from Here+((linewid/6)*((-sin(rp_ang))),(linewid/6)*(cos(rp_ang))) \
          to Here+((-linewid/6)*((-sin(rp_ang))),(-linewid/6)*(cos(rp_ang)))}
   {line from Here+(((linewid/16)*(cos(rp_ang))+(linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(linewid/9)*(cos(rp_ang)))) \
          to Here+(((linewid/16)*(cos(rp_ang))+(-linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(-linewid/9)*(cos(rp_ang))))}
   line from Here+(((2*linewid/16)*(cos(rp_ang))+(linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(linewid/14)*(cos(rp_ang)))) \
          to Here+(((2*linewid/16)*(cos(rp_ang))+(-linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(-linewid/14)*(cos(rp_ang))))
    down ; rp_ang = m4sd_ang
  } ;
}
line up 0.7 then left RL.x-0.2
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R sub 2$$~~$" \
     at last [].t above };  ;   {"$~~$$ 10k Omega$$~~$" \
     at last [].s below };  ;
    
  { move to last line.start+((((rp_len-last [].wid)/2*(0.1)+arrowht/3))*(cos(rp_ang)),(((rp_len-last [].wid)/2*(0.1)+arrowht/3))*(sin(rp_ang)))
    arrow <-  to Here+((-arrowht)*(cos(rp_ang)),(-arrowht)*(sin(rp_ang))) "$~~$$ i sub 1$$~~$" \
     below}; line down Here.y-S.In1.y; [  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c;  {"$~~$$ n$$~~$" \
     at last [].e above ljust };   ;
line left 0.2 from S.In2 then down 0.2; [  circle rad (0.04*linewid)  fill 1-((1) )   ] with .c at Here
  move to last [].c;   {"$~~$$ V sub ref1$$~~$" \
     at last [].s below };  ;
line left from S.In1;     
  { move to last line.start+((rp_len-    ((rp_len-last [].wid)/2*2/3+arrowht/3))*(cos(rp_ang)),(rp_len-    ((rp_len-last [].wid)/2*2/3+arrowht/3))*(sin(rp_ang)))
    arrow <-  to Here+((arrowht)*(cos(rp_ang)),(arrowht)*(sin(rp_ang))) "$~~$$ i sub 2$$~~$" \
     below};
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R sub 1$$~~$" \
     at last [].t above };  ;
  {"$~~$$ 1k Omega$$~~$" \
     at last [].s below };  ; box invis ht 0 wid 0 with .c at Here
    {  m4sd_ang = rp_ang; rp_ang = (-90)*(dtor_)  ; 
  line from last box.c to Here+((linewid/4)*(cos(rp_ang)),(linewid/4)*(sin(rp_ang)))
  {line from Here+((linewid/6)*((-sin(rp_ang))),(linewid/6)*(cos(rp_ang))) \
          to Here+((-linewid/6)*((-sin(rp_ang))),(-linewid/6)*(cos(rp_ang)))}
   {line from Here+(((linewid/16)*(cos(rp_ang))+(linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(linewid/9)*(cos(rp_ang)))) \
          to Here+(((linewid/16)*(cos(rp_ang))+(-linewid/9)*((-sin(rp_ang)))),((linewid/16)*(sin(rp_ang))+(-linewid/9)*(cos(rp_ang))))}
   line from Here+(((2*linewid/16)*(cos(rp_ang))+(linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(linewid/14)*(cos(rp_ang)))) \
          to Here+(((2*linewid/16)*(cos(rp_ang))+(-linewid/14)*((-sin(rp_ang)))),((2*linewid/16)*(sin(rp_ang))+(-linewid/14)*(cos(rp_ang))))
    left ; rp_ang = m4sd_ang
  } ;
.PE
.Fe ""
On commence par calculer $V sup +$ et $V sup -$ :
.EQ
left { matrix {
lcol {
V sup + = V sub in 
above
V sup - = V sub R sub 1 = {R sub 1 } over {R sub 1 + R sub 2} V sub out
}
}
.EN
On sait que :
.EQ
V sub s  = A ( V sup + - V sup - ) = A ( V sub in - {R sub 1 } over {R sub 1 + R sub 2}V sub out
.EN
Et on sait que :
.EQ
V sub out = {( R sub 2 + R sub 1 )// R sub L } over {( R sub 2 + R sub 1 )// R sub L + Rs} V sub s 
.EN
Il suffit ensuite de remplacer $V sub s$ par son expression et faire l'application numérique
.tc

