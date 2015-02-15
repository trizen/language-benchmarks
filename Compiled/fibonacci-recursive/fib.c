#include <stdio.h>
#include <stdlib.h>

int fib(int n) {
    if (n > 1) {
        return fib(n-1) + fib(n-2);
    }
    return n;
}

int main(int argc, const char * argv[]) {
    printf("%d\n", fib(atoi(argv[1])));
    return 0;
}
