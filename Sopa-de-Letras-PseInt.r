Algoritmo ej3_ago22
	contador <- 0
	// Contador para almacenar las palabras ingresadas
	mostrarMenu <- Verdadero
	// Booleano para mostrar el menú de interacción
	Dimension palabras[15]
	// Arreglo donde se almacenaran las primeras palabras ingresadas
	Dimension palabrasNuevas[15]
	// Arreglo donde se almacenaran las palabras finales a usar
	Dimension fila[15]
	// Arreglo para elegir la fila donde posicionar las palabras
	Dimension inicioFila[15]
	// Arreglo que determina el inicio de la fila donde comenzará la palabra ordenada
	Dimension finFila[15]
	// Arreglo que determina el final de la fila donde comenzará una palabra invertida 
	Dimension filaOrdenada[15]
	// Arreglo que determina si la palabra de la fila debe escribirse ordenada o invertida
	Dimension sopaLetras[20,20]
	// Arreglo para escribir la sopa de letras normal, el primer valor es la cantidad de filas y el segundo de caracteres por fila
	Dimension sopaGuiones[20,20]
	// Arreglo para escribir la sopa de letra con guiones y las palabras reveladas, el primer valor es la cantidad de filas y el segundo de caracteres por fila
	Dimension letrasAzar[27]
	// Arreglo con 27 letras del abecedario para rellenar la grilla
	letrasAzar[1] <- 'a'
	letrasAzar[2] <- 'b'
	letrasAzar[3] <- 'c'
	letrasAzar[4] <- 'd'
	letrasAzar[5] <- 'e'
	letrasAzar[6] <- 'f'
	letrasAzar[7] <- 'g'
	letrasAzar[8] <- 'h'
	letrasAzar[9] <- 'i'
	letrasAzar[10] <- 'j'
	letrasAzar[11] <- 'k'
	letrasAzar[12] <- 'l'
	letrasAzar[13] <- 'm'
	letrasAzar[14] <- 'n'
	letrasAzar[15] <- 'ñ'
	letrasAzar[16] <- 'o'
	letrasAzar[17] <- 'p'
	letrasAzar[18] <- 'q'
	letrasAzar[19] <- 'r'
	letrasAzar[20] <- 's'
	letrasAzar[21] <- 't'
	letrasAzar[22] <- 'u'
	letrasAzar[23] <- 'v'
	letrasAzar[24] <- 'w'
	letrasAzar[25] <- 'x'
	letrasAzar[26] <- 'y'
	letrasAzar[27] <- 'z'
	// A cada arreglo se le asigna una letra del abecedario
	Repetir
		// Bucle repetido hasta que cumpla su condición
		Si contador<=15 Entonces
			// Si el contador es menor o igual a 15
			Escribir 'Ingresa una letra máximo 12 caracteres'
			// Se solicitará el ingreso de una palabra
			Leer palabraIngresada
			// Se leerá la palabra
			palabraIngresada <- Minusculas(palabraIngresada)
			// Se convertira a minúscula para evitar problemas
			Si (Longitud(palabraIngresada)>12) Entonces
				// Si su longitud es menor a 12
				Escribir 'Ingresa nuevamente la palabra'
				// Se solicita ingresar una nueva
			SiNo
				Si (Longitud(palabraIngresada)>0 Y Longitud(palabraIngresada)<=12) Entonces
					// Si la longitud es mayor a 0 para evitar que sea vacia y menor o igual a 12 para evitar que se pase
					contador <- contador+1
					// Se aumenta el contador en 1
					palabras[contador] <- palabraIngresada
					// Al arreglo de las palabras con la posición del contador se le almacena la palabra
				SiNo
					Escribir 'Ingreso de palabras finalizado, pulse R para ver su grilla'
					// Se finaliza el ingreso de palabras y se solicitap resionar R para ver la grilla
				FinSi
			FinSi
		SiNo
			Escribir 'Ingreso de palabras finalizado, pulse R para ver su grilla'
			// Se finaliza el ingreso de palabras y se solicitap resionar R para ver la grilla
		FinSi
	Hasta Que contador=15 O palabraIngresada=''
	// El repetir finaliza cuando el contador llega a 15 o se ingresa una palabra vacia
	Mientras mostrarMenu Hacer
		// Mientras la variable de mostrar menu sea verdadera
		Escribir ' '
		// Se comenta un espacio vacio para hacer un salto de linea
		Escribir 'R = Generar una nueva grilla, S = Salir, U = Revelar ubicación'
		// Se muestran las opciones disponibles al usuario
		Leer accion
		// Se lee la acción elegida
		accion <- Mayusculas(accion)
		// Se convierte a mayúscula
		Segun accion Hacer
			'R':
				// Se crea un según de acuerdo a lo ingresado
				// Si la accion ingresada es R
				palabrasValidas <- contador
				// Se crea una variable igual al contador de palabras porque el contador se usará mas adelante y no debe cambiar
				contadorAlmacenadas <- 1
				// Y una variable que servirá para recorrer las filas
				Mientras palabrasValidas>0 Hacer
					// Mientras haya palabras validas
					filaAleatoria <- Aleatorio(1,20)
					// Se va a generar una fila aleatoria entre el 1 y el 20
					filaUsada <- Verdadero
					// Se crea una variable en verdadero la cual significa que la fila esta vacia, al ser el inicio empieza en vacia
					Para x<-1 Hasta contador Hacer
						// Se hace un para hasta la cantidad de palabras con el contador y este valor no debe cambiar sino no funcionará
						Si (filaAleatoria==fila[x]) Entonces
							// Se compará si la fila aleatoria es igual a algun valor almacenado en el arreglo de las filas
							filaUsada <- Falso
							// Se cambia a falso al estar en uso esa fila, como esto pasa no entra en el siguiente bucle y se repite hasta que no sea así
						FinSi
					FinPara
					Si (filaUsada==Verdadero) Entonces
						// Si el valor es verdadero
						fila[contadorAlmacenadas] <- filaAleatoria
						// A la fila de acuerdo al contador utilizado se le almacena el valor aleatorio
						contadorAlmacenadas <- contadorAlmacenadas+1
						// Se aumenta el contador de almacenadas para seguir con la siguiente fila
						palabrasValidas <- palabrasValidas-1
						// Se reducen las palabras validas en 1
					FinSi
				FinMientras
				palabrasValidas <- contadorAlmacenadas-1
				// Se reasigna las palabras validas al contador de almacenadas menos uno puesto que al final de la operación anterior queda valiendo uno mas que la cantidad de palabras
				contadorAux <- 1
				// Se crea un contador auxiliar para recorrer a partir de 1 los elementos
				Mientras palabrasValidas>0 Hacer
					// Mientras haya palabras validas
					posicion <- Aleatorio(1,20)
					// Se va a generar una posición aleatoria entre 1 y 20
					longitudinvertido <- Longitud(palabras[contadorAux])
					// Se toma la longitud de la palabra para poder invertirla
					invertida <- ''
					// Se crea un campo de texto vacío en el cuál se almacenará la palabra invertida
					Repetir
						invertida <- invertida+Subcadena(palabras[contadorAux],longitudinvertido,longitudinvertido)
						// A la variable de invertida le voy sumando con subcadena los caracteres de la palabra acorde al contadorAux desde la longitud de la palabra, comenzando por el final letra por letra
						longitudinvertido <- longitudinvertido-1
						// E ira disminuyendo la longitud para terminar de escribirla invertida
					Hasta Que longitudinvertido==0
					// Finalizando cuando se haya ingresado toda la palabra
					Si (((posicion+Longitud(palabras[contadorAux])))<=20) Entonces
						// Si la posición aleatoria mas la longitud de la palabra almacenada en el arreglo acorde al contadorAux es menor o igual a 20
						inicioFila[contadorAux] <- posicion
						// El inicio de la palabra en esa fila será la posición aleatoria
						finFila[contadorAux] <- (posicion+Longitud(palabras[contadorAux]))-1
						// Y le final de la fila será la posición mas la longitud menos 1 para evitar problemas en la grilla
						filaOrdenada[contadorAux] <- Verdadero
						// En este caso al entrar la palabra de forma normal se declará que la palabra esta ordenada, por lo tanto es verdadera
						palabrasNuevas[contadorAux] <- palabras[contadorAux]
						// Se asigna a palabras nuevas acorde al contador la palabra utilizada
						contadorAux <- contadorAux+1
						// Se aumenta el contadorAux para seguir trabajando con la siguiente palabra
						palabrasValidas <- palabrasValidas-1
						// Se restan las validas para ir saliendo del iterador
					SiNo
						Si (((posicion-Longitud(palabras[contadorAux])))>=1) Entonces
							// Si la posición menos la longitud es mayor o igual a 1
							inicioFila[contadorAux] <- posicion
							// El inicio de la fila será la posición generada aleatoriamente
							finFila[contadorAux] <- (posicion-Longitud(palabras[contadorAux]))+1
							// A su vez el final será la posición menos la longitud mas 1 para evitar problemas en la grilla
							filaOrdenada[contadorAux] <- Falso
							// En este caso la fila no es ordenada, por lo que se cambia el valor a falso
							palabrasNuevas[contadorAux] <- invertida
							// Se almacena en el nuevo arreglo de palabras nuevas
							contadorAux <- contadorAux+1
							// Se aumenta el contador para trabajar con la siguiente palabra
							palabrasValidas <- palabrasValidas-1
							// Se restan las palabras validas para ir saliendo del iterador
						FinSi
					FinSi
				FinMientras
				palabrasValidas <- (contadorAux-1)
				// Se reasignan las palabras validas de acuerdo al contadorAux y nuevamente se resta 1 para no romper el iterador
				Mientras palabrasValidas>0 Hacer
					// Mientras hayan palabras validas
					indiceRemplazado <- 1
					// Se crea una variable para ir recorriendo los indices a partir de 1
					Para x<-1 Hasta 20 Hacer
						// Se crea un primer para que genera una fila
						Para i<-1 Hasta 20 Hacer
							// Y un segundo para que las genera 20 veces
							sopaLetras[x,i]<-letrasAzar[Aleatorio(1,27)]
							// Genera una sopa de letras de 20 por 20 con las letras azar entre 1 y 27 asignadas anteriormente
							sopaGuiones[x,i]<-'-'
							// Para cuando son guiones en vez de buscar letras azar se sustituyen por guiones
						FinPara
					FinPara
					contadorAux2 <- 1
					// Se crea una nueva variable comenzada en 1 para poder recorrer nuevamente los valores
					Repetir
						Si filaOrdenada[contadorAux2]==Verdadero Entonces
							// Si la fila acorde al contador inicializado en 1 que ira aumentando cumple que esta ordenada
							Para x<-inicioFila[contadorAux2] Hasta finFila[contadorAux2] Hacer
								// Se recorre el inicio de la fila hasta el final
								
								//fila[contadorAux2] muestra la fila seleccionada
								//x muestra la posición donde empieza la palabra
								//sopaLetras[fila[contadorAux2],x] muestra el valor en esa fila y esa posición que esta en la sopa de letras
								//El primer valor de sopaLetras[] es la fila, y el segundo los caracteres, entonces se llama a esa fila y con x a la posición del caracter a sustituir
								
								sopaLetras[fila[contadorAux2],x]<-Subcadena(palabrasNuevas[contadorAux2],indiceRemplazado,indiceRemplazado)
								// A la grilla de la sopa de letras se fija en la fila y toma el valor ademas de usar la variable del para que es el inicio de la fila hasta el final, dentro de esta fila y estas posiciones
								// Con una subcadena se fijará la palabra acorde e irá colocando indice por indice usando la variable comenzada en 0 anteriormente
								sopaGuiones[fila[contadorAux2],x]<-Subcadena(palabrasNuevas[contadorAux2],indiceRemplazado,indiceRemplazado)
								// Hará lo mismo para la grilla de guiones, pero al estar en esta colocada solo guiones, por encima de estos colocará las letras en los mismos lugares
								indiceRemplazado <- indiceRemplazado+1
								// Aumenta el indice remplazado para seguir colocando letras
							FinPara
						SiNo
							Si filaOrdenada[contadorAux2]==Falso Entonces
								// Si la fila acorde al contador inicializado en 1 que ira aumentando no esta ordenada
								Para x<-finFila[contadorAux2] Hasta inicioFila[contadorAux2] Hacer
									// Se recorre igual que la anterior pero desde el final hasta el inicio
									sopaLetras[fila[contadorAux2],x]<-Subcadena(palabrasNuevas[contadorAux2],indiceRemplazado,indiceRemplazado)
									// Nuevamente en la fila acordada, en las posiciones designadas en el para utilizará la palabra según el auxiliar y la colocará indice por indice
									sopaGuiones[fila[contadorAux2],x]<-Subcadena(palabrasNuevas[contadorAux2],indiceRemplazado,indiceRemplazado)
									// Haciendo lo mismo para la sopa con guiones
									indiceRemplazado <- indiceRemplazado+1
									// Aumenta el indice para seguir colocando letras
								FinPara
							FinSi
						FinSi
						indiceRemplazado <- 1
						// Volvemos a llevar el indice a 1 para cuando salga del iterador se vuelva a repetir con la siguiente palabra
						palabrasValidas <- palabrasValidas-1
						// De igual manera se restará las palabras validas para ir saliendo del iterador
						contadorAux2 <- contadorAux2+1
						// Aumentará el contadorAux2 para continuar con la siguiente palabra
					Hasta Que palabrasValidas==0
					// Finaliza cuando ya no hay palabras validas
				FinMientras
				Para x<-1 Hasta 20 Hacer
					// Se recorre una vez un para asi se generán los 20 valores, el 20 es la cantidad de filas a crear
					Para i<-1 Hasta 20 Hacer
						// Y nuevamente para las 20 filas, el 20 son la cantidad de caracteres por fila
						Escribir sopaLetras[x,i],'  ' Sin Saltar
						// Se escribe la sopa de letras precargada anteriormente ademas de sumarle espacios para mayor visibilidad
					FinPara
					Escribir ''
					// Se escribe un espacio vacio para dar un salto de linea
				FinPara
			'S':
				Escribir 'Ha salido de la pantalla'
				// Se notifica que se ha salido de la pantalla
				mostrarMenu <- Falso
				// Se cambia el valor del menu a falso asi se sale del programa
			'U':
				Para x<-1 Hasta 20 Hacer
					// Se crea un para que imprime los 20 valores, el 20 es la cantidad de filas a crear
					Para i<-1 Hasta 20 Hacer
						// Otro para imprimir los caracteres, el 20 son la cantidad de caracteres por fila
						Escribir sopaGuiones[x,i],'  ' Sin Saltar
						// Se escribe la grilla ya precargada con un espacio así se tiene mayor visibilidad
					FinPara
					Escribir ''
					// Se escribe un espacio vacio para un salto de linea
				FinPara
			De Otro Modo:
				// Si no se ingresa un valor correcto
				Escribir 'Has ingresado una opción incorrecta'
				// Se notifica que se ingreso una palabra incorrecta
		FinSegun
	FinMientras
FinAlgoritmo