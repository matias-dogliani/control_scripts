
##Obtencion de funcion de transferencia de primer orden mediante su respuesta al escalón

pkg load control 
pkg load signal 
clear
clc 


Vfinal = input("\n Vfinal =  ");
printf("\n Tiempo en el que la curva alcanza el valor de %d (Si no hay info ingrese 0): ",(Vfinal*0.632)); %(5 Tau) 
T = input(''); 
if (T != 0)
  K = (1/T)*Vfinal; 
  G = tf(K,[1 1/T]) 
else 
  #OTRO FORMA ES SI NO SE TIENE EL TIEMPO y(t) = Vfinal (1 - e^(-t/T))
  printf("\n Valor conocido con su respectivo tiempo (y(t), t) \n"); 
  Y = input("\n Valor de y(t):  ");
  t = input(" \n Valor de t (seg):  ");
  T = (Y/Vfinal) / log(t); 
  K = (1/(-1*T))*Vfinal; 
  G = tf(K,[1 1/(-1*T)]) 
endif 



%Comprobacion 

step(G);
