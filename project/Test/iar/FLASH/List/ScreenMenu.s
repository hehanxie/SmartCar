///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       18/Jul/2016  20:57:14
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\whstarlit\Desktop\Smart_Car\lib\common\ScreenMenu.c
//    Command line =  
//        C:\Users\whstarlit\Desktop\Smart_Car\lib\common\ScreenMenu.c -D
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
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\FLASH\List\ScreenMenu.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN D
        EXTERN D_Speed
        EXTERN I_Speed
        EXTERN LCD_FILL
        EXTERN LCD_P6x8Str
        EXTERN LCD_Writeword
        EXTERN LPLD_FTM_PWM_ChangeDuty
        EXTERN P
        EXTERN P_Speed
        EXTERN SPEED
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fadd
        EXTERN crossScale
        EXTERN keyValue
        EXTERN leftMaxAngle
        EXTERN midAngle
        EXTERN rightMaxAngle
        EXTERN start

        PUBLIC changeVar
        PUBLIC confirm
        PUBLIC curLine
        PUBLIC curPages
        PUBLIC inputNum
        PUBLIC keyNum
        PUBLIC pageCount
        PUBLIC pageLine
        PUBLIC showInformation
        PUBLIC showMenu

// C:\Users\whstarlit\Desktop\Smart_Car\lib\common\ScreenMenu.c
//    1 #include "ScreenMenu.h"
//    2 #include "include.h"
//    3 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    4 uint8 curPages = 0;
curPages:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    5 uint8 keyNum;
keyNum:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//    6 uint8 pageCount = 4;
pageCount:
        DATA
        DC8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    7 uint8 curLine = 0;
curLine:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    8 float inputNum = 0;
inputNum:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    9 uint8 pageLine[4] = {0, 2, 3, 3};
pageLine:
        DATA
        DC8 0, 2, 3, 3

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   10 uint8 confirm = 0;
confirm:
        DS8 1
//   11 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   12 void changeVar(int inputValue)
//   13 {
changeVar:
        PUSH     {R7,LR}
//   14   switch (inputValue)
        CMP      R0,#+1
        BEQ.N    ??changeVar_0
        BCC.N    ??changeVar_1
        CMP      R0,#+3
        BEQ.N    ??changeVar_2
        BCC.N    ??changeVar_3
        CMP      R0,#+5
        BEQ.N    ??changeVar_4
        BCC.N    ??changeVar_5
        CMP      R0,#+7
        BEQ.N    ??changeVar_6
        BCC.N    ??changeVar_7
        CMP      R0,#+9
        BEQ.N    ??changeVar_8
        BCC.N    ??changeVar_9
        B.N      ??changeVar_1
//   15   {
//   16     case 1:
//   17       {
//   18         P -= 1;
??changeVar_0:
        LDR.N    R0,??DataTable1_4
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1_5  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable1_4
        STR      R0,[R1, #+0]
//   19         break;
        B.N      ??changeVar_10
//   20       }
//   21     case 2:
//   22       {
//   23         P += 1;
??changeVar_3:
        LDR.N    R0,??DataTable1_4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+1065353216
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable1_4
        STR      R0,[R1, #+0]
//   24         break;
        B.N      ??changeVar_10
//   25       }
//   26 
//   27     case 4:
//   28       {
//   29         D -= 1;
??changeVar_5:
        LDR.N    R0,??DataTable1_6
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1_5  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable1_6
        STR      R0,[R1, #+0]
//   30         break;
        B.N      ??changeVar_10
//   31       }
//   32     case 5:
//   33       {
//   34         D += 1;
??changeVar_4:
        LDR.N    R0,??DataTable1_6
        LDR      R1,[R0, #+0]
        MOVS     R0,#+1065353216
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable1_6
        STR      R0,[R1, #+0]
//   35         break;
        B.N      ??changeVar_10
//   36       }
//   37       
//   38    //调整舵机
//   39 //    case 7:
//   40 //      {
//   41 //        angle -= 5;
//   42 //        LPLD_FTM_PWM_ChangeDuty(FTM2, FTM_Ch0, angle);
//   43 //        break;
//   44 //      }
//   45 //    case 8:
//   46 //      {
//   47 //        angle += 5;
//   48 //        LPLD_FTM_PWM_ChangeDuty(FTM2, FTM_Ch0, angle);
//   49 //        break;
//   50 //      }
//   51     
//   52     //调整速度上限
//   53     case 7:
//   54       {
//   55         //CAR_SPEED_SET -= 10;
//   56         //LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0, Speed_Car_New);
//   57         //startLine--;
//   58         crossScale -= 0.05;
??changeVar_6:
        LDR.N    R0,??DataTable1_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable1_8  ;; 0x9999999a
        LDR.N    R3,??DataTable1_9  ;; 0xbfa99999
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable1_7
        STR      R0,[R1, #+0]
//   59         break;
        B.N      ??changeVar_10
//   60       }
//   61     case 8:
//   62       {
//   63         //CAR_SPEED_SET += 10;
//   64         //LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0, Speed_Car_New);
//   65        //startLine++;
//   66         crossScale += 0.05;
??changeVar_9:
        LDR.N    R0,??DataTable1_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable1_8  ;; 0x9999999a
        LDR.N    R3,??DataTable1_10  ;; 0x3fa99999
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable1_7
        STR      R0,[R1, #+0]
//   67         break;
        B.N      ??changeVar_10
//   68       }
//   69     
//   70     //开启电机
//   71     case 9:
//   72       {
//   73         if (start == 1)
??changeVar_8:
        LDR.N    R0,??DataTable1_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??changeVar_11
//   74         {
//   75           start = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_11
        STRB     R0,[R1, #+0]
        B.N      ??changeVar_12
//   76           //LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0, 0);
//   77         }
//   78         else
//   79         {
//   80           start = 1;
??changeVar_11:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_11
        STRB     R0,[R1, #+0]
//   81           //delayMs(20);
//   82           LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0, 6000);
        MOVW     R2,#+6000
        MOVS     R1,#+0
        LDR.N    R0,??DataTable1_12  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//   83           //
//   84           //LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0, 3000);
//   85         }     
//   86         //Speed_Car_New = 0;
//   87         break;
??changeVar_12:
        B.N      ??changeVar_10
//   88       }
//   89       
//   90     case 3:
//   91       {
//   92         SPEED += 100;
??changeVar_2:
        LDR.N    R0,??DataTable1_13
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+100
        LDR.N    R1,??DataTable1_13
        STR      R0,[R1, #+0]
//   93         break;
        B.N      ??changeVar_10
//   94       }
//   95     case 6:
//   96       {
//   97         SPEED -= 100;
??changeVar_7:
        LDR.N    R0,??DataTable1_13
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+100
        LDR.N    R1,??DataTable1_13
        STR      R0,[R1, #+0]
//   98         break;
        B.N      ??changeVar_10
//   99       }
//  100     
//  101     default :
//  102       break;
//  103   }
//  104   keyValue = 0;
??changeVar_1:
??changeVar_10:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_14
        STRB     R0,[R1, #+0]
//  105 }
        POP      {R0,PC}          ;; return
//  106 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  107 void showInformation()
//  108 {
//  109  
//  110 }
showInformation:
        BX       LR               ;; return
//  111 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  112 void showMenu(uint8 pages)
//  113 {
showMenu:
        PUSH     {LR}
        SUB      SP,SP,#+12
//  114   switch(pages)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??showMenu_0
        CMP      R0,#+2
        BEQ.N    ??showMenu_1
        BCC.N    ??showMenu_2
        CMP      R0,#+4
        BEQ.W    ??showMenu_3
        BCC.N    ??showMenu_4
        B.N      ??showMenu_5
//  115   {
//  116   case 0:
//  117     LCD_FILL(0x00);
??showMenu_0:
        MOVS     R0,#+0
        BL       LCD_FILL
//  118     LCD_P6x8Str(8, 1, "showImg");
        LDR.N    R2,??DataTable1_15
        MOVS     R1,#+1
        MOVS     R0,#+8
        BL       LCD_P6x8Str
//  119     LCD_P6x8Str(8, 2, "Control Menu");
        LDR.N    R2,??DataTable1_16
        MOVS     R1,#+2
        MOVS     R0,#+8
        BL       LCD_P6x8Str
//  120     LCD_P6x8Str(8, 3, "Speed Menu");
        LDR.N    R2,??DataTable1_17
        MOVS     R1,#+3
        MOVS     R0,#+8
        BL       LCD_P6x8Str
//  121     LCD_P6x8Str(8, 4, "Angle Menu");
        LDR.N    R2,??DataTable1_18
        MOVS     R1,#+4
        MOVS     R0,#+8
        BL       LCD_P6x8Str
//  122     LCD_P6x8Str(0, curLine+1, "*");
        ADR.N    R2,??DataTable1  ;; "*"
        LDR.N    R0,??DataTable1_19
        LDRB     R0,[R0, #+0]
        ADDS     R1,R0,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  123     break;
        B.N      ??showMenu_6
//  124     
//  125   case 1:
//  126     break;
??showMenu_2:
        B.N      ??showMenu_6
//  127     
//  128   case 2:
//  129     LCD_P6x8Str(60, 0, "Control Menu");
??showMenu_1:
        LDR.N    R2,??DataTable1_16
        MOVS     R1,#+0
        MOVS     R0,#+60
        BL       LCD_P6x8Str
//  130     LCD_Writeword(80, 0, "Page: ", curPages);
        LDR.N    R0,??DataTable1_20
        LDRB     R3,[R0, #+0]
        LDR.N    R2,??DataTable1_21
        MOVS     R1,#+0
        MOVS     R0,#+80
        BL       LCD_Writeword
//  131     
//  132     LCD_Writeword(80, 1, "P: ", P);
        LDR.N    R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        STRD     R0,R1,[SP, #+0]
        ADR.N    R2,??DataTable1_1  ;; "P: "
        MOVS     R1,#+1
        MOVS     R0,#+80
        BL       LCD_Writeword
//  133     LCD_Writeword(80, 2, "D: ", D);
        LDR.N    R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        STRD     R0,R1,[SP, #+0]
        ADR.N    R2,??DataTable1_2  ;; "D: "
        MOVS     R1,#+2
        MOVS     R0,#+80
        BL       LCD_Writeword
//  134     LCD_P6x8Str(0, curLine+1, "*");
        ADR.N    R2,??DataTable1  ;; "*"
        LDR.N    R0,??DataTable1_19
        LDRB     R0,[R0, #+0]
        ADDS     R1,R0,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  135     break;
        B.N      ??showMenu_6
//  136     
//  137   case 3:
//  138     LCD_P6x8Str(60, 0, "Speed Menu");
??showMenu_4:
        LDR.N    R2,??DataTable1_17
        MOVS     R1,#+0
        MOVS     R0,#+60
        BL       LCD_P6x8Str
//  139     LCD_Writeword(80, 0, "Page: ", curPages);
        LDR.N    R0,??DataTable1_20
        LDRB     R3,[R0, #+0]
        LDR.N    R2,??DataTable1_21
        MOVS     R1,#+0
        MOVS     R0,#+80
        BL       LCD_Writeword
//  140     
//  141     LCD_Writeword(80, 1, "P: ", P_Speed);
        LDR.N    R0,??DataTable1_22
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        STRD     R0,R1,[SP, #+0]
        ADR.N    R2,??DataTable1_1  ;; "P: "
        MOVS     R1,#+1
        MOVS     R0,#+80
        BL       LCD_Writeword
//  142     LCD_Writeword(80, 2, "I: ", I_Speed);
        LDR.N    R0,??DataTable1_23
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        STRD     R0,R1,[SP, #+0]
        ADR.N    R2,??DataTable1_3  ;; "I: "
        MOVS     R1,#+2
        MOVS     R0,#+80
        BL       LCD_Writeword
//  143     LCD_Writeword(80, 3, "D: ", D_Speed);
        LDR.N    R0,??DataTable1_24
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        STRD     R0,R1,[SP, #+0]
        ADR.N    R2,??DataTable1_2  ;; "D: "
        MOVS     R1,#+3
        MOVS     R0,#+80
        BL       LCD_Writeword
//  144     LCD_P6x8Str(0, curLine+1, "*");
        ADR.N    R2,??DataTable1  ;; "*"
        LDR.N    R0,??DataTable1_19
        LDRB     R0,[R0, #+0]
        ADDS     R1,R0,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  145     break;
        B.N      ??showMenu_6
//  146     
//  147   case 4:
//  148     LCD_P6x8Str(60, 0, "Angle Menu");
??showMenu_3:
        LDR.N    R2,??DataTable1_18
        MOVS     R1,#+0
        MOVS     R0,#+60
        BL       LCD_P6x8Str
//  149     LCD_Writeword(80, 0, "Page: ", curPages);
        LDR.N    R0,??DataTable1_20
        LDRB     R3,[R0, #+0]
        LDR.N    R2,??DataTable1_21
        MOVS     R1,#+0
        MOVS     R0,#+80
        BL       LCD_Writeword
//  150     
//  151     LCD_Writeword(8, 1, "cur mid anlge: ", midAngle);
        LDR.N    R0,??DataTable1_25
        LDR      R3,[R0, #+0]
        LDR.N    R2,??DataTable1_26
        MOVS     R1,#+1
        MOVS     R0,#+8
        BL       LCD_Writeword
//  152     LCD_Writeword(8, 2, "left max angle", leftMaxAngle);
        LDR.N    R0,??DataTable1_27
        LDR      R3,[R0, #+0]
        LDR.N    R2,??DataTable1_28
        MOVS     R1,#+2
        MOVS     R0,#+8
        BL       LCD_Writeword
//  153     LCD_Writeword(8, 3, "right max angle", rightMaxAngle);
        LDR.N    R0,??DataTable1_29
        LDR      R3,[R0, #+0]
        LDR.N    R2,??DataTable1_30
        MOVS     R1,#+3
        MOVS     R0,#+8
        BL       LCD_Writeword
//  154     LCD_P6x8Str(0, curLine+1, "*");
        ADR.N    R2,??DataTable1  ;; "*"
        LDR.N    R0,??DataTable1_19
        LDRB     R0,[R0, #+0]
        ADDS     R1,R0,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  155     break;
        B.N      ??showMenu_6
//  156   default:
//  157     break;
//  158   }
//  159 }
??showMenu_5:
??showMenu_6:
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC8      "*",0x0,0x0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC8      "P: "

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC8      "D: "

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC8      "I: "

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0xbf800000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     crossScale

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     0x9999999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     0xbfa99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     0x3fa99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     start

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     0x40038000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     SPEED

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     keyValue

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_15:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_16:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_17:
        DC32     ?_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_18:
        DC32     ?_3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_19:
        DC32     curLine

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_20:
        DC32     curPages

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_21:
        DC32     ?_5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_22:
        DC32     P_Speed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_23:
        DC32     I_Speed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_24:
        DC32     D_Speed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_25:
        DC32     midAngle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_26:
        DC32     ?_9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_27:
        DC32     leftMaxAngle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_28:
        DC32     ?_10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_29:
        DC32     rightMaxAngle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_30:
        DC32     ?_11

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC8 "showImg"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_1:
        DATA
        DC8 "Control Menu"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_2:
        DATA
        DC8 "Speed Menu"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_3:
        DATA
        DC8 "Angle Menu"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 "*"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_5:
        DATA
        DC8 "Page: "
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "P: "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "D: "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "I: "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_9:
        DATA
        DC8 "cur mid anlge: "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_10:
        DATA
        DC8 "left max angle"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_11:
        DATA
        DC8 "right max angle"

        END
//  160 
//  161 
//  162 
// 
//   8 bytes in section .bss
//   5 bytes in section .data
// 118 bytes in section .rodata
// 720 bytes in section .text
// 
// 720 bytes of CODE  memory
// 118 bytes of CONST memory
//  13 bytes of DATA  memory
//
//Errors: none
//Warnings: 2
