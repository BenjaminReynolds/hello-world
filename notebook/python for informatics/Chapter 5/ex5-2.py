count = 0
total = 0
smallest = None
largest = None
while True:
    inp = raw_input("Enter a number: ")
    if inp == "done":
        break
    try:
        inp = float(inp)
    except:
        print "Invalid input"
        continue
    count += 1
    total += inp
    if inp > largest or largest is None:
        largest = inp
    if inp < smallest or smallest is None:
        smallest = inp

print total, count, largest, smallest