%Calcular compensador en atraso (Estabilización en frecuencia) 

pkg load signal
pkg load control 
clear
clc 

den= [1 3 2 0]; 
num= [2]; 
G = tf(num,den) 
KDiseno = 5; 
MFDiseno = 40; 



[Kp,Kv,Ka] = Ess(G); 
ko = Kv; %En esta ocasión se especifica rampa 

KNuevo = KDiseno / ko;  %Esto es Kc.Alfa o Kp (Controlador proporcional) 
Gnueva = series(G,KNuevo);  %Lo necesito para encontrar Wmax y eso. 

printf("\t La nueva ganacia K  = %d \n",KNuevo)

[MG, MF, w_MG, w_MF] = margin(Gnueva);   

Ang = input("\t Ingrese ángulo a sumar (2 y 12)  = ");
printf("\n")
MFRequerido = MFDiseno -180 + Ang; 

printf("\t El angulo a compensar es = %d \n\n",MFRequerido);

%----------------Encuentro el punto W para el cual obtengo esa ganancia-------

 [mag phas w] = bode(Gnueva);

 i = find(phas > (MFRequerido-Ang)); % se hace a una octava o una década de la no compensada
 w_MF = w(length(i)) 
 M_MF = mag(length(i));
 M_MF = mag2db(M_MF), 
 T = 10/(w_MF);   %A una octava o a una década  
 
  i = find(phas > (MFRequerido)); %Beta si se encuentra con la compesación
 w_MF = w(length(i)) 
 M_MF = mag(length(i));
 M_MF = mag2db(M_MF), 
 Beta = 10 ^ (M_MF/20); 

 
 printf("\t Beta = %d    T = %d  \n\n",Beta,T)
 
 KGc = KNuevo*T / (T*Beta)
 DenGc = [1  (1/(T*Beta))]; 
 NumGc = [1  (1/T)]; 
 printf("\t CONTROLADOR \n\n")
 printf("\t Ganancia del controlador = %d \n",KGc)
 Gc = tf(NumGc,DenGc)
 Gc = series(Gc,KGc) 
 
 
 %-----------Funcion de transferencia total ---------------------------------
 
 printf("\n\n Funcion de transferencia total \n")
 GT = series(G,Gc) 
 [MG, MF, w_MG, w_MF] = margin(GT); 
 [Kp,Kv,Ka] = Ess(GT); 
 printf("\n Se logra un MF = %d \n",MF)
 printf("Se tiene un error Kv de %d \n \n \n", 1/Kv) 
 bode(GT)
 Gplanta = feedback(GT,1)
 
 
 