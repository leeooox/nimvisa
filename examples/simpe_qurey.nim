import ../src/nimvisa

let rm = newResourceManager()
echo rm.list_resources() # print all the resource.
let my_instrument = rm.open_resource("USB0::0x1AB1::0x0E11::DP8C185151484::INSTR")
echo my_instrument.query("*IDN?")
rm.close()