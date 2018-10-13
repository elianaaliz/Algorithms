#include<iostream>
using namespace std;

void resuelveCasos(int n) {
	bool ok = true,ascendente = true,descendente = true;
	long long int altura = 0, aux = 0;
	cin >> altura;
	aux = altura;
	int i = 0;
	while (i < n - 1) {
		cin >> altura;
		if ((aux > altura) && ok && descendente) {
			ascendente = false;
		}
		else {
			if ((aux < altura) && ok && ascendente) {
				descendente = false;
			}
			else {
				ok = false;
			}
		}
		aux = altura;
		i++;
	}
	if (ok) { cout << "DALTON" << "\n"; }
	else {
		cout << "DESCONOCIDOS" << "\n";
	}
}

int main() {
	int n = 0;
	cin >> n;

	while (n != 0) {//num de personajes no es vacio para terminar
		resuelveCasos(n);
		cin >> n;
	}
	return 0;
}

