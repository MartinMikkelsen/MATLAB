%% STANDARD
clc;clear all; close all; format short; format compact
%% MASSER
% Angivet i MeV
global mp mn me av as ac aa ap
mp = 0.938272*10^3;
mn = 0.939565*10^3;
me = 0.510999;
av = 15.67;
as = 17.23;
ac = 0.75;
aa = 93.2;
ap = 12;
%% CALCULATIONS
M1  = SEMF(58,28);                     % Total mass before MeV     
M2  = SEMF(58,28);                      % Total mass after in MeV      
Q   = M1-M2                             % Released energy in MeV    
MD  = M2-M1                             % Mass Deficiency  
%% MINIMUM Z
A=20  %Mass number
beta=aa+(mn-mp-me)
gamma=aa/A+ac/A^(1/3)
Z_min=beta/(2*gamma) 
%% SEPERATIONS ENERGIER
A=58;Z=28;
B = SEMF(A,Z)
E_n=SEMF(A-1,Z)+mn-SEMF(A,Z)       % Neutronseperation energy in MeV
E_p=SEMF(A-1,Z-1)+mp+me-SEMF(A,Z)  % Neutronseperation energy in MeV
%% FUNCTIONS
function M=SEMF(A,Z)
if (Z>A)
    Zgem=Z;
    Z=A;
    A=Zgem;
end

global mp mn me av as ac aa ap

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
M = f0+f1+f2+f3+f4+f5
end