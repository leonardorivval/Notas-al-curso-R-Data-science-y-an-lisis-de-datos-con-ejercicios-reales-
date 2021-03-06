#Una funci�n te permite almacenar todo un c�digo en una frase en que podemos escribir f�cilmente.
#Aqu� se hace uso de function(){} para generar la funci�n
#Se agregan par�metros en () que permiten flexibilidad a la funci�n. De tal modo que uno puede pedir los datos, y las filas a usar. Una vez que las da estas se acoplan al c�digo dado.
#En nuestro caso se toma data y este se almacena en datos y estos luego son transpuestos para poder ser usados por matplot()
#As� mismo se piden filas para que esas sean las tomadas del data y usadas en el c�digo. Adem�s se pone un valor default tal que se toman autom�ticamente las fila 1:10 si solamente se da el data

mi_funci�n <-function(data, filas=1:10){
  datos <- data[filas,,drop=FALSE]
  matplot(t(datos), type = "b", pch = 15:18, col = c(1:4, 6) )
  legend("bottomleft",inset = .01, legend = jugadores[filas], pch = 15:18, col = c(1:4, 6))
}

mi_funci�n(sueldos/juegos, 1)
