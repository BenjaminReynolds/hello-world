hours = raw_input("Enter Hours: ")
try:
    hours = float(hours)
except:
    print "Error, please enter numeric input"
    quit()
    
rate = raw_input("Enter Rate: ")
try:
    rate = float(rate)
except:
    print "Error, please enter numeric input"
    quit()
    
if hours > 40:
    pay = round((hours - 40) * (rate * 1.5) + (40 * rate), 2)
else:
    pay = round(hours * rate,2)

print "Pay:", pay
