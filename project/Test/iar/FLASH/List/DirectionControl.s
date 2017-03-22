///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2016  20:40:43
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\whstarlit\Desktop\Smart_Car\lib\common\DirectionControl.c
//    Command line =  
//        C:\Users\whstarlit\Desktop\Smart_Car\lib\common\DirectionControl.c -D
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
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\FLASH\List\DirectionControl.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN D
        EXTERN LPLD_FTM_PWM_ChangeDuty
        EXTERN Line1
        EXTERN Line2
        EXTERN P
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fmul
        EXTERN __aeabi_i2d
        EXTERN __aeabi_i2f
        EXTERN absMid
        EXTERN angle
        EXTERN averData
        EXTERN countAver
        EXTERN crossFlag
        EXTERN crossScale
        EXTERN curAver
        EXTERN devAver
        EXTERN leftMaxAngle
        EXTERN midAngle
        EXTERN midDot
        EXTERN preAver
        EXTERN rightMaxAngle
        EXTERN sumAverData

        PUBLIC angleProtected
        PUBLIC directionControl

// C:\Users\whstarlit\Desktop\Smart_Car\lib\common\DirectionControl.c
//    1 #include "DirectionControl.h"
//    2 #include "include.h"
//    3 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    4 void directionControl()
//    5 {
directionControl:
        PUSH     {R3-R7,LR}
//    6   if (crossFlag == 0)
        LDR.N    R0,??DataTable1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.W    ??directionControl_0
//    7   {
//    8     int i, sum, t, lineNum;
//    9     sum = 0;
        MOVS     R1,#+0
//   10     lineNum = 0;
        MOVS     R0,#+0
//   11     for (i = Line2; i >= Line1; i--)
        LDR.N    R2,??DataTable1_1
        LDR      R2,[R2, #+0]
        B.N      ??directionControl_1
//   12     {
//   13       t = midDot[i] - midDot[i-1];
??directionControl_2:
        LDR.N    R3,??DataTable1_2
        LDR      R3,[R3, R2, LSL #+2]
        LDR.N    R4,??DataTable1_2
        ADDS     R4,R4,R2, LSL #+2
        LDR      R4,[R4, #-4]
        SUBS     R3,R3,R4
//   14 //      if (t >= 5 || t <= -5)
//   15 //      {
//   16 //        midDot[i-1] = midDot[i];
//   17 //      }
//   18       lineNum++;
        ADDS     R0,R0,#+1
//   19       sum += midDot[i];
        LDR.N    R3,??DataTable1_2
        LDR      R3,[R3, R2, LSL #+2]
        ADDS     R1,R3,R1
//   20     }
        SUBS     R2,R2,#+1
??directionControl_1:
        LDR.N    R3,??DataTable1_3
        LDR      R3,[R3, #+0]
        CMP      R2,R3
        BGE.N    ??directionControl_2
//   21   
//   22     if (countAver >= 3)
        LDR.N    R2,??DataTable1_4
        LDR      R2,[R2, #+0]
        CMP      R2,#+3
        BLT.N    ??directionControl_3
//   23     {
//   24       countAver = 0;
        MOVS     R2,#+0
        LDR.N    R3,??DataTable1_4
        STR      R2,[R3, #+0]
//   25     }
//   26     curAver = sum/lineNum - absMid;
??directionControl_3:
        SDIV     R0,R1,R0
        LDR.N    R1,??DataTable1_5
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        LDR.N    R1,??DataTable1_6
        STR      R0,[R1, #+0]
//   27     devAver = curAver - preAver;
        LDR.N    R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_7
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        LDR.N    R1,??DataTable1_8
        STR      R0,[R1, #+0]
//   28     preAver = curAver;
        LDR.N    R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_7
        STR      R0,[R1, #+0]
//   29     averData[countAver] = curAver;
        LDR.N    R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_9
        LDR.N    R2,??DataTable1_4
        LDR      R2,[R2, #+0]
        STR      R0,[R1, R2, LSL #+2]
//   30     countAver++;
        LDR.N    R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable1_4
        STR      R0,[R1, #+0]
//   31   
//   32     //取三次的平均值
//   33     sumAverData = (averData[0] + averData[1] + averData[2])/3;
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_9
        LDR      R1,[R1, #+4]
        ADDS     R0,R1,R0
        LDR.N    R1,??DataTable1_9
        LDR      R1,[R1, #+8]
        ADDS     R0,R1,R0
        MOVS     R1,#+3
        SDIV     R0,R0,R1
        LDR.N    R1,??DataTable1_10
        STR      R0,[R1, #+0]
//   34   
//   35     angle = midAngle + curAver * (P/10.0) + devAver * (D/10.0) + 4 * sumAverData;
        LDR.N    R0,??DataTable1_11
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.N    R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable1_12
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable1_13  ;; 0x40240000
        BL       __aeabi_ddiv
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dadd
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.N    R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable1_14
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable1_13  ;; 0x40240000
        BL       __aeabi_ddiv
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable1_10
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+2
        BL       __aeabi_i2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2iz
        LDR.N    R1,??DataTable1_15
        STR      R0,[R1, #+0]
//   36     angle = angleProtected(angle);
        LDR.N    R0,??DataTable1_15
        LDR      R0,[R0, #+0]
        BL       angleProtected
        LDR.N    R1,??DataTable1_15
        STR      R0,[R1, #+0]
        B.N      ??directionControl_4
//   37   }
//   38   else
//   39   {
//   40     curAver *= crossScale;
??directionControl_0:
        LDR.N    R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable1_16
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2iz
        LDR.N    R1,??DataTable1_6
        STR      R0,[R1, #+0]
//   41     angle = midAngle + curAver * (P/10.0);
        LDR.N    R0,??DataTable1_11
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.N    R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable1_12
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable1_13  ;; 0x40240000
        BL       __aeabi_ddiv
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dadd
        BL       __aeabi_d2iz
        LDR.N    R1,??DataTable1_15
        STR      R0,[R1, #+0]
//   42   }
//   43   LPLD_FTM_PWM_ChangeDuty(FTM2, FTM_Ch0, angle);
??directionControl_4:
        LDR.N    R0,??DataTable1_15
        LDR      R2,[R0, #+0]
        MOVS     R1,#+0
        LDR.N    R0,??DataTable1_17  ;; 0x400b8000
        BL       LPLD_FTM_PWM_ChangeDuty
//   44 }
        POP      {R0,R4-R7,PC}    ;; return
//   45 
//   46 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   47 int angleProtected(int t)
//   48 {
//   49   if (t >= rightMaxAngle)
angleProtected:
        LDR.N    R1,??DataTable1_18
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BLT.N    ??angleProtected_0
//   50   {
//   51     return rightMaxAngle;
        LDR.N    R0,??DataTable1_18
        LDR      R0,[R0, #+0]
        B.N      ??angleProtected_1
//   52   }
//   53   else if (t <= leftMaxAngle)
??angleProtected_0:
        LDR.N    R1,??DataTable1_19
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BLT.N    ??angleProtected_2
//   54   {
//   55     return leftMaxAngle;
        LDR.N    R0,??DataTable1_19
        LDR      R0,[R0, #+0]
        B.N      ??angleProtected_1
//   56   }
//   57   else
//   58   {
//   59     return t;
??angleProtected_2:
??angleProtected_1:
        BX       LR               ;; return
//   60   }
//   61 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     crossFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     Line2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     midDot

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     Line1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     countAver

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     absMid

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     curAver

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     preAver

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     devAver

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     averData

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     sumAverData

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     midAngle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     0x40240000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_15:
        DC32     angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_16:
        DC32     crossScale

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_17:
        DC32     0x400b8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_18:
        DC32     rightMaxAngle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_19:
        DC32     leftMaxAngle

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   62 
//   63 
//   64 //void normal(int a, int b, int c)
//   65 //{ 
//   66 //  polyfit((float*)midDot, (float*)index, n);
//   67 //  float k = b_x;
//   68 //  float t = c_x;
//   69 //  
//   70 //  for (i = 55; i > a; i--)
//   71 //  {
//   72 //    midDot[i] = (i - t)/k;
//   73 //  }
//   74 //  
//   75 //   28 35 55
//   76 //  三个定行
//   77 //  line1 = a;
//   78 //  line2 = b;
//   79 //  line3 = c;
//   80 //
//   81 //  //头两行丢线
//   82 //  if (endLine > ctrLine)
//   83 //  {
//   84 //    line1 = 40;
//   85 //    line2 = 43;
//   86 //  }
//   87 //  int x1, x2, x3;
//   88 //
//   89 //  x1 = midDot[line1];
//   90 //  x2 = midDot[line3];
//   91 //  x3 = midDot[line3];
//   92 //  //key = 0;//countError();
//   93 //  s = (x1 * line2 - x2 * line1) + (x2 * line3 - x3 * line2) + (x3 * line1 - x1 * line3);
//   94 //  s = s * 0.5 * 0.07;
//   95 //
//   96 //  deviation = s - preS;
//   97 //  preS = s;
//   98 //  
//   99 //  angle = midAngle + s * (P/10.0) + deviation * (D/10.0) + -4 * (midDot[50] - absMid);
//  100 //  angle = angleProtected(angle);
//  101 //  LPLD_FTM_PWM_ChangeDuty(FTM2, FTM_Ch1, angle);
//  102 //}
//  103 
//  104 
//  105 
// 
// 520 bytes in section .text
// 
// 520 bytes of CODE memory
//
//Errors: none
//Warnings: 3
