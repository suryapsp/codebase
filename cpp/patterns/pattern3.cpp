#include <iostream>
using namespace std;

// 4321
// 4321
// 4321
// 4321

// n = 4 
// row = 4
// column = 1 -> n

int main(){
    int n;
    cout << "Enter your number: ";
    cin >> n;
    int i = 1;
    

    while(i <= n){
        int j = 1;
        while(j <= n){
            cout << ((n+1) - j);
            j = j + 1;
        }
        cout << endl;
        i = i + 1;
    }
}
