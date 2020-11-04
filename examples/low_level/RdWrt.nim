import ../../src/nimvisa/visa_wrapper

import strFormat


var 
  defaultRM: ViSession
  instr: ViSession
  retCount: ViUInt32
  buffer = newString(200).cstring


var status = viOpenDefaultRM(addr defaultRM)

if status < VI_SUCCESS:
  echo "Could not open a session to the VISA Resource Manager!"

status = defaultRM.viOpen("USB0::0x1AB1::0x0E11::DP8C185151484::INSTR", VI_NULL, VI_NULL, addr instr)

echo "instr=", instr
#Set timeout value to 5000 milliseconds (5 seconds).
status = instr.viSetAttribute(VI_ATTR_TMO_VALUE, 5000)
echo status

status = instr.viWrite("*IDN?\n", 6, addr retCount)
echo status
echo "rectCount=",retCount

status = instr.viRead(buffer, 200, addr retCount)
echo status

echo buffer

discard viClose(instr)
discard viClose(defaultRM)