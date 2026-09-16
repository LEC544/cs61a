def is_prime(n):
    """Returns True if n is a prime number and False otherwise.
    >>> is_prime(2)
    True
    >>> is_prime(16)
    False
    >>> is_prime(521)
    True
    """
    "*** YOUR CODE HERE ***"
    """
    create a new function with one argument to judge whether n is prime or not
    """
    def f(i):
        if n % i == 0:
            return False  #if n is divisible ,return False
        elif i * i >= n:  
            return True
        else:
            return f(i + 1)  #next i
    return f(2)  #start with 2
