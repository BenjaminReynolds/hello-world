hours = float(raw_input("Enter Hours: "))
rate = float(raw_input("Enter Rate: "))
if hours > 40:
    pay = round((hours - 40) * (rate * 1.5) + (40 * rate), 2)
else:
    pay = round(hours * rate,2)

print "Pay:", pay
