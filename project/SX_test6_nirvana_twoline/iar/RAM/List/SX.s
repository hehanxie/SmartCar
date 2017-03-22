///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       22/Dec/2015  18:54:51
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\app\SX.c
//    Command line =  
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\app\SX.c
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
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\RAM\List\SX.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Img
        EXTERN LCD_Write_Float
        EXTERN LCD_Write_Float_Dot
        EXTERN LED_PrintImage
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_f2d
        EXTERN get_img
        EXTERN init_all
        EXTERN key_scan
        EXTERN steering_err
        EXTERN steering_p
        EXTERN sterring_out

        PUBLIC key
        PUBLIC main

// C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\app\SX.c
//    1 /*
//    2  * --------------基于"拉普兰德K60底层库V3"的工程（SX）-----------------
//    3  * @file SX.c
//    4  * @version 0.0
//    5  * @date 2015-12-14
//    6  * @brief 关于该工程的描述
//    7  */
//    8 #include "include.h"
//    9    

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   10 uint8 key=0;
key:
        DS8 1
//   11    

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   12 void main (void)
//   13 {
main:
        PUSH     {R7,LR}
//   14   init_all();
        BL       init_all
        B.N      ??main_0
//   15   while(1)
//   16   {
//   17     get_img();
//   18     LED_PrintImage(*Img, 60, 80);
//   19     key=key_scan();
//   20     if(key==1)
//   21     {
//   22       steering_p=steering_p+0.1;
//   23     }
//   24       else if(key==2)
??main_1:
        LDR.N    R0,??main_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??main_3
//   25       {
//   26       steering_p=steering_p-0.1;
        LDR.N    R0,??main_2+0x4
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.N    R2,??main_2+0x8  ;; 0x9999999a
        LDR.N    R3,??main_2+0xC  ;; 0xbfb99999
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.N    R1,??main_2+0x4
        STR      R0,[R1, #+0]
//   27       }
//   28     LCD_Write_Float_Dot(85,0,steering_err,2);
??main_3:
        MOVS     R3,#+2
        LDR.N    R0,??main_2+0x10
        LDR      R2,[R0, #+0]
        MOVS     R1,#+0
        MOVS     R0,#+85
        BL       LCD_Write_Float_Dot
//   29     LCD_Write_Float(85,2,steering_p);
        LDR.N    R0,??main_2+0x4
        LDR      R2,[R0, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+85
        BL       LCD_Write_Float
//   30     LCD_Write_Float(85,3,sterring_out);
        LDR.N    R0,??main_2+0x14
        LDR      R2,[R0, #+0]
        MOVS     R1,#+3
        MOVS     R0,#+85
        BL       LCD_Write_Float
??main_0:
        BL       get_img
        MOVS     R2,#+80
        MOVS     R1,#+60
        LDR.N    R0,??main_2+0x18
        BL       LED_PrintImage
        BL       key_scan
        LDR.N    R1,??main_2
        STRB     R0,[R1, #+0]
        LDR.N    R0,??main_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??main_1
        LDR.N    R0,??main_2+0x4
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.N    R2,??main_2+0x8  ;; 0x9999999a
        LDR.N    R3,??main_2+0x1C  ;; 0x3fb99999
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.N    R1,??main_2+0x4
        STR      R0,[R1, #+0]
        B.N      ??main_3
        Nop      
        DATA
??main_2:
        DC32     key
        DC32     steering_p
        DC32     0x9999999a
        DC32     0xbfb99999
        DC32     steering_err
        DC32     sterring_out
        DC32     Img
        DC32     0x3fb99999
//   31   } 
//   32 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   33 
// 
//   1 byte  in section .bss
// 168 bytes in section .text
// 
// 168 bytes of CODE memory
//   1 byte  of DATA memory
//
//Errors: none
//Warnings: none
