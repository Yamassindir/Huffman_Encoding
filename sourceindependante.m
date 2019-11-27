function [ source ] = sourceindependante( dico,proba, N )
%tirage de N lettres, de mani�re ind�pendnates
%   selon dico, et proba
n=length(proba);

for i=1:N
r=rand(1);
if r<proba(1)                % proba(1) est la probabilit� de la 1�re lettre
    source(i)=dico(2,1);        % source = 1�re lettre
else
    source(i)=dico(2,2);        % sinon, c'est la 2�me
end
end


% La s�quence de caract�res est stock�e dans 'fichier_source_genereee.txt", en ASCII
[fid,message]=fopen('fichier_source_generee.txt','w')
count=fwrite(fid,source);
status=fclose(fid);


end

