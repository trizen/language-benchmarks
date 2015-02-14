#include <stdio.h>

int fib(int n) {
    if (n <= 1)
        return n;

    return fib(n-1) + fib(n-2);
}

int main() {
    printf("%d\n", fib(40));
    return 0;
}
