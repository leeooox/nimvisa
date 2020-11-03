import ../src/nimvisa
import os

let rm = newResourceManager()
echo rm.list_resources()
let my_instrument = rm.open_resource("USB0::0x0699::0x0507::C051920::INSTR")
echo my_instrument.query("*IDN?")
my_instrument.write("AUTOSET EXECute")
os.sleep(5000)
echo my_instrument.query(":MEASUrement:MEAS?")
#rm.close()