///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2016  20:40:44
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\whstarlit\Desktop\Smart_Car\lib\common\init.c
//    Command line =  
//        C:\Users\whstarlit\Desktop\Smart_Car\lib\common\init.c -D LPLD_K60 -D
//        USE_K60D10 -lCN
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
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\FLASH\List\init.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN DMA_init
        EXTERN IO_init
        EXTERN Keyboard_init
        EXTERN LCD_Init
        EXTERN LPLD_FTM_Init
        EXTERN LPLD_FTM_PWM_Enable
        EXTERN LPLD_PIT_EnableIrq
        EXTERN LPLD_PIT_Init
        EXTERN PCLK_init
        EXTERN SCCB_ReadByte
        EXTERN VSY_init
        EXTERN __aeabi_memcpy4
        EXTERN device_id
        EXTERN midAngle
        EXTERN ov7725_init
        EXTERN pit_speed_control

        PUBLIC delayMs
        PUBLIC ftm1_init_struct
        PUBLIC ftm2_init_struct
        PUBLIC ftm_init_struct
        PUBLIC init_all
        PUBLIC pit0_init_struct
        PUBLIC pit_init
        PUBLIC pwm_init

// C:\Users\whstarlit\Desktop\Smart_Car\lib\common\init.c
//    1 #include "include.h"
//    2 #include "init.h"
//    3 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    4 void init_all()
//    5 {
init_all:
        PUSH     {R7,LR}
//    6   DisableInterrupts;
        CPSID    I
//    7   //初始化键盘
//    8   Keyboard_init();
        BL       Keyboard_init
//    9   
//   10   //初始化电机
//   11   pwm_init();
        BL       pwm_init
//   12   
//   13   //初始化定时中断
//   14   pit_init();
        BL       pit_init
//   15   
//   16   //初始化屏幕
//   17   LCD_Init();
        BL       LCD_Init
//   18   
//   19   //初始化摄像头
//   20   VSY_init();
        BL       VSY_init
//   21   PCLK_init();
        BL       PCLK_init
//   22   DMA_init();
        BL       DMA_init
//   23   IO_init();
        BL       IO_init
//   24   ov7725_init();
        BL       ov7725_init
//   25   
//   26   SCCB_ReadByte(&device_id, 1, OV7725_COM4);
        MOVS     R2,#+13
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2
        BL       SCCB_ReadByte
//   27   
//   28   EnableInterrupts;
        CPSIE    I
//   29 }
        POP      {R0,PC}          ;; return
//   30 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   31 PIT_InitTypeDef pit0_init_struct;     //定时中断
pit0_init_struct:
        DS8 20

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   32 void pit_init()
//   33 {
pit_init:
        PUSH     {R7,LR}
//   34   pit0_init_struct.PIT_Pitx = PIT0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_1
        STRB     R0,[R1, #+0]
//   35   pit0_init_struct.PIT_PeriodMs = 10; 
        MOVS     R0,#+10
        LDR.N    R1,??DataTable2_1
        STR      R0,[R1, #+8]
//   36   pit0_init_struct.PIT_Isr = pit_speed_control;  
        LDR.N    R0,??DataTable2_2
        LDR.N    R1,??DataTable2_1
        STR      R0,[R1, #+16]
//   37   LPLD_PIT_Init(pit0_init_struct);  
        LDR.N    R1,??DataTable2_1
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_PIT_Init
//   38   LPLD_PIT_EnableIrq(pit0_init_struct);
        LDR.N    R1,??DataTable2_1
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_PIT_EnableIrq
//   39 }
        POP      {R0,PC}          ;; return
//   40 
//   41 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   42 FTM_InitTypeDef ftm_init_struct;    //舵机
ftm_init_struct:
        DS8 28

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   43 FTM_InitTypeDef ftm1_init_struct;   //电机
ftm1_init_struct:
        DS8 28

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   44 FTM_InitTypeDef ftm2_init_struct;   //编码器
ftm2_init_struct:
        DS8 28
//   45 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   46 void pwm_init(void)
//   47 {
pwm_init:
        PUSH     {R5-R7,LR}
//   48   //电机的初始化
//   49   ftm1_init_struct.FTM_Ftmx = FTM0;	      
        LDR.N    R0,??DataTable2_3  ;; 0x40038000
        LDR.N    R1,??DataTable2_4
        STR      R0,[R1, #+0]
//   50   //使能FTM0通道
//   51   ftm1_init_struct.FTM_Mode = FTM_MODE_PWM;	//使能PWM模式
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_4
        STRB     R0,[R1, #+4]
//   52   ftm1_init_struct.FTM_PwmFreq = 10000;	        //PWM频率25000Hz
        MOVW     R0,#+10000
        LDR.N    R1,??DataTable2_4
        STR      R0,[R1, #+8]
//   53   LPLD_FTM_Init(ftm1_init_struct);
        LDR.N    R1,??DataTable2_4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+28
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_FTM_Init
//   54   
//   55   LPLD_FTM_PWM_Enable(FTM0, FTM_Ch0, 0, PTC1, ALIGN_LEFT);    //------正转，Ch2, C3
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        MOVS     R3,#+61
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_3  ;; 0x40038000
        BL       LPLD_FTM_PWM_Enable
//   56   LPLD_FTM_PWM_Enable(FTM0, FTM_Ch1, 0, PTC2, ALIGN_LEFT);    //------反转，Ch3, C4
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        MOVS     R3,#+62
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2_3  ;; 0x40038000
        BL       LPLD_FTM_PWM_Enable
//   57   
//   58   //威斌---test
//   59 //  LPLD_FTM_PWM_Enable(FTM0, FTM_Ch1, 0, PTC2, ALIGN_LEFT);      //正转
//   60 //  LPLD_FTM_PWM_Enable(FTM0, FTM_Ch2, 0, PTC3, ALIGN_LEFT);      //反转
//   61 
//   62 
//   63   
//   64   //舵机
//   65   ftm_init_struct.FTM_Ftmx = FTM2;	
        LDR.N    R0,??DataTable2_5  ;; 0x400b8000
        LDR.N    R1,??DataTable2_6
        STR      R0,[R1, #+0]
//   66   ftm_init_struct.FTM_Mode = FTM_MODE_PWM;	
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_6
        STRB     R0,[R1, #+4]
//   67   ftm_init_struct.FTM_PwmFreq = 50;
        MOVS     R0,#+50
        LDR.N    R1,??DataTable2_6
        STR      R0,[R1, #+8]
//   68   LPLD_FTM_Init(ftm_init_struct);
        LDR.N    R1,??DataTable2_6
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+28
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_FTM_Init
//   69   //Ch1,B19  
//   70   LPLD_FTM_PWM_Enable(FTM2, FTM_Ch0, midAngle, PTB18, ALIGN_LEFT);
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        MOVS     R3,#+50
        LDR.N    R0,??DataTable2_7
        LDR      R2,[R0, #+0]
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_5  ;; 0x400b8000
        BL       LPLD_FTM_PWM_Enable
//   71   
//   72   //编码器
//   73   //ftm2_init_struct.FTM_Ftmx = FTM1;	
//   74   //ftm2_init_struct.FTM_Mode = FTM_MODE_QD;
//   75   //ftm2_init_struct.FTM_QdMode = QD_MODE_CNTDIR;
//   76 	//LPLD_FTM_Init(ftm2_init_struct);
//   77   //LPLD_FTM_QD_Enable(FTM1, PTB0, PTB1);
//   78 }
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     device_id

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     pit0_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     pit_speed_control

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x40038000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     ftm1_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x400b8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     ftm_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     midAngle
//   79  

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   80 void delayMs(uint32 ms)
//   81 {
//   82   int i, j;
//   83   for (i = 0; i < ms; i++)
delayMs:
        MOVS     R1,#+0
        B.N      ??delayMs_0
//   84   {
//   85     for (j = 10000; j > 0; j++)
??delayMs_1:
        ADDS     R2,R2,#+1
??delayMs_2:
        CMP      R2,#+1
        BGE.N    ??delayMs_1
        ADDS     R1,R1,#+1
??delayMs_0:
        CMP      R1,R0
        BCS.N    ??delayMs_3
        MOVW     R2,#+10000
        B.N      ??delayMs_2
//   86     {
//   87     }
//   88   }
//   89 }
??delayMs_3:
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
//   90 
// 
// 104 bytes in section .bss
// 296 bytes in section .text
// 
// 296 bytes of CODE memory
// 104 bytes of DATA memory
//
//Errors: none
//Warnings: none
