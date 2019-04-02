%Cette fonction permet de tracer, et de transposer un spectre de raies en 
%un signal acoustique.
%---------Utilisation-----------
%Le spectre de raies doit être entré en paramètre de la
%fonction au travers d'un fichier texte. 
%Les différentes longueurs d'onde doivent être entrées ligne par ligne, 
%avec une décimale différente de 0, les amplitudes associées à ces
%longueurs d'onde doivent êtres inscrites après un espace.
%La fonction renvoie une figure représentant les différentes raies, et joue
%le son associé au spectre.
%---------Fonction liée---------
% tracerSpectre.m

function [spectre_nm, spectre_Hz] = transposition(spectre_txt)
close all;

    spectre_nm = load(spectre_txt); %Chargement du spectre
    
    tracerSpectre(spectre_nm); %Tracé du spectre entré dans la fonction
    
    %--------------------------
    % TRANSPOSITION
    %--------------------------
    Fmin = 500; Fmax = 6000;
    Lmin = 300; Lmax = 800;
    
    %--> Transposition en linéaire
    a=(Fmax-Fmin)/(Lmax-Lmin);
    b=Fmax-a*Lmax;
    spectre_Hz = spectre_nm(:,1) * a + b;
    
    %--------------------------
    % SIGNAL AUDIO
    %--------------------------
    fe = 44100; T = 1;
    t = 0:1/fe:T;
    
    audio = [];
    for i = 1:length(spectre_Hz)
        audio = [audio sin(2*pi*spectre_Hz(i)*t)];
    end
    
    player = audioplayer(audio, fe);
    playblocking(player)
    clear player
    
end
