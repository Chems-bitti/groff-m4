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
cct_init
ground
source(up_,AC); llabel(-,V sub s, +); line right 0.1
resistor(right_); llabel(,R sub s,); rlabel(,10~k Omega)
QN : e_fet(up_,,N,S); rlabel(,Q sub N,)
line down QN.S.y from QN.S; ground
line up 0.1 from QN.D;dot;
{
line right 0.3; dot(,,1); rlabel(,V sub out,)

}
resistor(up_); rlabel(, R sub D,); llabel(, 2.2~k Omega)
line left then right 1; move up 0.1; "$+E$" 
.PE
.Fe
.NH 2 "Représentation du schéma équivalent du montage"
.Fs
.PS
ground
source(up_,AC); llabel(-,V sub s, +); line right 0.1
resistor(right_); llabel(,R sub s,); rlabel(,10~k Omega)
line right 0.2; move up 0.1; "$G$"
move down 0.6; line right 0.3;
{
move left 0.3 then down 0.1; "$S$"
}
ground
line right 0.3; source(up_, I,,R); rlabel(,g sub m V sub gs);
{
move up 0.1; "$D$"
}
line right 0.6; 
{
resistor(down_); llabel(,r sub ds)
ground
}
line right 0.6;
{
resistor(down_); llabel(,R sub D)
ground
}
line right 0.2;dot(,,1); llabel(,V sub out)
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
cct_init
ground
source(up_,AC); llabel(-,V sub s, +); line right 0.1
resistor(right_); llabel(,R sub s,); rlabel(,10~k Omega)
QN : e_fet(up_,,N,S); rlabel(,Q sub N,)
line down QN.S.y from QN.S; ground
line up 0.1 from QN.D;dot;
{
line right 0.2;capacitor(right_); llabel(,C)
{
line right 0.3; dot(,,1);move right 0.2;"$V sub out$"
}
resistor(down_);llabel(,R sub L);
ground
}
resistor(up_); rlabel(, R sub D,); llabel(, 2.2~k Omega)
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
ground; source(up_); llabel(+,A V sub in, -);
resistor(right_,,E); llabel(,Z sub out);
{
resistor(down_); llabel(,R sub L)
ground
}
line right
{
resistor(down_); llabel(,R sub D)
ground
}
{
line right 0.3; dot(,,1); llabel(,V sub out)
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
cct_init
ground
source(up_,AC); llabel(-,V sub s, +); line right 0.1
resistor(right_); llabel(,R sub s,); rlabel(,10~k Omega)
QN : e_fet(up_,,N,S); rlabel(,Q sub N,)
line down QN.S.y from QN.S; ground
line up 0.1 from QN.D;dot;
{
line right 0.3; dot(,,1); rlabel(,V sub out,)
}
QP : e_fet(down_,R,P,S) with .D at Here; llabel(,Q sub P,)
line up 0.3 from QP.S then left then right 1; move up 0.1; "$+E$" 
line left from QP.G; dot; rlabel(,V sub BIAS)
.PE
.Fe
.NH 2 "Schéma équivalent en courant alternatif"

.Fs
.PS
ground
source(up_,AC); llabel(-,V sub s, +); line right 0.1
resistor(right_); llabel(,R sub G,); rlabel(,10~k Omega)
line right 0.2; move up 0.1; "$G$"
move down 0.6; line right 0.3;
{
move left 0.3 then down 0.1; "$S$"
}
ground
line right 0.3; source(up_, I,,R); rlabel(,g sub m V sub gs);
{
move up 0.1; "$D$"
}
line right 0.6; 
{
resistor(down_); llabel(,r sub ds)
ground
}
line right 0.6;
{
resistor(down_); llabel(,r sub ds)
ground
}
line right 0.2;dot(,,1); llabel(,V sub out)
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

