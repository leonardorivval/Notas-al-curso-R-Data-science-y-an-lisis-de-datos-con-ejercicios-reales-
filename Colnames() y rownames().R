#Primero haemos un vector
Pau <- 1:5
Pau

#Aqu� se hace que el vector Pau siempre sea acompa�ado por el vector names()
names(Pau) <- c("a", "b", "c", "d", "e")

#Ahora cuando se corre Pau se obtiene que el vector original de 1:5 est� acompa�ado por c("a", "b", "c", "d", "e")

Pau

#Tambi�n podemos quitar los nombres acompa�antes mediante NULL
names(Pau) <- NULL
Pau


#Ahora a nombrar matrices 
V1 <- rep(c("a", "b", "c", "d", "e"), each = 3)
Dennett <- matrix(V1, 3, 3)
Dennett

matrix(Dennett, 3, 3)
rownames(Dennett) <- c("Dinosaurio", "Mam�fero", "Reptil")
colnames(Dennett) <- c("A", "B", "C")
Dennett

#Aplicando el principio que se mencion� antes podemos tomar cosas de la matriz de dif formas
Dennett["Reptil", "A"]
Dennett[3,1]

#Como lo hicimos anteriormente, igualmente se pueden quitar los nombres por medio de NULL
rownames(Dennett) <- NULL
colnames(Dennett) <- NULL

