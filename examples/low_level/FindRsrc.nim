import ../../src/nimvisa/visa_wrapper

import strFormat


var 
  defaultRM: ViSession
  instr: ViSession
  fList: ViFindList
  numInstrs: ViUInt32
  desc = newString(256).cstring



var status = viOpenDefaultRM(addr defaultRM)

if status < VI_SUCCESS:
  echo "Could not open a session to the VISA Resource Manager!"


status = viFindRsrc(defaultRM, "?*", addr fList, addr numInstrs, desc)
if status < VI_SUCCESS:
  echo "An error occurred while finding resources\n"
  quit(-1)

echo fmt"{numInstrs} instruments, serial ports, and other resources found:\n\n" 

while numInstrs>0:
  dec numInstrs
  status = viOpen(defaultRM, desc, VI_NULL, VI_NULL, addr instr)
  if (status<VI_SUCCESS):
    discard viFindNext(fList,desc)
    echo "An error occurred finding the next resource."
    continue
  echo fmt"{desc} "
  discard viClose(instr)
  discard viFindNext(fList,desc)
# clean up
discard viClose(fList)
discard viClose(defaultRM)