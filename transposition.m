% Cette fonction transforme un spectre au format texte en signal audio.
% -----Prototype de la fonction------
% [audio] = transposition(spectre_nm, T, methode, fe)
%
% audio = signal de sortie
% spectre_nm = nom du tableau avec les informations du spectre
% T = durée (s) pendant laquelle le signal de sortie sera joué
% fe = fréquence d'échentillonage (Hz) valeur par défaut 44100 Hz
% methode = choix de la méthode de transposition
%   1 : Pseudo mélodie avec transposition linéaire
%   2 : Un seul son avec transposition linéaire
%  +3+ : Un seul son avec f1 = L1 ; f2 = 3/2L1 ; f3 = L3/L2 f2 ...

function [audio] = transposition(spectre_nm, T, methode, fe)
    
    %--------------------------
    % TRANSPOSITION
    %--------------------------
    Fmin = 500; Fmax = 6000; % Gamme de fréquences
    Lmin = 300; Lmax = 800; % Longueurs d'onde dans le domaine visible
    
    if nargin < 3
        methode = 3;
    end
    
    if methode == 1 || methode == 2 % Transposition linéaire
        a=(Fmax-Fmin)/(Lmax-Lmin);
        b=Fmax-a*Lmax;
        spectre_Hz = spectre_nm(:,1) * a + b;
    
    else % Transposition avec f2 tierce
        spectre_Hz = zeros(size(spectre_nm(:,1)));
        spectre_Hz(1) = spectre_nm(1,1);
        spectre_Hz(2) = (3/2) * spectre_Hz(1);
        for i = 3:length(spectre_Hz)
            spectre_Hz(i) = (spectre_nm(i,1)/spectre_nm(i-1,1)) * spectre_Hz(i-1);
        end
    end
    
    %--------------------------
    % SIGNAL AUDIO
    %--------------------------
    if nargin < 4
        fe = 44100;
    end
    
    if methode == 1 % Pseudo mélodie
        t = 0:1/fe:T/length(spectre_Hz);
        audio = [];
        for i = 1:length(spectre_Hz)
            audio = [audio sin(2*pi*spectre_Hz(i)*t)];
        end
        
    else % Un seul son
        t = 0:1/fe:T;
        audio = zeros(size(t));
        for i = 1:length(spectre_Hz)
            audio = audio + spectre_nm(i,2)*sin(2*pi*spectre_Hz(i)*t);
        end

        audio = audio/max(audio);
    end
    
end
