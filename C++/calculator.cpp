#include <iostream>
using namespace std;

// Operacoes Artimeticas
extern "C" int adicionar(int x, int y);
extern "C" int multiplicar(int x, int y);
extern "C" int divisao(int x, int y);
extern "C" int subtrair(int x, int y);

int main() {
    int num1, num2 = 0;
    int opcao0, opcao1 = 0;

    while(true) {
        cout << "+-----------------------+" << endl;
        cout << "+----- Calculadora -----+" << endl;
        cout << "+-----------------------+" << endl;
        cout << "0 - Sair do Programa" << endl;
        cout << "1 - Adicionar" << endl;
        cout << "2 - Subtrair" << endl;
        cout << "3 - Multiplicar" << endl;
        cout << "4 - Dividir" << endl;
        
        cout << "Escolha a operacao a realizar: " << endl;
        cin >>  opcao0;

        if (opcao0 == 0) {
            cout << "Terminei!!!" << endl;
            break;
        } else if (opcao0 == 1) {
            cout << "Processo de Adicao" << endl;
            cout << "Introduza os numeros: " << endl;
            cout << "Numero1: ";
            cin >> num1;
            cout << "Numero2: ";
            cin >> num2;

            cout << "O resultado foi: " << adicionar(num1, num2) << endl;
        } else if (opcao0 == 2) {
            cout << "Processo de Subtracao" << endl;
            cout << "Introduza os numeros: " << endl;
            cout << "Numero1: ";
            cin >> num1;
            cout << "Numero2: ";
            cin >> num2;

            cout << "O resultado foi: " << subtrair(num1, num2) << endl;
        } else if (opcao0 == 3) {
            cout << "Processo de Multiplicacao" << endl;
            cout << "Introduza os numeros: " << endl;
            cout << "Numero1: ";
            cin >> num1;
            cout << "Numero2: ";
            cin >> num2;

            cout << "O resultado foi: " << multiplicar(num1, num2) << endl;
        } else if (opcao0 == 4) {
            cout << "Processo de Divisao" << endl;
            cout << "Introduza os numeros: " << endl;
            cout << "Numero1: ";
            cin >> num1;
            cout << "Numero2: ";
            cin >> num2;

            cout << "O resultado foi: " << divisao(num1, num2) << endl;
        } else {
            cout << "Valor da Opcao invalida" << endl;
        }
            
        cout << "> Pressione 1 - Para voltar ao menu principal e Realizar novas operacoes." << endl;
        cout << "> Ou pressione qualquer tecla para sair do programa" <<endl;
        cin >> opcao1;
        if (opcao1 != 1) break;
    }
     
    return 0;
}