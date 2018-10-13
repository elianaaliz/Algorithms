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

	conjuntos[0] = nConjuntos;
	for (int i = 1; i < n; i++) {
		if (frase[i - 1] != frase[i]) {
			nConjuntos++;
		}
		conjuntos[i] = nConjuntos;
	}

	int n_Intervalos, a, b;
	cin >> n_Intervalos;

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

	cout << "\n";
	cin.get(letra);
	return true;
}
int main() {

	while (resuelve());

	return 0;
	
}
