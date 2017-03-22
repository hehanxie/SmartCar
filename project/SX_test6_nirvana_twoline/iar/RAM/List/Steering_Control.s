///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       22/Dec/2015  19:22:29
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\app\Steering_Control.c
//    Command line =  
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\app\Steering_Control.c
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
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\RAM\List\Steering_Control.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Img
        EXTERN LPLD_FTM_Init
        EXTERN LPLD_FTM_PWM_Enable
        EXTERN __aeabi_memcpy4
        EXTERN steering_middle

        PUBLIC left
        PUBLIC right
        PUBLIC steering_control
        PUBLIC steering_init
        PUBLIC steering_init_struct

// C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\app\Steering_Control.c
//    1 #include "include.h"
//    2 #include "math.h"
//    3 
//    4 /*后来加的变量*/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    5 uint8 left[10]={0};
left:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    6 uint8 right[10]={0};
right:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    7 FTM_InitTypeDef steering_init_struct;
steering_init_struct:
        DS8 28
//    8 
//    9 uint8  straight_line(uint8 line);//直线无丢线的情况

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   10 void steering_init()
//   11 {
steering_init:
        PUSH     {R5-R7,LR}
//   12   steering_init_struct.FTM_Ftmx = FTM2;	
        LDR.N    R0,??DataTable1  ;; 0x400b8000
        LDR.N    R1,??DataTable1_1
        STR      R0,[R1, #+0]
//   13   steering_init_struct.FTM_Mode = FTM_MODE_PWM;	
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_1
        STRB     R0,[R1, #+4]
//   14   steering_init_struct.FTM_PwmFreq = 50;
        MOVS     R0,#+50
        LDR.N    R1,??DataTable1_1
        STR      R0,[R1, #+8]
//   15   
//   16   LPLD_FTM_Init(steering_init_struct);
        LDR.N    R1,??DataTable1_1
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+28
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_FTM_Init
//   17   
//   18   LPLD_FTM_PWM_Enable(FTM2, 
//   19                       FTM_Ch1, 
//   20                       steering_middle,  
//   21                       PTB19, 
//   22                       ALIGN_LEFT       
//   23                       );  
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        MOVS     R3,#+51
        LDR.N    R0,??DataTable1_2
        LDR      R2,[R0, #+0]
        MOVS     R1,#+1
        LDR.N    R0,??DataTable1  ;; 0x400b8000
        BL       LPLD_FTM_PWM_Enable
//   24 }
        POP      {R0-R2,PC}       ;; return
//   25 
//   26 //白是255 黑是0
//   27 //void steering_control()
//   28 //{
//   29 //  uint8 total=0;
//   30 //  uint8 curve=0;
//   31 //  uint8 err[10];
//   32 //  uint8 k=0;
//   33 //for(uint8 i=79;i<49;i=i-3)
//   34 //{
//   35 //  err[k]=straight_line(i);
//   36 //  total=total+err[k];
//   37 //  k++;
//   38 //}
//   39 //total=total/10;
//   40 //for(uint8 j=0;j<10;j++)
//   41 //{
//   42 // curve= err[j]-total+curve;
//   43 //}
//   44 //  if(sterring_out<=steering_left)
//   45 //  {sterring_out = steering_left;}
//   46 //  if(sterring_out>=steering_right)
//   47 //  {sterring_out = steering_right;}
//   48 //  sterring_out=curve*steering_p;
//   49 //  
//   50 //  LPLD_FTM_PWM_ChangeDuty(FTM2, FTM_Ch1, (int)sterring_out);
//   51 //}

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   52 void steering_control(void)
//   53 {
steering_control:
        PUSH     {R4}
//   54   uint8 m=0;
        MOVS     R0,#+0
//   55   for(uint8 a=78;a<72;a=a-2)
        MOVS     R1,#+78
        B.N      ??steering_control_0
//   56   {
//   57     //中间到右
//   58     for(int8 i =60 ;i<80;i++)
//   59     {
//   60       if(Img[a][i]==255&Img[a][i+2]==0)    
//   61       {  
//   62         right[m]=i;
//   63         break;
//   64       }
//   65     }
//   66     //中间到左
//   67     for(int8 j = 20;j>=0;j--)
??steering_control_1:
        SUBS     R2,R2,#+1
??steering_control_2:
        SXTB     R2,R2            ;; SignExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BMI.N    ??steering_control_3
//   68     {
//   69       if(Img[a][j]==255&&Img[a][j-2])
        LDR.N    R3,??DataTable1_3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R4,#+80
        MLA      R3,R4,R1,R3
        SXTB     R2,R2            ;; SignExt  R2,R2,#+24,#+24
        LDRB     R3,[R2, R3]
        CMP      R3,#+255
        BNE.N    ??steering_control_1
        LDR.N    R3,??DataTable1_3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R4,#+80
        MLA      R3,R4,R1,R3
        SXTB     R2,R2            ;; SignExt  R2,R2,#+24,#+24
        ADDS     R3,R2,R3
        LDRB     R3,[R3, #-2]
        CMP      R3,#+0
        BEQ.N    ??steering_control_1
//   70       {
//   71         left[m]=j;
        LDR.N    R3,??DataTable1_4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STRB     R2,[R0, R3]
//   72         break;
//   73       }
//   74     }
//   75     m++;
??steering_control_3:
        ADDS     R0,R0,#+1
        SUBS     R1,R1,#+2
??steering_control_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+72
        BGE.N    ??steering_control_4
        MOVS     R2,#+60
        B.N      ??steering_control_5
??steering_control_6:
        ADDS     R2,R2,#+1
??steering_control_5:
        SXTB     R2,R2            ;; SignExt  R2,R2,#+24,#+24
        CMP      R2,#+80
        BGE.N    ??steering_control_7
        LDR.N    R3,??DataTable1_3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R4,#+80
        MLA      R3,R4,R1,R3
        SXTB     R2,R2            ;; SignExt  R2,R2,#+24,#+24
        LDRB     R3,[R2, R3]
        CMP      R3,#+255
        BNE.N    ??steering_control_6
        LDR.N    R3,??DataTable1_3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R4,#+80
        MLA      R3,R4,R1,R3
        SXTB     R2,R2            ;; SignExt  R2,R2,#+24,#+24
        ADDS     R3,R2,R3
        LDRB     R3,[R3, #+2]
        CMP      R3,#+0
        BNE.N    ??steering_control_6
        LDR.N    R3,??DataTable1_5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STRB     R2,[R0, R3]
??steering_control_7:
        MOVS     R2,#+20
        B.N      ??steering_control_2
//   76     
//   77   }
//   78 }
??steering_control_4:
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x400b8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     steering_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     steering_middle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     Img

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     left

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     right

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
//  52 bytes in section .bss
// 218 bytes in section .text
// 
// 218 bytes of CODE memory
//  52 bytes of DATA memory
//
//Errors: none
//Warnings: none
