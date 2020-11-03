# nimvisa
nimvisa is C wrapper for NI-VISA instrument control library

As I cannot find a visa library for NIm, I decided to do it by myself.

visa_wrapper.nim is the FFI of  C wrapper of NI-Visa to Nim

nimvisa.nim is high level based on visa_wrapper and inspired by pyvisa. Only necessary procs(function) are implemented, and others to be done later when necessary.

## Testing your installation

```nim
let rm = newResourceManager()
echo rm.list_resources() # print all the resource.
```


## Example

```nim
import nimvisa

let rm = newResourceManager()
let my_instrument = rm.open_resource("USB0::0x1AB1::0x0E11::DP8C185151484::INSTR")
echo my_instrument.query("*IDN?")
rm.close()
```

As limited bandwidth, I only implement it on windows10 64bit system.