include defines

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
  ViConstString* = cstring
  ViFindList* = ViObject
  ViPFindList* = ptr ViFindList
  ViPUInt16* = ptr ViUInt16
  ViUInt16* = cuint
  ViJobId* = ViUInt32
  ViPJobId* = ptr ViJobId
  ViEventType* = ViUInt32
  ViEventFilter* = ViUInt32
  ViPEventType* = ptr ViEventType
  ViEvent* = ViObject
  ViPEvent* = ptr ViEvent
  ViHndlr* = ptr ViStatus
  ViAddr* = pointer



{.push dynlib: libName.}
#================ Resource Manager Functions and Operations ======================#
#ViStatus _VI_FUNC  viOpenDefaultRM (ViPSesksion vi);
proc viOpenDefaultRM*(vi: ViPSession): ViStatus {.fastcall, importc: "viOpenDefaultRM".}

#ViStatus _VI_FUNC  viFindRsrc      (ViSession sesn, ViConstString expr, ViPFindList vi,
#                                    ViPUInt32 retCnt, ViChar _VI_FAR desc[]);
proc viFindRsrc*(sesn:ViSession, expr:ViConstString, vi:ViPFindList, retCnt: ViPUInt32, 
    desc:cstring): ViStatus {.fastcall, importc: "viFindRsrc".}

#ViStatus _VI_FUNC  viFindNext      (ViFindList vi, ViChar _VI_FAR desc[]);
proc viFindNext*(vi:ViFindList, desc :cstring): ViStatus {.fastcall, importc: "viFindNext".}

#ViStatus _VI_FUNC  viParseRsrc     (ViSession rmSesn, ViConstRsrc rsrcName,
#                                    ViPUInt16 intfType, ViPUInt16 intfNum);
proc viParseRsrc*(rmSesn:ViSession,rsrcName:ViConstRsrc,
    intfType:ViPUInt16,intfNum:ViPUInt16 ) : ViStatus  {.fastcall, importc: "viParseRsrc".}

#ViStatus _VI_FUNC  viParseRsrcEx   (ViSession rmSesn, ViConstRsrc rsrcName, ViPUInt16 intfType,
#                                    ViPUInt16 intfNum, ViChar _VI_FAR rsrcClass[],
#                                    ViChar _VI_FAR expandedUnaliasedName[],
#                                    ViChar _VI_FAR aliasIfExists[]);
proc viParseRsrcEx*(rmSesn:ViSession,rsrcName:cstring,
    intfType:ViPUInt16,intfNum:ViPUInt16,
    expandedUnaliasedName: cstring,
    aliasIfExists: cstring
    ) : ViStatus {.fastcall, importc: "viParseRsrcEx".}

#ViStatus _VI_FUNC  viOpen          (ViSession sesn, ViConstRsrc name, ViAccessMode mode,
#                                    ViUInt32 timeout, ViPSession vi);
proc viOpen*(sesn:ViSession, name:ViConstRsrc, mode:ViAccessMode, timeout: ViUInt32, 
    vi:ViPSession): ViStatus {.fastcall, importc: "viOpen".}



#================ Resource Template Operations ======================#

#ViStatus _VI_FUNC  viClose         (ViObject vi);
proc viClose*(vi:ViObject): ViStatus {.fastcall, importc: "viClose".}

#ViStatus _VI_FUNC  viSetAttribute  (ViObject vi, ViAttr attrName, ViAttrState attrValue);
proc viSetAttribute*(vi:ViObject, attrName:ViAttr, attrValue:ViAttrState):
    ViStatus {.fastcall, importc: "viSetAttribute".}

#ViStatus _VI_FUNC  viGetAttribute  (ViObject vi, ViAttr attrName, void _VI_PTR attrValue);
proc viGetAttribute*(vi:ViObject, attrName:ViAttr,attrValue:pointer):
    ViStatus {.fastcall, importc: "viGetAttribute".}

#ViStatus _VI_FUNC  viStatusDesc    (ViObject vi, ViStatus status, ViChar _VI_FAR desc[]);
proc viStatusDesc*(vi:ViObject,status:ViStatus,desc:cstring): 
    ViStatus {.fastcall, importc: "viStatusDesc".}

#ViStatus _VI_FUNC  viTerminate     (ViObject vi, ViUInt16 degree, ViJobId jobId);
proc viTerminate*(vi:ViObject,degree:ViUInt16,jobId:ViJobId): 
    ViStatus {.fastcall, importc: "viTerminate".}

#ViStatus _VI_FUNC  viLock          (ViSession vi, ViAccessMode lockType, ViUInt32 timeout,
#                                    ViConstKeyId requestedKey, ViChar _VI_FAR accessKey[]);
proc viLock*(vi:ViSession,lockType:ViAccessMode,timeout:ViUInt32,
    requestedKey:cstring,accessKey:cstring):
    ViStatus {.fastcall, importc: "viUnlock".}

#ViStatus _VI_FUNC  viUnlock        (ViSession vi);
proc viUnlock*(vi:ViSession): ViStatus {.fastcall, importc: "viUnlock".}

#ViStatus _VI_FUNC  viEnableEvent   (ViSession vi, ViEventType eventType, ViUInt16 mechanism,
#                                    ViEventFilter context);
proc viEnableEvent*(vi:ViSession,eventType:ViEventType,mechanism:ViUInt16,context:ViEventFilter):
    ViStatus {.fastcall, importc: "viEnableEvent".}

#ViStatus _VI_FUNC  viDisableEvent  (ViSession vi, ViEventType eventType, ViUInt16 mechanism);
proc viDisableEvent*(vi:ViSession,eventType:ViEventType,mechanism:ViUInt16):
    ViStatus {.fastcall, importc: "viDisableEvent".}

#ViStatus _VI_FUNC  viDiscardEvents (ViSession vi, ViEventType eventType, ViUInt16 mechanism);
proc viDiscardEvents*(vi:ViSession,eventType:ViEventType,mechanism:ViUInt16):
    ViStatus {.fastcall, importc: "viDiscardEvents".}

#ViStatus _VI_FUNC  viWaitOnEvent   (ViSession vi, ViEventType inEventType, ViUInt32 timeout,
#                                    ViPEventType outEventType, ViPEvent outContext);
proc viWaitOnEvent*(vi:ViSession,inEventType:ViEventType,timeout:ViUInt32,
    outEventType:ViPEventType,outContext:ViPEvent):
    ViStatus {.fastcall, importc: "viWaitOnEvent".}
#ViStatus _VI_FUNC  viInstallHandler(ViSession vi, ViEventType eventType, ViHndlr handler,
#                                    ViAddr userHandle);
proc viInstallHandler*(vi:ViSession,eventType:ViEventType,handler:ViHndlr,
    userHandle:ViAddr): ViStatus {.fastcall, importc: "viInstallHandler".}

#ViStatus _VI_FUNC  viUninstallHandler(ViSession vi, ViEventType eventType, ViHndlr handler,
#                                      ViAddr userHandle);
proc viUninstallHandler*(vi:ViSession,eventType:ViEventType,handler:ViHndlr,
    userHandle:ViAddr): ViStatus {.fastcall, importc: "viUninstallHandler".}

#================ End of Resource Template Operations ======================#



#================      Basic I/O Operations     ======================#
#ViStatus _VI_FUNC  viRead          (ViSession vi, ViPBuf buf, ViUInt32 cnt, ViPUInt32 retCnt);
proc viRead*(vi:ViSession, buf:cstring, cnt:ViUInt32, retCnt:ViPUInt32):
    ViStatus {.fastcall, importc: "viRead".}

#ViStatus _VI_FUNC  viReadAsync     (ViSession vi, ViPBuf buf, ViUInt32 cnt, ViPJobId  jobId);
proc viReadAsync*(vi:ViSession, buf:cstring, cnt:ViUInt32, jobId:ViPJobId):
    ViStatus {.fastcall, importc: "viReadAsync".}
#ViStatus _VI_FUNC  viReadToFile    (ViSession vi, ViConstString filename, ViUInt32 cnt,
#                                    ViPUInt32 retCnt);
proc viReadToFile*(vi:ViSession, filename:cstring, cnt:ViUInt32, retCnt:ViPUInt32):
    ViStatus {.fastcall, importc: "viReadToFile".}

#ViStatus _VI_FUNC  viWrite         (ViSession vi, ViConstBuf  buf, ViUInt32 cnt, ViPUInt32 retCnt);
proc viWrite*(vi:ViSession, buf:cstring, cnt:ViUInt32, retCnt:ViPUInt32):
    ViStatus {.fastcall, importc: "viWrite".}

#ViStatus _VI_FUNC  viWriteAsync    (ViSession vi, ViConstBuf  buf, ViUInt32 cnt, ViPJobId  jobId);
proc viWriteAsync*(vi:ViSession, buf:cstring, cnt:ViUInt32, jobId:ViPJobId):
    ViStatus {.fastcall, importc: "viWriteAsync".}

#ViStatus _VI_FUNC  viWriteFromFile (ViSession vi, ViConstString filename, ViUInt32 cnt,
#                                    ViPUInt32 retCnt);
proc viWriteFromFile*(vi:ViSession, filename:cstring, cnt:ViUInt32,retCnt:ViPUInt32):
    ViStatus {.fastcall, importc: "viWriteFromFile".}

#ViStatus _VI_FUNC  viAssertTrigger (ViSession vi, ViUInt16 protocol);
proc viAssertTrigger*(vi:ViSession,protocol:ViUInt16):ViStatus {.fastcall, importc: "viAssertTrigger".}

#ViStatus _VI_FUNC  viReadSTB       (ViSession vi, ViPUInt16 status);
proc viReadSTB*(vi:ViSession,status:ViPUInt16):ViStatus {.fastcall, importc: "viReadSTB".}
#ViStatus _VI_FUNC  viClear         (ViSession vi);
proc viClear*(vi:ViSession):ViStatus {.fastcall, importc: "viClear".}
#================     End of Basic I/O Operations     ======================#

#================      Formatted and Buffered I/O Operations   =============#
#ViStatus _VI_FUNC  viSetBuf        (ViSession vi, ViUInt16 mask, ViUInt32 size);
proc viSetBuf*(vi:ViSession,mask:ViUInt16,size:ViUInt32): ViStatus {.fastcall, importc: "viSetBuf".}
#ViStatus _VI_FUNC  viFlush         (ViSession vi, ViUInt16 mask);
proc viFlush*(vi:ViSession,mask:ViUInt16): ViStatus {.fastcall, importc: "viFlush".}
#ViStatus _VI_FUNC  viBufWrite      (ViSession vi, ViConstBuf  buf, ViUInt32 cnt, ViPUInt32 retCnt);
proc viBufWrite*(vi:ViSession,buf:ViConstBuf,cnt:ViUInt32,retCnt:ViPUInt32): 
    ViStatus {.fastcall, importc: "viBufWrite".}
#ViStatus _VI_FUNC  viBufRead       (ViSession vi, ViPBuf buf, ViUInt32 cnt, ViPUInt32 retCnt);
proc viBufRead*(vi:ViSession, buf:cstring, cnt:ViUInt32, retCnt:ViPUInt32):
    ViStatus {.fastcall, importc: "viBufRead".}

#These print function are marked as to be done. Not really needed for Nim
#ViStatus _VI_FUNCC viPrintf        (ViSession vi, ViConstString writeFmt, ...);
#ViStatus _VI_FUNC  viVPrintf       (ViSession vi, ViConstString writeFmt, ViVAList params);
#ViStatus _VI_FUNCC viSPrintf       (ViSession vi, ViBuf buf, ViConstString writeFmt, ...);
#ViStatus _VI_FUNC  viVSPrintf      (ViSession vi, ViBuf buf, ViConstString writeFmt,
#                                    ViVAList parms);
#
#ViStatus _VI_FUNCC viScanf         (ViSession vi, ViConstString readFmt, ...);
#ViStatus _VI_FUNC  viVScanf        (ViSession vi, ViConstString readFmt, ViVAList params);
#ViStatus _VI_FUNCC viSScanf        (ViSession vi, ViConstBuf buf, ViConstString readFmt, ...);
#ViStatus _VI_FUNC  viVSScanf       (ViSession vi, ViConstBuf buf, ViConstString readFmt,
#                                    ViVAList parms);
#
#ViStatus _VI_FUNCC viQueryf        (ViSession vi, ViConstString writeFmt, ViConstString readFmt, ...);
#ViStatus _VI_FUNC  viVQueryf       (ViSession vi, ViConstString writeFmt, ViConstString readFmt,
#                                    ViVAList params);


{.pop.}

