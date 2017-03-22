///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       22/Dec/2015  18:54:50
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\app\init.c
//    Command line =  
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\app\init.c
//        -D LPLD_K60 -D USE_K60D10 -lCN
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\RAM\List\
//        -lB
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\RAM\List\
//        -o
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\RAM\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M4 -e --fpu=None --dlib_config "C:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\app\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\CPU\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\common\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\LPLD\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\LPLD\HW\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\LPLD\DEV\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\LPLD\FUNC\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\uCOS-II\Source\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\FatFs\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\FatFs\option\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\USB\common\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\USB\driver\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\USB\descriptor\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\USB\class\
//        -Ol -I "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\" -D ARM_MATH_CM4
//    List file    =  
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\RAM\List\init.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN DMA_init
        EXTERN IO_init
        EXTERN LCD_Init
        EXTERN PCLK_init
        EXTERN SCCB_ReadByte
        EXTERN VSY_init
        EXTERN device_id
        EXTERN key_init
        EXTERN motor_init
        EXTERN ov7725_init
        EXTERN steering_init

        PUBLIC init_all

// C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\app\init.c
//    1 #include "include.h"
//    2 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//    3 void init_all()
//    4 {
init_all:
        PUSH     {R7,LR}
//    5   DisableInterrupts;
        CPSID    I
//    6   LCD_Init();
        BL       LCD_Init
//    7   steering_init();
        BL       steering_init
//    8   motor_init();
        BL       motor_init
//    9   key_init();
        BL       key_init
//   10 
//   11   VSY_init();
        BL       VSY_init
//   12   PCLK_init();
        BL       PCLK_init
//   13   DMA_init();
        BL       DMA_init
//   14   IO_init();
        BL       IO_init
//   15   ov7725_init();
        BL       ov7725_init
//   16   //LPLD_SCCB_ReadReg(0x1C, &device_id, 1);
//   17   //device_id=GY_ReadByte(0x1C);
//   18   SCCB_ReadByte(&device_id,1,OV7725_COM4);
        MOVS     R2,#+13
        MOVS     R1,#+1
        LDR.N    R0,??init_all_0
        BL       SCCB_ReadByte
//   19   //LPLD_GPIO_EnableIrq(VSY_init_struct);
//   20   EnableInterrupts;
        CPSIE    I
//   21 }
        POP      {R0,PC}          ;; return
        Nop      
        DATA
??init_all_0:
        DC32     device_id

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
// 60 bytes in section .text
// 
// 60 bytes of CODE memory
//
//Errors: none
//Warnings: none
