int fib(int n) {
   if (n > 1)
        return fib(n-2) + fib(n-1);

    return n;
}

int main() {
    write(fib(35) + "\n");
    return 0;
}
