# Question 2.1

def multiply(m, n):
    """
    >>> multiply(5, 3)
    15
    """
    if n == 0:
        return 0
    elif n == 1:
        return m
    else:
        return m + multiply(m, n - 1)

# Question 2.2
def countdown(n):
    """
    >>> countdown(3)
    3
    2
    1
    """
    print(n)
    if n > 1:
        countdown(n - 1)

# Question 2.3
# moving the print statement to AFTER the recursive call
# and changing the conditional creates a countup function
def countup(n):
    """
    >>> countup(3)
    1
    2
    3
    """
    if n > 0:
        countup(n - 1)
        print(n)

# Question 2.4
def sum_digits(n):
    """
    >>> sum_digits(7)
    7
    >>> sum_digits(30)
    3
    >>> sum_digits(228)
    12
    """
    if n == 0:
        return 0
    else:
        return n % 10 + sum_digits(n // 10)

# Question 3.1
def count_stair_ways(n):
    if n == 1:
        return 1
    elif n == 2:
        return 2
    else:
        return count_stair_ways(n - 1) + count_stair_ways(n - 2)

# Question 3.2
def count_k(n, k):
    """
    >>> count_k(3, 3) # 3, 2 + 1, 1 + 2, 1 + 1 + 1
    4
    >>> count_k(4, 4)
    8
    >>> count_k(10, 3)
    274
    >>> count_k(300, 1) # Only one step at a time
    1
    """
    if n == 0:
        return 1
    elif n < 0:
        return 0
    else:
        total, i = 0, 1
        while i <= k:
            total += count_k(n - i, k)
            i += 1
        return total
