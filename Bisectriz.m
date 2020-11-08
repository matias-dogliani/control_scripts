#METODO GRAFICO DE BISECTRIZ 
pkg load control 
pkg load signal 
clear
clc

%Funcion de transferencia original. 
Num = 1; 
Den = [1 8 12 0]; 
sys = tf(Num,Den);

#Especifaciones de diseño 
#PuntoPrueba  = -1.4400 + 1.3879i 
Zita = 0.72
Wn = 2

#Calculo de punto de prueba que cumple la condicion 
sigma = Zita*Wn 
Wd = sqrt(Wn^2 - sigma^2); 
PuntoPrueba = complex(-sigma,Wd)


#ALGORITMO PARA CONDICION DE ANGULO PARA POLOS
Polos = roots(Den);
for i = 1:length(Polos)
if( real(Polos(i) > real(PuntoPrueba)) ) 
  denominador = abs(Polos(i) - real(PuntoPrueba)); 
  coord = imag(PuntoPrueba) / denominador; 
  angulo(i) = 180 - (atan(coord)*(180/pi)); 
  angulo(i) = -1*angulo(i); 
else 
  denominador = abs(Polos(i) - real(PuntoPrueba)); 
  if(denominador)
  coord = imag(PuntoPrueba) / denominador; 
  angulo(i) = (atan(coord)*(180/pi)); 
  angulo(i)= -1*angulo(i);
  else 
  angulo(i) = -90;
 endif 
endif
endfor 
#Para Ceros
Ceros = roots(Num);
for i = 1:length(Ceros)
if( real(Ceros(i) > real(PuntoPrueba)) ) 
  denominador = abs(Ceros(i) - real(PuntoPrueba)); 
  coord = imag(PuntoPrueba) / denominador; 
  angulo = [angulo; (180 - (atan(coord)*(180/pi))) ]; 
    
else 
  denominador = abs(Ceros(i) - real(PuntoPrueba)); 
  if(denominador)
  coord = imag(PuntoPrueba) / denominador; 
  angulo = [angulo; ((atan(coord)*(180/pi)))]; 
  else 
  angulo = [angulo; 90];
 endif 
endif
endfor 
%-----------Compensanción-----------
Total = sum(angulo); 
i=0; 
if(abs(Total)>180)
  do
     ang = 180 * (2*i + 1)
    i+=1; 
 until(ang < abs(Total));
else 
 ang = 0; 
endif

AnguloCompensacion = ang + Total;
AnguloCompensacionABS = abs(AnguloCompensacion); 


%--------------Teoremas de geometria para poder graficar (se puede hacer mejor pero fue lo que más rapido salio) 
AnguloBisec = (180 - rad2deg( (atan(abs(imag(PuntoPrueba) / real(PuntoPrueba)))) )) / 2 ;
phi = rad2deg(abs(atan(imag(PuntoPrueba) / real(PuntoPrueba)))); 
beta = AnguloBisec; 
alfa =180 - abs(phi + beta);
alfa = deg2rad(alfa);
beta = deg2rad(beta); 
phi  = deg2rad(phi); 
B =  -(abs(PuntoPrueba) / sin(alfa)) * sin(beta);
Bisectriz = B;

phi = rad2deg(abs(atan(imag(PuntoPrueba) / real(PuntoPrueba)))); 
beta = AnguloBisec + (AnguloCompensacionABS/2);
alfa =180 - abs(phi + beta);
alfa = deg2rad(alfa);
beta = deg2rad(beta); 
phi  = deg2rad(phi); 
puntoNuevo1 =   -(abs(PuntoPrueba) / sin(alfa)) * sin(beta);

phi = rad2deg(abs(atan(imag(PuntoPrueba) / real(PuntoPrueba)))); 
beta = AnguloBisec - (AnguloCompensacionABS/2);
alfa =180 - abs(phi + beta);
alfa = deg2rad(alfa);
beta = deg2rad(beta); 
phi  = deg2rad(phi); 
puntoNuevo2 =   -(abs(PuntoPrueba) / sin(alfa)) * sin(beta) ; 

if(AnguloCompensacion< 0) 
  if (puntoNuevo1 > puntoNuevo2) 
       cero = puntoNuevo1;
       polo = puntoNuevo2;
  else 
       cero = puntoNuevo2;
       polo = puntoNuevo1; 
  endif
 endif
 
 if(AnguloCompensacion> 0) 
  if (puntoNuevo1 < puntoNuevo2) 
       cero = puntoNuevo1;
       polo = puntoNuevo2;
  else 
       cero = puntoNuevo2;
       polo = puntoNuevo1; 
  endif
 endif


 %Calculo de K 
 Knum = 0;
 for i = 0:(length(Polos))
   if(i==0)
   Knum = PuntoPrueba - polo;
   else
   Knum *=  ( PuntoPrueba - Polos(i) );
   endif
 endfor
Knum = abs(Knum); 

 kden= 0;
 for i = 0:(length(Ceros))
   if(i==0)
   Kden= PuntoPrueba - cero;
   else
   Kden *= (  PuntoPrueba - Ceros(i));
   endif
 endfor
Kden = abs(Kden); 

K = Knum / Kden; 

NumGc = K*[1 -1*cero]; 
DenGc = [1 -1*polo]; 
Gc = tf(NumGc,DenGc); 

%Comprobacion de metodo de Bisectriz (PAra ver cual coloco más a la derecha <Cual domina>) 
if(abs(puntoNuevo1) < abs(real(PuntoPrueba)))
  numerador = imag(PuntoPrueba);
  denominador = abs(real(PuntoPrueba)) - abs(puntoNuevo1);
  arg = rad2deg(  atan(numerador/denominador) );
  Angulo1 = 180 - arg; 
  
else 
  numerador = imag(PuntoPrueba);
  
  denominador =  abs(puntoNuevo1) - abs(real(PuntoPrueba));
  arg = rad2deg(  atan(numerador/denominador) );
  Angulo1 = - arg; 

endif

if(abs(puntoNuevo2) < abs(real(PuntoPrueba)))
  numerador = imag(PuntoPrueba);
  denominador = abs(real(PuntoPrueba)) - abs(puntoNuevo2);
  arg = rad2deg(  atan(numerador/denominador) );
  Angulo2 = 180 - arg; 
  
else 
  numerador = imag(PuntoPrueba);
  denominador =  abs(puntoNuevo2) - abs(real(PuntoPrueba));
  arg = rad2deg(  atan(numerador/denominador) );
  Angulo2 = - arg; 

endif
AnguloAlcanzado = Angulo2 + Angulo1 ;


printf("La función de trasnferencia original es : \n")
sys 
printf("La condición establecida es \zeta = %.3f \n",Zita)
printf("La condición establecida es Wn = %.3f \n",Wn)



printf("\METODO DE BISECTRIZ: \n")
printf("El ángulo en ese punto es %.2f \n",Total);
printf("El angulo a compensar es %.2f \n", AnguloCompensacion);
printf("Se agrega un cero en %.2f \n",cero);
printf("Se agrega un polo en %.2f \n",polo);
printf("La ganancia necesaria es %.2f \n",K)
printf("El controlador presenta la funcion de transferencia");
Gc 
printf("\n La funcion de transferencia a lazo abierto es ")
GH = series(sys,Gc) 
printf("\n La funcion de transferencia a lazo cerrado es ")
FS = feedback(GH,1)
printf("\n")
[z,p,k] = zpkdata(FS) 
printf("\n");


%----------------Grafica del Metodo de Bisectriz------------
figure("Name","Bisectriz");
grid("minor","on"); 
hold on; 
rlocus(sys) 
plot(PuntoPrueba,'o',2)
line ("xdata",[0,Polos(1)*2], "ydata",[imag(PuntoPrueba),imag(PuntoPrueba)], "linewidth", 3)
line ("xdata",[0,real(PuntoPrueba)], "ydata",[0,imag(PuntoPrueba)], "linewidth", 1)
line ("xdata",[real(PuntoPrueba),B], "ydata",[imag(PuntoPrueba),0], "linewidth", 1)
line ("xdata",[real(PuntoPrueba),puntoNuevo1], "ydata",[imag(PuntoPrueba),0], "linewidth", 1, "color", "r")
line ("xdata",[real(PuntoPrueba),puntoNuevo2], "ydata",[imag(PuntoPrueba),0], "linewidth", 1, "color", "r")
text(B,0, "Bisectriz","rotation",90); 
clear









 


