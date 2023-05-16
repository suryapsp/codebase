#include <iostream>
using namespace std;

int main(){
    // int a;
    // cin >> a;

    // if(a > 0){
    //     cout << "a is +ve" << endl;
    // }
    // else{
    //     cout << "a is -ve" << endl;
    // }

    // int a , b;
    // cout << "Enter the value of a: ";
    // cin >> a;

    // cout << "Enter the value of b: ";
    // cin  >> b;

    // //a = cin.get(); //gets only the character value

    // if (a > b){
    //     cout << "a is greater than b" << endl;
    // }
    // if (b > a){
    //     cout << "b is greater than a" << endl;
    // }

    // int a = 2;
    // int b = a+1;

    // if((a=3) == b){
    //     cout << a << endl;
    // }
    // else{
    //     cout << a+1 << endl;
    // }

    char ch;
    cin >> ch;
    if(ch <= 'z' && ch >= 'a'){
        cout << "ch is small" << endl;
    }
    else if(ch <= 'Z' && ch >= 'A'){
        cout << "ch is capital"<<endl;
    }
    else{
        cout << "ch is a number" << endl;
    }

}
