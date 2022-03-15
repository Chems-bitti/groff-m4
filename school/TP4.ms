./" TP4.pdf
.EQ
delim $$
.EN

.TL
3EE200
 TP n°4
 Amplificateur Source Commune
.AU
Chems-Eddine NAIMI
.AI
Sorbonne Université - Sciences et Ingénierie
 3e année de Licence Électronique, Énergie Électrique et Automatique
.PP
.bp
.NH 1 "Étude d'un montage amplificateur source commune à MOSFET et charge passive
.PP 
Cahier de charge :
.Ls B
.Li 
$V sub DS0 = 3~V$
.Li
$I sub DS0 = 1~mA$
.Le
.PP 
Caractèristiques du MOSFET :
.Ls B
.Li
$mu sub n C sub ox W over L = 640 mu S~~ +- 20%$
.Li
$|V sub T| = 1~V~~+-20%$
.Le
.PP
On réalise le montage suivant :

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

box invis ht 0 wid 0 with .c at Here
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
line invis  up
  rpoint__
  
   
  { line to Here+((rp_len/2-(0.25*linewid))*(cos(rp_ang)),(rp_len/2-(0.25*linewid))*(sin(rp_ang)))
    move to Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang)))
  { Src_C: circle rad (0.25*linewid)  at Here }
  {[ Origin: Here
     m4sd_ang = rp_ang; rp_ang = 0;  right; 
 Start: Here+(-(linewid/3)/2,0)
 End:   Here+((linewid/3)/2,0)
 
 { arc ccw to Start with .c at Here+(-(linewid/3)/4,-max((linewid/3)/4-(linewid/3)/3,0)) }
   { arc ccw to   End with .c at Here+((linewid/3)/4,max((linewid/3)/4-(linewid/3)/3,0)) }
 ;  up ; rp_ang = m4sd_ang
   ] with .Origin at Here}
  line from Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang))) \
          to Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang)))}
  { [box invis wid (0.25*linewid)*2 ht (0.25*linewid)*2] at Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang))) } 
  line to Here+((rp_len)*(cos(rp_ang)),(rp_len)*(sin(rp_ang))) invis ;  {"$~~$$ +$$~~$" \
     at last [].s rjust below }; {"$~~$$ V sub s$$~~$" \
     at last [].w rjust }; {"$~~$$ -$$~~$" \
     at last [].n rjust above }; ; line right 0.1
   line invis  right
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
     at last [].n above };  ;   {"$~~$$ 10~k Omega$$~~$" \
     at last [].s below };  
QN :         [ line invis  up
  rpoint__
  
   ; M4_xyO: last line.c

    S: last line.start; line from S to M4_xyO+(((linewid/10)*(-2))*(cos(rp_ang)),((linewid/10)*(-2))*(sin(rp_ang))) \
           then to M4_xyO+(((linewid/10)*(-2))*(cos(rp_ang)),((linewid/10)*(-2))*(sin(rp_ang)))+((linethick *(scale/72.27))*((-sin(rp_ang))),(linethick *(scale/72.27))*(cos(rp_ang)))
      D: S+((rp_len)*(cos(rp_ang)),(rp_len)*(sin(rp_ang))); line from D to M4_xyO+(((linewid/10)*(2))*(cos(rp_ang)),((linewid/10)*(2))*(sin(rp_ang))) \
         then to M4_xyO+(((linewid/10)*(2))*(cos(rp_ang)),((linewid/10)*(2))*(sin(rp_ang)))+((linethick *(scale/72.27))*((-sin(rp_ang))),(linethick *(scale/72.27))*(cos(rp_ang)))
  
  Dl: line from M4_xyO+(((linewid/10)*(2))*(cos(rp_ang)),((linewid/10)*(2))*(sin(rp_ang))) \
          to M4_xyO+((((linewid/10)*(2))*(cos(rp_ang))+((linewid/10)*((3.5)))*((-sin(rp_ang)))),(((linewid/10)*(2))*(sin(rp_ang))+((linewid/10)*((3.5)))*(cos(rp_ang))))
  
  Channel: line from M4_xyO+((((linewid/10)*(-2.5))*(cos(rp_ang))+((linewid/10)*((3.5)))*((-sin(rp_ang)))),(((linewid/10)*(-2.5))*(sin(rp_ang))+((linewid/10)*((3.5)))*(cos(rp_ang)))) \
          to M4_xyO+((((linewid/10)*(2.5))*(cos(rp_ang))+((linewid/10)*((3.5)))*((-sin(rp_ang)))),(((linewid/10)*(2.5))*(sin(rp_ang))+((linewid/10)*((3.5)))*(cos(rp_ang))))
  
  
  
  
   
   
   
   
  
  
  
  
  
  
  
  Sl: line from M4_xyO+(((linewid/10)*(-2))*(cos(rp_ang)),((linewid/10)*(-2))*(sin(rp_ang))) \
          to M4_xyO+((((linewid/10)*(-2))*(cos(rp_ang))+((linewid/10)*((3.5)))*((-sin(rp_ang)))),(((linewid/10)*(-2))*(sin(rp_ang))+((linewid/10)*((3.5)))*(cos(rp_ang))))
    arrow  ht linewid/10*10/6 wid linewid/10*10/9 <- \
      from M4_xyO+((((linewid/10)*(-2))*(cos(rp_ang))+((linewid/10)*((3.5/2)))*((-sin(rp_ang)))),(((linewid/10)*(-2))*(sin(rp_ang))+((linewid/10)*((3.5/2)))*(cos(rp_ang))))-((linewid/10*10/6/2)*((-sin(rp_ang))),(linewid/10*10/6/2)*(cos(rp_ang))) \
        to M4_xyO+((((linewid/10)*(-2))*(cos(rp_ang))+((linewid/10)*((3.5/2)))*((-sin(rp_ang)))),(((linewid/10)*(-2))*(sin(rp_ang))+((linewid/10)*((3.5/2)))*(cos(rp_ang))))+((linewid/10*10/6/2)*((-sin(rp_ang))),(linewid/10*10/6/2)*(cos(rp_ang))) 
  Tl: line from M4_xyO+((((linewid/10)*(-2))*(cos(rp_ang))+((linewid/10)*(((3.5+1))))*((-sin(rp_ang)))),(((linewid/10)*(-2))*(sin(rp_ang))+((linewid/10)*(((3.5+1))))*(cos(rp_ang)))) \
          to M4_xyO+((((linewid/10)*(2))*(cos(rp_ang))+((linewid/10)*(((3.5+1))))*((-sin(rp_ang)))),(((linewid/10)*(2))*(sin(rp_ang))+((linewid/10)*(((3.5+1))))*(cos(rp_ang))))
    
    Gl: line from M4_xyO+(((linewid/10)*(((3.5+1))))*((-sin(rp_ang))),((linewid/10)*(((3.5+1))))*(cos(rp_ang))) \
           to M4_xyO+(((linewid/10)*(((3.5+4))))*((-sin(rp_ang))),((linewid/10)*(((3.5+4))))*(cos(rp_ang))); G: Here
  
  
  ;  ] ;   {"$~~$$ Q sub N$$~~$" \
     at last [].r ljust };  
line down QN.S.y from QN.S; box invis ht 0 wid 0 with .c at Here
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
line up 0.1 from QN.D;[  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c;
{
line right 0.3; [  circle rad (0.04*linewid)  fill 1-((1) )   ] with .c at Here
  move to last [].c;   {"$~~$$ V sub out$$~~$" \
     at last [].r ljust };  

}
   line invis  up
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R sub D$$~~$" \
     at last [].r ljust };  ;   {"$~~$$ 2.2~k Omega$$~~$" \
     at last [].w rjust };  
line left then right 1; move up 0.1; "$+E$" 
.PE
.Fe
.NH 2 "Représentation du schéma équivalent du montage"
.Fs
.PS
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
line invis  up
  rpoint__
  
   
  { line to Here+((rp_len/2-(0.25*linewid))*(cos(rp_ang)),(rp_len/2-(0.25*linewid))*(sin(rp_ang)))
    move to Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang)))
  { Src_C: circle rad (0.25*linewid)  at Here }
  {[ Origin: Here
     m4sd_ang = rp_ang; rp_ang = 0;  right; 
 Start: Here+(-(linewid/3)/2,0)
 End:   Here+((linewid/3)/2,0)
 
 { arc ccw to Start with .c at Here+(-(linewid/3)/4,-max((linewid/3)/4-(linewid/3)/3,0)) }
   { arc ccw to   End with .c at Here+((linewid/3)/4,max((linewid/3)/4-(linewid/3)/3,0)) }
 ;  up ; rp_ang = m4sd_ang
   ] with .Origin at Here}
  line from Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang))) \
          to Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang)))}
  { [box invis wid (0.25*linewid)*2 ht (0.25*linewid)*2] at Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang))) } 
  line to Here+((rp_len)*(cos(rp_ang)),(rp_len)*(sin(rp_ang))) invis ;  {"$~~$$ +$$~~$" \
     at last [].s rjust below }; {"$~~$$ V sub s$$~~$" \
     at last [].w rjust }; {"$~~$$ -$$~~$" \
     at last [].n rjust above }; ; line right 0.1
   line invis  right
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
     at last [].n above };  ;   {"$~~$$ 10~k Omega$$~~$" \
     at last [].s below };  
line right 0.2; move up 0.1; "$G$"
move down 0.6; line right 0.3;
{
move left 0.3 then down 0.1; "$S$"
}
box invis ht 0 wid 0 with .c at Here
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
line right 0.3; line invis  up
  rpoint__
  
   
  line invis from last line.end to last line.start
  rpoint__
  
   
  { line to Here+((rp_len/2-(0.25*linewid))*(cos(rp_ang)),(rp_len/2-(0.25*linewid))*(sin(rp_ang)))
    move to Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang)))
  { Src_C: circle rad (0.25*linewid)  at Here }
  {arrow from Here+((-(0.25*linewid)*3/4)*(cos(rp_ang)),(-(0.25*linewid)*3/4)*(sin(rp_ang))) \
          to Here+(((0.25*linewid)*3/4)*(cos(rp_ang)),((0.25*linewid)*3/4)*(sin(rp_ang)))}
  line from Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang))) \
          to Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang)))}
  { [box invis wid (0.25*linewid)*2 ht (0.25*linewid)*2] at Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang))) } 
  line to Here+((rp_len)*(cos(rp_ang)),(rp_len)*(sin(rp_ang))) invis 
  rp_ht = -rp_ht; rp_wid = -rp_wid; rp_ang = rp_ang - pi_
  line invis to last line.start ;   {"$~~$$ g sub m V sub gs$$~~$" \
     at last [].r ljust };  ;
{
move up 0.1; "$D$"
}
line right 0.6; 
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ r sub ds$$~~$" \
     at last [].e ljust };  
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
line right 0.6;
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R sub D$$~~$" \
     at last [].e ljust };  
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
line right 0.2;[  circle rad (0.04*linewid)  fill 1-((1) )   ] with .c at Here
  move to last [].c;   {"$~~$$ V sub out$$~~$" \
     at last [].e ljust };  
.PE
.Fe
.EQ
A = V sub out over V sub s = -g sub m (r sub ds // R sub D )
.EN
.NH 2 "Calcul de $V sub GS0$, $g sub m$, et le gain $A$"
.PP
En théorie, le courant $I sub D$ doit valoir $1~mA$, le montage étant un amplificateur, on suppose que le transistor est en régime sature, d'où l'expression du courant est la suivante :
.EQ
I sub D = 1 over 2 mu sub n C sub ox W over L ( V sub GS0 - V sub Tn ) sup 2
.EN
.EQ
V sub GS0 = sqrt { {2 I sub D L} over {mu sub n C sub ox W} } + V sub Tn approx 2.77~V
.EN
De la même manière :
.EQ
g sub m = {2 I sub D} over {V sub GS0 - V sub Tn} approx 1.13 times 10 sup -3 S
.EN
Et enfin :
.EQ
A = - g sub m (r sub ds // R sub D )
.EN
Or $ r sub ds >> R sub D$, donc :
.EQ
A approx -g sub m R sub D approx -2.48
.EN
.NH 2 "Mesure de $V sub D0$ et $I sub D0$"
.PP
On réalise le circuit et on pose : $V sub s = 2~V$. On mesure $V sub D0$ et on
trouve $V sub D0 = 4.5~V$, on peut en déduire le courant circulants au bornes
de la resistance $R sub D$ qui est égale à $I sub D$ :
.EQ
I sub D = {E - V sub D} over {R sub D} approx 227~mu A
.EN
.NH 2 "Augmenter la valeur de $V sub G$ jusqu'à $V sub D = 3~V$
.PP
À $V sub G0 = 2.7~V$, $V sub D0 = 3~V$ et donc $I sub D0 approx 1~mA$, on peut considerer que le cahier de charges à été rempli.
.NH 2 "Mesure du gain à vide"
.PP
On met en entrée une tension sinusoïdale de fréquence $1~kHz$ et d'amplitude crête à crête $V
sub g sub pp = 1~V$, On mesure en sortie $V sub d sub pp = 2.6~V$, avec un
inversion de phase. On en déduit que :
.EQ
A = V sub in over V sub out = -2.6
.EN
.NH 2 "Calcul de la valeur de $g sub m$
.PP
$r sub ds$ étant trés grand devant $R sub D$, on peut le négliger et calculer $g sub m$ :
.EQ
A = -g sub m R sub D = -2.6 implies g sub m = 2.6 over R sub D approx 1.18~mS
.EN
.NH 2 "Mesure de $V sub in sub max$"
.PP
On augmente $V sub in$ jusqu'à la saturation, on trouve
.EQ
V sub in sub max approx 1.3~V
.EN
.NH 2 "Mesure du gain à charge"
.PP
On rajoute au montage précédent une capacité $C$ et une résistance $R sub L$ en série :
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

box invis ht 0 wid 0 with .c at Here
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
line invis  up
  rpoint__
  
   
  { line to Here+((rp_len/2-(0.25*linewid))*(cos(rp_ang)),(rp_len/2-(0.25*linewid))*(sin(rp_ang)))
    move to Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang)))
  { Src_C: circle rad (0.25*linewid)  at Here }
  {[ Origin: Here
     m4sd_ang = rp_ang; rp_ang = 0;  right; 
 Start: Here+(-(linewid/3)/2,0)
 End:   Here+((linewid/3)/2,0)
 
 { arc ccw to Start with .c at Here+(-(linewid/3)/4,-max((linewid/3)/4-(linewid/3)/3,0)) }
   { arc ccw to   End with .c at Here+((linewid/3)/4,max((linewid/3)/4-(linewid/3)/3,0)) }
 ;  up ; rp_ang = m4sd_ang
   ] with .Origin at Here}
  line from Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang))) \
          to Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang)))}
  { [box invis wid (0.25*linewid)*2 ht (0.25*linewid)*2] at Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang))) } 
  line to Here+((rp_len)*(cos(rp_ang)),(rp_len)*(sin(rp_ang))) invis ;  {"$~~$$ +$$~~$" \
     at last [].s rjust below }; {"$~~$$ V sub s$$~~$" \
     at last [].w rjust }; {"$~~$$ -$$~~$" \
     at last [].n rjust above }; ; line right 0.1
   line invis  right
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
     at last [].n above };  ;   {"$~~$$ 10~k Omega$$~~$" \
     at last [].s below };  
QN :         [ line invis  up
  rpoint__
  
   ; M4_xyO: last line.c

    S: last line.start; line from S to M4_xyO+(((linewid/10)*(-2))*(cos(rp_ang)),((linewid/10)*(-2))*(sin(rp_ang))) \
           then to M4_xyO+(((linewid/10)*(-2))*(cos(rp_ang)),((linewid/10)*(-2))*(sin(rp_ang)))+((linethick *(scale/72.27))*((-sin(rp_ang))),(linethick *(scale/72.27))*(cos(rp_ang)))
      D: S+((rp_len)*(cos(rp_ang)),(rp_len)*(sin(rp_ang))); line from D to M4_xyO+(((linewid/10)*(2))*(cos(rp_ang)),((linewid/10)*(2))*(sin(rp_ang))) \
         then to M4_xyO+(((linewid/10)*(2))*(cos(rp_ang)),((linewid/10)*(2))*(sin(rp_ang)))+((linethick *(scale/72.27))*((-sin(rp_ang))),(linethick *(scale/72.27))*(cos(rp_ang)))
  
  Dl: line from M4_xyO+(((linewid/10)*(2))*(cos(rp_ang)),((linewid/10)*(2))*(sin(rp_ang))) \
          to M4_xyO+((((linewid/10)*(2))*(cos(rp_ang))+((linewid/10)*((3.5)))*((-sin(rp_ang)))),(((linewid/10)*(2))*(sin(rp_ang))+((linewid/10)*((3.5)))*(cos(rp_ang))))
  
  Channel: line from M4_xyO+((((linewid/10)*(-2.5))*(cos(rp_ang))+((linewid/10)*((3.5)))*((-sin(rp_ang)))),(((linewid/10)*(-2.5))*(sin(rp_ang))+((linewid/10)*((3.5)))*(cos(rp_ang)))) \
          to M4_xyO+((((linewid/10)*(2.5))*(cos(rp_ang))+((linewid/10)*((3.5)))*((-sin(rp_ang)))),(((linewid/10)*(2.5))*(sin(rp_ang))+((linewid/10)*((3.5)))*(cos(rp_ang))))
  
  
  
  
   
   
   
   
  
  
  
  
  
  
  
  Sl: line from M4_xyO+(((linewid/10)*(-2))*(cos(rp_ang)),((linewid/10)*(-2))*(sin(rp_ang))) \
          to M4_xyO+((((linewid/10)*(-2))*(cos(rp_ang))+((linewid/10)*((3.5)))*((-sin(rp_ang)))),(((linewid/10)*(-2))*(sin(rp_ang))+((linewid/10)*((3.5)))*(cos(rp_ang))))
    arrow  ht linewid/10*10/6 wid linewid/10*10/9 <- \
      from M4_xyO+((((linewid/10)*(-2))*(cos(rp_ang))+((linewid/10)*((3.5/2)))*((-sin(rp_ang)))),(((linewid/10)*(-2))*(sin(rp_ang))+((linewid/10)*((3.5/2)))*(cos(rp_ang))))-((linewid/10*10/6/2)*((-sin(rp_ang))),(linewid/10*10/6/2)*(cos(rp_ang))) \
        to M4_xyO+((((linewid/10)*(-2))*(cos(rp_ang))+((linewid/10)*((3.5/2)))*((-sin(rp_ang)))),(((linewid/10)*(-2))*(sin(rp_ang))+((linewid/10)*((3.5/2)))*(cos(rp_ang))))+((linewid/10*10/6/2)*((-sin(rp_ang))),(linewid/10*10/6/2)*(cos(rp_ang))) 
  Tl: line from M4_xyO+((((linewid/10)*(-2))*(cos(rp_ang))+((linewid/10)*(((3.5+1))))*((-sin(rp_ang)))),(((linewid/10)*(-2))*(sin(rp_ang))+((linewid/10)*(((3.5+1))))*(cos(rp_ang)))) \
          to M4_xyO+((((linewid/10)*(2))*(cos(rp_ang))+((linewid/10)*(((3.5+1))))*((-sin(rp_ang)))),(((linewid/10)*(2))*(sin(rp_ang))+((linewid/10)*(((3.5+1))))*(cos(rp_ang))))
    
    Gl: line from M4_xyO+(((linewid/10)*(((3.5+1))))*((-sin(rp_ang))),((linewid/10)*(((3.5+1))))*(cos(rp_ang))) \
           to M4_xyO+(((linewid/10)*(((3.5+4))))*((-sin(rp_ang))),((linewid/10)*(((3.5+4))))*(cos(rp_ang))); G: Here
  
  
  ;  ] ;   {"$~~$$ Q sub N$$~~$" \
     at last [].r ljust };  
line down QN.S.y from QN.S; box invis ht 0 wid 0 with .c at Here
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
line up 0.1 from QN.D;[  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c;
{
line right 0.2;line invis  right
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
     at last [].n above };  
{
line right 0.3; [  circle rad (0.04*linewid)  fill 1-((1) )   ] with .c at Here
  move to last [].c;move right 0.2;"$V sub out$"
}
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
  line invis from 2nd last line.start to 2nd last line.end ;  {"$~~$$ R sub L$$~~$" \
     at last [].e ljust };  ;
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
   line invis  up
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R sub D$$~~$" \
     at last [].r ljust };  ;   {"$~~$$ 2.2~k Omega$$~~$" \
     at last [].w rjust };  
line left then right 1; move up 0.1; "$+E$" 
.PE
.Fe
Avec $R sub L = 1~k Omega$ et $C = 1~mu F$. Pour $V sub in sub pp = 1~V$,
l'amplitude de tension de sortie crête à crête $V sub out sub pp = 0.8~V$, on
en déduit que le gain en tension à charge vaut :
.EQ
A sub c approx 0.8
.EN
.NH 2 "Pourquoi peut-on négliger l'impédence du condensateur?"
.PP
À $f= 1~kHz$, le module de l'impédence du condensateur vaut :
.EQ
Z sub c = 1 over {C 2 pi f} approx 159 Omega << 2.2~k Omega
.EN
.NH 2 "Expression du gain en tension en charge en fonction du gain en tension à vide"
.PP
On peut faire le schéma équivalent du montage amplificateur :
.Fs
.PS
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
  } ; line invis  up
  rpoint__
  
   
  { line to Here+((rp_len/2-(0.25*linewid))*(cos(rp_ang)),(rp_len/2-(0.25*linewid))*(sin(rp_ang)))
    move to Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang)))
  { Src_C: circle rad (0.25*linewid)  at Here }
  
  line from Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang))) \
          to Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang)))}
  { [box invis wid (0.25*linewid)*2 ht (0.25*linewid)*2] at Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang))) } 
  line to Here+((rp_len)*(cos(rp_ang)),(rp_len)*(sin(rp_ang))) invis ;  {"$~~$$ +$$~~$" \
     at last [].s rjust below }; {"$~~$$ A V sub in$$~~$" \
     at last [].w rjust }; {"$~~$$ -$$~~$" \
     at last [].n rjust above }; ;
 line invis  right
  rpoint__
  
   
         {line to Here+((max(0,rp_len/2-linewid/2/2))*(cos(rp_ang)),(max(0,rp_len/2-linewid/2/2))*(sin(rp_ang)))
        line from Here+(((linewid/2))*(cos(rp_ang)),((linewid/2))*(sin(rp_ang))) \
    to Here+((((linewid/2))*(cos(rp_ang))+((linewid/5)/2)*((-sin(rp_ang)))),(((linewid/2))*(sin(rp_ang))+((linewid/5)/2)*(cos(rp_ang)))) \
    then to Here+(((linewid/5)/2)*((-sin(rp_ang))),((linewid/5)/2)*(cos(rp_ang))) \
    then to Here+((-(linewid/5)/2)*((-sin(rp_ang))),(-(linewid/5)/2)*(cos(rp_ang))) \
    then to Here+((((linewid/2))*(cos(rp_ang))+(-(linewid/5)/2)*((-sin(rp_ang)))),(((linewid/2))*(sin(rp_ang))+(-(linewid/5)/2)*(cos(rp_ang)))) \
    then to Here+(((linewid/2))*(cos(rp_ang)),((linewid/2))*(sin(rp_ang)))       
    line to Here+((max(0,rp_len/2-linewid/2/2))*(cos(rp_ang)),(max(0,rp_len/2-linewid/2/2))*(sin(rp_ang)))}
  {[box invis ht linewid/5 wid linewid/2] at Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang)))}
   line to Here+((rp_len)*(cos(rp_ang)),(rp_len)*(sin(rp_ang))) invis ;   {"$~~$$ Z sub out$$~~$" \
     at last [].n above };  ;
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R sub L$$~~$" \
     at last [].e ljust };  
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
line right
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R sub D$$~~$" \
     at last [].e ljust };  
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
{
line right 0.3; [  circle rad (0.04*linewid)  fill 1-((1) )   ] with .c at Here
  move to last [].c;   {"$~~$$ V sub out$$~~$" \
     at last [].e ljust };  
}
.PE
.Fe
.EQ
V sub out = {R sub L} over {Z sub out + R sub L} A V sub in
.EN
.EQ
A sub c = {R sub L} over {Z sub out + R sub L} A
.EN
.NH 2 "Déduire l'expression de $Z sub out$"
.EQ
Z sub out = {A R sub L V sub in - R sub L V sub out} over {V sub out}
.EN
Pour $A = 2.6$, $R sub L = 1~k Omega$, $ V sub in = 1$, $V sub out = 0.8$, on trouve :
.EQ
Z sub out = 2250 Omega approx R sub D
.EN
.NH 1 "Étude d'un montage amplificateur Source Commune à MOSFET et charge active"

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

box invis ht 0 wid 0 with .c at Here
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
line invis  up
  rpoint__
  
   
  { line to Here+((rp_len/2-(0.25*linewid))*(cos(rp_ang)),(rp_len/2-(0.25*linewid))*(sin(rp_ang)))
    move to Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang)))
  { Src_C: circle rad (0.25*linewid)  at Here }
  {[ Origin: Here
     m4sd_ang = rp_ang; rp_ang = 0;  right; 
 Start: Here+(-(linewid/3)/2,0)
 End:   Here+((linewid/3)/2,0)
 
 { arc ccw to Start with .c at Here+(-(linewid/3)/4,-max((linewid/3)/4-(linewid/3)/3,0)) }
   { arc ccw to   End with .c at Here+((linewid/3)/4,max((linewid/3)/4-(linewid/3)/3,0)) }
 ;  up ; rp_ang = m4sd_ang
   ] with .Origin at Here}
  line from Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang))) \
          to Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang)))}
  { [box invis wid (0.25*linewid)*2 ht (0.25*linewid)*2] at Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang))) } 
  line to Here+((rp_len)*(cos(rp_ang)),(rp_len)*(sin(rp_ang))) invis ;  {"$~~$$ +$$~~$" \
     at last [].s rjust below }; {"$~~$$ V sub s$$~~$" \
     at last [].w rjust }; {"$~~$$ -$$~~$" \
     at last [].n rjust above }; ; line right 0.1
   line invis  right
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
     at last [].n above };  ;   {"$~~$$ 10~k Omega$$~~$" \
     at last [].s below };  
QN :         [ line invis  up
  rpoint__
  
   ; M4_xyO: last line.c

    S: last line.start; line from S to M4_xyO+(((linewid/10)*(-2))*(cos(rp_ang)),((linewid/10)*(-2))*(sin(rp_ang))) \
           then to M4_xyO+(((linewid/10)*(-2))*(cos(rp_ang)),((linewid/10)*(-2))*(sin(rp_ang)))+((linethick *(scale/72.27))*((-sin(rp_ang))),(linethick *(scale/72.27))*(cos(rp_ang)))
      D: S+((rp_len)*(cos(rp_ang)),(rp_len)*(sin(rp_ang))); line from D to M4_xyO+(((linewid/10)*(2))*(cos(rp_ang)),((linewid/10)*(2))*(sin(rp_ang))) \
         then to M4_xyO+(((linewid/10)*(2))*(cos(rp_ang)),((linewid/10)*(2))*(sin(rp_ang)))+((linethick *(scale/72.27))*((-sin(rp_ang))),(linethick *(scale/72.27))*(cos(rp_ang)))
  
  Dl: line from M4_xyO+(((linewid/10)*(2))*(cos(rp_ang)),((linewid/10)*(2))*(sin(rp_ang))) \
          to M4_xyO+((((linewid/10)*(2))*(cos(rp_ang))+((linewid/10)*((3.5)))*((-sin(rp_ang)))),(((linewid/10)*(2))*(sin(rp_ang))+((linewid/10)*((3.5)))*(cos(rp_ang))))
  
  Channel: line from M4_xyO+((((linewid/10)*(-2.5))*(cos(rp_ang))+((linewid/10)*((3.5)))*((-sin(rp_ang)))),(((linewid/10)*(-2.5))*(sin(rp_ang))+((linewid/10)*((3.5)))*(cos(rp_ang)))) \
          to M4_xyO+((((linewid/10)*(2.5))*(cos(rp_ang))+((linewid/10)*((3.5)))*((-sin(rp_ang)))),(((linewid/10)*(2.5))*(sin(rp_ang))+((linewid/10)*((3.5)))*(cos(rp_ang))))
  
  
  
  
   
   
   
   
  
  
  
  
  
  
  
  Sl: line from M4_xyO+(((linewid/10)*(-2))*(cos(rp_ang)),((linewid/10)*(-2))*(sin(rp_ang))) \
          to M4_xyO+((((linewid/10)*(-2))*(cos(rp_ang))+((linewid/10)*((3.5)))*((-sin(rp_ang)))),(((linewid/10)*(-2))*(sin(rp_ang))+((linewid/10)*((3.5)))*(cos(rp_ang))))
    arrow  ht linewid/10*10/6 wid linewid/10*10/9 <- \
      from M4_xyO+((((linewid/10)*(-2))*(cos(rp_ang))+((linewid/10)*((3.5/2)))*((-sin(rp_ang)))),(((linewid/10)*(-2))*(sin(rp_ang))+((linewid/10)*((3.5/2)))*(cos(rp_ang))))-((linewid/10*10/6/2)*((-sin(rp_ang))),(linewid/10*10/6/2)*(cos(rp_ang))) \
        to M4_xyO+((((linewid/10)*(-2))*(cos(rp_ang))+((linewid/10)*((3.5/2)))*((-sin(rp_ang)))),(((linewid/10)*(-2))*(sin(rp_ang))+((linewid/10)*((3.5/2)))*(cos(rp_ang))))+((linewid/10*10/6/2)*((-sin(rp_ang))),(linewid/10*10/6/2)*(cos(rp_ang))) 
  Tl: line from M4_xyO+((((linewid/10)*(-2))*(cos(rp_ang))+((linewid/10)*(((3.5+1))))*((-sin(rp_ang)))),(((linewid/10)*(-2))*(sin(rp_ang))+((linewid/10)*(((3.5+1))))*(cos(rp_ang)))) \
          to M4_xyO+((((linewid/10)*(2))*(cos(rp_ang))+((linewid/10)*(((3.5+1))))*((-sin(rp_ang)))),(((linewid/10)*(2))*(sin(rp_ang))+((linewid/10)*(((3.5+1))))*(cos(rp_ang))))
    
    Gl: line from M4_xyO+(((linewid/10)*(((3.5+1))))*((-sin(rp_ang))),((linewid/10)*(((3.5+1))))*(cos(rp_ang))) \
           to M4_xyO+(((linewid/10)*(((3.5+4))))*((-sin(rp_ang))),((linewid/10)*(((3.5+4))))*(cos(rp_ang))); G: Here
  
  
  ;  ] ;   {"$~~$$ Q sub N$$~~$" \
     at last [].r ljust };  
line down QN.S.y from QN.S; box invis ht 0 wid 0 with .c at Here
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
line up 0.1 from QN.D;[  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c;
{
line right 0.3; [  circle rad (0.04*linewid)  fill 1-((1) )   ] with .c at Here
  move to last [].c;   {"$~~$$ V sub out$$~~$" \
     at last [].r ljust };  
}
QP :         [ line invis  down
  rpoint__
  
   ; M4_xyO: last line.c

    S: last line.start; line from S to M4_xyO+(((linewid/10)*(-2))*(cos(rp_ang)),((linewid/10)*(-2))*(sin(rp_ang))) \
           then to M4_xyO+(((linewid/10)*(-2))*(cos(rp_ang)),((linewid/10)*(-2))*(sin(rp_ang)))+((-linethick *(scale/72.27))*((-sin(rp_ang))),(-linethick *(scale/72.27))*(cos(rp_ang)))
      D: S+((rp_len)*(cos(rp_ang)),(rp_len)*(sin(rp_ang))); line from D to M4_xyO+(((linewid/10)*(2))*(cos(rp_ang)),((linewid/10)*(2))*(sin(rp_ang))) \
         then to M4_xyO+(((linewid/10)*(2))*(cos(rp_ang)),((linewid/10)*(2))*(sin(rp_ang)))+((-linethick *(scale/72.27))*((-sin(rp_ang))),(-linethick *(scale/72.27))*(cos(rp_ang)))
  
  Dl: line from M4_xyO+(((linewid/10)*(2))*(cos(rp_ang)),((linewid/10)*(2))*(sin(rp_ang))) \
          to M4_xyO+((((linewid/10)*(2))*(cos(rp_ang))+((linewid/10)*(-(3.5)))*((-sin(rp_ang)))),(((linewid/10)*(2))*(sin(rp_ang))+((linewid/10)*(-(3.5)))*(cos(rp_ang))))
  
  Channel: line from M4_xyO+((((linewid/10)*(-2.5))*(cos(rp_ang))+((linewid/10)*(-(3.5)))*((-sin(rp_ang)))),(((linewid/10)*(-2.5))*(sin(rp_ang))+((linewid/10)*(-(3.5)))*(cos(rp_ang)))) \
          to M4_xyO+((((linewid/10)*(2.5))*(cos(rp_ang))+((linewid/10)*(-(3.5)))*((-sin(rp_ang)))),(((linewid/10)*(2.5))*(sin(rp_ang))+((linewid/10)*(-(3.5)))*(cos(rp_ang))))
  
  
  
  
   
   
   
   
  
  
  
  
  
  
  
  Sl: line from M4_xyO+(((linewid/10)*(-2))*(cos(rp_ang)),((linewid/10)*(-2))*(sin(rp_ang))) \
          to M4_xyO+((((linewid/10)*(-2))*(cos(rp_ang))+((linewid/10)*(-(3.5)))*((-sin(rp_ang)))),(((linewid/10)*(-2))*(sin(rp_ang))+((linewid/10)*(-(3.5)))*(cos(rp_ang))))
    arrow  ht linewid/10*10/6 wid linewid/10*10/9  \
      from M4_xyO+((((linewid/10)*(-2))*(cos(rp_ang))+((linewid/10)*(-(3.5/2)))*((-sin(rp_ang)))),(((linewid/10)*(-2))*(sin(rp_ang))+((linewid/10)*(-(3.5/2)))*(cos(rp_ang))))-((-linewid/10*10/6/2)*((-sin(rp_ang))),(-linewid/10*10/6/2)*(cos(rp_ang))) \
        to M4_xyO+((((linewid/10)*(-2))*(cos(rp_ang))+((linewid/10)*(-(3.5/2)))*((-sin(rp_ang)))),(((linewid/10)*(-2))*(sin(rp_ang))+((linewid/10)*(-(3.5/2)))*(cos(rp_ang))))+((-linewid/10*10/6/2)*((-sin(rp_ang))),(-linewid/10*10/6/2)*(cos(rp_ang))) 
  Tl: line from M4_xyO+((((linewid/10)*(-2))*(cos(rp_ang))+((linewid/10)*(-((3.5+1))))*((-sin(rp_ang)))),(((linewid/10)*(-2))*(sin(rp_ang))+((linewid/10)*(-((3.5+1))))*(cos(rp_ang)))) \
          to M4_xyO+((((linewid/10)*(2))*(cos(rp_ang))+((linewid/10)*(-((3.5+1))))*((-sin(rp_ang)))),(((linewid/10)*(2))*(sin(rp_ang))+((linewid/10)*(-((3.5+1))))*(cos(rp_ang))))
    
    Gl: line from M4_xyO+(((linewid/10)*(-((3.5+1))))*((-sin(rp_ang))),((linewid/10)*(-((3.5+1))))*(cos(rp_ang))) \
           to M4_xyO+(((linewid/10)*(-((3.5+4))))*((-sin(rp_ang))),((linewid/10)*(-((3.5+4))))*(cos(rp_ang))); G: Here
  
  
  ;  ]  with .D at Here;   {"$~~$$ Q sub P$$~~$" \
     at last [].e ljust };  
line up 0.3 from QP.S then left then right 1; move up 0.1; "$+E$" 
line left from QP.G; [  circle rad (0.04*linewid)  fill 1-(0 )   ] with .c at Here
  move to last [].c;   {"$~~$$ V sub BIAS$$~~$" \
     at last [].l rjust };  
.PE
.Fe
.NH 2 "Schéma équivalent en courant alternatif"

.Fs
.PS
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
line invis  up
  rpoint__
  
   
  { line to Here+((rp_len/2-(0.25*linewid))*(cos(rp_ang)),(rp_len/2-(0.25*linewid))*(sin(rp_ang)))
    move to Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang)))
  { Src_C: circle rad (0.25*linewid)  at Here }
  {[ Origin: Here
     m4sd_ang = rp_ang; rp_ang = 0;  right; 
 Start: Here+(-(linewid/3)/2,0)
 End:   Here+((linewid/3)/2,0)
 
 { arc ccw to Start with .c at Here+(-(linewid/3)/4,-max((linewid/3)/4-(linewid/3)/3,0)) }
   { arc ccw to   End with .c at Here+((linewid/3)/4,max((linewid/3)/4-(linewid/3)/3,0)) }
 ;  up ; rp_ang = m4sd_ang
   ] with .Origin at Here}
  line from Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang))) \
          to Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang)))}
  { [box invis wid (0.25*linewid)*2 ht (0.25*linewid)*2] at Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang))) } 
  line to Here+((rp_len)*(cos(rp_ang)),(rp_len)*(sin(rp_ang))) invis ;  {"$~~$$ +$$~~$" \
     at last [].s rjust below }; {"$~~$$ V sub s$$~~$" \
     at last [].w rjust }; {"$~~$$ -$$~~$" \
     at last [].n rjust above }; ; line right 0.1
   line invis  right
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ R sub G$$~~$" \
     at last [].n above };  ;   {"$~~$$ 10~k Omega$$~~$" \
     at last [].s below };  
line right 0.2; move up 0.1; "$G$"
move down 0.6; line right 0.3;
{
move left 0.3 then down 0.1; "$S$"
}
box invis ht 0 wid 0 with .c at Here
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
line right 0.3; line invis  up
  rpoint__
  
   
  line invis from last line.end to last line.start
  rpoint__
  
   
  { line to Here+((rp_len/2-(0.25*linewid))*(cos(rp_ang)),(rp_len/2-(0.25*linewid))*(sin(rp_ang)))
    move to Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang)))
  { Src_C: circle rad (0.25*linewid)  at Here }
  {arrow from Here+((-(0.25*linewid)*3/4)*(cos(rp_ang)),(-(0.25*linewid)*3/4)*(sin(rp_ang))) \
          to Here+(((0.25*linewid)*3/4)*(cos(rp_ang)),((0.25*linewid)*3/4)*(sin(rp_ang)))}
  line from Here+(((0.25*linewid))*(cos(rp_ang)),((0.25*linewid))*(sin(rp_ang))) \
          to Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang)))}
  { [box invis wid (0.25*linewid)*2 ht (0.25*linewid)*2] at Here+((rp_len/2)*(cos(rp_ang)),(rp_len/2)*(sin(rp_ang))) } 
  line to Here+((rp_len)*(cos(rp_ang)),(rp_len)*(sin(rp_ang))) invis 
  rp_ht = -rp_ht; rp_wid = -rp_wid; rp_ang = rp_ang - pi_
  line invis to last line.start ;   {"$~~$$ g sub m V sub gs$$~~$" \
     at last [].r ljust };  ;
{
move up 0.1; "$D$"
}
line right 0.6; 
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ r sub ds$$~~$" \
     at last [].e ljust };  
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
line right 0.6;
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
  line invis from 2nd last line.start to 2nd last line.end ;   {"$~~$$ r sub ds$$~~$" \
     at last [].e ljust };  
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
line right 0.2;[  circle rad (0.04*linewid)  fill 1-((1) )   ] with .c at Here
  move to last [].c;   {"$~~$$ V sub out$$~~$" \
     at last [].e ljust };  
.PE
.Fe
.NH 2 "Trouver $V sub BIAS$ pour que $V sub D0$ soit égal à $2.5~V$
.PP
On se met à $V sub G0 = 2.6~V$ (pour que $Q sub N$ soit passant) et on fait varier $V sub BIAS$ jusqu'à avoir $V sub D0 = 2.5~V$. On trouve :
.EQ
V sub BIAS = 2.26~V
.EN
.NH 2 "Trouver le gain à vide"
.PP
On met en entrée un signal de fréquence $f= 1~k Omega$ et d'amplitude crête à crête $V sub in sub pp = 200~mV$, on obtient en sortie $V sub out sub pp = 2.8~V$, on calcule le gain à vide :
.EQ
A = V sub out over V sub in = -14
.EN
.NH 2 "Trouver $r sub ds$ et $V sub AF$"
.PP
On a :
.EQ
V sub out = -g sub m r sub ds over 2 V sub gs
.EN
.EQ
r sub ds = 2 |A| over g sub m approx 25~k Omega
.EN
On sait que $r sub ds = V sub AF over I sub d$, donc :
.EQ
V sub AF = I sub D times r sub ds = 25~V
.EN

