int fib(int n) {
   return(n > 1 ? fib(n-2) + fib(n-1) : n);
}

int main(int argc, array(string) argv) {
    write(fib((int)argv[1]) + "\n");
    return 0;
}
