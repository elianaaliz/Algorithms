#include<iostream>
#include<fstream>
#include<string>
using namespace std;

int main() {

	int mesas;
	while (cin >> mesas && mesas != 0) {

		int contI = 0, contD = 0;
		char silla;
		cin.get(silla);//DEL ESPACIO
		for (int i = 0; i < mesas; i++) {
			cin.get(silla);
			//cin >> silla;
			cout << silla << ".." << "\n";	//esta linea no pertenece al programa era depuracion
			if (silla == 'D') { contD++; }
			else if (silla == 'I') { contI++; }

		}

		if (contD > 0 && contI > 0) {
			cout << "ALGUNO NO COME" << "\n";
		}
		else {
			cout << "TODOS COMEN" << "\n";
		}

	}

	return 0;
}


/*int main() {

	int mesas;
	while (cin >> mesas && mesas != 0) {

		char sillas[1000];
		int i = 0, j = 2;
		bool ok = true;
		for (int i = 0; i < mesas; i++) {
			cin >> sillas[i];
		}
		

		while (i < mesas && j < mesas) {
			//cout << sillas[i] << " - " << sillas[j] << "\n";
			if (sillas[i] == 'D' && sillas[j] == 'I') {
				ok = false;
			}

			else {
				if (sillas[i] == 'I' && sillas[j] == 'D') {
					ok = false;
				}
				else {
					if (sillas[1] == 'I' && sillas[mesas - 1] == 'D' || sillas[1] == 'D' && sillas[mesas - 1] == 'I') {
						ok = false;
					}
				}
			}
			i++;
			j++;
		}

		if (ok) { cout << "TODOS COMEN" << "\n"; }
		else { cout << "ALGUNO NO COME" << "\n"; }

	}

	return 0;
}*/