import sys
sys.setrecursionlimit(10000)

def ack(M, N):
    if M == 0:
        return N + 1
    elif N == 0:
        return ack(M - 1, 1)
    else:
        return ack(M - 1, ack(M, N - 1))

print(ack(int(sys.argv[1]), int(sys.argv[2])))
