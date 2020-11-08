#Funciones útiles 


%FUNCION PARA POLINOMIOS 
## poly(raices); Devuelve un polinomio con las raices indicadas. [ s^n s^n-i --- s^0]
##polyout(p, ‘x’): Expresa el polinomio en términos de la variable x
##y = polyval(p, x): Devuelve el valor del polinomio para el valor x. Si x es un vector o matriz, devuelve un vector o matriz con la evaluación del polinomio p en cada elemento.
##b = conv(p, q): Devuelve el vector de coeficientes que define el polinomio b, producto de los polinomios p y q.
##[b, r] = deconv(p, q): Realiza la división de los polinomios p y q, devolviendo el polinomio cociente b y el polinomio resto r, de forma que se cumple: p = conv(q,b) + r
##r = roots(p): Devuelve un vector r con las raices del polinomio p
##d = polyder(p): Devuelve un vector con los coeficientes del polinomio que resulta de derivar p
##s = polyint(p): Devuelve un vector con los coeficientes del polinomio que resulta de integrar p
##p = polyfit(x, y, n): Devuelve el polinomio de grado n que mejor ajusta por mínimos cuadrados el conjuntos de puntos 

%FUNCION DE TRANSFERENCIA 
##tf([1], [1 0 0]);  Armar la funcon de transferencia
##Gtp = parallel(G1,G2) Bloque paralelos
##GT = feedback(Gtp,G3) Bloques con realimentacion 
##G  = series(G1,G2) Bloques en serie 
##[Res, Polos, K] = residue(Num,Den) Obtener la expresion con fracciones parciales
##[z,p,k] = zpkdata(FS) : Obtener los ceros, polos y ganancia
##[z,p,k] = tf2zp(NumG, DenG) Lo mismo que lo anterior 
##dcgain(GT)  Ganancia del sistema
##step(C); Respuesta del sistema al escalón unitario.
##impulse(G) 
  
  
  









