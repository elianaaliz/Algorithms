#include<iostream>
using namespace std;

int main() {

	long long int n,vel;
	long long int ini = 0;

	cin >> n;

	while (cin) {	//si sigue escribiendo

		for (int i = 0; i < n; i++) {
			cin >> vel;
			if (vel > ini) {
				ini = vel;
			}
		}
		cout << ini << "\n";
		ini = 0;
		cin >> n;

	}
	
	return 0;
}
