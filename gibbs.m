function [ PI ] = gibbs( E,T )
% A partir d'un vecteur d'�nergie E
%  et d'une temp�rature
% on calcule la mesure de Gibbs PI

n=length(E);
Z=0;
for i=1:n
    PI(i)=exp(-E(i)/T);
    Z=Z+PI(i);
end
PI=PI/Z;
end

