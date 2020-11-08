#Graficar lugar de raices y marcar N puntos sobre el mismo 

pkg load control 
pkg load signal 
clear
clc 
function [rldata, k_break, rlpol, gvec]=rlocusgain (b,a,N)
Go=tf(b,a);
rlocus(Go);
hold on
[rldata, k_break, rlpol, gvec] = rlocus(Go);
Nloci=length(rldata(:,1));
 
 
for n=1:N
[X,Y]=ginput(1);Wn=abs(X+i*Y);
k=1;
while k < Nloci + 1
 
[A,B]=min(abs((X+Y*i)-(rldata(k,:))));
if(A)<.3;
BB=B;l=k;AA=A;
end
k = k+1;
end
plot(X+i*Y,'xr')
text(X,Y+.2,['G  =  ' num2str(gvec(BB)) ';  \zeta =' num2str(-X/Wn) ';'],'fontsize',9)
text(X,Y-.2,['\omega_n  =  ' num2str(Wn)],'fontsize',9)
end
hold off
endfunction

Num = 1; 
Den = [1 9 14 0]; 
sys = tf(Num,Den);

#Polinomio = poly(raices); 

%rlocusgain(Num,Den,2);
[rldata, k] = rlocus(sys);

##min = 1; 
##Zita = 0.7; 
## for i=1:length(rldata)
##Wn(i) = abs(rldata(i));
##if(Wn(i))
##Coef(i) = abs(real(rldata(i)) / Wn(i));
##if( abs((Coef(i) - Zita)) < min )
##  ValorPosible = Coef(i);
##  min = Coef(i) - Zita; 
##endif 
##endif
##endfor
##printf("\n El valor más cercano al zita elegido es %d \n", ValorPosible)



#ALGORITMO PARA CONDICION DE ANGULO 
##PuntoPrueba  = -2 + 2*i; 
##Raices = roots(Den)
##for i = 1:length(Raices)
##if( real(Raices(i) > real(PuntoPrueba)) ) 
##  denominador = abs(Raices(i) - real(PuntoPrueba)); 
##  coord = imag(PuntoPrueba) / denominador; 
##  angulo(i) = 180 - (atan(coord)*(180/pi)); 
##  angulo(i) = -1*angulo(i) 
##else 
##  denominador = abs(Raices(i) - real(PuntoPrueba)); 
##  coord = imag(PuntoPrueba) / denominador; 
##  angulo(i) = (atan(coord)*(180/pi)); 
##  angulo(i)= -1*angulo(i) 
##endif
##
##endfor 
##
##Total = sum(angulo)

