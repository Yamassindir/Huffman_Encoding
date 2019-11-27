function [ source ] = sourceindependantev2( dico,proba, N )
%tirage de N lettres, de manière indépendnates
%   selon dico, et proba


for i=1:N
    r=rand(1);
    j=1;
    seuil=0;
    while r>=seuil+proba(j)  % On cherche l'intervalle dans [0,1] dans lequel
                              % se situe le nombre tiré r (Monte Carlo)
        seuil=seuil+proba(j);
        j=j+1;                 % Et j est le numéro de la lettre tirée
    end
    numero=j;    % j est le numero de la lettre tirée, et l'on met à jour
    source(i)=char(dico(2,numero)); % on stocke dans sortie, les N lettres tirées
end




% La séquence de caractères est stockée dans 'fichier_source_genereee.txt", en ASCII
[fid,message]=fopen('fichier_source_generee.txt','w')
count=fwrite(fid,source);
status=fclose(fid);


end

