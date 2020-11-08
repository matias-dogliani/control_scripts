
##Obtencion de funcion de transferencia de segundo orden mediante su respuesta al escalón

pkg load control 
pkg load signal 
clear
clc 

Vp = input("\n Vp =  ");
Vr = input("\n Vr =  ");
tp = input("\n tp =  ");

Mp = (Vp - Vr) / Vr ; 
Wd = pi / tp; 
Zita = sqrt((log(Mp)^2)/(log(Mp)^2 + pi^2)); 
Wn = Wd / (sqrt(1 - Zita^2)); 
K = Vr; 
ts = 4 / (Zita *Wn);  %Criterio de error 2% 
#ts = 3 / (Zita*Wn);   %Criterio de error de 5% 

printf("\n Función de trasnferencia : \n")

Num = (K *(Wn^2)); 
Den = [1 (2*Zita*Wn) (Wn^2)];
tf(Num,Den) 

Zita 
Wn 
ts  