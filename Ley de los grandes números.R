contador <- 0 # el contador inicial, se empieza sin ning�n caso entrelas SD
N <- 100000 # n�mero de casos o vector
for(i in rnorm(N)){ 
  if(i > -1 & i < 1){ #la condici�n a evaluar
    contador <- contador + 1  #se van agregando el n�mero de de casos entre -1 y +1 SD
  }
}
contador/ N  #valor se va acercando al 68.2 de la distribuci�n normal a mayor N
