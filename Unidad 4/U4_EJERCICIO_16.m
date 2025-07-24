close all; clear all; history -c; clc;
pkg load control;

s = tf('s');

% Sistema 1:
G1 = 10/(s^2 + 10);
rlocusx(G1);
% Sistema Inestable para todo k

% Sistema 2:
G2 = (10*s + 20)/(s^2 + 120*s + 10);
rlocusx(G2);
% Sistema Estable para todo k > 0

% Sistema 3:
G3 = 45/(s^3 + 12*s^2 + 10*s + 45);
rlocusx(G3);
% Sistema Estable para todo k < 1.67

% Sistema 4:
G4 = ((s + 10)*(s + 20))/((s + 1)*(s + 5));
rlocusx(G4);
% Sistema Estable para todo k > 0

% Sistema 5:
G5 = ((s + 10)*(s + 20))/((s - 1)*(s + 5));
rlocusx(G5);
% Sistema Estable para todo k > 0.026

% Sistema 6:
G6 = 1/(s + 10)*s/(s^2 + s + 1);
rlocusx(G6);
% Sistema Estable para todo k > 0
