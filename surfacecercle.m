function [ surface ] = surfacecercle( R,N )
% Algorithme de Monte-Carlo pour calculer
%   la surface d'un cercle de rayon R
% N points sont tir�s al�atoirement gr�ce � la fonction rand,
% dans un carr� de c�t� 4R
% On comptabilise les ponits qui tombent dans la cible circulaire
% centr�e au milieu du carr�
Ns=0;
j=1;
for i = 1:N
    x(i)=4*R*rand-2*R;
    y(i)=4*R*rand-2*R;
    
    if ((x(i))^2+(y(i))^2)^(1/2)<=R
        Ns=Ns+1;
        xx(j)=x(i);
        yy(j)=y(i);
        j=j+1;
    end
end
% La proposrtion du nombre de fl�chettes qui tombent dans 
% la cible circulaire tend, lorsque N est tr�s grand, vers
% le rapport (Surface cible)/(Surface du carr�)

surface=((4*R)^2)*(Ns/N);
% on dessine les tirs
plot(x,y,'*');
hold
% les tirs gagnants sont en rouge
plot(xx,yy,'*r')

for j=1:1000
    teta(j)=j*(2*pi/1000);
end
% on dessine le bord de la cible, en blanc
plot(R*cos(teta),R*sin(teta),'.w')
hold off
end

