count = 0
total = 0
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

print total, count, total/count