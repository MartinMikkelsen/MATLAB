clc;clear all;close all; format long;
%APPROKSIMATION AF VÆRDIEN FOR PI
%Firkant af størrelse, nx2 matrix
antal = 100000;
tegne_antal = rand(antal,2);

%Antal punkter inde i cirkel. Første søjle i anden + anden søjle i anden
%skal være skarpt mindre end 1, da dette er længden og højden af firkanten
Indre_cirkel = (tegne_antal(:,1).^2+tegne_antal(:,2).^2) < 1;
%Bestemmer den kommulerede sum af punkter inden for arealet af cirklen
%Antallet af punkter indenfor cirkel delt med cirklensoverflade er lig pi.
%punkter_i_cirkel/cirkel*4 = Pi
pi_over_tid = cumsum(Indre_cirkel)./(1:antal)'*4;

%Plot
%Subplot med akser 3x1 som fylder 1,2 ud af 3
subplot(3,1,[1,2]);
plot(tegne_antal(Indre_cirkel,1), tegne_antal(Indre_cirkel,2),'rx', ...
    tegne_antal(~Indre_cirkel,1), tegne_antal(~Indre_cirkel,2),'bx')
title(sprintf('%d Punkter i [0,1]^2', antal))
hold on
%Approksimation over tid
%Subplot med akser 3x1 som fylder sidste trejdedel
subplot(3,1,3);
plot(1:antal, pi_over_tid);
title(sprintf('Approksimation af værdien for \pi over tid (Resultat: %f)', ...
    pi_over_tid(end)));
grid on
xlabel('Gentagelser');
ylabel('Værdi for \pi')
%%
%TEST AF PUBGRAPH
h = figure;
plot(3,1);
plot(1:antal, pi_over_tid);
title(sprintf('Approksimation af værdien for \\pi over tid (Resultat: %f)', ...
    pi_over_tid(end)));
xlabel('Gentagelser'), ylabel('Værdi for \pi'), grid on
pubgraph(h,12,1,'w')
