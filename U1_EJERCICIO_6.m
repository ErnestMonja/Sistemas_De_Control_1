close all; clear all; history -c; clc;
pkg load symbolic;

syms s t a w real;

g1 = laplace(dirac(t))
g2 = laplace(heaviside(t))
g3 = laplace(exp(-2*t))
g4 = laplace(7*exp(-5*t))
g5 = 1/s + laplace(exp(-2*t))
g6 = laplace(t*sin(2*t) + 3*exp(-10*t))
g7 = laplace(exp(-5*(t-2))*heaviside(t-2))
g8 = laplace(exp(-a*t)*cos(w*t))
