function [ PI ] = gibbs( E,T )
% A partir d'un vecteur d'énergie E
%  et d'une température
% on calcule la mesure de Gibbs PI

n=length(E);
Z=0;
for i=1:n
    PI(i)=exp(-E(i)/T);
    Z=Z+PI(i);
end
PI=PI/Z;
end

