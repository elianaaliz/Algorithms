#include<iostream>
using namespace std;

int main() {
	int muestra;
	cin >> muestra;

	while (muestra != 0) {
		
		bool correcto = true;
		long int max = 0,v;
		for (int i = 0; i < muestra; i++) {
			cin >> v;
			if (v > max) {
				max = v;
			}
			else {
				correcto = false;
			}
		}
		if (correcto) {
			cout << "SI\n";
		}
		else {
			cout << "NO\n";
		}

		cin >> muestra;
	}

	return 0;
}

//long int v[10000000];