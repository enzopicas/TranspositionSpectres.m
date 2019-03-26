function [spectre_nm, spectre_Hz] = transposition(spectre_txt)
close all;

    spectre_nm = load(spectre_txt); %Chargement du spectre
    
    tracerSpectre(spectre_nm); %Tracé du spectre entré dans la fonction
    
    %--------------------------
    % TRANSPOSITION
    %--------------------------
    Fmin = 280; Fmax = 8000;
    Lmin = 300; Lmax = 800;
    
    %Calcul de la nouvelle échelle
    a=(Fmax-Fmin)/(Lmax-Lmin); %a=(log10(Fmax)-log10(Fmin))/(Lmax-Lmin);
    b=Fmax-a*Lmax;
    spectre_Hz = spectre_nm * a + b;
    
    %Fabrication du signal audio
    fe = 8000; N = 8192; t = (1:N)/fe;
    for i = 1:length(spectre_Hz)
        audio = sin(2*pi*spectre_Hz(i)*t);
        player = audioplayer(audio, fe);
        playblocking(player)
        clear player
    end
    
end