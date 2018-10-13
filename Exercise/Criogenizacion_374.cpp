#include<iostream>
using namespace std;

int main() {

	int ncasos;
	cin >> ncasos;

	for(int i = 0; i < ncasos; i++){
		long long int temp;
		cin >> temp;

		long long int Max = temp, Min = temp;
		long long int vecesMax = 1, vecesMin = 1;
		
		while (cin >> temp && temp != 0) {
			if (temp > Max) {
				Max = temp;
				vecesMax = 1;
			}else {
				if (temp == Max) { vecesMax++; }
			}
			if (temp < Min) {
				Min = temp;
				vecesMin = 1;
			}else {
				if (temp == Min) { vecesMin++; }
			}
			
		}

		cout << Min << " " << vecesMin << " " << Max << " " << vecesMax << "\n";

	}
	return 0;
}