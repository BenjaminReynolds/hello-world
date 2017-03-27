file = raw_input("Enter a file name: ")
fhand = open(file, "r")
for line in fhand:
    print line.rstrip().upper()