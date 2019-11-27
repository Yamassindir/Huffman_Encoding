function [ source ] = sourceindependante( dico,proba, N )
%tirage de N lettres, de manière indépendnates
%   selon dico, et proba
n=length(proba);

for i=1:N
r=rand(1);
if r<proba(1)                % proba(1) est la probabilité de la 1ère lettre
    source(i)=dico(2,1);        % source = 1ère lettre
else
    source(i)=dico(2,2);        % sinon, c'est la 2ème
end
end


% La séquence de caractères est stockée dans 'fichier_source_genereee.txt", en ASCII
[fid,message]=fopen('fichier_source_generee.txt','w')
count=fwrite(fid,source);
status=fclose(fid);


end

