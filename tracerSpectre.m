function tracerSpectre(spectre)
    
    Lmax=800; Lmin=300;

    REF = zeros((Lmax-Lmin),1); %Une case par longueur d'onde
    valeursREF = Lmin:Lmax-1; %Uniquement pour tracer à la bonne échelle
    
    for i = 1:length(REF)
        for n = 1:length(spectre)
           if ((spectre(n) > i+300) && (spectre(n) < i+301))
               REF(i) = REF(i) + 1;
           end
        end
    end
    
    plot(valeursREF, REF);
    
end