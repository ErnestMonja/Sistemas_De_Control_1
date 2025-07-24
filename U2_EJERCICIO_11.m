close all; clear all; history -c; clc;
pkg load symbolic;

syms R L K H B s real;
syms V I W Tl real;

P1 = (1/L)*(1/s)*(K/J)*(1/s);

L1 = (1/s)*(-R/L);
L2 = (1/s)*(-B/J);
L3 = (1/s)*(K/J)*(1/s)*(-K/L);

Delta = 1 - (L1 + L2 + L3) + L1*L2;
D1 =  1;
M = simplify(factor((P1*D1)/Delta, 's'))
