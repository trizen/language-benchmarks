#include <iostream>
#include <stdlib.h>

using namespace std;

int fib(int n) {
    if (n > 1) {
        return fib(n-1) + fib(n-2);
    }
    return n;
}

int main(int argc, const char * argv[]) {
    cout << fib(atoi(argv[1])) << endl;
    return 0;
}
