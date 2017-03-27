file = raw_input("Enter the file name: ")
if file == "na na boo boo":
    print "NA NA BOO BOO TO YOU - you have been punk'd!"
    quit()
else:
    try:
        fhand = open(file, 'r')
    except:
        print "File cannot be opened: %s" % file
        quit()
count = 0
for line in fhand:
    count += 1
print "There were %d lines in file %s" % (count, file)