const libName* = "visa32.dll"

# for 64bit system only
type
  ViUInt32* = cuint
  ViUInt64* = cuint
  ViStatus* = cint
  ViSession* = ViUInt32
  ViPSession* = ptr ViSession
  ViConstRsrc* = cstring
  ViAccessMode* = ViUInt32
  ViObject* = ViUInt32
  ViAttr* = ViUInt32
  ViAttrState* = ViUInt64
  ViConstBuf* = cstring
  ViPUInt32* = ptr ViUInt32

const VI_ATTR_TMO_VALUE* = 0x3FFF001A

{.push dynlib: libName.}
#================ Resource Manager Functions and Operations ======================#
#ViStatus _VI_FUNC  viOpenDefaultRM (ViPSession vi);
proc viOpenDefaultRM*(vi: ViPSession): ViStatus {.fastcall, importc: "viOpenDefaultRM".}

#ViStatus _VI_FUNC  viFindRsrc      (ViSession sesn, ViConstString expr, ViPFindList vi,
#                                    ViPUInt32 retCnt, ViChar _VI_FAR desc[]);

#proc viFindRsrc

#ViStatus _VI_FUNC  viOpen          (ViSession sesn, ViConstRsrc name, ViAccessMode mode,
#                                    ViUInt32 timeout, ViPSession vi);
proc viOpen*(sesn:ViSession, name:ViConstRsrc, mode:ViAccessMode, timeout: ViUInt32, 
    vi:ViPSession): ViStatus {.fastcall, importc: "viOpen".}



#================ Resource Template Operations ======================#

#ViStatus _VI_FUNC  viSetAttribute  (ViObject vi, ViAttr attrName, ViAttrState attrValue);
proc viSetAttribute*(vi:ViObject, attrName:ViAttr, attrValue:ViAttrState):
    ViStatus {.fastcall, importc: "viSetAttribute".}

#ViStatus _VI_FUNC  viWrite         (ViSession vi, ViConstBuf  buf, ViUInt32 cnt, ViPUInt32 retCnt);
proc viWrite*(vi:ViSession, buf:ViConstBuf, cnt:ViUInt32, retCnt:ViPUInt32):
    ViStatus {.fastcall, importc: "viWrite".}

#ViStatus _VI_FUNC  viRead          (ViSession vi, ViPBuf buf, ViUInt32 cnt, ViPUInt32 retCnt);
proc viRead*(vi:ViSession, buf:cstring, cnt:ViUInt32, retCnt:ViPUInt32):
    ViStatus {.fastcall, importc: "viRead".}


#================      Basic I/O Operations     ======================#

{.pop.}

