///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       12/Jul/2016  22:03:02
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\app\SX.c
//    Command line =  
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\app\SX.c
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
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\FLASH\List\SX.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Center_Line
        EXTERN Img
        EXTERN LCD_Write_Float_Dot
        EXTERN LED_PrintImage
        EXTERN Left_Line
        EXTERN Right_Line
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fadd
        EXTERN get_img
        EXTERN init_all
        EXTERN key_scan
        EXTERN steering_d
        EXTERN steering_out
        EXTERN steering_p

        PUBLIC key
        PUBLIC main

// C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\app\SX.c
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
//   17     
//   18     
//   19 
//   20     get_img();
//   21     
//   22     
//   23     
//   24           for(uint8 y=59;y>19;y--)
//   25    {
//   26      Img[y][Center_Line[y]]=0;
//   27      Img[y][Left_Line[y]]=0;
//   28      Img[y][Right_Line[y]]=0;
//   29    }
//   30     
//   31     
//   32     
//   33     LED_PrintImage(*Img, 60, 80);
//   34     
//   35     
//   36 //    for(uint8 i=0;i<30;i++)
//   37 //      LCD_PutPixel(i,39); 
//   38     //键盘部分
//   39     key=key_scan();
//   40     if(key==1)
//   41     {
//   42       steering_p=steering_p+1;
//   43     }
//   44     else if(key==2)
//   45     {
//   46       steering_p=steering_p-1;
//   47     }
//   48         else if(key==4)
//   49     {
//   50       steering_p=steering_d+0.1;
//   51     }
//   52         else if(key==5)
??main_1:
        LDR.N    R0,??main_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+5
        BNE.N    ??main_3
//   53     {
//   54       steering_p=steering_d-0.1;
        LDR.N    R0,??main_2+0x4
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.N    R2,??main_2+0x8  ;; 0x9999999a
        LDR.N    R3,??main_2+0xC  ;; 0xbfb99999
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.N    R1,??main_2+0x10
        STR      R0,[R1, #+0]
//   55     }
//   56     
//   57     
//   58     
//   59  
//   60     //显示部分
//   61    LCD_Write_Float_Dot(85,5,steering_p,2);
??main_3:
        MOVS     R3,#+2
        LDR.N    R0,??main_2+0x10
        LDR      R2,[R0, #+0]
        MOVS     R1,#+5
        MOVS     R0,#+85
        BL       LCD_Write_Float_Dot
//   62     LCD_Write_Float_Dot(85,6,steering_out,2);
        MOVS     R3,#+2
        LDR.N    R0,??main_2+0x14
        LDR      R2,[R0, #+0]
        MOVS     R1,#+6
        MOVS     R0,#+85
        BL       LCD_Write_Float_Dot
??main_0:
        BL       get_img
        MOVS     R0,#+59
        B.N      ??main_4
??main_5:
        LDR.N    R1,??main_2+0x18
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+80
        MLA      R1,R2,R0,R1
        LDR.N    R2,??main_2+0x1C
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        MOVS     R3,#+0
        STRB     R3,[R2, R1]
        LDR.N    R1,??main_2+0x18
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+80
        MLA      R1,R2,R0,R1
        LDR.N    R2,??main_2+0x20
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        MOVS     R3,#+0
        STRB     R3,[R2, R1]
        LDR.N    R1,??main_2+0x18
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+80
        MLA      R1,R2,R0,R1
        LDR.N    R2,??main_2+0x24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        MOVS     R3,#+0
        STRB     R3,[R2, R1]
        SUBS     R0,R0,#+1
??main_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+20
        BGE.N    ??main_5
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
        BNE.N    ??main_6
        LDR.N    R0,??main_2+0x10
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1065353216
        BL       __aeabi_fadd
        LDR.N    R1,??main_2+0x10
        STR      R0,[R1, #+0]
        B.N      ??main_3
??main_6:
        LDR.N    R0,??main_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??main_7
        LDR.N    R0,??main_2+0x10
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_2+0x28  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR.N    R1,??main_2+0x10
        STR      R0,[R1, #+0]
        B.N      ??main_3
??main_7:
        LDR.N    R0,??main_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+4
        BNE.N    ??main_1
        LDR.N    R0,??main_2+0x4
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.N    R2,??main_2+0x8  ;; 0x9999999a
        LDR.N    R3,??main_2+0x2C  ;; 0x3fb99999
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.N    R1,??main_2+0x10
        STR      R0,[R1, #+0]
        B.N      ??main_3
        DATA
??main_2:
        DC32     key
        DC32     steering_d
        DC32     0x9999999a
        DC32     0xbfb99999
        DC32     steering_p
        DC32     steering_out
        DC32     Img
        DC32     Center_Line
        DC32     Left_Line
        DC32     Right_Line
        DC32     0xbf800000
        DC32     0x3fb99999
//   63    
//   64 //    
//   65 //    int a=0;
//   66 //    for(int i=9;i>=0;i--)
//   67 //    {
//   68 //          LCD_Write_Float_Dot(85,a,left[i],0);
//   69 //          LCD_Write_Float_Dot(100,a,right[i],0);
//   70 //          a++;
//   71 //    }
//   72   } 
//   73 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   74 
// 
//   1 byte  in section .bss
// 300 bytes in section .text
// 
// 300 bytes of CODE memory
//   1 byte  of DATA memory
//
//Errors: none
//Warnings: none
