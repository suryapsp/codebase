#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;


int main() {
    int a, b, c;
    int sum = 0;
    cin >> a >> b >> c;
    if(a,b,c <= 1000 && a,b,c >= 1){
        sum = a + b + c;
    }
    cout << sum;
    return 0;
}
