close all; clear all; history -c; clc;
pkg load symbolic;
syms G1 G2 H real;

F1 = G1/(1 + G1*H);
F2 = G2/(1 + G2);
eq1 = F1 == F2;
RES = solve(eq1, G2)
