% Cette fonction transforme un spectre au format texte en signal audio.
% -----Prototype de la fonction------
% [audio] = transposition(spectre_nm, T, fe)
%
% audio = signal de sortie
% spectre_nm = nom du tableau avec les informations du spectre
% T = durée (s) pendant laquelle le signal de sortie sera joué
% fe = fréquence d'échentillonage (Hz) valeur par défaut 44100 Hz

function [audio] = transposition(spectre_nm, T, fe)
    
    %--------------------------
    % TRANSPOSITION
    %--------------------------
    Fmin = 500; Fmax = 6000;
    Lmin = 300; Lmax = 800;
    
    a=(Fmax-Fmin)/(Lmax-Lmin);
    b=Fmax-a*Lmax;
    spectre_Hz = spectre_nm(:,1) * a + b;
    
    %--------------------------
    % SIGNAL AUDIO
    %--------------------------
    if nargin < 3
        fe = 44100;
    end
    t = 0:1/fe:T;
    
    audio = zeros(size(t));
    for i = 1:length(spectre_Hz)
        audio = audio + spectre_nm(i,2)*sin(2*pi*spectre_Hz(i)*t);
    end
    
    audio = audio/max(audio);
    
end
