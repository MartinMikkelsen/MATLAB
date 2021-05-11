%% STANDARD
clc;clear all; close all; format short; format compact
%% MASSER
% Angivet i MeV
global mp mn me
mp = 0.938272*10^3;
mn = 0.939565*10^3;
me = 0.510999;
%% ENERGI
BHe = 28.296                         % Emperical binding energy of 4-He    
MHe = - BHe + 2.*mp + 2.*mn + 2.*me  % Emperical mass of 4-He
M1  = SEMF(170,79);                   % Total mass before MeV     
M2  = SEMF(166,77) + MHe;            % Total mass after in MeV      
Q   = M1-M2                          % Released energy in MeV    
MD  = M2-M1                          % Mass Deficiency  
%% HALVERINGSTID
format long

Z=64;
A=148;

T_alpha=3.183 % Den kinetiske energi af alpha partiklen, hvilket ikke er den samlede energi. Skal skrives i MeV. 
Q_alpha=T_alpha*A/(A-4); % Den samlede energi af henfaldet i MeV
%Q_alpha=

t_halve_sekunder = halveringstid(Z,A,Q_alpha) % Q skal være i MeV og halveringstiden fås i sekunder
t_halve_minuter= t_halve_sekunder/(60)        % Halverings tid i dage
t_halve_timer= t_halve_sekunder/(60*60 )      % Halverings tid i dage
t_halve_dage = t_halve_sekunder/(60*60*24)    % Halverings tid i dage
t_halve_aar = t_halve_sekunder/(60*60*24*365) % Halverings tid i dage
%% FUNCTIONS
function t_halve=halveringstid(Z,A,Q)
t_halve=10^(-25.752-1.15055*A^(1/6)*sqrt(Z)+1.5913*Z/sqrt(Q)) % Q skal være i MeV og halveringstiden fås i sekunder
end
function M=SEMF(A,Z)
if (Z>A)
    Zgem=Z;
    Z=A;
    A=Zgem;
end

global mp mn me

av = 15.56;
as = 17.23;
ac = 0.697;
aa = 93.14;
ap = 12;

f0 = Z*(mp+me)+(A-Z)*mn;
f1 = -av*A;
f2 = as*(A^(2/3));
f3 = ac*(Z*(Z-1))/(A^(1/3));
f4 = aa*(((Z-A/2)^2)/A);

if (mod(A-Z,2) == 0) 
    if (mod(Z,2)==0)
    f5 = -ap./sqrt(A);
    else 
    f5 = 0       
    end    
else
    if (mod(Z,2)==0)
    f5 = 0
    else 
    f5 = ap./sqrt(A);     
    end 
end
f5
M = f0+f1+f2+f3+f4+f5
end