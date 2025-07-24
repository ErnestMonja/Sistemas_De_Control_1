close all; clear all; history -c; clc;
pkg load symbolic;

syms s Jeff Bm La Ra Km Kcr real;

Jeff = 2.2125*10^(-6);
Bm = 1.1115*10^(-4);
La = 1.92*10^(-4);
Ra = 1.84;
Km = 0.0229;
Kcr =  1/120;

FdS = (Km*Kcr/(Jeff*La))/( s^2 + s*((Jeff*Ra + La*Bm)/(Jeff*La)) + (Km^2 + Ra*Bm)/(Jeff*La))


pkg load control;
s = tf('s');

step(12*FdS, 0.07)
pole(FdS)
