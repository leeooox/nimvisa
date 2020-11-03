import ../src/nimvisa

let rm = newResourceManager()
echo rm.list_resources()
let my_instrument = rm.open_resource("USB0::0x1AB1::0x0E11::DP8C185151484::INSTR")
echo my_instrument.query("*IDN?")
my_instrument.write(":APPL CH1,0.6,0.4")
echo my_instrument.query(":APPL? CH1")
rm.close()
