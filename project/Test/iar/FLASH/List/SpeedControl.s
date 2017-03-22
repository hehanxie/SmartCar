///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2016  20:40:45
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\whstarlit\Desktop\Smart_Car\lib\common\SpeedControl.c
//    Command line =  
//        C:\Users\whstarlit\Desktop\Smart_Car\lib\common\SpeedControl.c -D
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
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\FLASH\List\SpeedControl.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN CAR_SPEED_SET
        EXTERN D_Speed
        EXTERN I_Speed
        EXTERN I_speed_out
        EXTERN LPLD_FTM_PWM_ChangeDuty
        EXTERN P_Speed
        EXTERN P_speed_out
        EXTERN SPEED
        EXTERN Speed_Car
        EXTERN Speed_Car_New
        EXTERN Speed_Car_Old
        EXTERN Speed_Control_Max
        EXTERN Speed_Control_Min
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_dmul
        EXTERN __aeabi_dsub
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN speedCount
        EXTERN start

        PUBLIC pit_speed_control
        PUBLIC speed_control
        PUBLIC speed_protected
        PUBLIC speed_stop

// C:\Users\whstarlit\Desktop\Smart_Car\lib\common\SpeedControl.c
//    1 #include "SpeedControl.h"
//    2 #include "include.h"
//    3 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    4 void pit_speed_control()
//    5 {
pit_speed_control:
        PUSH     {R7,LR}
//    6   //获取当前编码器的值
//    7   //speedCount = LPLD_FTM_GetCounter(FTM1);
//    8   //清零
//    9   //sss = speedCount;
//   10   //speed_control();
//   11   //LPLD_FTM_ClearCounter(FTM1);
//   12   
//   13   speed_protected();
        BL       speed_protected
//   14 }
        POP      {R0,PC}          ;; return
//   15 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   16 void speed_protected()
//   17 {
speed_protected:
        PUSH     {R7,LR}
//   18   if (1 == start)
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??speed_protected_0
//   19   {
//   20     //LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0, Speed_Car_New);
//   21     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0, SPEED);
        LDR.N    R0,??DataTable1_1
        LDR      R2,[R0, #+0]
        MOVS     R1,#+0
        LDR.N    R0,??DataTable1_2  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//   22     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1, 0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable1_2  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
        B.N      ??speed_protected_1
//   23   }
//   24   else
//   25   {
//   26     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0, 0);
??speed_protected_0:
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable1_2  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//   27     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1, 0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable1_2  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//   28   }
//   29 }
??speed_protected_1:
        POP      {R0,PC}          ;; return
//   30 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   31 void speed_control()
//   32 {
speed_control:
        PUSH     {R4-R8,LR}
//   33   //增量式速度PID
//   34   volatile static float err = 0 ,last_err = 0 ,before_last_err = 0 ,derr = 0;
//   35   float speed_P = 0.0, speed_I = 0.0, speed_D = 0.0;
        MOVS     R6,#+0
        MOVS     R7,#+0
        MOVS     R4,#+0
//   36   static float P_Last,I_Last;
//   37 //  float Power = 0.5;                                  //速度P控制输出量的权值
//   38 //  if(start == 1)                                    //当开始运行时，速度一点点的加上去
//   39 //  {
//   40 //     if(CAR_SPEED_SET < CAR_SPEED_SET_TMP)
//   41 //       CAR_SPEED_SET += 100; 
//   42 //  }
//   43 //
//   44 //  if(speed_left > speed_right)                     
//   45 //    speed_car = (int)(speed_left *0.60 + speed_right * 0.4);
//   46 //  else 
//   47 //    speed_car = (int)(speed_left *0.4 + speed_right * 0.6);
//   48 // 
//   49   Speed_Car = speedCount;//车子的实际速度，为左右两轮速度的均值
        LDR.N    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable1_4
        STR      R0,[R1, #+0]
//   50   
//   51   err = CAR_SPEED_SET - Speed_Car ;                //与预定速度的差值
        LDR.N    R0,??DataTable1_5
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable1_6
        STR      R0,[R1, #+0]
//   52   derr = err - last_err;                           //两次速度的偏差
        LDR.N    R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_7
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable1_8
        STR      R0,[R1, #+0]
//   53   //derr1=0.9*derr1+0.1*derr;
//   54   Speed_Car_Old = Speed_Car_New;                     //新旧速度输出量的交替
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_10
        STR      R0,[R1, #+0]
//   55 
//   56    
//   57   speed_P = (float)derr * P_Speed;
        LDR.N    R0,??DataTable1_8
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1_11
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R6,R0
//   58   speed_I = (float)err * I_Speed;
        LDR.N    R0,??DataTable1_6
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1_12
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R7,R0
//   59   speed_D = (float)(err  - 2.0*last_err + before_last_err) * D_Speed;
        LDR.N    R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_7
        LDR      R8,[R1, #+0]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        MOV      R0,R8
        BL       __aeabi_f2d
        MOVS     R2,#+0
        MOVS     R3,#+1073741824
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_dsub
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable1_13
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable1_14
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R4,R0
//   60 // P = P * Power + P_Last * (1.0 - Power);              //对速度P的控制量做低通滤波
//   61 // I = I * Power + I_Last * (1.0 - Power);  
//   62 //  if(P > 8000)
//   63 //   P = 8000;
//   64 //  else if(P < -8000)
//   65 //    P = -8000;
//   66 //  if(I > 800)
//   67 //   I = 800;
//   68 //  else if(I < -800)
//   69 //  I = -800;
//   70 
//   71   P_speed_out = speed_P;
        LDR.N    R0,??DataTable1_15
        STR      R6,[R0, #+0]
//   72   I_speed_out = speed_I;
        LDR.N    R0,??DataTable1_16
        STR      R7,[R0, #+0]
//   73 
//   74   Speed_Car_New += speed_P + speed_I + speed_D;       //速度的输出值
        MOVS     R0,R6
        MOVS     R1,R7
        BL       __aeabi_fadd
        MOVS     R1,R4
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable1_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable1_9
        STR      R0,[R1, #+0]
//   75  
//   76   
//   77   if(Speed_Car_New > Speed_Control_Max)
        LDR.N    R0,??DataTable1_17
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS.N    ??speed_control_0
//   78   {
//   79     Speed_Car_New = Speed_Control_Max;
        LDR.N    R0,??DataTable1_17
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_9
        STR      R0,[R1, #+0]
//   80   }
//   81   if(Speed_Car_New < Speed_Control_Min)
??speed_control_0:
        LDR.N    R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_18
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS.N    ??speed_control_1
//   82   {
//   83     Speed_Car_New = Speed_Control_Min;
        LDR.N    R0,??DataTable1_18
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_9
        STR      R0,[R1, #+0]
//   84   } 
//   85   before_last_err = last_err; 
??speed_control_1:
        LDR.N    R0,??DataTable1_7
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_13
        STR      R0,[R1, #+0]
//   86   last_err = err;
        LDR.N    R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_7
        STR      R0,[R1, #+0]
//   87   P_Last = speed_P;
        LDR.N    R0,??DataTable1_19
        STR      R6,[R0, #+0]
//   88   I_Last = speed_I;
        LDR.N    R0,??DataTable1_20
        STR      R7,[R0, #+0]
//   89 }
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     start

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     SPEED

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x40038000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     speedCount

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     Speed_Car

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     CAR_SPEED_SET

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     ??err

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     ??last_err

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     ??derr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     Speed_Car_New

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     Speed_Car_Old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     P_Speed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     I_Speed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     ??before_last_err

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     D_Speed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_15:
        DC32     P_speed_out

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_16:
        DC32     I_speed_out

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_17:
        DC32     Speed_Control_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_18:
        DC32     Speed_Control_Min

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_19:
        DC32     ??P_Last

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_20:
        DC32     ??I_Last

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??err:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??last_err:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??before_last_err:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??derr:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??P_Last:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??I_Last:
        DS8 4
//   90 
//   91 //终点停车

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   92 void speed_stop()
//   93 {
//   94 }
speed_stop:
        BX       LR               ;; return

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
//  24 bytes in section .bss
// 426 bytes in section .text
// 
// 426 bytes of CODE memory
//  24 bytes of DATA memory
//
//Errors: none
//Warnings: 4
