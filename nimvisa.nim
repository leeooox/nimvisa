import visa_wrapper,visa_exception
import os,strutils

const
  READ_BUFFER_LEN = 1024
  INSTR_NAME_LEN  = 256
  RSRC_TIMEOUT    = 2000
  IO_TIMEOUT      = 2000

type ResourceManager* = ref object of RootObj
  defaultRM:ViSession

proc newResourceManager*(): ResourceManager =
  result = ResourceManager()
  var defaultRM: ViSession
  checkStatus(viOpenDefaultRM(addr defaultRM))
  result.defaultRM = defaultRM


type Resource* = ref object of RootObj
   instr: ViSession
   query_delay: int # delay in milsecs
   write_termination: string # "\n"
   timeout:int
   iotimeout:int


proc newResource*(): Resource =
  result = Resource()
  result.query_delay = 0
  result.write_termination = "\r\n"
  result.timeout=   RSRC_TIMEOUT
  result.iotimeout= IO_TIMEOUT

#### forward_declaration
method set_visa_attribute(this:Resource,name:int,state:int): void {.base.}


##################### ResourceManager Objects ###################################
method list_resources*(this: ResourceManager): seq[string] {.base.}=
  var 
    #defaultRM: ViSession
    instr:     ViSession
    fList:     ViFindList
    numInstrs: ViUInt32
    desc = newString(INSTR_NAME_LEN).cstring

  var status = viFindRsrc(this.defaultRM, "?*", addr fList, addr numInstrs, desc)
  #checkStatus(status)
  while numInstrs>0:
    dec numInstrs
    status = viOpen(this.defaultRM, desc, VI_NULL, VI_NULL, addr instr)
    if (status<VI_SUCCESS):
      discard viFindNext(fList,desc)
      continue
    result.add($desc)
    checkStatus(viClose(instr))
    if numInstrs>0: checkStatus(viFindNext(fList,desc))
  checkStatus(viClose(fList))


method close*(this: ResourceManager): void {.base.}=
  checkStatus(this.defaultRM.viClose())

###resource_name,access_mode 
method open_resource*(this: ResourceManager,resource_name:string): Resource {.base.} =
  result = newResource()
  var status = this.defaultRM.viOpen(resource_name, VI_NULL, ViUInt32(result.timeout),
      addr result.instr)
  checkStatus(status)
  result.set_visa_attribute(VI_ATTR_TMO_VALUE,result.iotimeout)



###### Resoure is the base class of GPIBInstrument

method write*(this:Resource, message:string, termination:string=""): void {.base.} =
  var retCount: ViUInt32
  var write_message:string
  #if message.endsWith(termination):
  let term = if termination=="": this.write_termination else: termination
  if (term.len>0) and (not message.endsWith(term)):
    write_message = message&term
  else:
    write_message = message
  let status = this.instr.viWrite(write_message, ViUInt32(write_message.len),addr retCount)
  checkStatus(status)


method read*(this:Resource): string {.base.} =
  var buffer = newString(READ_BUFFER_LEN).cstring
  var retCount: ViUInt32
  let status = this.instr.viRead(buffer, READ_BUFFER_LEN, addr retCount)
  result = $buffer
  checkStatus(status)

method query*(this:Resource,message:string,delay:int=0): string {.base.}=
  this.write(message)
  let query_delay = if delay==0: this.query_delay else: delay
  sleep(query_delay)
  result = this.read()

method clear*(this:Resource): void {.base.} = checkStatus(this.instr.viClear())

method set_visa_attribute(this:Resource,name:int,state:int): void {.base.}=
  checkStatus(this.instr.viSetAttribute(ViAttr(name), ViAttrState(state)))

if isMainModule:
  let rm = newResourceManager()
  echo rm.list_resources()
  #rm.close()
  let my_instrument = rm.open_resource("USB0::0x1AB1::0x0E11::DP8C185151484::INSTR")
  echo my_instrument.query("*IDN?")
  my_instrument.write(":APPL CH1,0.6,0.4")
  echo my_instrument.query(":APPL? CH1")
  rm.close()