function [resultats]=lettresproba

% Récupération du texte écrit via bloc notes, en fichier.txt : création d'un vecteur "texte" de taille N.
% Le nom de ce fichier est fichier_source_generee.txt

[fid , message] = fopen('fichier_source_generee.txt' , 'r');
[texte , N] = fread(fid);
status = fclose(fid);
%disp(setstr(texte'));

N=length(texte);


%/ calcul du dictionnaire (ou alphabet) et des fréqunces, puis probabilites

tailalphabet=1;
alphabet(:,1)=[1 ;texte(1)]; 
frequence(1)=1;

for i=2:N
   lettre=texte(i);
   test=0;
   for j=1:tailalphabet
      if lettre==alphabet(2,j)           % si une lettre est déjà dans l'alphabet,
         frequence(j)=frequence(j)+1;    % on incrémente de 1 son apparition
         test=1;
      end
   end
   if test==0
      tailalphabet=tailalphabet+1;       % sinon, on ajoute la lettre dans l'alphabet
      alphabet(:,tailalphabet)=[tailalphabet; lettre];
      frequence(tailalphabet)=1;
   end
end
resultats=alphabet(2,:);
			%L'alphabet est un vecteur de variables décimales correspondant aux codes ASCII, en décimal
resultats(2,:)=frequence/N; %probabilite est le vecteur de probabilites, ou plutôt de fréquences de chaque lettre dans le texte
char(resultats(1,:))
end



