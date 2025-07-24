close all; clear all; history -c; clc;
pkg load control;

s = tf('s')

G1 = 15/(5*s +1); step(G1) % K = 15 y el 98% de K es 14.7 tal que 4*T = 20 s y por lo tanto T = 5 s
G2 = 1/(5*s + 1); step(G2) % K = 1 y el 99% de K es 0.98 tal que 5*T = 25 s y por lo tanto T = 5 s
G3 = 1/(s + 5); step(G3) % K = 0.2 y el 99% de K es 0.198 tal que 5*T = 1 s y por lo tanto T = 0.20 s
G4 = 15/(s + 5); step(G4)
G5 = 15/(5*s + 1); step(G5)
G6 = 625/(s^2 + 60*s + 625); step(G6)
G7 = 1875/(s^2 + 60*s + 625); step(G7)
G8 = 1875/(s^2 + 60*s + 625); step(G8) %% G8.inputdelay = 0.1;
G9 = 1875/((s + 46.58)*(s + 13.42)); step(G9) %% G9.inputdelay = 0.1;
G10 = 187500/(s^2 + 600*s + 62500); step(G10)
G11 = 0.1875/(s^2 + 0.6s + 0.0625); step(G11)
G12 = 0.0625/(s^2 + 0.35s + 0.0625); step(G12)
G13 = 0.0625/(s^2 + 0.3s+ 0.0625); step(G13)
G14 = 0.0625/(s^2 + 0.3s + 0.0625); step(G14) %% G14.inputdelay = 5;
G15 = 0.1563/(s^2 + 0.3s + 0.0625); step(G15) %% G15.inputdelay = 5;
G16 = 0.0625/(s^2 + 0.0625); step(G16,50)
G17 = 0.25/(s^2 + 0.25); step(G17,50)
G18 = 0.5/(s^2 + 0.25); step(G18,50)
G19 = 2/(3*s + 1)^2; step(G19)
G20 = 2/(3*s + 1)^2; step(G20) %% G20.inputdelay = 4;
