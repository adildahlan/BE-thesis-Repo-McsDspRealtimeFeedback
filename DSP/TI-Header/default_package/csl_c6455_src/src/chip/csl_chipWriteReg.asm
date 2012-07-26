;/*   ==========================================================
; *   Copyright (c) Texas Instruments Inc , 2004, 2005
; *
; *   Use of this software is controlled by the terms and conditions found
; *   in the license agreement under which this software has been supplied
; *   priovided
; *   ==========================================================
;*/
;/** @file csl_chipWriteReg.asm
; *
; *  @brief CSL chip APIs
; *
; *   @path  $(CSLPATH)\chip\src
; *
; *  Description
; *	- API for writing of the control registers is defined here 
; *  @date 15th Apr, 2004
; */
;/* ============================================================================
; *  Revision History
; *  ===============
; *  07-Mar-2006 ds  Added dummy code chipWriteNone2, 
; *                  before ILC write in CSL_chipWriteReg () API
; *  19-May-2006 NG  chipWriteREP moved from 32 to 15
; *                  Added a dummy code chipReadNone6 before chipWriteTSR
; * ============================================================================
; */
	.global _CSL_chipWriteReg
_CSL_chipWriteReg:
    mvk 12, a1
  ||mvkl chipRegTable,b0 ; The offset of the case is attempted to be obtained here
    mvkh chipRegTable,b0
  ||mvk 12,a3
  ||nop
    mpy a3,a4,a4
    mvk 1, b5
 ||nop    
    add .s2 a4,b0,b0
 ||nop
	bnop b0,5

chipRegTable:
chipWriteAMR:
	bnop __end, 3
	mvc .s2 amr,b5
	mvc .s2 b4,amr

chipWriteCSR:
	bnop __end, 3
	mvc .s2 csr,b5
	mvc .s2 b4,csr

chipWriteIFR:
chipWriteISR:
	bnop __end, 3
	mvc .s2 ifr,b5
	mvc .s2 b4,isr

chipWriteICR:
	bnop __end, 3
	mvc .s2 ifr,b5 ;reading ifr since icr is not a valid source
	mvc .s2 b4,icr

chipWriteIER:
	bnop __end, 3
	mvc .s2 ier,b5
	mvc .s2 b4,ier

chipWriteISTP:
	bnop __end, 3
	mvc .s2 istp,b5
	mvc .s2 b4,istp
	
chipWriteIRP:
	bnop __end, 3
	mvc .s2 irp,b5
	mvc .s2 b4,irp

chipWriteNRP:
chipWriteERP:
	bnop __end, 3
	mvc .s2 nrp,b5
	mvc .s2 b4,nrp
	
chipWriteNone0:
    mpy b5,b5,b5
	bnop __end, 4
 	mpy b5,b5,b5
	
chipWriteNone1:
    mpy b5,b5,b5
	bnop __end, 4
 	mpy b5,b5,b5

chipWriteTSCL:
	bnop __end, 3
	mvc .s2 tscl,b5
	mvc .s2 b4,tscl

chipWriteTSCH:
    mpy b5,b5,b5
	bnop __end, 4
 	mpy b5,b5,b5

chipWriteNone2:
    mpy b5,b5,b5
	bnop __end, 4
 	mpy b5,b5,b5

chipWriteILC:
	bnop __end, 3
	mvc .s2 ilc,b5
	mvc .s2 b4,ilc

chipWriteRILC:
	bnop __end, 3
	mvc .s2 rilc,b5
	mvc .s2 b4,rilc
	
chipWriteREP:
	bnop __end, 3
	mvc .s2 rep,b5
	mvc .s2 b4,rep

chipWritePCE1:	
    mpy b5,b5,b5
	bnop __end, 4
 	mpy b5,b5,b5

chipWriteDNUM:
	bnop __end, 3
	mvc .s2 dnum,b5
	mpy 1, b5, b5 	
	
chipWriteNone3:
    mpy b5,b5,b5
	bnop __end, 4
 	mpy b5,b5,b5

chipWriteNone4:
    mpy b5,b5,b5
	bnop __end, 4
 	mpy b5,b5,b5

chipWriteNone5:
    mpy b5,b5,b5
	bnop __end, 4
 	mpy b5,b5,b5

chipWriteSSR:
	bnop __end, 3
	mvc .s2 ssr,b5
	mvc .s2 b4,ssr
	
chipWriteGPLYA:	
	bnop __end, 3
	mvc .s2 gplya,b5
	mvc .s2 b4,gplya
	
chipWriteGPLYB:
	bnop __end, 3
	mvc .s2 gplyb,b5
	mvc .s2 b4,gplyb
	
chipWriteGFPGFR:
	bnop __end, 3
	mvc .s2 gfpgfr,b5
	mvc .s2 b4,gfpgfr

chipWriteNone6:
    mpy b5,b5,b5
	bnop __end, 4
 	mpy b5,b5,b5
	
chipWriteTSR:	
	bnop __end, 3
	mvc .s2 tsr,b5
	mvc .s2 b4,tsr
	
chipWriteITSR:
	bnop __end, 3
	mvc .s2 itsr,b5
	mvc .s2 b4,itsr
	
chipWriteNTSR:
	bnop __end, 3
	mvc .s2 ntsr,b5
	mvc .s2 b4,ntsr
	
chipWriteEFR:
chipWriteECR:
	bnop __end, 3
	mvc .s2 efr,b5
	mvc .s2 b4,ecr
		
chipWriteNone7:
    
	mpy b5,b5,b5
	bnop __end, 1
 	mpy b5,b5,b5

chipWriteIERR:
	bnop __end, 3
	mvc .s2 ierr,b5
	mvc .s2 b4,ierr

__end:
	b b3    
	mv .s1 b5,a4
	nop 4
