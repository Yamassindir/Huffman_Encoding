function [ sortie ] = metropolis1718( PI,N,Q,lettreinit,dico )
% ....
% ...
lettre=lettreinit;
% .....
i=1;
while lettre~=char(dico(2,i))
    i=i+1;
end
numero=i;
% ...    
n=1;
while n<=N
    %.....
    [ newlettre ] = sourcemarkov( 1,Q,dico,lettre ); 
       
    j=1;
    while newlettre~=char(dico(2,j))
        j=j+1;
    end
    newnumero=j;
    
    %.....
    ro=(PI(newnumero)*Q(newnumero,numero))/(PI(numero)*Q(numero,newnumero));
    if ro>=1
        sortie(n)=newlettre;    %....
    else
        U=rand(1);
        if U<ro
            sortie(n)=newlettre; %.....
        else
            sortie(n)=lettre;    % ...
        end
    end
    
    lettre=sortie(n);
   
    %  ....
    j=1;
    while lettre~=char(dico(2,j))
        j=j+1;
    end
    numero=j;
    
    n=n+1;
end

[fid,message]=fopen('fichier_source_generee.txt','w');
count=fwrite(fid,sortie);
status=fclose(fid);
end

