function tracerSpectre(spectre)
    
    Lmax=800; Lmin=300;

    REF = zeros((Lmax-Lmin),1); %Une case par longueur d'onde
    valeursREF = Lmin:Lmax-1; %Uniquement pour tracer à la bonne échelle x
    
    for i = 1:length(spectre)
        for n = 1:length(REF)
           if ((spectre(i,1) > n+Lmin) && (spectre(i,1) < n+(Lmin+1)))
               REF(n) = spectre(i,2);
           end
        end
    end
    
    %Tracé de la figure
    A = round(length(valeursREF)/3);
    B = round(2*length(valeursREF)/3);
    
    figure;
    hold on
    plot(valeursREF(1:A), REF(1:A),'b');
    plot(valeursREF(A:B), REF(A:B),'g');
    plot(valeursREF(B:end), REF(B:end),'r');
    hold off
    
    xlim([Lmin-10 , Lmax+10]);
    xlabel('Longueur d''onde en nm'); 
    ylabel('Amplitude des raies');
    title('Spectre de raies');
end