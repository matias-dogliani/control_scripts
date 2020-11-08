%Diagrama de Bode y Margen de ganancia y fase 
pkg load signal
pkg load control 
clear
clc 

den= [1 -1 0]; 
num= [1.5 3]; 
G = tf(num,den) 

figure();
bode(G);
grid on;
title('Diagrama de Bode'); 
xlabel("Fase [°]");
ylabel("Amplitud [dB] ");



[MG, MF, w_MG, w_MF] = margin(G); 

printf("Margen de ganacia =  %d =  %d  dB \n",MG, -1*mag2db(MG)) 
printf("Margen de fase  = %d  \n",MF )