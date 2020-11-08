pkg load symbolic

syms a s
F = 1/(s-5)^2;
ilaplace(F)

%residue(num,den); Para conocer los coeficientes de la descomposición por fracciones simples

