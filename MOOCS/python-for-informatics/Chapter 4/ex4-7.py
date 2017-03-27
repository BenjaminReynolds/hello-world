score = raw_input("Enter score: ")
try:
    score = float(score)
except:
    print "Bad Score"

def computegrade(score):    
    if score < 0 or score > 1.0:
        return "Bad score"
    elif score < 0.6:
        return "F"
    elif score < 0.7:
        return "D"
    elif score < 0.8:
        return "C"
    elif score < 0.9:
        return "B"
    else:
        return "A"
        
print computegrade(score)