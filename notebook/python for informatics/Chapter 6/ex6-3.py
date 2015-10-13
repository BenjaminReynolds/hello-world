def count(word, target):
    counter = 0
    for letter in word:
        if letter == target:
            counter += 1
    return counter
    
print count('banana', 'a')