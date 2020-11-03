import defines

type ERROR_SYSTEM_ERROR*      = object of CatchableError
type ERROR_INV_OBJECT*        = object of CatchableError
type ERROR_RSRC_LOCKED*       = object of CatchableError
type ERROR_INV_EXPR*          = object of CatchableError
type ERROR_RSRC_NFOUND*       = object of CatchableError
type ERROR_INV_RSRC_NAME*     = object of CatchableError
type ERROR_INV_ACC_MODE*      = object of CatchableError
type ERROR_TMO*               = object of CatchableError
type ERROR_CLOSING_FAILED*    = object of CatchableError
type ERROR_INV_DEGREE*        = object of CatchableError
type ERROR_INV_JOB_ID*        = object of CatchableError
type ERROR_NSUP_ATTR*         = object of CatchableError
type ERROR_NSUP_ATTR_STATE*   = object of CatchableError
type ERROR_ATTR_READONLY*     = object of CatchableError
type ERROR_INV_LOCK_TYPE*     = object of CatchableError
type ERROR_INV_ACCESS_KEY*    = object of CatchableError
type ERROR_INV_EVENT*         = object of CatchableError
type ERROR_INV_MECH*          = object of CatchableError
type ERROR_HNDLR_NINSTALLED*  = object of CatchableError
type ERROR_INV_HNDLR_REF*     = object of CatchableError
type ERROR_INV_CONTEXT*       = object of CatchableError
type ERROR_QUEUE_OVERFLOW*    = object of CatchableError
type ERROR_NENABLED*          = object of CatchableError
type ERROR_ABORT*             = object of CatchableError
type ERROR_RAW_WR_PROT_VIOL*  = object of CatchableError
type ERROR_RAW_RD_PROT_VIOL*  = object of CatchableError
type ERROR_OUTP_PROT_VIOL*    = object of CatchableError
type ERROR_INP_PROT_VIOL*     = object of CatchableError
type ERROR_BERR*              = object of CatchableError
type ERROR_IN_PROGRESS*       = object of CatchableError
type ERROR_INV_SETUP*         = object of CatchableError
type ERROR_QUEUE_ERROR*       = object of CatchableError
type ERROR_ALLOC*             = object of CatchableError
type ERROR_INV_MASK*          = object of CatchableError
type ERROR_IO*                = object of CatchableError
type ERROR_INV_FMT*           = object of CatchableError
type ERROR_NSUP_FMT*          = object of CatchableError
type ERROR_LINE_IN_USE*       = object of CatchableError
type ERROR_LINE_NRESERVED*    = object of CatchableError
type ERROR_NSUP_MODE*         = object of CatchableError
type ERROR_SRQ_NOCCURRED*     = object of CatchableError
type ERROR_INV_SPACE*         = object of CatchableError
type ERROR_INV_OFFSET*        = object of CatchableError
type ERROR_INV_WIDTH*         = object of CatchableError
type ERROR_NSUP_OFFSET*       = object of CatchableError
type ERROR_NSUP_VAR_WIDTH*    = object of CatchableError
type ERROR_WINDOW_NMAPPED*    = object of CatchableError
type ERROR_RESP_PENDING*      = object of CatchableError
type ERROR_NLISTENERS*        = object of CatchableError
type ERROR_NCIC*              = object of CatchableError
type ERROR_NSYS_CNTLR*        = object of CatchableError
type ERROR_NSUP_OPER*         = object of CatchableError
type ERROR_INTR_PENDING*      = object of CatchableError
type ERROR_ASRL_PARITY*       = object of CatchableError
type ERROR_ASRL_FRAMING*      = object of CatchableError
type ERROR_ASRL_OVERRUN*      = object of CatchableError
type ERROR_TRIG_NMAPPED*      = object of CatchableError
type ERROR_NSUP_ALIGN_OFFSET* = object of CatchableError
type ERROR_USER_BUF*          = object of CatchableError
type ERROR_RSRC_BUSY*         = object of CatchableError
type ERROR_NSUP_WIDTH*        = object of CatchableError
type ERROR_INV_PARAMETER*     = object of CatchableError
type ERROR_INV_PROT*          = object of CatchableError
type ERROR_INV_SIZE*          = object of CatchableError
type ERROR_WINDOW_MAPPED*     = object of CatchableError
type ERROR_NIMPL_OPER*        = object of CatchableError
type ERROR_INV_LENGTH*        = object of CatchableError
type ERROR_INV_MODE*          = object of CatchableError
type ERROR_SESN_NLOCKED*      = object of CatchableError
type ERROR_MEM_NSHARED*       = object of CatchableError
type ERROR_LIBRARY_NFOUND*    = object of CatchableError
type ERROR_NSUP_INTR*         = object of CatchableError
type ERROR_INV_LINE*          = object of CatchableError
type ERROR_FILE_ACCESS*       = object of CatchableError
type ERROR_FILE_IO*           = object of CatchableError
type ERROR_NSUP_LINE*         = object of CatchableError
type ERROR_NSUP_MECH*         = object of CatchableError
type ERROR_INTF_NUM_NCONFIG*  = object of CatchableError
type ERROR_CONN_LOST*         = object of CatchableError
type ERROR_MACHINE_NAVAIL*    = object of CatchableError
type ERROR_NPERMISSION*       = object of CatchableError
type ERROR_UNKNOWN*           = object of CatchableError

proc checkStatus*(status:int32): void =
  case status
  of VI_SUCCESS:
    discard
  of VI_ERROR_SYSTEM_ERROR:
    raise newException(ERROR_SYSTEM_ERROR,"Unknown system error (miscellaneous error).")
  of VI_ERROR_INV_OBJECT:
    raise newException(ERROR_INV_OBJECT,"The given session or object reference is invalid.")
  of VI_ERROR_RSRC_LOCKED:
    raise newException(ERROR_RSRC_LOCKED,"Specified type of lock cannot be obtained or specified operation cannot be performed, because the resource is locked.")
  of VI_ERROR_INV_EXPR:
    raise newException(ERROR_INV_EXPR,"Invalid expression specified for search.")
  of VI_ERROR_RSRC_NFOUND:
    raise newException(ERROR_RSRC_NFOUND,"Insufficient location information or the device or resource is not present inrformed")
  of VI_ERROR_INV_RSRC_NAME:
    raise newException(ERROR_INV_RSRC_NAME,"Invalid resource reference specified. Parsing error.")
  of VI_ERROR_INV_ACC_MODE:
    raise newException(ERROR_INV_ACC_MODE,"Invalid access mode.")
  of VI_ERROR_TMO:
    raise newException(ERROR_TMO,"Timeout expired before operation completed.")
  of VI_ERROR_CLOSING_FAILED:
    raise newException(ERROR_CLOSING_FAILED,"Unable to deallocate the previously allocated data structures corresponding to this session or object reference.")  
  of VI_ERROR_INV_DEGREE:
    raise newException(ERROR_INV_DEGREE,"Specified degree is invalid.")
  of VI_ERROR_INV_JOB_ID:
    raise newException(ERROR_INV_JOB_ID,"Specified job identifier is invalid.")
  of VI_ERROR_NSUP_ATTR:
    raise newException(ERROR_NSUP_ATTR,"The specified attribute is not defined or supported by the referenced session, event, or find list.")
  of VI_ERROR_NSUP_ATTR_STATE:
    raise newException(ERROR_NSUP_ATTR_STATE,"The specified state of the attribute isor supported by the referenced session, event, or find list.ct reference.cked.")
  of VI_ERROR_ATTR_READONLY:
    raise newException(ERROR_ATTR_READONLY,"The specified attribute is Read Only.")
  of VI_ERROR_INV_LOCK_TYPE:
    raise newException(ERROR_INV_LOCK_TYPE,"The specified type of lock is not supported by this resource.")
  of VI_ERROR_INV_ACCESS_KEY:
    raise newException(ERROR_INV_ACCESS_KEY,"The access key to the resource associated with this session is invalid.")
  of VI_ERROR_INV_EVENT:
    raise newException(ERROR_INV_EVENT,"Specified event type is not supported by the resource.")
  of VI_ERROR_INV_MECH:
    raise newException(ERROR_INV_MECH,"Invalid mechanism specified.")
  of VI_ERROR_HNDLR_NINSTALLED:
    raise newException(ERROR_HNDLR_NINSTALLED,"A handler is not currently installed for the specified event.")
  of VI_ERROR_INV_HNDLR_REF:
    raise newException(ERROR_INV_HNDLR_REF,"The given handler reference is invalid.")
  of VI_ERROR_INV_CONTEXT:
    raise newException(ERROR_INV_CONTEXT,"Specified event context is invalid.")
  of VI_ERROR_QUEUE_OVERFLOW:
    raise newException(ERROR_QUEUE_OVERFLOW,"The event queue for the specified type has overflowed (usually due to previous events not having been closed).")
  of VI_ERROR_NENABLED:
    raise newException(ERROR_NENABLED,"The session must be enabled for events of the specified type in order to receive them.")
  of VI_ERROR_ABORT:
    raise newException(ERROR_ABORT,"The operation was aborted.")
  of VI_ERROR_RAW_WR_PROT_VIOL:
    raise newException(ERROR_RAW_WR_PROT_VIOL,"Violation of raw write protocol occurred during transfer.")
  of VI_ERROR_RAW_RD_PROT_VIOL:
    raise newException(ERROR_RAW_RD_PROT_VIOL,"Violation of raw read protocol occurred during transfer.")
  of VI_ERROR_OUTP_PROT_VIOL:
    raise newException(ERROR_OUTP_PROT_VIOL,"Device reported an output protocol error during transfer.")
  of VI_ERROR_INP_PROT_VIOL:
    raise newException(ERROR_INP_PROT_VIOL,"Device reported an input protocol error during transfer.")
  of VI_ERROR_BERR:
    raise newException(ERROR_BERR,"Bus error occurred during transfer.")
  of VI_ERROR_IN_PROGRESS:
    raise newException(ERROR_IN_PROGRESS,"Unable to queue the asynchronous operation because there is already an operation in progress.")
  of VI_ERROR_INV_SETUP:
    raise newException(ERROR_INV_SETUP,"Unable to start operation because setup is invalid (due to attributes being set to an inconsistent state).")
  of VI_ERROR_QUEUE_ERROR:
    raise newException(ERROR_QUEUE_ERROR,"Unable to queue asynchronous operation (usually due to the I/O completion event not being enabled or insufficient space in the session's queue).")
  of VI_ERROR_ALLOC:
    raise newException(ERROR_ALLOC,"Insufficient system resources to perform necessary memory allocation.")
  of VI_ERROR_INV_MASK:
    raise newException(ERROR_INV_MASK,"Invalid buffer mask specified.")
  of VI_ERROR_IO:
    raise newException(ERROR_IO,"Could not perform operation because of I/O error.")
  of VI_ERROR_INV_FMT:
    raise newException(ERROR_INV_FMT,"A format specifier in the format string is invalid.")
  of VI_ERROR_NSUP_FMT:
    raise newException(ERROR_NSUP_FMT,"A format specifier in the format string is not supported.")
  of VI_ERROR_LINE_IN_USE:
    raise newException(ERROR_LINE_IN_USE,"The specified trigger line is currently in use.")
  of VI_ERROR_NSUP_MODE:
    raise newException(ERROR_NSUP_MODE,"The specified mode is not supported by this VISA implementation.")
  of VI_ERROR_SRQ_NOCCURRED:
    raise newException(ERROR_SRQ_NOCCURRED,"Service request has not been received for the session.")
  of VI_ERROR_INV_SPACE:
    raise newException(ERROR_INV_SPACE,"Invalid address space specified.")
  of VI_ERROR_INV_OFFSET:
    raise newException(ERROR_INV_OFFSET,"Invalid offset specified.")
  of VI_ERROR_INV_WIDTH:
    raise newException(ERROR_INV_WIDTH,"Invalid source or destination width specified.")
  of VI_ERROR_NSUP_OFFSET:
    raise newException(ERROR_NSUP_OFFSET,"Specified offset is not accessible from this hardware.")
  of VI_ERROR_NSUP_VAR_WIDTH:
    raise newException(ERROR_NSUP_VAR_WIDTH,"Cannot support source and destination widths that are different.")
  of VI_ERROR_WINDOW_NMAPPED:
    raise newException(ERROR_WINDOW_NMAPPED,"The specified session is not currently mapped.")
  of VI_ERROR_RESP_PENDING:
    raise newException(ERROR_RESP_PENDING,"A previous response is still pending, causing a multiple query error.")
  of VI_ERROR_NLISTENERS:
    raise newException(ERROR_NLISTENERS,"No Listeners condition is detected (both NRFD and NDAC are deasserted).")
  of VI_ERROR_NCIC:
    raise newException(ERROR_NCIC,"The interface associated with this session is not currently the controller in charge.")
  of VI_ERROR_NSYS_CNTLR:
    raise newException(ERROR_NSYS_CNTLR,"The interface associated with this session is not the system controller.")
  of VI_ERROR_NSUP_OPER:
    raise newException(ERROR_NSUP_OPER,"The given session or object reference does not support this operation.")
  of VI_ERROR_INTR_PENDING:
    raise newException(ERROR_INTR_PENDING,"An interrupt is still pending from a previous call.")
  of VI_ERROR_ASRL_PARITY:
    raise newException(ERROR_ASRL_PARITY,"A parity error occurred during transfer.")
  of VI_ERROR_ASRL_FRAMING:
    raise newException(ERROR_ASRL_FRAMING,"A framing error occurred during transfer.")
  of VI_ERROR_ASRL_OVERRUN:
    raise newException(ERROR_ASRL_OVERRUN,"An overrun error occurred during transfer. A character was not read from the hardware before the next character arrived.")
  of VI_ERROR_TRIG_NMAPPED:
    raise newException(ERROR_TRIG_NMAPPED,"The path from trigSrc to trigDest is not currently mapped.")
  of VI_ERROR_NSUP_ALIGN_OFFSET:
    raise newException(ERROR_NSUP_ALIGN_OFFSET,"The specified offset is not properly aligned for the access width of the operation.")
  of VI_ERROR_USER_BUF:
    raise newException(ERROR_USER_BUF,"A specified user buffer is not valid or cannot be accessed for the required size.")
  of VI_ERROR_RSRC_BUSY:
    raise newException(ERROR_RSRC_BUSY,"The resource is valid, but VISA cannot currently access it.")
  of VI_ERROR_NSUP_WIDTH:
    raise newException(ERROR_NSUP_WIDTH,"Specified width is not supported by this hardware.")
  of VI_ERROR_INV_PARAMETER:
    raise newException(ERROR_INV_PARAMETER,"The value of some parameterorted by this hardware.ccess it.for the r")
  of VI_ERROR_INV_PROT:
    raise newException(ERROR_INV_PROT,"The protocol specified is invalid.")
  of VI_ERROR_INV_SIZE:
    raise newException(ERROR_INV_SIZE,"Invalid size of window specified.")
  of VI_ERROR_WINDOW_MAPPED:
    raise newException(ERROR_WINDOW_MAPPED,"The specified session currently contains a mapped window.")
  of VI_ERROR_NIMPL_OPER:
    raise newException(ERROR_NIMPL_OPER,"The given operation is not implemented.")
  of VI_ERROR_INV_LENGTH:
    raise newException(ERROR_INV_LENGTH,"Invalid length specified.")
  of VI_ERROR_INV_MODE:
    raise newException(ERROR_INV_MODE,"The specified mode is invalid.")
  of VI_ERROR_SESN_NLOCKED:
    raise newException(ERROR_SESN_NLOCKED,"The current session did not have any lock on the resource.")
  of VI_ERROR_MEM_NSHARED:
    raise newException(ERROR_MEM_NSHARED,"The device does not export any memory.")
  of VI_ERROR_LIBRARY_NFOUND:
    raise newException(ERROR_LIBRARY_NFOUND,"A code library required by VISA could not be located or loaded.")
  of VI_ERROR_NSUP_INTR:
    raise newException(ERROR_NSUP_INTR,"The interface cannot generate an interrupt on the requested level or with the requested statusID value.")
  of VI_ERROR_INV_LINE:
    raise newException(ERROR_INV_LINE,"The value specified by the line parameter is invalid.")
  of VI_ERROR_FILE_ACCESS:
    raise newException(ERROR_FILE_ACCESS,"An error occurred while trying to open the specified file. Possible reasons include an invalid path or lack of access rights.")
  of VI_ERROR_FILE_IO:
    raise newException(ERROR_FILE_IO,"An error occurred while performing I/O on the specified file.")
  of VI_ERROR_NSUP_LINE:
    raise newException(ERROR_NSUP_LINE,"One of the specified lines (trigSrc or trigDest) is not supported by this VISA implementation, or the combination of lines is not a valid mapping.")
  of VI_ERROR_NSUP_MECH:
    raise newException(ERROR_NSUP_MECH,"The specified mechanism is not supported for the given event type.")
  of VI_ERROR_INTF_NUM_NCONFIG:
    raise newException(ERROR_INTF_NUM_NCONFIG,"The interface type is valid but the specified interface number is not configured.")
  of VI_ERROR_CONN_LOST:
    raise newException(ERROR_CONN_LOST,"The connection for the given session has been lost.")
  of VI_ERROR_MACHINE_NAVAIL:
    raise newException(ERROR_MACHINE_NAVAIL,"The remote machine does not exist or is not accepting any connections.")
  of VI_ERROR_NPERMISSION:
    raise newException(ERROR_NPERMISSION,"Access to the resource or remote machine is denied. This is due to lack of sufficient privileges for the current user or machine")
  else:
    raise newException(ERROR_UNKNOWN,"unknow error not defined in visa libaray")   
    
    

#checkStatus(0)