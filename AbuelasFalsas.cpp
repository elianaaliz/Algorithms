#include<iostream>
#include<fstream>
#include<string>
using namespace std;

int main() {

	int n_casos = 0;
	cin >> n_casos;

	while (n_casos--) {
		//bool abuela = false; // no hace falta
		string nieto, nom;
		int nombres;
		cin.get(); // el salto de linea
		cin >> nieto;
		cin >> nombres;
		int i = 0,cont = 0;
		while(i < nombres) {
			cin.get();// el espacio despues del # de nombres falsos(nietos)
			cin >> nom;
			if (nom != nieto) {
				cont++;
			}
			i++;
		}
		//aqui ten cuidado , porque te pensabas que el booleano te controlaba lo de nombres > 1
		if (cont == (nombres - 1) && nieto == nom && nombres > 1) {	
			cout << "VERDADERA" << "\n";
		}
		else {
			cout << "FALSA" << "\n";
		}
	}


	return 0;
}
