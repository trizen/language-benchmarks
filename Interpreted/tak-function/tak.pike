int tak(int x, int y, int z) {
   return(y<x ? tak(tak(x - 1, y, z), tak(y - 1, z, x), tak(z - 1, x, y)) : z);
}

int main(int argc, array(string) argv) {
    write(tak((int)argv[1], (int)argv[2], (int)argv[3]) + "\n");
    return 0;
}
