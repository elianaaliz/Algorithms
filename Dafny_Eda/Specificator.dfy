include "Gatrix.dfy" //sustituye aqui por tu fichero
include "specFunctions.dfy"


//1.Especificación de un metodo que determine si todos los elementos de un vector son distintos de un elemento dado
method mdistintosDe(v:array<int>, x:int) returns (b:bool)
//requires true
ensures b==distintosDe(v[0..v.Length],x)




//2.Especifica un metodo que determine si todos los elementos de un vector de enteros son positivos
method mpositivos(v:array<int>) returns (b:bool)
//Especifica
ensures b==positivos(v[0..v.Length])

//3.Especifica un metodo que determine si todos los elementos de un vector son iguales
method miguales(v:array<int>) returns (b:bool)
//Especifica
ensures b==iguales(v[0..v.Length])


//4.Especifica un metodo que determine si todos los elementos de un vector de enteros contenidos entre dos posiciones 
//dadas c (incluida) y f (excluida) son pares. Se considera que el intervalo [c,f) es vacio cuando c=f
method mparesEntreA(v:array<int>,c:int,f:int) returns (b:bool)
//Especifica
requires 0<=c<=f<=v.Length
requires positivos(v[c..f])
ensures b == forall k::c<=k<f ==> esPar(v[k])


//5.Especifica un metodo que determine si todos los elementos de un vector de enteros positivos contenidos entre dos posiciones 
//dadas c y f ambas incluidas son pares. Se considera que el intervalo [c,f] es vacio cuando c=f+1

method mparesEntreC(v:array<int>,c:int,f:int) returns (b:bool)
//Especifica
requires 0<=c<=f+1<=v.Length
requires forall k::c<=k<=f ==> v[k] >= 0
ensures b == forall k::c<=k<=f ==> esPar(v[k])


//6.Especifica un metodo que dado un vector de enteros devuelva la posicion en la que se encuentra el primer elemento
//igual a 0, y el numero de elementos en caso de no haber ninguno 
method mprimerCero(v:array<int>) returns (i:int)
//Especifica
ensures esPrimerCero(v[0..v.Length],i)


//7.Especifica un metodo que dado un vector de enteros devuelva un booleano que indica si existe algun 
//valor negativo en el vector y en caso de haberlo la posicion mas a la izquierda que contiene un valor negativo
method mprimerNegativo(v:array<int>) returns (b:bool, i:int)
//Especifica
ensures b <==> exists k:: o <= k.Length && v[k]<0
ensures b <==> 0<=i<v.Length && v[i]<0 && positivos(v[0..i])



//8.Especifica un metodo que calcule una posicion del maximo de un vector de enteros
method mmaximo(v:array<int>) returns (i:int) 
//Especifica
requires v.Length > 0
ensures 0<=i<v.Length
ensures forall k::0<=k<v.Length ==> v[i] >= v[k]

//9. Especifica un metodo que calcule la posicion de la aparicion mas a la izquierda  del maximo de un vector de enteros
method mprimerMaximo(v:array<int>) returns (i:int)
//Especifica
requires v.Length > 0
ensures 0<=i<v.Length
ensures forall k::0<=k<v.Length ==> v[i] >= v[k]
ensures forall l::0<=l<i ==> v[i]>v[l]


//10. Especifica un metodo que calcule la posicion de la aparicion mas a la derecha  del maximo de un vector de enteros
method multimoMaximo(v:array<int>) returns (i:int)
//Especifica 
requires v.Length > 0
ensures 0<=i<v.Length
ensures forall k::0<=k<v.Length ==> v[i] >= v[k]
ensures forall l::i<l<v.Length ==> v[i]>v[l]

//11. Especificación de un metodo que calcule el cociente y el resto de la division de naturales.
method mdivide (a: int, b:int) returns (c:int,r:int) //O(mcd(a,b))
requires a>=0 && b>0
ensures a==b*c+r && 0<=r<b

//12.Especifica un metodo que calcule la raiz entera de un entero positivo
method mraiz(n:int) returns (r:int) 
//Especifica
requires n > 0
ensures r >= 0 && r*r <= n < (r+1)*(r+1)

//13.Especifica un metodo que calcule la potencia de 2 elevado a un numero natural dado
function potencia(b:int,e:nat) : int
decreases e;
{
 if (e==0) then 1 else b*potencia(b,e-1)

}

method mpotencia(n:int) returns (pot:int)
//Especifica
requires n>=0
ensures pot ==potencia(2,n)


//14.Especifica un metodo que  calcula la suma de los elementos de un array de enteros
method msuma(v:array<int>) returns (suma:int) //de izquierda a derecha
//ensures  suma==SumS(v[0..v.Length])
ensures suma==SumV(v,0,v.Length)



//15.Especifica un metodo que cuenta el numero de pares de un array de enteros positivos
function ContarPares(s : seq<int>):nat
 decreases s;
 requires forall i:: 0<=i<|s| ==> s[i]>=0
 {
 if s==[] then 0
 else (if esPar((s[|s|-1])) then 1 else 0)+ContarPares(s[..|s|-1])
}

method mpares(v:array<int>) returns (n:int)
requires positivos(v[0..v.Length])
ensures  n==ContarPares(v[0..v.Length])

//16.Especifica un metodo que indica si un vector es Gaspariforme (ejercicio 8 de los apuntes)
method mgaspariforme(v:array<int>) returns (b:bool)
//Especifica 
ensures b==(SumS(v[0..v.Length]) == 0 && forall k::0<=k<v.Length ==> SumS(v[0..k]) >= 0)


//17.Especifica un método que indica si hay la misma cantidad de numeros pares que de impares en un array de enteros positivos
method mmismaParidad(v:array<int>) returns (b:bool)
//Especifica
ensures b == ((v.Length - ContarPares(v[0..v.Length])) == (ContarPares(v[0..v.Length])))

//18. Especifica un metodo que positiviza un vector de enteros, lo cual consiste en reemplazar los valores
// negativos por cero respetando el resto de valores
method mpositivizar(v:array<int>)
modifies v
ensures forall k::0<=k<v.Length && old(v[k])<0 ==> v[k]==0 &&
        forall k::0<=k<v.Length && old(v[k])>=0 ==> v[k]==old(v[k])


//19. Especifica un metodo que en un vector de enteros reemplaza todas las apariciones de un 
//numero dado x por otro y respetando el resto de valores
method mreemplazar(v:array<int>, x:int, y:int)
modifies v
//Especifica 
ensures forall k::0<=k<v.Length && old(v[k]) == x ==> v[k] == y &&
        forall k::0<=k<v.Length && old(v[k]) != x ==> v[k]== old(v[k])

//20. Especifica un metodo que dado un vector v de enteros devuelva otro vector w con su imagen especular 
method mespecular(v:array<int>,w:array<int>)
modifies w
//Especifica
requires v.Length == w.Length
ensures forall k:: 0 <= k < v.Length ==> w[k] = v[w.Length-1-k] //es correcto aunque marque error

