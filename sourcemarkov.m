function [ sortie ] = sourcemarkov( N,Q,dico,lettreinit )
% Création d'une chaine de Markov de longueur N,
% où les lettres sont piochées dans le dico,
% de matrice de transition Q,
% de lettre initiale transmise : lettreinit


% Récupération du numéro de la lettre initiale, lettreinit
i=1;
while lettreinit~=char(dico(2,i))
    i=i+1;
end
numero=i;   % Le 1er sommet a pour numero=i

% Cette 1ère lettre n'est pas enregistrée

% Boucle pour fabriquer une chaîne de N-1 sommets 
for i=1:N
    r=rand(1);     % on part de numero, Son vectur de probabilité est
                   % la ligne "numero" de Q
                   % on tire un nombre r et on cherche la "cible" avec la boucle while 
    cible=1;        % c'est à dire que l'on cherche   
    seuil=0;        % dans quel intervalle est r ? On déduit la "cible"
    while r>=seuil+Q(numero,cible)  % tirage d'une nouvelle lettre, si la précédente
        seuil=seuil+Q(numero,cible); % est numero
        cible=cible+1;    
    end
    numero=cible;    % On met à jour numero, avec cible, avant de recommencer
    sortie(i)=char(dico(2,numero)); % on stocke dans sortie, les N-1 lettres tirées
end
% La séquence de caractères est stockée dans 'fichier_source_generee.txt", en ASCII
[fid,message]=fopen('fichier_source_generee.txt','w');
count=fwrite(fid,sortie);
status=fclose(fid);

end
