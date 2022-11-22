n = int(input("Enter a number: "))
f1 = 0
f2 = 1

if n <= 1:
    print(n)
else:
    print(f1)
    print(f2)
    for i in range(2, n):
        f3 = f1 + f2
        print(f3)
        f1 = f2
        f2 = f3
