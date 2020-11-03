# nimvisa
nimvisa is C wrapper for NI-VISA instrument control library

As I cannot find a visa library for Nim, I decided to do it by myself.

**visa_wrapper.nim** is the FFI of  C wrapper of NI-Visa to Nim

**nimvisa.nim** is high level based on visa_wrapper and inspired by [pyvisa](https://github.com/pyvisa/pyvisa). Only necessary procs(function) are implemented, and others to be done later when necessary.

## Testing your installation

```nim
let rm = newResourceManager()
echo rm.list_resources() # print all the resource.
```


## Example 

```nim
import nimvisa
# an example to control Rigol DP832 DC power supply by USB cable
let rm = newResourceManager()
echo rm.list_resources()
let my_instrument = rm.open_resource("USB0::0x1AB1::0x0E11::DP8C185151484::INSTR")
echo my_instrument.query("*IDN?")
my_instrument.write(":APPL CH1,0.6,0.4") # set channel 1 to 0.6V and current limitation to 0.4A
echo my_instrument.query(":APPL? CH1")
rm.close()
```

As limited bandwidth, I only implement it on windows10 64bit system.