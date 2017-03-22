///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       12/Jul/2016  22:02:58
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\app\Motor_Control.c
//    Command line =  
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\app\Motor_Control.c
//        -D LPLD_K60 -D USE_K60D10 -lCN
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\FLASH\List\
//        -lB
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\FLASH\List\
//        -o
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\FLASH\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M4 -e --fpu=None --dlib_config
//        D:\IAR\arm\INC\c\DLib_Config_Normal.h -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\app\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\CPU\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\common\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\LPLD\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\LPLD\HW\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\LPLD\DEV\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\LPLD\FUNC\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\uCOS-II\Source\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\FatFs\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\FatFs\option\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\USB\common\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\USB\driver\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\USB\descriptor\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\USB\class\
//        -Ol -I D:\IAR\arm\CMSIS\Include\ -D ARM_MATH_CM4
//    List file    =  
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\FLASH\List\Motor_Control.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_FTM_Init
        EXTERN LPLD_FTM_PWM_Enable
        EXTERN __aeabi_memcpy4

        PUBLIC motor_init
        PUBLIC motor_init_struct

// C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\app\Motor_Control.c
//    1 #include "common.h"
//    2 #include "include.h"
//    3 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 FTM_InitTypeDef motor_init_struct;
motor_init_struct:
        DS8 28
//    5 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//    6 void motor_init()
//    7 {
motor_init:
        PUSH     {R5-R7,LR}
//    8   motor_init_struct.FTM_Ftmx=FTM0;
        LDR.N    R0,??motor_init_0  ;; 0x40038000
        LDR.N    R1,??motor_init_0+0x4
        STR      R0,[R1, #+0]
//    9   motor_init_struct.FTM_Mode=FTM_MODE_PWM;
        MOVS     R0,#+1
        LDR.N    R1,??motor_init_0+0x4
        STRB     R0,[R1, #+4]
//   10   motor_init_struct.FTM_PwmFreq=25000;
        MOVW     R0,#+25000
        LDR.N    R1,??motor_init_0+0x4
        STR      R0,[R1, #+8]
//   11   LPLD_FTM_Init(motor_init_struct);
        LDR.N    R1,??motor_init_0+0x4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+28
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_FTM_Init
//   12   LPLD_FTM_PWM_Enable(FTM0,FTM_Ch2,1500,PTC3,ALIGN_LEFT);
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        MOVS     R3,#+63
        MOVW     R2,#+1500
        MOVS     R1,#+2
        LDR.N    R0,??motor_init_0  ;; 0x40038000
        BL       LPLD_FTM_PWM_Enable
//   13   LPLD_FTM_PWM_Enable(FTM0,FTM_Ch3,0,PTC4,ALIGN_LEFT);
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        MOVS     R3,#+64
        MOVS     R2,#+0
        MOVS     R1,#+3
        LDR.N    R0,??motor_init_0  ;; 0x40038000
        BL       LPLD_FTM_PWM_Enable
//   14 }
        POP      {R0-R2,PC}       ;; return
        DATA
??motor_init_0:
        DC32     0x40038000
        DC32     motor_init_struct

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
// 28 bytes in section .bss
// 84 bytes in section .text
// 
// 84 bytes of CODE memory
// 28 bytes of DATA memory
//
//Errors: none
//Warnings: none
