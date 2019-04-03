% Ce script permet de transformer un spectre de raies en un signal auible.
% Il est nécessaire d'indiquer le chemin du
% spectre de raies. Ce spectre doit être indiqué dans un tableau de deux
% colonnes, la première avec les longueurs d'onde (en  nm ou A), et la
% deuxième avec les amplitudes.
%----------Fonctions liées---------
% transposition.m
% tracerSpectre.m

clc; close all; clear variables;

%------------------------------
% Chargement du spectre
[filename, pathname] = uigetfile('*', 'Choisir le script');
name = [pathname filename];
spectre_nm = load(name);

%------------------------------
% Conversion du spectre
format = menu('Format des longueurs d''onde', 'nm', 'A');
if format == 2
    spectre_nm(:,1) = spectre_nm(:,1) * 0.1;
end

%------------------------------
% Tracé du spectre
tracerSpectre(spectre_nm, 0);

%------------------------------
% Transposition du spectre
fe = 44100; T = 3;
methode = 3;
audio = transposition(spectre_nm, T, methode, fe);

%------------------------------
% Lecture du signal
player = audioplayer(audio, fe);
playblocking(player)
clear player

%------------------------------
% Enregistrement du signal
%audiowrite('spectreAudio.wav', audio, 44100);
