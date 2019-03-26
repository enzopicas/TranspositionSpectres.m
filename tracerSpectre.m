function tracerSpectre(spectre)
    
    Lmax=800; Lmin=300;

    REF = zeros((Lmax-Lmin),1); %Une case par longueur d'onde
    valeursREF = Lmin:Lmax-1; %Uniquement pour tracer à la bonne échelle
    
    for i = 1:length(REF)
        for n = 1:length(spectre)
           if ((spectre(n) > i+Lmin) && (spectre(n) < i+(Lmin+1)))
               REF(i) = REF(i) + 1;
               REF(i+1) = REF(i+1) +1;
           end
        end
    end
    
    figure;
    plot(valeursREF, REF); ylim([0.9 , 1]); xlim([300 , 800]);
    xlabel('Longueur d''onde en nm'); title('Spectre de raies');
    
end