%Calcular compensador en Atraso-Adelanto 

pkg load signal
pkg load control 
clear
clc 

den= [ 1   3   2   0]; 
num= [1]; 
G = tf(num,den) 
KDiseno = 10; 
MFDiseno = 50; 
MGDiseno = 15; %dB 

%----------------Corrigo Error----------------------------------------------

[Kp,Kv,Ka] = Ess(G); 
k = Kv; 
KNuevo = KDiseno / k;  
Gnueva = series(G,KNuevo)

%Encuentro MFinicial, MGinicial y Wx -----------------------------------
  
  [MG, MF, w_MG, w_MF] = margin(Gnueva);   
  [mag phas w] = bode(Gnueva);
  MG_inicial = mag2db(MG)
  MF_inicial = MF %Debe ser q hay un error en margin. Porque me da 330 el MF para el caso ejemplo. Si hago 360 - MF me da como el apunte 
  MF_inicial = 360 - MF 
  Wx = w_MG 
  
  Fi = MFDiseno + 5; 
  Beta = (1 + sin(deg2rad(Fi)))/(1 - sin(deg2rad(Fi)))
  
%----------------Calculo zeros del compensador en atraso----------------
  
  Zc2 = Wx/10 
  Zp2 = Zc2 / Beta 
 
 NumGa = [1 Zc2];
 DenGa = [1 Zp2];
 
 Gatraso = tf(NumGa,DenGa)
 
## w_MF = w(length(i)) 
## M_MF = mag(length(i));
## M_MF = mag2db(M_MF); 
## T = 10/w_MF ; 
## 
## Beta = 10 ^ (M_MF/20); 
## 
## 
## 
## KGc = KNuevo*T / (T*Beta)
## DenGc = [1  (1/(T*Beta))]; 
## NumGc = [1  (1/T)]; 
## printf("Funcion de trasnferencia del controlador Gc")
## Gc = tf(NumGc,DenGc)
## KGc 
## Gc = series(Gc,KGc) 
## 
## 
## %-----------Funcion de transferencia total ---------------------------------
## 
## printf("\n\n Funcion de transferencia total \n")
## GT = series(G,Gc) 
## [MG, MF, w_MG, w_MF] = margin(GT); 
## [Kp,Kv,Ka] = Ess(GT); 
## printf("\n Se logra un MF = %d \n",MF)
## printf("Se tiene un error Kv de %d \n \n \n", 1/Kv) 
## bode(GT)
## Gplanta = feedback(GT,1)
## 
## 
## 