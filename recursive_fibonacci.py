def fibonacci(n):
    if n <= 1:
        return n
    else:
        return fibonacci(n-1) + fibonacci(n-2)


nterms = int(input("Enter number of terms: "))
if(nterms <= 0):
    print("Enter a positive integer: ")
else:
    print("Fibonnaci Series: ")
    for i in range(nterms):
        print(fibonacci(i))

