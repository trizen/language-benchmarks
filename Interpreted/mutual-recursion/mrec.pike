int main(int argc, array(string) argv) {
   write(F((int)argv[1]) + "\n");
   write(M((int)argv[1]) + "\n");
}

int F(int n) {
    return (n == 0 ? 1 : n - M(F(n-1)));
}

int M(int n) {
    return (n == 0 ? 0 : n - F(M(n-1)));
}
