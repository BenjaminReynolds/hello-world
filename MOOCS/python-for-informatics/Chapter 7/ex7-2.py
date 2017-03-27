file = raw_input("Enter a file name: ")
fhand = open(file, "r")
count = 0
total = 0
for line in fhand:
    if not line.startswith("X-DSPAM-Confidence: "):
        continue
    count += 1
    total += float(line[line.find(":")+2:len(line)-1])
print "Average spam confidence: %g" % (total/count)
    