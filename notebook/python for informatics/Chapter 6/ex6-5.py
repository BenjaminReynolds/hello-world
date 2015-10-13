str = 'X-DSPAM-Confidence: 0.8475'
start = str.find(':')
print float(str[start+2:len(str)-1])