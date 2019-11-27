function [ sortie ] = sourcemarkov( N,Q,dico,lettreinit )
% Cr�ation d'une chaine de Markov de longueur N,
% o� les lettres sont pioch�es dans le dico,
% de matrice de transition Q,
% de lettre initiale transmise : lettreinit


% R�cup�ration du num�ro de la lettre initiale, lettreinit
i=1;
while lettreinit~=char(dico(2,i))
    i=i+1;
end
numero=i;   % Le 1er sommet a pour numero=i

% Cette 1�re lettre n'est pas enregistr�e

% Boucle pour fabriquer une cha�ne de N-1 sommets 
for i=1:N
    r=rand(1);     % on part de numero, Son vectur de probabilit� est
                   % la ligne "numero" de Q
                   % on tire un nombre r et on cherche la "cible" avec la boucle while 
    cible=1;        % c'est � dire que l'on cherche   
    seuil=0;        % dans quel intervalle est r ? On d�duit la "cible"
    while r>=seuil+Q(numero,cible)  % tirage d'une nouvelle lettre, si la pr�c�dente
        seuil=seuil+Q(numero,cible); % est numero
        cible=cible+1;    
    end
    numero=cible;    % On met � jour numero, avec cible, avant de recommencer
    sortie(i)=char(dico(2,numero)); % on stocke dans sortie, les N-1 lettres tir�es
end
% La s�quence de caract�res est stock�e dans 'fichier_source_generee.txt", en ASCII
[fid,message]=fopen('fichier_source_generee.txt','w');
count=fwrite(fid,sortie);
status=fclose(fid);

end
