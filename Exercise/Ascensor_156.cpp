#include<iostream>
#include<cmath>
using namespace std;

int main() {

	int origen = 0;
	cin >> origen;

	while (origen >= 0) {
		int sumapisos = 0;
		int destino = 0;
		cin >> destino;
		while (destino != -1) {
			sumapisos += abs(destino - origen);
			origen = destino;
			cin >> destino;
		}

		cout << sumapisos << "\n";
		cin >> origen;
	}
	return 0;
}


/**#include<iostream>
#include<cmath>
using namespace std;

int main() {

	int origen = 0;
	cin >> origen;

	while (origen >= 0) {
		int sumapisos = 0;
		int destino = 0;
		cin >> destino;
		while (destino != -1) {
			sumapisos += abs(destino - origen);
			origen = destino;
			cin >> destino;
		}

		cout << sumapisos << "\n";
		cin >> origen;
	}
	return 0;
}**/