import visa

var 
  defaultRM: ViSession
  instr: ViSession
  retCount: ViUInt32
  buffer = newString(200).cstring



echo viOpenDefaultRM(addr defaultRM)

var status = viOpen(defaultRM, "USB0::0x1AB1::0x0E11::DP8C185151484::INSTR", 0, 0, addr instr)

echo status

status = viSetAttribute(instr, VI_ATTR_TMO_VALUE, 5000)
echo status

status = viWrite(instr, "*IDN?\n", 6, addr retCount)
echo status

echo $buffer
status = viRead(instr, buffer, 200, addr retCount)
echo $buffer
echo retCount

#echo buffer.isNil()