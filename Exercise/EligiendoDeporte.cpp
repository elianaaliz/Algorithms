// Alberto Pastor Moreno
// E46


#include <iostream>
#include <iomanip>
#include <fstream>
#include <algorithm>
#include <vector>
#include <string>
#include<set>
#include "treemap_eda.h"

using namespace std;

/*
// Estructura que define el par <key,value> del mapa utilizado en el ejercicio
struct sport_ref_t{
	std::string key;
	int value;
	sport_ref_t(std::string k, int v) : key(k), value(v){}
};

// Compara dos instancias de la estructura sport_ref_t
bool cmp_sport_ref(const sport_ref_t &l, const sport_ref_t &r) {
	return l.value > r.value || (l.value == r.value && l.key < r.key);
}

// Traduce un mapa a un vector de pares tipados igual que el mapa
std::vector<sport_ref_t> map_to_vector(std::map<std::string, int> const & map){
	std::vector<sport_ref_t> v;
	for (auto it = map.begin(); it != map.cend(); it++)
		v.push_back({ it->first, it->second });
	return v;
}

// Imprime el mapa traduciendolo a un vector y ordenandolo segun el orden requerido en el ejercicio
void printMap(std::map<std::string, int> const & map){
	std::vector<sport_ref_t> v = map_to_vector(map);
	std::sort(v.begin(), v.end(), cmp_sport_ref);
	for (int i = 0; i < v.size(); ++i)
		std::cout << v[i].key << " " << v[i].value << "\n";
	std::cout << "***\n";
}
*/

// Resuelve un caso de prueba, leyendo de la entrada la
// configuración, y escribiendo la respuesta
bool resuelveCaso() {
	map<string, int> deportes;
	map<string, string> alumnoDep;
	string elemento, nombre, d;
	cin >> elemento;
	while (elemento != "_FIN_"){
		if (isupper(elemento[0])){
			d = elemento;
			deportes[d] = 0;
		}
		else{
			nombre = elemento;
			if (alumnoDep.count(nombre) == 0){
				alumnoDep[nombre] = d;
				++deportes[d];
			}
			else{
				if (d != alumnoDep[nombre] && alumnoDep[nombre] != "FUERA"){
					//eliminamos al alumno
					//bueno le escrito fuera o algo asi
					string fuera = "FUERA";
					string depAnterior = alumnoDep[nombre];
					--deportes[depAnterior];
					alumnoDep[nombre] = fuera;
				}
				//si es el mismo deporte no pasa nada
			}
		}
		cin >> elemento;
	}

	//imprimimos el mapa
	for (auto const& it : deportes)
		cout << it.clave << ' ' << it.valor << '\n';

	cout << "***" << endl;
	//funcion pero no esta ordenado, probare con la clase set
	//Para mostrarlo ordenado
	//set<string> ordenado;
	/*map<int, set<string>> ult;
	for (auto const& it : deportes){
		ult[it.valor].insert(it.clave);
	}*/
	
	
	/*for (auto const& it : ult){
		cout << it.clave << ' ';
		set<int>::iterator myIterator;
		set<string> mySet = it.valor;
		for (auto const& it : mySet){
			cout << (it*) << "\n";
		}
	}*/

	return true;
}

int main() {
	// Para la entrada por fichero.
	// Comentar para acepta el reto
#ifndef DOMJUDGE
	std::ifstream in("datos.txt");
	auto cinbuf = std::cin.rdbuf(in.rdbuf()); //save old buf and redirect std::cin to casos.txt
#endif 


	while (resuelveCaso());

	
	// Para restablecer entrada. Comentar para acepta el reto
#ifndef DOMJUDGE // para dejar todo como estaba al principio
	std::cin.rdbuf(cinbuf);
	system("PAUSE");
#endif
	
	return 0;
}