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

