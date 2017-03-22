///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       12/Jul/2016  22:02:57
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\app\keyboard.c
//    Command line =  
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\app\keyboard.c
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
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\FLASH\List\keyboard.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_GPIO_Init
        EXTERN __aeabi_memcpy4

        PUBLIC delay1
        PUBLIC key_init
        PUBLIC key_scan

// C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\app\keyboard.c
//    1 #include "common.h"
//    2 void delay1(void);
//    3 /*void key_init(void)
//    4 功能：键盘GPIO初始化*/
//    5 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    6 void key_init(void)
//    7 {GPIO_InitTypeDef gpio_init_struct;
key_init:
        PUSH     {LR}
        SUB      SP,SP,#+28
//    8     //////////列初始化//////////////
//    9   gpio_init_struct.GPIO_PTx=PTC;
        LDR.N    R0,??DataTable1  ;; 0x400ff080
        STR      R0,[SP, #+4]
//   10   gpio_init_struct.GPIO_Pins=GPIO_Pin14|GPIO_Pin15|GPIO_Pin16;
        MOVS     R0,#+114688
        STR      R0,[SP, #+8]
//   11   gpio_init_struct.GPIO_Dir=DIR_INPUT;
        MOVS     R0,#+0
        STRB     R0,[SP, #+16]
//   12   gpio_init_struct.GPIO_PinControl=IRQC_DIS|INPUT_PULL_DOWN;
        MOVS     R0,#+2
        STR      R0,[SP, #+12]
//   13   gpio_init_struct.GPIO_Output=OUTPUT_L;
        MOVS     R0,#+0
        STRB     R0,[SP, #+17]
//   14   LPLD_GPIO_Init(gpio_init_struct);
        ADD      R1,SP,#+4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   15   
//   16    //////////行初始化//////////////
//   17   gpio_init_struct.GPIO_PTx=PTC;
        LDR.N    R0,??DataTable1  ;; 0x400ff080
        STR      R0,[SP, #+4]
//   18   gpio_init_struct.GPIO_Pins=GPIO_Pin11|GPIO_Pin12|GPIO_Pin13;
        MOV      R0,#+14336
        STR      R0,[SP, #+8]
//   19   gpio_init_struct.GPIO_Dir=DIR_OUTPUT;
        MOVS     R0,#+1
        STRB     R0,[SP, #+16]
//   20   gpio_init_struct.GPIO_PinControl=IRQC_DIS;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//   21   gpio_init_struct.GPIO_Output=OUTPUT_L;
        MOVS     R0,#+0
        STRB     R0,[SP, #+17]
//   22   LPLD_GPIO_Init(gpio_init_struct);
        ADD      R1,SP,#+4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   23 }
        ADD      SP,SP,#+28
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   24 unsigned char key_scan(void)
//   25 {
key_scan:
        PUSH     {R4,LR}
//   26   
//   27     unsigned char keyvalue=0; 
        MOVS     R4,#+0
//   28   //////////第一行///////////////
//   29   PTC11_O=1; 
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_1  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//   30   if(PTC14_I==1)
        LDR.N    R0,??DataTable1_2  ;; 0x43fe1238
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_0
//   31   {
//   32     delay1();
        BL       delay1
//   33     if(PTC14_I==1)
        LDR.N    R0,??DataTable1_2  ;; 0x43fe1238
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_1
//   34     {  
//   35 
//   36       keyvalue=1;
        MOVS     R4,#+1
//   37     }
//   38       while(PTC14_I==1);
??key_scan_1:
        LDR.N    R0,??DataTable1_2  ;; 0x43fe1238
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_2
        B.N      ??key_scan_1
//   39   } 
//   40   else if(PTC15_I==1)
??key_scan_0:
        LDR.N    R0,??DataTable1_3  ;; 0x43fe123c
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_3
//   41   {
//   42     delay1();
        BL       delay1
//   43     if(PTC15_I==1)
        LDR.N    R0,??DataTable1_3  ;; 0x43fe123c
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_4
//   44     {   
//   45 
//   46       keyvalue=2;
        MOVS     R4,#+2
//   47     }
//   48       while(PTC15_I==1);
??key_scan_4:
        LDR.N    R0,??DataTable1_3  ;; 0x43fe123c
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_2
        B.N      ??key_scan_4
//   49   } 
//   50   else if(PTC16_I==1)
??key_scan_3:
        LDR.N    R0,??DataTable1_4  ;; 0x43fe1240
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_2
//   51   {
//   52     delay1();
        BL       delay1
//   53     if(PTC16_I==1)
        LDR.N    R0,??DataTable1_4  ;; 0x43fe1240
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_5
//   54     {    
//   55 
//   56       keyvalue=3;
        MOVS     R4,#+3
//   57     }
//   58       while(PTC16_I==1);
??key_scan_5:
        LDR.N    R0,??DataTable1_4  ;; 0x43fe1240
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??key_scan_5
//   59   } 
//   60       PTC11_O=0;
??key_scan_2:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_1  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//   61  //////////////////第二行//////////////////////
//   62  PTC12_O=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_5  ;; 0x43fe1030
        STR      R0,[R1, #+0]
//   63   
//   64   if(PTC14_I==1)
        LDR.N    R0,??DataTable1_2  ;; 0x43fe1238
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_6
//   65   {
//   66     delay1();
        BL       delay1
//   67     if(PTC14_I==1)
        LDR.N    R0,??DataTable1_2  ;; 0x43fe1238
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_7
//   68     {
//   69       keyvalue=4;
        MOVS     R4,#+4
//   70     }
//   71     while(PTC14_I==1);
??key_scan_7:
        LDR.N    R0,??DataTable1_2  ;; 0x43fe1238
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_8
        B.N      ??key_scan_7
//   72   } 
//   73   else if(PTC15_I==1)
??key_scan_6:
        LDR.N    R0,??DataTable1_3  ;; 0x43fe123c
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_9
//   74   {
//   75     delay1();
        BL       delay1
//   76     if(PTC15_I==1)
        LDR.N    R0,??DataTable1_3  ;; 0x43fe123c
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_10
//   77     {
//   78       keyvalue=5;
        MOVS     R4,#+5
//   79     }
//   80     while(PTC15_I==1);
??key_scan_10:
        LDR.N    R0,??DataTable1_3  ;; 0x43fe123c
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_8
        B.N      ??key_scan_10
//   81   } 
//   82   else if(PTC16_I==1)
??key_scan_9:
        LDR.N    R0,??DataTable1_4  ;; 0x43fe1240
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_8
//   83   {
//   84     delay1();
        BL       delay1
//   85     if(PTC16_I==1)
        LDR.N    R0,??DataTable1_4  ;; 0x43fe1240
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_11
//   86     {
//   87       keyvalue=6;
        MOVS     R4,#+6
//   88     }
//   89     while(PTC16_I==1);
??key_scan_11:
        LDR.N    R0,??DataTable1_4  ;; 0x43fe1240
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??key_scan_11
//   90 
//   91   } 
//   92       PTC12_O=0;
??key_scan_8:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_5  ;; 0x43fe1030
        STR      R0,[R1, #+0]
//   93     //////////第三行///////////////
//   94   PTC13_O=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_6  ;; 0x43fe1034
        STR      R0,[R1, #+0]
//   95   
//   96   if(PTC14_I==1)
        LDR.N    R0,??DataTable1_2  ;; 0x43fe1238
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_12
//   97   {
//   98     delay1();
        BL       delay1
//   99     if(PTC14_I==1)
        LDR.N    R0,??DataTable1_2  ;; 0x43fe1238
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_13
//  100     {
//  101       keyvalue=7;
        MOVS     R4,#+7
//  102     }
//  103     while(PTC14_I==1);
??key_scan_13:
        LDR.N    R0,??DataTable1_2  ;; 0x43fe1238
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_14
        B.N      ??key_scan_13
//  104   } 
//  105   else if(PTC15_I==1)
??key_scan_12:
        LDR.N    R0,??DataTable1_3  ;; 0x43fe123c
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_15
//  106   {
//  107     delay1();
        BL       delay1
//  108     if(PTC15_I==1)
        LDR.N    R0,??DataTable1_3  ;; 0x43fe123c
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_16
//  109     {
//  110       keyvalue=8;
        MOVS     R4,#+8
//  111     }
//  112     while(PTC15_I==1);
??key_scan_16:
        LDR.N    R0,??DataTable1_3  ;; 0x43fe123c
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_14
        B.N      ??key_scan_16
//  113   } 
//  114   else if(PTC16_I==1)
??key_scan_15:
        LDR.N    R0,??DataTable1_4  ;; 0x43fe1240
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_14
//  115   {
//  116     delay1();
        BL       delay1
//  117     if(PTC16_I==1)
        LDR.N    R0,??DataTable1_4  ;; 0x43fe1240
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??key_scan_17
//  118     {
//  119       keyvalue=9;
        MOVS     R4,#+9
//  120     }
//  121     while(PTC16_I==1);
??key_scan_17:
        LDR.N    R0,??DataTable1_4  ;; 0x43fe1240
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??key_scan_17
//  122 
//  123   } 
//  124       PTC13_O=0;
??key_scan_14:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_6  ;; 0x43fe1034
        STR      R0,[R1, #+0]
//  125   return keyvalue;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return
//  126 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x43fe102c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x43fe1238

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x43fe123c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x43fe1240

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0x43fe1030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     0x43fe1034
//  127 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  128 void delay1()
//  129 {
//  130   uint16 i, n;
//  131   for(i=0;i<300;i++)
delay1:
        MOVS     R0,#+0
        B.N      ??delay1_0
//  132   {
//  133     for(n=0;n<50;n++)
//  134     {
//  135       asm("nop");
??delay1_1:
        nop
//  136     }
        ADDS     R1,R1,#+1
??delay1_2:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+50
        BLT.N    ??delay1_1
        ADDS     R0,R0,#+1
??delay1_0:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+300
        BGE.N    ??delay1_3
        MOVS     R1,#+0
        B.N      ??delay1_2
//  137   }
//  138 }
??delay1_3:
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
// 482 bytes in section .text
// 
// 482 bytes of CODE memory
//
//Errors: none
//Warnings: none
