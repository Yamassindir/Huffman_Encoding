function [ source ] = alea( dico,proba )

% G�n�ration d'une source tir�e au hasard dans dico de 2 lettres, selon proba

n=length(proba);
r=rand(1);

if r<proba(1)                % proba(1) est la probabilit� de la 1�re lettre
    source=dico(2,1);        % source = 1�re lettre
else
    source=dico(2,2);        % sinon, c'est la 2�me
end

% La s�quence de caract�res est stock�e dans 'fichier_source_genereee.txt", en ASCII
[fid,message]=fopen('fichier_source_generee.txt','w')
count=fwrite(fid,source);
status=fclose(fid);

end

