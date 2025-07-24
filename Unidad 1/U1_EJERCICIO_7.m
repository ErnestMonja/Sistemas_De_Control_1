close all; clear all; history -c; clc;
pkg load symbolic;

syms s t a w real;

G1 = ilaplace(2/(s+3))
G2 = ilaplace(1/(s*(s+2)*( s+3)))
G3 = ilaplace((6*s + 8)/(s*(s+1)*(s+2)))
G4 = ilaplace(10*s/(s^3 + 6*s^2 + 11*s + 6))
G5 = ilaplace(10/((s+3)*(s+1)^2))
G6 = ilaplace(w/((s+a)^2 + w^2))
G7 = ilaplace(9/(2*s^2 + 4*s + 4))
G8 = ilaplace((2*s + 12)/(s^2 + 2*s + 5))
G9 = ilaplace((2*exp(-5*s))/(s^2 + 4))
G10 = ilaplace(100/(s*(s^2 + 4)))
G11 = ilaplace((100*(s + 2)*exp(-s))/(s*(s^2 + 4)*(s + 1)))
