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
    
def computepay(hours, rate):    
    if hours > 40:
        return round((hours - 40) * (rate * 1.5) + (40 * rate), 2)
    else:
        return round(hours * rate, 2)

pay = computepay(hours, rate)
print "Pay:", pay
