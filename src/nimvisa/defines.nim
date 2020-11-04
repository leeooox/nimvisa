const libName* = "visa32.dll"

const
  VI_SUCCESS* = 0
  VI_NULL*    = 0
  VI_ATTR_TMO_VALUE* = 0x3FFF001A



const
  VI_ERROR_SYSTEM_ERROR*      :int32 = -1073807360   
  VI_ERROR_INV_OBJECT*        :int32 = -1073807346 
  VI_ERROR_RSRC_LOCKED*       :int32 = -1073807345
  VI_ERROR_INV_EXPR*          :int32 = -1073807344 
  VI_ERROR_RSRC_NFOUND*       :int32 = -1073807343 
  VI_ERROR_INV_RSRC_NAME*     :int32 = -1073807342 
  VI_ERROR_INV_ACC_MODE*      :int32 = -1073807341 
  VI_ERROR_TMO*               :int32 = -1073807339 
  VI_ERROR_CLOSING_FAILED*    :int32 = -1073807338 
  VI_ERROR_INV_DEGREE*        :int32 = -1073807333 
  VI_ERROR_INV_JOB_ID*        :int32 = -1073807332 
  VI_ERROR_NSUP_ATTR*         :int32 = -1073807331
  VI_ERROR_NSUP_ATTR_STATE*   :int32 = -1073807330 
  VI_ERROR_ATTR_READONLY*     :int32 = -1073807329 
  VI_ERROR_INV_LOCK_TYPE*     :int32 = -1073807328 
  VI_ERROR_INV_ACCESS_KEY*    :int32 = -1073807327 
  VI_ERROR_INV_EVENT*         :int32 = -1073807322 
  VI_ERROR_INV_MECH*          :int32 = -1073807321 
  VI_ERROR_HNDLR_NINSTALLED*  :int32 = -1073807320 
  VI_ERROR_INV_HNDLR_REF*     :int32 = -1073807319 
  VI_ERROR_INV_CONTEXT*       :int32 = -1073807318 
  VI_ERROR_QUEUE_OVERFLOW*    :int32 = -1073807315 
  VI_ERROR_NENABLED*          :int32 = -1073807313 
  VI_ERROR_ABORT*             :int32 = -1073807312 
  VI_ERROR_RAW_WR_PROT_VIOL*  :int32 = -1073807308 
  VI_ERROR_RAW_RD_PROT_VIOL*  :int32 = -1073807307 
  VI_ERROR_OUTP_PROT_VIOL*    :int32 = -1073807306 
  VI_ERROR_INP_PROT_VIOL*     :int32 = -1073807305 
  VI_ERROR_BERR*              :int32 = -1073807304 
  VI_ERROR_IN_PROGRESS*       :int32 = -1073807303 
  VI_ERROR_INV_SETUP*         :int32 = -1073807302 
  VI_ERROR_QUEUE_ERROR*       :int32 = -1073807301 
  VI_ERROR_ALLOC*             :int32 = -1073807300 
  VI_ERROR_INV_MASK*          :int32 = -1073807299 
  VI_ERROR_IO*                :int32 = -1073807298 
  VI_ERROR_INV_FMT*           :int32 = -1073807297 
  VI_ERROR_NSUP_FMT*          :int32 = -1073807295 
  VI_ERROR_LINE_IN_USE*       :int32 = -1073807294 
  VI_ERROR_LINE_NRESERVED*    :int32 = -1073807293 
  VI_ERROR_NSUP_MODE*         :int32 = -1073807290 
  VI_ERROR_SRQ_NOCCURRED*     :int32 = -1073807286 
  VI_ERROR_INV_SPACE*         :int32 = -1073807282 
  VI_ERROR_INV_OFFSET*        :int32 = -1073807279 
  VI_ERROR_INV_WIDTH*         :int32 = -1073807278 
  VI_ERROR_NSUP_OFFSET*       :int32 = -1073807276 
  VI_ERROR_NSUP_VAR_WIDTH*    :int32 = -1073807275 
  VI_ERROR_WINDOW_NMAPPED*    :int32 = -1073807273 
  VI_ERROR_RESP_PENDING*      :int32 = -1073807271 
  VI_ERROR_NLISTENERS*        :int32 = -1073807265 
  VI_ERROR_NCIC*              :int32 = -1073807264 
  VI_ERROR_NSYS_CNTLR*        :int32 = -1073807263 
  VI_ERROR_NSUP_OPER*         :int32 = -1073807257 
  VI_ERROR_INTR_PENDING*      :int32 = -1073807256 
  VI_ERROR_ASRL_PARITY*       :int32 = -1073807254 
  VI_ERROR_ASRL_FRAMING*      :int32 = -1073807253 
  VI_ERROR_ASRL_OVERRUN*      :int32 = -1073807252 
  VI_ERROR_TRIG_NMAPPED*      :int32 = -1073807250 
  VI_ERROR_NSUP_ALIGN_OFFSET* :int32 = -1073807248 
  VI_ERROR_USER_BUF*          :int32 = -1073807247 
  VI_ERROR_RSRC_BUSY*         :int32 = -1073807246 
  VI_ERROR_NSUP_WIDTH*        :int32 = -1073807242 
  VI_ERROR_INV_PARAMETER*     :int32 = -1073807240 
  VI_ERROR_INV_PROT*          :int32 = -1073807239 
  VI_ERROR_INV_SIZE*          :int32 = -1073807237 
  VI_ERROR_WINDOW_MAPPED*     :int32 = -1073807232 
  VI_ERROR_NIMPL_OPER*        :int32 = -1073807231 
  VI_ERROR_INV_LENGTH*        :int32 = -1073807229 
  VI_ERROR_INV_MODE*          :int32 = -1073807215 
  VI_ERROR_SESN_NLOCKED*      :int32 = -1073807204 
  VI_ERROR_MEM_NSHARED*       :int32 = -1073807203 
  VI_ERROR_LIBRARY_NFOUND*    :int32 = -1073807202 
  VI_ERROR_NSUP_INTR*         :int32 = -1073807201 
  VI_ERROR_INV_LINE*          :int32 = -1073807200 
  VI_ERROR_FILE_ACCESS*       :int32 = -1073807199 
  VI_ERROR_FILE_IO*           :int32 = -1073807198 
  VI_ERROR_NSUP_LINE*         :int32 = -1073807197 
  VI_ERROR_NSUP_MECH*         :int32 = -1073807196 
  VI_ERROR_INTF_NUM_NCONFIG*  :int32 = -1073807195 
  VI_ERROR_CONN_LOST*         :int32 = -1073807194 
  VI_ERROR_MACHINE_NAVAIL*    :int32 = -1073807193 
  VI_ERROR_NPERMISSION*       :int32 = -1073807192 