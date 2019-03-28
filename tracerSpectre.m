function tracerSpectre(spectre)
    
    Lmax=800; Lmin=300;

    REF = zeros((Lmax-Lmin),1); %Une case par longueur d'onde
    valeursREF = Lmin:Lmax-1; %Uniquement pour tracer à la bonne échelle
    
    for i = 1:length(spectre)
        for n = 1:length(REF)
           if ((spectre(i) > n+Lmin) && (spectre(i) < n+(Lmin+1)))
               REF(n) = REF(n) + 1;
               REF(n+1) = REF(n+1) +1;
           end
        end
    end
    
    % Tracé de la figure
    figure;
    plot(valeursREF, REF);
    ylim([0.95 , 1]); set(gca,'ytick',[]); xlim([Lmin-10 , Lmax+10]);
    xlabel('Longueur d''onde en nm'); 
    title('Spectre de raies');
end