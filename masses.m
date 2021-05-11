function masses
close all 
clear all
clc

% loader data
tmp=load('masses.dat');
N=tmp(:,1);
P=tmp(:,2);
A=tmp(:,3);
M_ex=tmp(:,4);
BE=tmp(:,5);

% Beregner dimensioner
Pmax=max(P);
Nmax=max(N);
Nkerner=length(P);

% Genererer Bindings energi matricen
BE_PN = zeros(Pmax+1,Nmax+1);
C = ones(Pmax+1,Nmax+1);
for j=1:length(P)
    help = M_ex(j)/A(j);
    BE_PN(P(j)+1,N(j)+1) = M_ex(j)/A(j);
    C(P(j)+1,N(j)+1) = 0.01;
    if help<1000 
      C(P(j)+1,N(j)+1) = (1000-help)/2500;
    end
end

% Plotter bindings energien
%bar3(BE_PN,'b');
colormap hot
surf(BE_PN,C);

% Limits of possible nuclei
av = 15.56;
as = 17.23;
ac = 0.697;
aa = 93.14;
ap = 12;
bs = 2/3*as/aa*A.^(-1/3);
bc = ac/aa*A.^(2/3);
Z_max = A./(1+bc/3).*(1+bc-sqrt(1/4-av/aa+bs+bc.*(7/4+bc+bs/3-1/3*av/aa)));
Z_min = A.*sqrt((1/4-av/aa+bs)./(1+bc/3));

hold on
plot(N, Z_min, 'r')
plot(N, Z_max, 'b')
end
