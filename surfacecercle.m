function [ surface ] = surfacecercle( R,N )
% Algorithme de Monte-Carlo pour calculer
%   la surface d'un cercle de rayon R
% N points sont tirés aléatoirement grâce à la fonction rand,
% dans un carré de côté 4R
% On comptabilise les ponits qui tombent dans la cible circulaire
% centrée au milieu du carré
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
% La proposrtion du nombre de fléchettes qui tombent dans 
% la cible circulaire tend, lorsque N est très grand, vers
% le rapport (Surface cible)/(Surface du carré)

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

