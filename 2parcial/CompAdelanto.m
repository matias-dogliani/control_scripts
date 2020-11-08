%Calcular compensador en adelanto (Estabilización en frecuencia) 

pkg load signal
pkg load control 
clear
clc 

den= [1 -1 0]; 
num= [0.5 2]; 
G = tf(num,den) 
G = tf(num,den) 
KDiseno = -3; 
MFDiseno =40; 



[Kp,Kv,Ka] = Ess(G); 
k = Kv; %En esta ocasión se especifica rampa 

%Corregimos el error: 
KNuevo = 1.5   %Esto es Kc.Alfa
Gnueva = series(G,KNuevo);

printf("\t Knuevo = %d \n",KNuevo)

[MG, MF, w_MG, w_MF] = margin(Gnueva);   
MF = 16.3;
printf("\t El margen de fase original es %d\n", MF)
Ang = input("\t Ingrese ángulo a sumar (5 y 15)  = ");
printf("\n")

FiMax = MFDiseno - MF + Ang; 

Alfa = (1 - sin(deg2rad(FiMax))) / (1 + sin(deg2rad(FiMax))); 
G_FiMax = 10*log10(Alfa); 
G_FiMax = 6.37
printf("\t El angulo a compensar es = %d , y se corresponde con Alfa  = %d, con ganancia  = %d\n",FiMax,Alfa, G_FiMax);


%----------------Encuentro el punto W para el cual obtengo esa ganancia-------

 [mag phas w] = bode(G);
 mag_dB = 20*log10(mag);
 i = find(mag_dB > G_FiMax);
 w_Fi = w(length(i)); 
 W_Fi = 3.46
 T = 1 / (w_Fi * sqrt(Alfa)); 
 
 printf("\t T = %d \n",T)
 printf("\t Alfa = %d \n",Alfa)
  
 KGc = KNuevo*T / (T*Alfa);
 DenGc = [1  (1/(T*Alfa))]; 
 NumGc = [1  (1/T)]; 
 printf("\n\n\t CONTROLADOR \n\n")
 Gc = tf(NumGc,DenGc);
 printf("\t KGc (Ganancia controlador)  = %d \n",KGc)
 Gc
 Gc = series(Gc,KGc); 
 Gc 
 
 %-----------Funcion de transferencia total ---------------------------------
 
 printf("\n\n Funcion de transferencia total \n")
 GT = series(G,Gc) 
 [MG, MF, w_MG, w_MF] = margin(GT); 
 [Kp,Kv,Ka] = Ess(GT); 
 printf("\n Se logra un MF = %d \n",MF)
 printf("Se tiene un error Kv de %d \n \n \n", Kv) 
 Gplanta = feedback(GT,1)
 
 
 
 
 
