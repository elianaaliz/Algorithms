#include<iostream>
#include<fstream>
using namespace std;
char frase[1000000];
int conjuntos[1000000];
bool resuelve() {
	
	char letra ;
	
	int nConjuntos = 0, n = 0;

	cin.get(letra);
	while (letra != '\n') {
		frase[n] = letra;
		n++;
		cin.get(letra);

	}
	cout << frase << ".....+";

	conjuntos[0] = nConjuntos;
	for (int i = 1; i < n; i++) {
		if (frase[i - 1] != frase[i]) {
			nConjuntos++;
		}
		conjuntos[i] = nConjuntos;
	}

	int n_Intervalos, a, b;
	cin >> n_Intervalos;
	cout << n_Intervalos << "#";
	if (n_Intervalos == 0) {
		return false;
	}

	for (int x = 0; x < n_Intervalos; x++) {
		cin >> a;
		cin >> b;

		if (conjuntos[a] == conjuntos[b]) {
			cout << "SI\n";
		}
		else {
			cout << "NO\n";
		}
	}


	/*lO DE AQUI ABAJO NO SIRVE O NO VALE, ESTA MAL, ES MEJOR PENSAR COMO SEMI CONJUNTOS*/

	//cin.get(frase); //leer el char
	/*cin >> n_intervalos;

	while (n_intervalos-- ) {
		int a, b;
		cin >> a;
		cin >> b;
		int i = a, j = b;
		if (b < a) {
			j = a;
			i = b;
		}
		int l = i + 1;
		char igual = frase[i];
		bool correcto = true;
		while (l < b + 1 && correcto) {
			if (igual != frase[l]) {
				correcto = false;
			}
		}

		if (correcto) { cout << "SI" << "\n"; }
		else {
			cout << "NO" << "\n";
		}
	}*/

	cout << "\n";
	cin.get(letra);
	return true;
}
int main() {

	while (resuelve());

	return 0;
	
}