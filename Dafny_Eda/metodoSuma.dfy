include "specFunctions.dfy"
//No hay Precondicion {P}
method msuma(v:array<int>) returns(suma:int)
ensures suma == SumS(v[0..v.Length])    //Post-Condicion{Q}
{
    suma := 0;
    var i : int;
    i := 0;

    while(i < v.Length)
        decreases v.Length - i  //Funcion Cota
        invariant 0 <= i <= v.Length    //Invariante
        invariant suma == SumS(v[0..i]) //Invariante
    {
        ArrayFacts<int>();
        SumProps(v);
        suma := suma + v[i];
        i := i+1;
    }

}
//Coste de la funcion:
//O(v.length) , es lineal con respecto al tamaño de entrada del vector