function [ source ] = sourceindependantev2( dico,proba, N )
%tirage de N lettres, de mani�re ind�pendnates
%   selon dico, et proba


for i=1:N
    r=rand(1);
    j=1;
    seuil=0;
    while r>=seuil+proba(j)  % On cherche l'intervalle dans [0,1] dans lequel
                              % se situe le nombre tir� r (Monte Carlo)
        seuil=seuil+proba(j);
        j=j+1;                 % Et j est le num�ro de la lettre tir�e
    end
    numero=j;    % j est le numero de la lettre tir�e, et l'on met � jour
    source(i)=char(dico(2,numero)); % on stocke dans sortie, les N lettres tir�es
end




% La s�quence de caract�res est stock�e dans 'fichier_source_genereee.txt", en ASCII
[fid,message]=fopen('fichier_source_generee.txt','w')
count=fwrite(fid,source);
status=fclose(fid);


end

