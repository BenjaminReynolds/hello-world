# Question 1.1
def wears_jacket(temp, raining):
    """
    >>> wears_jacket(90, False)
    False
    >>> wears_jacket(40, False)
    True
    >>> wears_jacket(100, True)
    True
    """
    return temp < 60 or raining

# Question 1.2
def handle_overflow(s1, s2):
    """
    >>> handle_overflow(27, 15)
    No overflow
    >>> handle_overflow(35, 29)
    Move to Section 2: 1
    >>> handle_overflow(20, 32)
    Move to Section 1: 10
    >>> handle_overflow(35, 30)
    No space left in either section
    """
    def overflow(from_section, to_section):
        overflow_room = 30 - to_section
        return overflow_room
    if s1 >= 30 and s2 >= 30:
        print("No space left in either section")
    elif s1 > 30:
        print("Move to Section 2:", 30 - s2)
    elif s2 > 30:
        print("Move to Section 1:", 30 - s1)
    else:
        print("No overflow")

# Question 1.4
def is_prime(n):
    """
    >>> is_prime(10)
    False
    >>> is_prime(7)
    True
    """
    i = 2
    while i < (n - 1):
        if n % i == 0:
            return False
        i += 1
    return True

# Question 2.1
def keep_ints(cond, n):
    """Print out all integers 1..i..n where cond(i) is true
    >>> def is_even(x):
    ...     # Even numbers have remainder 0 when divided by 2.
    ...     return x % 2 == 0
    >>> keep_ints(is_even, 5)
    2
    4
    """
    i = 1
    while i <= n:
        if cond(i):
            print(i)
        i += 1

# Question 2.3
def keep_ints(n):
    """Returns a function which takes one parameter cond and prints out
    all integers 1..i..n where calling cond(i) returns True.
    >>> def is_even(x):
    ...     # Even numbers have remainder 0 when divided by 2.
    ...     return x % 2 == 0
    >>> keep_ints(5)(is_even)
    2
    4
    """
    def print_ints(cond):
        i = 1
        while i <= n:
            if cond(i):
                print(i)
            i += 1
    return print_ints
