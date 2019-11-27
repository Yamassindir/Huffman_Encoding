function [ source ] = alea( dico,proba )

% Génération d'une source tirée au hasard dans dico de 2 lettres, selon proba

n=length(proba);
r=rand(1);

if r<proba(1)                % proba(1) est la probabilité de la 1ère lettre
    source=dico(2,1);        % source = 1ère lettre
else
    source=dico(2,2);        % sinon, c'est la 2ème
end

% La séquence de caractères est stockée dans 'fichier_source_genereee.txt", en ASCII
[fid,message]=fopen('fichier_source_generee.txt','w')
count=fwrite(fid,source);
status=fclose(fid);

end

