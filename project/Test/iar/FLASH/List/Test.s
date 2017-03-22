///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       18/Jul/2016  19:48:28
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\app\Test.c
//    Command line =  
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\app\Test.c -D
//        LPLD_K60 -D USE_K60D10 -lCN
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\FLASH\List\ -lB
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\FLASH\List\ -o
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\FLASH\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M4 -e --fpu=None --dlib_config
//        D:\IAR\arm\INC\c\DLib_Config_Normal.h -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\app\ -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\CPU\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\common\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\LPLD\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\LPLD\HW\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\LPLD\DEV\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\LPLD\FUNC\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\uCOS-II\Source\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\FatFs\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\FatFs\option\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\USB\common\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\USB\driver\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\USB\descriptor\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\USB\class\
//        -I C:\Users\whstarlit\Desktop\Smart_Car\lib\ -Ol -I
//        D:\IAR\arm\CMSIS\Include\ -D ARM_MATH_CM4
//    List file    =  
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\FLASH\List\Test.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN D
        EXTERN Img
        EXTERN LCD_Write_Float_Dot
        EXTERN LED_PrintImage
        EXTERN Line2
        EXTERN P
        EXTERN SPEED
        EXTERN __aeabi_i2f
        EXTERN changeVar
        EXTERN crossScale
        EXTERN curAver
        EXTERN get_img
        EXTERN index1
        EXTERN index2
        EXTERN init_all
        EXTERN keyValue
        EXTERN key_scan
        EXTERN midDot
        EXTERN runwayType

        PUBLIC main

// C:\Users\whstarlit\Desktop\Smart_Car\project\Test\app\Test.c
//    1 #include "include.h"
//    2 
//    3 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//    4 void main (void)
//    5 {
main:
        PUSH     {R4,LR}
//    6   init_all();
        BL       init_all
//    7   while(1)
//    8   {
//    9     keyValue = 0;
??main_0:
        MOVS     R0,#+0
        LDR.N    R1,??main_1
        STRB     R0,[R1, #+0]
//   10     keyValue = key_scan();
        BL       key_scan
        LDR.N    R1,??main_1
        STRB     R0,[R1, #+0]
//   11    
//   12     changeVar(keyValue);
        LDR.N    R0,??main_1
        LDRB     R0,[R0, #+0]
        BL       changeVar
//   13     
//   14     get_img();
        BL       get_img
//   15     LED_PrintImage(*Img, 60, 80);
        MOVS     R2,#+80
        MOVS     R1,#+60
        LDR.N    R0,??main_1+0x4
        BL       LED_PrintImage
//   16     
//   17     LCD_Write_Float_Dot(0, 0, P, 0);
        MOVS     R3,#+0
        LDR.N    R0,??main_1+0x8
        LDR      R2,[R0, #+0]
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_Write_Float_Dot
//   18     LCD_Write_Float_Dot(40, 0, D, 0);
        MOVS     R3,#+0
        LDR.N    R0,??main_1+0xC
        LDR      R2,[R0, #+0]
        MOVS     R1,#+0
        MOVS     R0,#+40
        BL       LCD_Write_Float_Dot
//   19     LCD_Write_Float_Dot(0, 1, index1, 0);
        MOVS     R3,#+0
        MOVS     R4,R3
        LDR.N    R0,??main_1+0x10
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R2,R0
        MOVS     R3,R4
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       LCD_Write_Float_Dot
//   20     LCD_Write_Float_Dot(40, 1, index2, 0);
        MOVS     R3,#+0
        MOVS     R4,R3
        LDR.N    R0,??main_1+0x14
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R2,R0
        MOVS     R3,R4
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       LCD_Write_Float_Dot
//   21     
//   22     LCD_Write_Float_Dot(88, 0, curAver, 0);
        MOVS     R3,#+0
        MOVS     R4,R3
        LDR.N    R0,??main_1+0x18
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R2,R0
        MOVS     R3,R4
        MOVS     R1,#+0
        MOVS     R0,#+88
        BL       LCD_Write_Float_Dot
//   23     
//   24     LCD_Write_Float_Dot(88, 3, midDot[Line2], 0);
        MOVS     R3,#+0
        MOVS     R4,R3
        LDR.N    R0,??main_1+0x1C
        LDR.N    R1,??main_1+0x20
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        BL       __aeabi_i2f
        MOVS     R2,R0
        MOVS     R3,R4
        MOVS     R1,#+3
        MOVS     R0,#+88
        BL       LCD_Write_Float_Dot
//   25 
//   26     
//   27     LCD_Write_Float_Dot(88, 5, crossScale, 1);
        MOVS     R3,#+1
        LDR.N    R0,??main_1+0x24
        LDR      R2,[R0, #+0]
        MOVS     R1,#+5
        MOVS     R0,#+88
        BL       LCD_Write_Float_Dot
//   28     LCD_Write_Float_Dot(88, 6, runwayType, 0);
        MOVS     R3,#+0
        MOVS     R4,R3
        LDR.N    R0,??main_1+0x28
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R2,R0
        MOVS     R3,R4
        MOVS     R1,#+6
        MOVS     R0,#+88
        BL       LCD_Write_Float_Dot
//   29     LCD_Write_Float_Dot(88, 7, SPEED, 0);
        MOVS     R3,#+0
        MOVS     R4,R3
        LDR.N    R0,??main_1+0x2C
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R2,R0
        MOVS     R3,R4
        MOVS     R1,#+7
        MOVS     R0,#+88
        BL       LCD_Write_Float_Dot
        B.N      ??main_0
        DATA
??main_1:
        DC32     keyValue
        DC32     Img
        DC32     P
        DC32     D
        DC32     index1
        DC32     index2
        DC32     curAver
        DC32     midDot
        DC32     Line2
        DC32     crossScale
        DC32     runwayType
        DC32     SPEED
//   30     
//   31 //    n++;
//   32 //    m = LPLD_FTM_GetCounter(FTM1);
//   33 //    if (n >= 3)
//   34 //    {
//   35 //      LPLD_FTM_ClearCounter(FTM1);
//   36 //    }
//   37   } 
//   38 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   39 
// 
// 284 bytes in section .text
// 
// 284 bytes of CODE memory
//
//Errors: none
//Warnings: none
