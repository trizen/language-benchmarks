int main(int argc, array(string) argv) {
   write(ackermann((int)argv[1], (int)argv[2]) + "\n");
}

int ackermann(int m, int n){
   if(m == 0){
      return n + 1;
   } else if(n == 0){
      return ackermann(m-1, 1);
   } else {
      return ackermann(m-1, ackermann(m, n-1));
   }
}
