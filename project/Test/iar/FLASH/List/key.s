///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       12/Jul/2016  22:23:46
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\whstarlit\Desktop\Smart_Car\lib\LPLD\DEV\key.c
//    Command line =  
//        C:\Users\whstarlit\Desktop\Smart_Car\lib\LPLD\DEV\key.c -D LPLD_K60
//        -D USE_K60D10 -lCN
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
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\FLASH\List\key.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_GPIO_Init
        EXTERN LPLD_GPIO_Input_b
        EXTERN LPLD_GPIO_Output_b
        EXTERN __aeabi_memcpy4

        PUBLIC InitGPIOKEY1
        PUBLIC InitGPIOKEY2
        PUBLIC InitGPIOkey_I
        PUBLIC InitGPIOkey_O
        PUBLIC Keyboard_init
        PUBLIC key_scan

// C:\Users\whstarlit\Desktop\Smart_Car\lib\LPLD\DEV\key.c
//    1 #include "key.h"
//    2 
//    3 
//    4 /*************************************************************************
//    5 *                           嘉庚学院智能车队
//    6 *
//    7 *  函数名称：key_init
//    8 *  功能说明：初始化key端口，设置行为输出，列为下拉输入
//    9 *  参数说明：无
//   10 *  函数返回：无
//   11 *  修改时间：2015-10-2   已测试
//   12 *  备    注：
//   13 *************************************************************************/
//   14 
//   15 
//   16 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17   GPIO_InitTypeDef InitGPIOKEY1; 
InitGPIOKEY1:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   18   GPIO_InitTypeDef InitGPIOKEY2;
InitGPIOKEY2:
        DS8 20
//   19 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   20 void Keyboard_init()                                               // KEY初始化 函数
//   21 {
Keyboard_init:
        PUSH     {R7,LR}
//   22      InitGPIOkey_O();
        BL       InitGPIOkey_O
//   23      InitGPIOkey_I();
        BL       InitGPIOkey_I
//   24 } 
        POP      {R0,PC}          ;; return
//   25 
//   26 
//   27 /*************************************************************************
//   28 *                             嘉庚学院智能车队
//   29 *
//   30 *  函数名称：key_scan
//   31 *  功能说明:扫描按键的情况
//   32 *  参数说明：无
//   33 *  函数返回：被按下的按键键值,不支持两键同时按下
//   34 *  修改时间：2015-10-2   已测试
//   35 *  备    注：
//   36 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   37 uint8 key_scan()
//   38 {
key_scan:
        PUSH     {R3-R5,LR}
//   39 
//   40     uint8 KeyValue =0;//默认没有按键按下
        MOVS     R4,#+0
//   41     int i = 0;//初始扫描的端口
        MOVS     R5,#+0
//   42 //    for(i=11;i<=13;i++)
//   43 //    {
//   44 //      LPLD_GPIO_Output_b(PTC, i, 1);//设置输出高电平
//   45 //      
//   46 //      if(LPLD_GPIO_Input_b(PTC, 14)==1)//表示第一列有按键按下
//   47 //      {
//   48 //        keyValue = 1+(i-11)*3;
//   49 //       while(LPLD_GPIO_Input_b(PTC, 14)==1);//等待按键放开
//   50 //      }
//   51 //      
//   52 //      else if(LPLD_GPIO_Input_b(PTC, 15)==1)//表示第二列有按键按下
//   53 //      {
//   54 //        keyValue = 2+(i-11)*3;
//   55 //        while(LPLD_GPIO_Input_b(PTC, 15)==1);//等待按键放开
//   56 //      }
//   57 //      
//   58 //      else if(LPLD_GPIO_Input_b(PTC, 16)==1)//表示第三列有按键按下
//   59 //      {
//   60 //        keyValue = 3+(i-11)*3;
//   61 //        while(LPLD_GPIO_Input_b(PTC, 16)==1);//等待按键放开
//   62 //      } 
//   63 //     LPLD_GPIO_Output_b(PTC, i, 0);//恢复低电平
//   64 //    }//逐行扫描
//   65     
//   66     for(i = 3;i <= 5;i++)
        MOVS     R5,#+3
        B.N      ??key_scan_0
//   67     {
//   68       LPLD_GPIO_Output_b(PTC, i, 1);//设置输出高电平
//   69       
//   70       if(LPLD_GPIO_Input_b(PTC, 6) == 1)//表示第一列有按键按下
//   71       {
//   72         KeyValue = 1 + (i - 3) * 3;
//   73         while(LPLD_GPIO_Input_b(PTC, 6) == 1);//等待按键放开
//   74       }
//   75       
//   76       else if(LPLD_GPIO_Input_b(PTC, 7) == 1)//表示第二列有按键按下
//   77       {
//   78         KeyValue = 2 + (i - 3) * 3;
//   79         while(LPLD_GPIO_Input_b(PTC, 7) == 1);//等待按键放开
//   80       }
//   81       
//   82       else if(LPLD_GPIO_Input_b(PTC, 8) == 1)//表示第三列有按键按下
??key_scan_1:
        MOVS     R1,#+8
        LDR.N    R0,??DataTable2  ;; 0x400ff080
        BL       LPLD_GPIO_Input_b
        CMP      R0,#+1
        BNE.N    ??key_scan_2
//   83       {
//   84         KeyValue = 3 + (i - 3) * 3;
        MOVS     R0,#+3
        MUL      R0,R0,R5
        SUBS     R4,R0,#+6
//   85         while(LPLD_GPIO_Input_b(PTC, 8) == 1);//等待按键放开
??key_scan_3:
        MOVS     R1,#+8
        LDR.N    R0,??DataTable2  ;; 0x400ff080
        BL       LPLD_GPIO_Input_b
        CMP      R0,#+1
        BEQ.N    ??key_scan_3
//   86       }
//   87       LPLD_GPIO_Output_b(PTC, i, 0);//恢复低电平
??key_scan_2:
        MOVS     R2,#+0
        MOVS     R1,R5
        LDR.N    R0,??DataTable2  ;; 0x400ff080
        BL       LPLD_GPIO_Output_b
        ADDS     R5,R5,#+1
??key_scan_0:
        CMP      R5,#+6
        BGE.N    ??key_scan_4
        MOVS     R2,#+1
        MOVS     R1,R5
        LDR.N    R0,??DataTable2  ;; 0x400ff080
        BL       LPLD_GPIO_Output_b
        MOVS     R1,#+6
        LDR.N    R0,??DataTable2  ;; 0x400ff080
        BL       LPLD_GPIO_Input_b
        CMP      R0,#+1
        BNE.N    ??key_scan_5
        MOVS     R0,#+3
        MUL      R0,R0,R5
        SUBS     R4,R0,#+8
??key_scan_6:
        MOVS     R1,#+6
        LDR.N    R0,??DataTable2  ;; 0x400ff080
        BL       LPLD_GPIO_Input_b
        CMP      R0,#+1
        BNE.N    ??key_scan_2
        B.N      ??key_scan_6
??key_scan_5:
        MOVS     R1,#+7
        LDR.N    R0,??DataTable2  ;; 0x400ff080
        BL       LPLD_GPIO_Input_b
        CMP      R0,#+1
        BNE.N    ??key_scan_1
        MOVS     R0,#+3
        MUL      R0,R0,R5
        SUBS     R4,R0,#+7
??key_scan_7:
        MOVS     R1,#+7
        LDR.N    R0,??DataTable2  ;; 0x400ff080
        BL       LPLD_GPIO_Input_b
        CMP      R0,#+1
        BNE.N    ??key_scan_2
        B.N      ??key_scan_7
//   88     }//逐行扫描
//   89     return KeyValue;
??key_scan_4:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
//   90 }
//   91 
//   92 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   93 void InitGPIOkey_O()
//   94 {
InitGPIOkey_O:
        PUSH     {R7,LR}
//   95   /*配置结构体的GPIO_PTx变量，选择使用PTD组的PTE引脚
//   96    *配置结构体的GPIO_Pins变量，选择使用编号为E0 -- E6的引脚
//   97    *配置结构体的GPIO_Dir变量，设置PTD的相关引脚方向为输出
//   98    *配置结构体的GPIO_Output变量，设置PTD的相关引脚初始化输出为高电平
//   99    *配置结构体的GPIO_PinControl变量，配置端口的控制模式为禁止中断
//  100    *调用GPIO初始化的库函数，并将初始化结构体变量传入其中，完成初始化*/
//  101 
//  102 //  InitGPIOKEY1.GPIO_PTx = PTC;
//  103 //  InitGPIOKEY1.GPIO_Pins = GPIO_Pin11 | GPIO_Pin12 | GPIO_Pin13;
//  104 //  InitGPIOKEY1.GPIO_Dir = DIR_OUTPUT;
//  105 //  InitGPIOKEY1.GPIO_Output = OUTPUT_L;
//  106 //  InitGPIOKEY1.GPIO_PinControl = IRQC_DIS;
//  107 //  LPLD_GPIO_Init(InitGPIOKEY1);
//  108   
//  109   
//  110   InitGPIOKEY1.GPIO_PTx = PTC;
        LDR.N    R0,??DataTable2  ;; 0x400ff080
        LDR.N    R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  111   InitGPIOKEY1.GPIO_Pins = GPIO_Pin3 | GPIO_Pin4 | GPIO_Pin5;
        MOVS     R0,#+56
        LDR.N    R1,??DataTable2_1
        STR      R0,[R1, #+4]
//  112   InitGPIOKEY1.GPIO_Dir = DIR_OUTPUT;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_1
        STRB     R0,[R1, #+12]
//  113   InitGPIOKEY1.GPIO_Output = OUTPUT_L;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_1
        STRB     R0,[R1, #+13]
//  114   InitGPIOKEY1.GPIO_PinControl = IRQC_DIS;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_1
        STR      R0,[R1, #+8]
//  115   LPLD_GPIO_Init(InitGPIOKEY1);
        LDR.N    R1,??DataTable2_1
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  116 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  117 void InitGPIOkey_I()
//  118 {
InitGPIOkey_I:
        PUSH     {R7,LR}
//  119   /*配置结构体的GPIO_PTx变量，选择使用PTD组的PTE引脚
//  120    *配置结构体的GPIO_Pins变量，选择使用编号为E0 -- E6的引脚
//  121    *配置结构体的GPIO_Dir变量，设置PTD的相关引脚方向为输入
//  122    *配置结构体的GPIO_PinControl变量，配置端口的控制模式为禁止中断
//  123    *调用GPIO初始化的库函数，并将初始化结构体变量传入其中，完成初始化*/
//  124 //  InitGPIOKEY2.GPIO_PTx = PTC;
//  125 //  InitGPIOKEY2.GPIO_Pins =GPIO_Pin14 | GPIO_Pin15 | GPIO_Pin16;
//  126 //  InitGPIOKEY2.GPIO_Dir = DIR_INPUT;
//  127 //  InitGPIOKEY2.GPIO_PinControl = INPUT_PULL_DOWN;
//  128 //  LPLD_GPIO_Init(InitGPIOKEY2);
//  129   
//  130   InitGPIOKEY2.GPIO_PTx = PTC;
        LDR.N    R0,??DataTable2  ;; 0x400ff080
        LDR.N    R1,??DataTable2_2
        STR      R0,[R1, #+0]
//  131   InitGPIOKEY2.GPIO_Pins =GPIO_Pin6 | GPIO_Pin7 | GPIO_Pin8;
        MOV      R0,#+448
        LDR.N    R1,??DataTable2_2
        STR      R0,[R1, #+4]
//  132   
//  133   InitGPIOKEY2.GPIO_Dir = DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_2
        STRB     R0,[R1, #+12]
//  134   InitGPIOKEY2.GPIO_PinControl = INPUT_PULL_DOWN;
        MOVS     R0,#+2
        LDR.N    R1,??DataTable2_2
        STR      R0,[R1, #+8]
//  135   LPLD_GPIO_Init(InitGPIOKEY2);
        LDR.N    R1,??DataTable2_2
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  136 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     InitGPIOKEY1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     InitGPIOKEY2

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  137 
// 
//  40 bytes in section .bss
// 268 bytes in section .text
// 
// 268 bytes of CODE memory
//  40 bytes of DATA memory
//
//Errors: none
//Warnings: none
