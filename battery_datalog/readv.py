#Bring in the VISA library
import visa
from time import sleep, ctime
#Create a resource manager
resources = visa.ResourceManager('@py')
#Open the Rigol by name. (Change this to the string for your instrument)
oscilloscope = resources.open_resource(u'')
#Return the Rigol's ID string to tell us it's there
print(oscilloscope.query('*IDN?'))
lfd = open("voltages.txt", "a")
while True:
    #Select channel 1
    oscilloscope.query(':MEAS:SOUR:CHAN1')
    #Read the RMS voltage on that channel
    fullreading = oscilloscope.query(':MEAS:ITEM? VAVG,CHAN1')
    #Extract the reading from the resulting string...
    readinglines = fullreading.splitlines()
    # ...and convert it to a floating point value.
    reading = float(readinglines[0])
    #Send the reading to the terminal
    lfd.write("{1} VRMS: {0}\n".format(reading, ctime()))
    fullreading = oscilloscope.query(':MEAS:ITEM? VRMS,CHAN1')
    #Extract the reading from the resulting string...
    readinglines = fullreading.splitlines()
    # ...and convert it to a floating point value.
    reading = float(readinglines[0])
    #Send the reading to the terminal
    lfd.write("{1} VAVG: {0}\n".format(reading, ctime()))
    lfd.flush()
    sleep(60)
#Close the connection
oscilloscope.close()
