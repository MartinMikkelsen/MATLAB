clc;clear all;close all

me = 0.510999;              %MeV/c^2
c = 2.99792e8;              %m/s
me2 = me/c^2/1000;
hbar = 6.58212e-25;         %GeV s
GF = 1.16638e-5*(hbar*c)^3; %GeV^-2
thetac = 13.02;                %Grader
G = GF*cosd(thetac);        
M = 2;                      %Matrixelement
E0 = 3402/1000+me;
t = 11;                %halveringstid i s
Lambdatot = log(2)/t;
U0 = (7.025-1.634)/(me);
f = sqrt(U0^2-1)*(U0^4/30-(3*U0^2)/20-2/15)+U0/4*log(U0+sqrt(U0^2-1))

Lambda = (G^2*me2^5*c^4*M)/(2*pi^3*hbar^7)*f
B = Lambda/(Lambdatot)