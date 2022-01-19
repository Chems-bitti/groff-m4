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
cct_init
Origin : Here
S : opamp
line up 0.1 from S.E1; llabel(,+10V,)
line down 0.1 from S.E2; ground
line right 0.2 from S.Out; dot; llabel(,V sub out,)
line up 0.7 from S.Out then left 0.2; 
resistor(left_); rlabel(,R sub 2,); llabel(,10k Omega,);
line left 0.2; b_current(i sub 1); line down Here.y-S.In1.y; dot; rlabel(n,,);
line left 0.2 from S.In2 then down 0.2; dot(,,1); llabel(,V sub ref1,);
line left from S.In1; b_current(i sub 2,,,E);
resistor(left_); rlabel(,R sub 1,);
llabel(,1k Omega,)
line down 0.2; source(down_); rlabel(+,V sub in, -); dot(,,1); llabel(,V sub ref2,) 
.PE
.Fe "Test"
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
cct_init
Origin : Here
S : opamp
line up 0.1 from S.E1; llabel(,+12V,)
line down 0.1 from S.E2; ground
line right 0.2 from S.Out; dot; llabel(,V sub out,)
line up 0.7 from S.Out then left 0.2; 
resistor(left_); rlabel(,R sub 2,)
line left 0.2; b_current(i sub 1); line down Here.y-S.In1.y; dot; rlabel(n,,);
line left 0.2 from S.In2 
{
	resistor(down_); llabel(,R,)
	dot(,,1); llabel(,V sub ref)
}
left_;capacitor; llabel(,C); dot;up_; llabel(,V sub in)
line left from S.In1; left_;b_current(i sub 2,below_,,E);
resistor(left_); rlabel(,R sub 1,); dot(,,1); up_;llabel(, V sub ref);
.PE
.Fe "test2"
.IP 1) 
Analyse en courant continue :
.LP
En courant continue, le schéma équivalent est le suivant :

.Fs
.PS
cct_init
Origin : Here
S : opamp
line up 0.1 from S.E1; llabel(,+12V,)
line down 0.1 from S.E2; ground
line right 0.2 from S.Out; dot; llabel(,V sub out,)
line up 0.7 from S.Out then left 0.2; 
resistor(left_); rlabel(,R sub 2,)
line left 0.2; b_current(i sub 1); line down Here.y-S.In1.y; dot; rlabel(n,,);
line left 0.2 from S.In2 
{
	resistor(down_); llabel(,R,)
	dot(,,1); llabel(,V sub ref)
}
line left from S.In1; left_;b_current(i sub 2,below_,,E);
resistor(left_); rlabel(,R sub 1,); dot(,,1); up_;llabel(, V sub ref);
.PE
.Fe "test3"
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
cct_init
Origin : Here
S : opamp(,,,0.7)
line up 0.1 from S.E1; llabel(,+12V,)
line down 0.1 from S.E2; ground
line right 0.2 from S.Out; dot; llabel(,V sub out,)
line up 0.7 from S.Out then left 0.2; 
resistor(left_); rlabel(,R sub 2,)
line left 0.2; b_current(i sub 1); line down Here.y-S.In1.y; dot; rlabel(n,,);
line left 0.2 from S.In2 
{
	resistor(down_); rlabel(,R,)
	ground
}
left_;capacitor; llabel(,C); dot;up_; llabel(,V sub in)
line left from S.In1; left_;b_current(i sub 2,below_,,E);
resistor(left_); rlabel(,R sub 1,); ground;
.PE
.Fe "test4"
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
cct_init
Origin : Here
S : opamp
line up 0.1 from S.E1; llabel(,+10V,)
line down 0.1 from S.E2; rlabel(,-10V,)
line right 0.2 from S.Out; dot
{
	line up 0.1; dot(,,1); llabel(,V sub s)
}
right_;resistor(); llabel(, R sub s,); rlabel(,75 Omega); b_current(i sub s);
dot;
{
	{
		line right 0.1
		dot(,,1);up_; rlabel(,V sub out,)
	}
	RL : resistor(down_); rlabel(,R sub L);
	ground;
}
line up 0.7 then left RL.x-0.2
resistor(left_); rlabel(,R sub 2,); llabel(,10k Omega,);
b_current(i sub 1,,0,S, 0.1); line down Here.y-S.In1.y; dot; rlabel(n,,);
line left 0.2 from S.In2 then down 0.2; dot(,,1); llabel(,V sub ref1,);
line left from S.In1; b_current(i sub 2,,,E);
resistor(left_); rlabel(,R sub 1,);
llabel(,1k Omega,); ground;
.PE
.Fe "test5"
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
