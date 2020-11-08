%DIAGRAMAS 
clear
clc 

den= [1 11 10 0]; 
num= [100]; 
G = tf(num,den) 

figure();
bode(G);
grid on;
title('Diagrama de Bode'); 
xlabel("Fase [°]");
ylabel("Amplitud [dB] ");

##figure();
##nichols(G);
##grid on;
##title('Diagrama de Nichols / Black'); 
##xlabel("Fase [°]");
##ylabel("Amplitud [dB] ");
##
##figure();
##nyquist(G);
##grid on;
##title('Diagrama de Nyquist'); 
##xlabel("Fase [°]");
##ylabel("Amplitud [dB] ");