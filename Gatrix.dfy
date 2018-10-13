


//----------------------------
//DEFINICION DE PREDICADOS
//-----------------------------

//1-Predicado que indica si un entero positivo es par 
predicate esPar(i:int) 
requires i>=0
{i%2==0}

// Comprueba si el predicado es cierto para algunos enteros
// Este test es util para poder identificar errores del predicado 

method testPar(){
	//assert esPar(2);                  /*Es correcto,ya que cumple las condiciones (2 es par)*/ 
	//assert esPar(5);                  /*Este caso Falla, porque no cumple lo que dice el predicado, ya que 5 es impar*/
	//assert esPar(-2);                 /*Este caso Falla, por no cumplir la pre-condición de ser mayor que cero */
	//assert esPar(1000000);            /*Es correcto, dado que cumple con el predicado (1000000 es par)*/
}

//2. Predicado que indica si todos los elementos de una secuencia son positivos.
predicate positivos(s:seq<int>)
{forall u::0<=u<|s| ==> s[u]>=0}

method TestPositivos()
{
	//assert positivos([1,2,3]);                     /*Es correcto, dado que cumple con el predicado (la secuencia es positiva)*/
	//assert positivos([1,-3,7,8]);                  /*Este caso Falla,porque no cumple lo que dice el predicado(contiene un numero negativo)*/
    //assert positivos([0,9]);                       /*Es correcto, dado que cumple con el predicado (la secuencia es positiva)*/  
	//assert positivos([44,2,3,4,5,6,7,8,9]);        /*Es correcto, dado que cumple con el predicado (la secuencia es positiva)*/  

}

//Predicado que indica si todos los elementos de un array son positivos.

predicate positivosA(a:array<int>)
reads a;
{positivos(a[0..a.Length])}

// 3-Predicado que indica que todos los elementos de una secuencia son 
// iguales
predicate iguales(s : seq<int>) {
      forall u, w :: 0 <= u <= w < |s| ==> s[u] == s[w]

}


predicate igualesA( a: array<int>)
	reads a;
{
	forall k,j:: 0 <= k <=j < a.Length  ==> a[k] == a[j] 
}



// Comprueba si el predicado es cierto para algunas secuencias
// Este test es util para poder identificar errores del predicado 

method TestIguales() 
{
	//assert iguales([1,1,1,1,1]);            /*Es correcto, dado que cumple con el predicado (solo contiene 1's)*/
	//assert iguales([2]);                    /*Es correcto, dado que cumple con el predicado (solo contiene el numero 2)*/
	//var s : seq<int>;
	//s := [];
	//assert iguales(s);                          /*Es correcto, dado que cumple con el predicado, dado que es una secuencia vacia*/
	//assert iguales([1,1,1,1,2]);              /*No cumple con el predicado */


	//Comprueba que los elementos de un array son iguales
	//var v:array<int> := new int[4];
	//v[0]:=6; v[1]:=6; v[2]:=6; v[3]:=6;
	//assert iguales(v[0..v.Length]);              /*Cumple la condicion del predicado, a diferencia del anterior son casos con array*/
	//assert igualesA(v);                           /*Cumple la condicion del predicado, a diferencia del anterior son casos con array*/

}



// ------------------------------------------

//4- Predicado que indica que los elementos de una secuencia son todos distintos de un elemento dado

predicate distintosDe(s : seq<int>, x :int) {

     forall u :: 0 <= u < |s| ==> s[u] != x
}


predicate distintosDeA ( a: array<int>, x:int)
	reads a;
{
	forall k:: 0 <= k < a.Length  ==> a[k] != x 
		
}


// Comprueba si el predicado es cierto para algunas secuencias
// Este test es util para poder identificar errores del predicado

method TestDistintosDe() 
{
    //assert distintosDe([1,4,2,8],0);      /*Cumple con el predicado, dado que no contiene ningun 0 */
	//assert distintosDe([6,3,1,9,2],8);    /*Cumple con el predicado, dado que no contiene ningun 8 */
	//assert distintosDe([2],3);            /*Cumple con el predicado, dado que no contiene ningun 3 */
	//var s : seq<int>;
	//s := [];
	//assert distintosDe(s,7);                                            /*Cumple con el predicado, dado que no contiene ningun 7 */
	//assert distintosDe([3,4,3,6],3); // Este assert debe fallar         /*No cumple con las condiciones, ya que hay un elemento igual al 3*/

	//var v:array<int> := new int[4];
	//v[0]:=6; v[1]:=7; v[2]:=8; v[3]:=-2;
	//assert distintosDe(v[0..v.Length],0);           /*Cumple con el predicado, dado que no contiene ningun 0 este caso con secuencia */
	//assert distintosDeA(v,0);                       /*Cumple con el predicado, dado que no contiene ningun 0 este caso con array */
}


// 5. Escribir un predicado que indique que los elementos de una secuencia son todos distintos entre si

predicate distintos(s : seq<int>) {
    // Escribir aqui el predicado
	forall k,j:: 0 <= k < j < |s| ==> s[k] != s[j] 
}


predicate distintosA ( a: array<int>)
	reads a;
{
  forall k,j:: 0 <= k < j < a.Length ==> a[k] != a[j]	
}


// Comprueba si el predicado es cierto para algunas secuencias
// Este test es util para poder identificar errores del predicado 

method TestDistintos() 
{
  	//assert distintos([1,4,2,8]);          /*Cumple con el predicado, dado que ninguno de sus elementos entre ellos son iguales */
	//assert distintos([6,3,1,9,2]);        /*Cumple con el predicado, dado que ninguno de sus elementos entre ellos son iguales */
	//assert distintos([2]);                /*Cumple con el predicado, dado que ninguno de sus elementos entre ellos son iguales */
	var s : seq<int>;
	s := [];
	assert distintos(s);   
	//assert distintos(s);                    /*Cumple con el predicado*/
	//assert distintos([3,4,3,6]);              /*No cumple con el predicado , ya que el 3 se repite dos veces*/
	//assert distintos([6,3,3,1,5]);            /*No cumple con el predicado , ya que el 3 se repite seguido dos veces*/

	//var v:array<int> := new int[4];
	//v[0]:=6; v[1]:=7; v[2]:=8; v[3]:=-2;
	//assert distintos(v[0..v.Length]);           /*Cumple con el predicado,dado que ninguno de sus elementos entre ellos son iguales(secuencia)*/
	//assert distintosA(v);                       /*Cumple con el predicado,dado que ninguno de sus elementos entre ellos son iguales(array)*/
}


// 6. Escribir un predicado que indique que los elementos contiguos de una secuencia son distintos

predicate contiguosDistintos(s : seq<int>) 
{
 //Escribe aqui el predicado
    forall k:: 0 <= k < |s|-1 ==> s[k] != s[k+1]
}



// Comprueba si el predicado es cierto para algunas secuencias
// Este test es util para poder identificar errores del predicado

method TestContiguosDistintos() 
{
   //assert contiguosDistintos([1,4,2,8]);                /*Cumple con el predicado,entre elementos contiguos son diferentes*/
   //assert contiguosDistintos([6,3,1,9,2]);              /*Cumple con el predicado,entre elementos contiguos son diferentes*/
   //assert contiguosDistintos([2]);                      /*Cumple con el predicado,entre elementos contiguos son diferentes*/
	//var s:seq<int>;
	//s:=[];
	//assert contiguosDistintos(s);                       /*Cumple con el predicado*/
	//assert contiguosDistintos([3,4,3,6]);               /*Cumple con el predicado,entre elementos contiguos son diferentes*/
	//assert contiguosDistintos([6,3,3,1,5]);             /*No cumple con el predicado, ya que en la posicion de la secuencia 1 y 2 hay un mismo 3*/
	//var v:array<int> := new int[4];
	//v[0]:=6; v[1]:=7; v[2]:=6; v[3]:=-2;
	//assert contiguosDistintos(v[0..v.Length]);          /*Cumple con el predicado,entre elementos contiguos son diferentes(en este caso con un array)*/

}



// 7. Escribir un predicado que indique que una secuencia esta ordenada de manera no decreciente
predicate ordenado(s : seq<int>) {
    
    forall k:: 0 <= k < |s|-1 ==> s[k] <= s[k+1]
}

// Comprueba si el predicado es cierto para algunas secuencias
// Este test es util para poder identificar errores del predicado 

method TestOrdenado()
{
 //assert ordenado([]);                 /*Cumple con el predicado*/
 //assert ordenado([5]);                /*Cumple con el predicado,esta ordenado la secuencia*/
 //assert ordenado([1,6,8,9]);          /*Cumple con el predicado,esta ordenado la secuencia*/

 //assert ordenado([3,10,10,28]);           /*Cumple con el predicado,esta ordenado la secuencia*/
 //assert ordenado([3,6,1,9,10]);           /*No cumple con el predicado ya que no se encuentra ordenado*/


}



// 8. Escribir un predicado que indique que una secuencia esta ordenada de manera estrictamente creciente
predicate ordenadoEstricto(s : seq<int>) {
    
    forall k:: 0 <= k < |s|-1 ==> s[k] < s[k+1]
}

// Comprueba si el predicado es cierto para algunas secuencias
// Este test es util para poder identificar errores del predicado 

method TestOrdenadoEstricto()
{
 //assert ordenadoEstricto([]);                             /*Cumple con el predicado*/
 //assert ordenadoEstricto([5]);                            /*Cumple con el predicado,esta ordenado estrictamente la secuencia*/
 //assert ordenadoEstricto([1,6,8,9]);                      /*Cumple con el predicado,esta ordenado estrictamente la secuencia*/

 //assert ordenadoEstricto([3,10,10,28]);                           /*No cumple con la condicion, ya que es estrictamente (<)*/
 //assert ordenadoEstricto([3,6,1,9,10]);//Este test debe fallar    /*No cumple con la condicion ya es no esta ordenado de forma creciente*/
}



//Los existenciales son dificiles de demostrar
//9. Este predicado indica que hay un elemento en la secuencia igual a uno dado

predicate igual(s : seq<int>, x :int) {
   // exists u:int :: 0 <= u < |s| && s[u] == x //prueba con este
   x in s
}


// Comprueba que el predicado es cierto para algunas secuencias
// Este test es util para poder identificar errores del predicado (secuencias que no lo cumplen)
// y corregirlo cuando el test anterior falla.
method TestIgual() 
{  	var s : seq<int>;
 
    s := [1,7,0,5];
   // assert s[2]==0; //sin esta ayuda  no es capaz de demostrarlo
  	assert igual(s,0);
	s:=[];
	//assert igual(s,0); //este caso falla 
}

// ------------------------------------------


//10. Escribir un predicado que indique si una posicion de una secuencia es la primera posicion de la 
//secuencia (desde la izquierda) en la que aparece un cero o su longitud en caso de no haber ningun
//cero en la secuencia
predicate esPrimerCero(s : seq<int>, k : int) 
{
   
   forall j:: 0 <= k <= |s| && (0 <= j < k ==> s[j] != 0) && (0 <= k < |s| ==> s[k] == 0)

   //Tambien podría haberse separado por predicados a parte :

	/*	predicate hallarCero(s : seq<int>, k : int){ (0 <= k < |s| ==> s[k] == 0) }

		predicate nohayCerosAnteriores(s : seq<int>, k : int){
			forall j:: 0 <= j <= (k-1) && 0 <= k <= |s| ==> s[j] != 0 
		}

		predicate condicionInicial(s : seq<int>, k : int){	0 <= k <= |s|}
		*/

	// Y juntarlos todo en el predicado esPrimerCero { condicionInicial(s,k) && nohayCerosAnteriores(s,k) && hallarCero(s,k)}	
}

method TestEsPrimerCero() 
{  	//var s : seq<int>;
   // s := [1,7,0,5];
   // assert esPrimerCero(s,2);             /*Cumple con el predicado,ya que antes de la posición 2 no hay ningun 0*/
	//assert esPrimerCero(s,1);             /*No cumple el predicado, porque en la posicion 1 no hay ningun 0*/
	//s:= [1,7,4,5];
	//assert esPrimerCero(s,4);        /*Cumple con el predicado,ya que al no haber en la secuencia s ningun 0, k=4 es igual al tamaño de s*/
	//s:=[];
	//assert esPrimerCero(s,0);       /*Cumple con el predicado,ya que k=0 es igual al tamaño de s*/

    /*Algunos casos agregados  mios*/

    //s := [2,0,6,0];
	//assert esPrimerCero(s,1);           /*Cumple con el predicado,ya que antes de la posición 1 no hay ningun 0*/
    //assert esPrimerCero(s,2);           /*No cumple con el predicado ya en la posicion dos no hay ningun 0*/
    //assert esPrimerCero(s,3);           /*No cumple con el predicado porque ya habia un 0 en la posicion 1*/

	//s := [2,3,6,1];
	//assert esPrimerCero(s,8);			 /*No cumple con el predicado ya que no coincide la longitud de s con k*/
}


//10. Este predicado determina si una secuencia es permutacion de otra
predicate esPermutacion(s:seq<int>, t:seq<int>)
{multiset(s)==multiset(t)}

method TestEsPerm()
{
  // assert esPermutacion([1,4,2,5], [5,2,4,1]);  /*Cumple con el predicado,ya que son exactamente los mismos elementos en distinto orden*/

  // assert esPermutacion([1,1],[1]);  //No cumple con la condicion,porque el conjunto multiple de una secuencia considera cada
                                    //elemento por separado, mientras que un conjunto {1,1} solo tiene como maximo uno de cada elemento

}



/*Grupo: C  y  Nick/Avatar: Gatrix*/