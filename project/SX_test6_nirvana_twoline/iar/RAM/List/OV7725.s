///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       22/Dec/2015  18:54:50
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\app\OV7725.c
//    Command line =  
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\app\OV7725.c
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
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\RAM\List\OV7725.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Img
        EXTERN LPLD_DMA_EnableIrq
        EXTERN LPLD_DMA_Init
        EXTERN LPLD_GPIO_Init
        EXTERN Pix_Data
        EXTERN SCCB_GPIO_init
        EXTERN SCCB_WriteByte
        EXTERN __aeabi_memcpy4
        EXTERN steering_control

        PUBLIC DMA_init
        PUBLIC DMA_init_struct
        PUBLIC DMA_isr
        PUBLIC IO_init
        PUBLIC IO_init_struct
        PUBLIC PCLK_init
        PUBLIC PCLK_init_struct
        PUBLIC VSY_init
        PUBLIC VSY_init_struct
        PUBLIC VSY_isr
        PUBLIC delay
        PUBLIC get_img
        PUBLIC img_extract
        PUBLIC ov7725_eagle_img_flag
        PUBLIC ov7725_init

// C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\app\OV7725.c
//    1 #include "include.h"

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_EnableIRQ(IRQn_Type)
NVIC_EnableIRQ:
        MOVS     R1,#+1
        ANDS     R2,R0,#0x1F
        LSLS     R1,R1,R2
        LDR.W    R2,??DataTable9  ;; 0xe000e100
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        STR      R1,[R2, R0, LSL #+2]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_DisableIRQ(IRQn_Type)
NVIC_DisableIRQ:
        MOVS     R1,#+1
        ANDS     R2,R0,#0x1F
        LSLS     R1,R1,R2
        LDR.W    R2,??DataTable9_1  ;; 0xe000e180
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        STR      R1,[R2, R0, LSL #+2]
        BX       LR               ;; return
//    2 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//    3 volatile IMG_STATUS_e      ov7725_eagle_img_flag = IMG_FINISH;   //图像状态
ov7725_eagle_img_flag:
        DATA
        DC8 1
//    4 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    5 GPIO_InitTypeDef IO_init_struct;
IO_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    6 GPIO_InitTypeDef VSY_init_struct;
VSY_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    7 GPIO_InitTypeDef PCLK_init_struct;
PCLK_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    8 DMA_InitTypeDef DMA_init_struct;
DMA_init_struct:
        DS8 44
//    9 
//   10 
//   11 //场中断函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   12 void VSY_isr()
//   13 { 
VSY_isr:
        PUSH     {LR}
        SUB      SP,SP,#+28
//   14   uint8  n = 0;    //引脚号
        MOVS     R0,#+0
//   15   uint32 flag = (PORTC->ISFR);
        LDR.W    R1,??DataTable9_2  ;; 0x4004b0a0
        LDR      R1,[R1, #+0]
//   16   LPLD_GPIO_ClearIntFlag(PORTC);                  //清中断标志位
        MOVS     R2,#-1
        LDR.W    R3,??DataTable9_2  ;; 0x4004b0a0
        STR      R2,[R3, #+0]
//   17   n = 17;                                         //场中断
        MOVS     R2,#+17
        MOVS     R0,R2
//   18   if(flag & (1 << n))  
        LSRS     R0,R1,R0
        LSLS     R0,R0,#+31
        BPL.N    ??VSY_isr_0
//   19   {
//   20     
//   21     //场中断需要判断是场结束还是场开始
//   22     if(ov7725_eagle_img_flag == IMG_START)        //需要开始采集图像
        LDR.W    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+4
        BNE.N    ??VSY_isr_1
//   23     {
//   24       ov7725_eagle_img_flag = IMG_GATHER;         //标记图像采集中
        MOVS     R0,#+3
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+0]
//   25       disable_irq(PORTC_IRQn);
        MOVS     R0,#+89
        BL       NVIC_DisableIRQ
//   26       
//   27       PORTC->ISFR = 1 << 17;                      //清空PCLK标志位              
        MOVS     R0,#+131072
        LDR.W    R1,??DataTable9_2  ;; 0x4004b0a0
        STR      R0,[R1, #+0]
//   28       LPLD_DMA_LoadDstAddr(DMA_CH0, Pix_Data);    //恢复地址
        LDR.W    R0,??DataTable9_4
        LDR.W    R1,??DataTable9_5  ;; 0x40009010
        STR      R0,[R1, #+0]
//   29       LPLD_DMA_EnableReq(DMA_CH0);                //使能通道CHn 硬件请求
        LDR.W    R0,??DataTable9_6  ;; 0x4000800c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_6  ;; 0x4000800c
        STR      R0,[R1, #+0]
//   30       LPLD_DMA_EnableIrq(DMA_init_struct);        //开DMA结束中断
        LDR.W    R1,??DataTable9_7
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+44
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_DMA_EnableIrq
        B.N      ??VSY_isr_0
//   31     }
//   32     else                                         //图像采集错误
//   33     {
//   34       disable_irq(PORTC_IRQn);                    //关闭PTA的中断
??VSY_isr_1:
        MOVS     R0,#+89
        BL       NVIC_DisableIRQ
//   35       ov7725_eagle_img_flag = IMG_FAIL;           //标记图像采集失败
        MOVS     R0,#+2
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+0]
//   36     }
//   37   }
//   38 }
??VSY_isr_0:
        ADD      SP,SP,#+28
        POP      {PC}             ;; return
//   39 
//   40 
//   41 //DMA结束中断函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   42 void DMA_isr()
//   43 {
DMA_isr:
        PUSH     {R7,LR}
//   44   ov7725_eagle_img_flag = IMG_FINISH ;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+0]
//   45   DMA0->INT |= 0x1u<<0;
        LDR.W    R0,??DataTable9_8  ;; 0x40008024
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_8  ;; 0x40008024
        STR      R0,[R1, #+0]
//   46   img_extract(*Img,(unsigned char*)Pix_Data,600);
        MOV      R2,#+600
        LDR.N    R1,??DataTable9_4
        LDR.W    R0,??DataTable9_9
        BL       img_extract
//   47   
//   48   
//   49   steering_control();
        BL       steering_control
//   50   
//   51 }
        POP      {R0,PC}          ;; return
//   52 
//   53 
//   54 //采集函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   55 void get_img()
//   56 {
get_img:
        PUSH     {R7,LR}
//   57   ov7725_eagle_img_flag = IMG_START;               //开始采集图像
        MOVS     R0,#+4
        LDR.N    R1,??DataTable9_3
        STRB     R0,[R1, #+0]
//   58   LPLD_GPIO_ClearIntFlag(PORTC);                   //写1清中断标志位(必须的，不然回导致一开中断就马上触发中断)
        MOVS     R0,#-1
        LDR.N    R1,??DataTable9_2  ;; 0x4004b0a0
        STR      R0,[R1, #+0]
//   59   enable_irq(PORTC_IRQn);                          //允许PTC的中断
        MOVS     R0,#+89
        BL       NVIC_EnableIRQ
        B.N      ??get_img_0
//   60   while(ov7725_eagle_img_flag != IMG_FINISH)      //等待图像采集完毕
//   61   {
//   62     if(ov7725_eagle_img_flag == IMG_FAIL)         //假如图像采集错误，则重新开始采集
??get_img_1:
        LDR.N    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??get_img_0
//   63     {
//   64       ov7725_eagle_img_flag = IMG_START;          //开始采集图像
        MOVS     R0,#+4
        LDR.N    R1,??DataTable9_3
        STRB     R0,[R1, #+0]
//   65       LPLD_GPIO_ClearIntFlag(PORTC);              //写1清中断标志位(必须的，不然回导致一开中断就马上触发中断)
        MOVS     R0,#-1
        LDR.N    R1,??DataTable9_2  ;; 0x4004b0a0
        STR      R0,[R1, #+0]
//   66       enable_irq(PORTC_IRQn);                     //允许PTA的中断
        MOVS     R0,#+89
        BL       NVIC_EnableIRQ
//   67     }
//   68   }
??get_img_0:
        LDR.N    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??get_img_1
//   69 }
        POP      {R0,PC}          ;; return
//   70 
//   71 
//   72 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   73 void IO_init()
//   74 {
IO_init:
        PUSH     {R7,LR}
//   75   //OV数据口初始化：PTD0~PTD7
//   76   IO_init_struct.GPIO_PTx = PTD;
        LDR.N    R0,??DataTable9_10  ;; 0x400ff0c0
        LDR.N    R1,??DataTable9_11
        STR      R0,[R1, #+0]
//   77   IO_init_struct.GPIO_Dir = DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable9_11
        STRB     R0,[R1, #+12]
//   78   IO_init_struct.GPIO_Pins = GPIO_Pin0_7;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable9_11
        STR      R0,[R1, #+4]
//   79   IO_init_struct.GPIO_PinControl = IRQC_DIS | INPUT_PULL_DIS;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable9_11
        STR      R0,[R1, #+8]
//   80   LPLD_GPIO_Init(IO_init_struct);
        LDR.N    R1,??DataTable9_11
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   81 }
        POP      {R0,PC}          ;; return
//   82 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   83 void VSY_init()
//   84 {
VSY_init:
        PUSH     {R7,LR}
//   85   VSY_init_struct.GPIO_PTx = PTC;
        LDR.N    R0,??DataTable9_12  ;; 0x400ff080
        LDR.N    R1,??DataTable9_13
        STR      R0,[R1, #+0]
//   86   VSY_init_struct.GPIO_Dir = DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable9_13
        STRB     R0,[R1, #+12]
//   87   VSY_init_struct.GPIO_Pins = GPIO_Pin18;
        MOVS     R0,#+262144
        LDR.N    R1,??DataTable9_13
        STR      R0,[R1, #+4]
//   88   VSY_init_struct.GPIO_PinControl = IRQC_RI|INPUT_PULL_UP|INPUT_PF_EN;
        LDR.N    R0,??DataTable9_14  ;; 0x90013
        LDR.N    R1,??DataTable9_13
        STR      R0,[R1, #+8]
//   89   VSY_init_struct.GPIO_Isr = VSY_isr;
        LDR.N    R0,??DataTable9_15
        LDR.N    R1,??DataTable9_13
        STR      R0,[R1, #+16]
//   90   LPLD_GPIO_Init(VSY_init_struct); 
        LDR.N    R1,??DataTable9_13
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   91 }
        POP      {R0,PC}          ;; return
//   92 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   93 void PCLK_init()
//   94 {
PCLK_init:
        PUSH     {R7,LR}
//   95   PCLK_init_struct.GPIO_PTx = PTC;
        LDR.N    R0,??DataTable9_12  ;; 0x400ff080
        LDR.N    R1,??DataTable9_16
        STR      R0,[R1, #+0]
//   96   PCLK_init_struct.GPIO_Pins = GPIO_Pin17;
        MOVS     R0,#+131072
        LDR.N    R1,??DataTable9_16
        STR      R0,[R1, #+4]
//   97   PCLK_init_struct.GPIO_Dir = DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable9_16
        STRB     R0,[R1, #+12]
//   98   PCLK_init_struct.GPIO_PinControl = IRQC_DMAFA | INPUT_PULL_UP;
        LDR.N    R0,??DataTable9_17  ;; 0x20003
        LDR.N    R1,??DataTable9_16
        STR      R0,[R1, #+8]
//   99   LPLD_GPIO_Init(PCLK_init_struct); 
        LDR.N    R1,??DataTable9_16
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  100 }
        POP      {R0,PC}          ;; return
//  101 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  102 void DMA_init()
//  103 {
DMA_init:
        PUSH     {LR}
        SUB      SP,SP,#+28
//  104   //DMA参数配置
//  105   DMA_init_struct.DMA_CHx = DMA_CH0;        //CH0通道
        MOVS     R0,#+0
        LDR.N    R1,??DataTable9_7
        STRB     R0,[R1, #+0]
//  106   DMA_init_struct.DMA_Req = PORTC_DMAREQ;   //PORTC为请求源
        MOVS     R0,#+51
        LDR.N    R1,??DataTable9_7
        STRB     R0,[R1, #+1]
//  107   DMA_init_struct.DMA_MajorLoopCnt = 600;   //主循环计数值：采集数
        MOV      R0,#+600
        LDR.N    R1,??DataTable9_7
        STRH     R0,[R1, #+4]
//  108   DMA_init_struct.DMA_MinorByteCnt = 1;     //次循环字节计数：每次读入1字节
        MOVS     R0,#+1
        LDR.N    R1,??DataTable9_7
        STR      R0,[R1, #+8]
//  109   DMA_init_struct.DMA_SourceAddr = (uint32_t)&PTD->PDIR;//源地址：PTD0~7
        LDR.N    R0,??DataTable9_18  ;; 0x400ff0d0
        LDR.N    R1,??DataTable9_7
        STR      R0,[R1, #+12]
//  110   DMA_init_struct.DMA_DestAddr = (uint32)Pix_Data;      //目的地址：存放图像的数组
        LDR.N    R0,??DataTable9_4
        LDR.N    R1,??DataTable9_7
        STR      R0,[R1, #+24]
//  111   DMA_init_struct.DMA_DestAddrOffset = 1;   //目的地址偏移：每次读入增加1
        MOVS     R0,#+1
        LDR.N    R1,??DataTable9_7
        STRH     R0,[R1, #+30]
//  112   DMA_init_struct.DMA_MajorCompleteIntEnable = TRUE;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable9_7
        STRB     R0,[R1, #+37]
//  113   DMA_init_struct.DMA_Isr = DMA_isr;
        LDR.N    R0,??DataTable9_19
        LDR.N    R1,??DataTable9_7
        STR      R0,[R1, #+40]
//  114   DMA_init_struct.DMA_AutoDisableReq = TRUE;//自动禁用请求
        MOVS     R0,#+1
        LDR.N    R1,??DataTable9_7
        STRB     R0,[R1, #+36]
//  115   //初始化DMA
//  116   LPLD_DMA_Init(DMA_init_struct);
        LDR.N    R1,??DataTable9_7
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+44
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_DMA_Init
//  117 }
        ADD      SP,SP,#+28
        POP      {PC}             ;; return
//  118 
//  119 //ov7725初始化函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  120 void ov7725_init(void)
//  121 {
ov7725_init:
        PUSH     {R7,LR}
//  122   SCCB_GPIO_init();
        BL       SCCB_GPIO_init
//  123   delay();
        BL       delay
//  124   SCCB_WriteByte(OV7725_COM7,0x80);//复位
        MOVS     R1,#+128
        MOVS     R0,#+18
        BL       SCCB_WriteByte
//  125   delay();
        BL       delay
//  126   SCCB_WriteByte(OV7725_COM4,0x81); //150帧:0xC1,112帧:0x81,75帧:0x41,50帧:0xC1
        MOVS     R1,#+129
        MOVS     R0,#+13
        BL       SCCB_WriteByte
//  127   SCCB_WriteByte(OV7725_CLKRC,0x00);//150帧:0x00,112帧:0x00,75帧:0x00,50帧:0x02
        MOVS     R1,#+0
        MOVS     R0,#+17
        BL       SCCB_WriteByte
//  128   SCCB_WriteByte(OV7725_COM2,0x03);
        MOVS     R1,#+3
        MOVS     R0,#+9
        BL       SCCB_WriteByte
//  129   SCCB_WriteByte(OV7725_COM3,0xD0);//50
        MOVS     R1,#+208
        MOVS     R0,#+12
        BL       SCCB_WriteByte
//  130   SCCB_WriteByte(OV7725_COM7,0x40);
        MOVS     R1,#+64
        MOVS     R0,#+18
        BL       SCCB_WriteByte
//  131   SCCB_WriteByte(OV7725_HSTART,0x3F);
        MOVS     R1,#+63
        MOVS     R0,#+23
        BL       SCCB_WriteByte
//  132   SCCB_WriteByte(OV7725_HSIZE,0x50);
        MOVS     R1,#+80
        MOVS     R0,#+24
        BL       SCCB_WriteByte
//  133   SCCB_WriteByte(OV7725_VSTRT,0x03);
        MOVS     R1,#+3
        MOVS     R0,#+25
        BL       SCCB_WriteByte
//  134   SCCB_WriteByte(OV7725_VSIZE,0x78);
        MOVS     R1,#+120
        MOVS     R0,#+26
        BL       SCCB_WriteByte
//  135   SCCB_WriteByte(OV7725_HREF,0x00);
        MOVS     R1,#+0
        MOVS     R0,#+50
        BL       SCCB_WriteByte
//  136   SCCB_WriteByte(OV7725_SCAL0,0x0A);
        MOVS     R1,#+10
        MOVS     R0,#+160
        BL       SCCB_WriteByte
//  137   SCCB_WriteByte(OV7725_AWB_Ctrl0,0xE0);
        MOVS     R1,#+224
        MOVS     R0,#+99
        BL       SCCB_WriteByte
//  138   SCCB_WriteByte(OV7725_DSPAuto,0xff);
        MOVS     R1,#+255
        MOVS     R0,#+172
        BL       SCCB_WriteByte
//  139   SCCB_WriteByte(OV7725_DSP_Ctrl2,0x0C);
        MOVS     R1,#+12
        MOVS     R0,#+101
        BL       SCCB_WriteByte
//  140   SCCB_WriteByte(OV7725_DSP_Ctrl3,0x00);
        MOVS     R1,#+0
        MOVS     R0,#+102
        BL       SCCB_WriteByte
//  141   SCCB_WriteByte(OV7725_DSP_Ctrl4,0x00);
        MOVS     R1,#+0
        MOVS     R0,#+103
        BL       SCCB_WriteByte
//  142   SCCB_WriteByte(OV7725_HOutSize,0x14);//80
        MOVS     R1,#+20
        MOVS     R0,#+41
        BL       SCCB_WriteByte
//  143   SCCB_WriteByte(OV7725_VOutSize,0x1E);//60 
        MOVS     R1,#+30
        MOVS     R0,#+44
        BL       SCCB_WriteByte
//  144   SCCB_WriteByte(OV7725_EXHCH,0x00);
        MOVS     R1,#+0
        MOVS     R0,#+42
        BL       SCCB_WriteByte
//  145   SCCB_WriteByte(OV7725_GAM1,0x0c);
        MOVS     R1,#+12
        MOVS     R0,#+126
        BL       SCCB_WriteByte
//  146   SCCB_WriteByte(OV7725_GAM2,0x16);
        MOVS     R1,#+22
        MOVS     R0,#+127
        BL       SCCB_WriteByte
//  147   SCCB_WriteByte(OV7725_GAM3,0x2a);
        MOVS     R1,#+42
        MOVS     R0,#+128
        BL       SCCB_WriteByte
//  148   SCCB_WriteByte(OV7725_GAM4,0x4e);
        MOVS     R1,#+78
        MOVS     R0,#+129
        BL       SCCB_WriteByte
//  149   SCCB_WriteByte(OV7725_GAM5,0x61);
        MOVS     R1,#+97
        MOVS     R0,#+130
        BL       SCCB_WriteByte
//  150   SCCB_WriteByte(OV7725_GAM6,0x6f);
        MOVS     R1,#+111
        MOVS     R0,#+131
        BL       SCCB_WriteByte
//  151   SCCB_WriteByte(OV7725_GAM7,0x7b);
        MOVS     R1,#+123
        MOVS     R0,#+132
        BL       SCCB_WriteByte
//  152   SCCB_WriteByte(OV7725_GAM8,0x86);
        MOVS     R1,#+134
        MOVS     R0,#+133
        BL       SCCB_WriteByte
//  153   SCCB_WriteByte(OV7725_GAM9,0x8e);
        MOVS     R1,#+142
        MOVS     R0,#+134
        BL       SCCB_WriteByte
//  154   SCCB_WriteByte(OV7725_GAM10,0x97);
        MOVS     R1,#+151
        MOVS     R0,#+135
        BL       SCCB_WriteByte
//  155   SCCB_WriteByte(OV7725_GAM11,0xa4);
        MOVS     R1,#+164
        MOVS     R0,#+136
        BL       SCCB_WriteByte
//  156   SCCB_WriteByte(OV7725_GAM12,0xaf);
        MOVS     R1,#+175
        MOVS     R0,#+137
        BL       SCCB_WriteByte
//  157   SCCB_WriteByte(OV7725_GAM13,0xc5);
        MOVS     R1,#+197
        MOVS     R0,#+138
        BL       SCCB_WriteByte
//  158   SCCB_WriteByte(OV7725_GAM14,0xd7);
        MOVS     R1,#+215
        MOVS     R0,#+139
        BL       SCCB_WriteByte
//  159   SCCB_WriteByte(OV7725_GAM15,0xe8);
        MOVS     R1,#+232
        MOVS     R0,#+140
        BL       SCCB_WriteByte
//  160   SCCB_WriteByte(OV7725_SLOP,0x20);
        MOVS     R1,#+32
        MOVS     R0,#+141
        BL       SCCB_WriteByte
//  161   SCCB_WriteByte(OV7725_LC_RADI,0x00);
        MOVS     R1,#+0
        MOVS     R0,#+74
        BL       SCCB_WriteByte
//  162   SCCB_WriteByte(OV7725_LC_COEF,0x13);
        MOVS     R1,#+19
        MOVS     R0,#+73
        BL       SCCB_WriteByte
//  163   SCCB_WriteByte(OV7725_LC_XC,0x08);
        MOVS     R1,#+8
        MOVS     R0,#+71
        BL       SCCB_WriteByte
//  164   SCCB_WriteByte(OV7725_LC_COEFB,0x14);
        MOVS     R1,#+20
        MOVS     R0,#+75
        BL       SCCB_WriteByte
//  165   SCCB_WriteByte(OV7725_LC_COEFR,0x17);
        MOVS     R1,#+23
        MOVS     R0,#+76
        BL       SCCB_WriteByte
//  166   SCCB_WriteByte(OV7725_LC_CTR,0x05);
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       SCCB_WriteByte
//  167   SCCB_WriteByte(OV7725_BDBase,0x99);
        MOVS     R1,#+153
        MOVS     R0,#+34
        BL       SCCB_WriteByte
//  168   SCCB_WriteByte(OV7725_BDMStep,0x03);
        MOVS     R1,#+3
        MOVS     R0,#+35
        BL       SCCB_WriteByte
//  169   SCCB_WriteByte(OV7725_SDE,0x04);
        MOVS     R1,#+4
        MOVS     R0,#+166
        BL       SCCB_WriteByte
//  170   SCCB_WriteByte(OV7725_BRIGHT,0x8a); //亮度值补偿
        MOVS     R1,#+138
        MOVS     R0,#+155
        BL       SCCB_WriteByte
//  171   SCCB_WriteByte(OV7725_CNST,0xA0);//阈值调整(0~255)//0xA0
        MOVS     R1,#+160
        MOVS     R0,#+156
        BL       SCCB_WriteByte
//  172   SCCB_WriteByte(OV7725_SIGN,0x0E);//0x06  BRIGHT为正       0x0E    BRIGHT为负
        MOVS     R1,#+14
        MOVS     R0,#+171
        BL       SCCB_WriteByte
//  173   SCCB_WriteByte(OV7725_UVADJ0,0x11);
        MOVS     R1,#+17
        MOVS     R0,#+158
        BL       SCCB_WriteByte
//  174   SCCB_WriteByte(OV7725_UVADJ1,0x02);
        MOVS     R1,#+2
        MOVS     R0,#+159
        BL       SCCB_WriteByte
//  175 }
        POP      {R0,PC}          ;; return
//  176 
//  177 
//  178 /*!
//  179  *  @brief      二值化图像解压（空间 换 时间 解压）
//  180  *  @param      dst             图像解压目的地址
//  181  *  @param      src             图像解压源地址
//  182  *  @param      srclen          二值化图像的占用空间大小
//  183  *  @since      v5.0            img_extract(img, imgbuff,CAMERA_SIZE);
//  184  *  Sample usage:
//  185  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  186 void img_extract(uint8 *dst, uint8 *src, uint32 srclen)
//  187 {
img_extract:
        PUSH     {R3-R5}
//  188     uint8 colour[2] = {255, 0}; //0 和 1 分别对应的颜色
        LDR.N    R3,??DataTable9_20
        LDRH     R3,[R3, #+0]
        STRH     R3,[SP, #+0]
        B.N      ??img_extract_0
//  189     //注： 0 表示 白色，1表示 黑色
//  190     uint8 tmpsrc;
//  191     while(srclen --)
//  192     {
//  193         tmpsrc = *src++;
??img_extract_1:
        LDRB     R3,[R1, #+0]
        ADDS     R1,R1,#+1
//  194         *dst++ = colour[ (tmpsrc >> 7 ) & 0x01 ];
        ADD      R4,SP,#+0
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ASRS     R5,R3,#+7
        LDRB     R4,[R5, R4]
        STRB     R4,[R0, #+0]
        ADDS     R0,R0,#+1
//  195         *dst++ = colour[ (tmpsrc >> 6 ) & 0x01 ];
        ADD      R4,SP,#+0
        UBFX     R5,R3,#+6,#+1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R4,[R5, R4]
        STRB     R4,[R0, #+0]
        ADDS     R0,R0,#+1
//  196         *dst++ = colour[ (tmpsrc >> 5 ) & 0x01 ];
        ADD      R4,SP,#+0
        UBFX     R5,R3,#+5,#+1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R4,[R5, R4]
        STRB     R4,[R0, #+0]
        ADDS     R0,R0,#+1
//  197         *dst++ = colour[ (tmpsrc >> 4 ) & 0x01 ];
        ADD      R4,SP,#+0
        UBFX     R5,R3,#+4,#+1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R4,[R5, R4]
        STRB     R4,[R0, #+0]
        ADDS     R0,R0,#+1
//  198         *dst++ = colour[ (tmpsrc >> 3 ) & 0x01 ];
        ADD      R4,SP,#+0
        UBFX     R5,R3,#+3,#+1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R4,[R5, R4]
        STRB     R4,[R0, #+0]
        ADDS     R0,R0,#+1
//  199         *dst++ = colour[ (tmpsrc >> 2 ) & 0x01 ];
        ADD      R4,SP,#+0
        UBFX     R5,R3,#+2,#+1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R4,[R5, R4]
        STRB     R4,[R0, #+0]
        ADDS     R0,R0,#+1
//  200         *dst++ = colour[ (tmpsrc >> 1 ) & 0x01 ];
        ADD      R4,SP,#+0
        UBFX     R5,R3,#+1,#+1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R4,[R5, R4]
        STRB     R4,[R0, #+0]
        ADDS     R0,R0,#+1
//  201         *dst++ = colour[ (tmpsrc >> 0 ) & 0x01 ];
        ADD      R4,SP,#+0
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ANDS     R3,R3,#0x1
        LDRB     R3,[R3, R4]
        STRB     R3,[R0, #+0]
        ADDS     R0,R0,#+1
//  202     }
??img_extract_0:
        MOVS     R3,R2
        SUBS     R2,R3,#+1
        CMP      R3,#+0
        BNE.N    ??img_extract_1
//  203 }
        POP      {R0,R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     0x4004b0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     ov7725_eagle_img_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     Pix_Data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_5:
        DC32     0x40009010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_6:
        DC32     0x4000800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_7:
        DC32     DMA_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_8:
        DC32     0x40008024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_9:
        DC32     Img

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_10:
        DC32     0x400ff0c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_11:
        DC32     IO_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_12:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_13:
        DC32     VSY_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_14:
        DC32     0x90013

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_15:
        DC32     VSY_isr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_16:
        DC32     PCLK_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_17:
        DC32     0x20003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_18:
        DC32     0x400ff0d0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_19:
        DC32     DMA_isr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_20:
        DC32     ?_0
//  204 
//  205 /*
//  206  * 延时一段时间
//  207  */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  208 void delay()
//  209 {
//  210   uint16 i, n;
//  211   for(i=0;i<20000;i++)
delay:
        MOVS     R0,#+0
        B.N      ??delay_0
//  212   {
//  213     for(n=0;n<100;n++)
//  214     {
//  215       asm("nop");
??delay_1:
        nop
//  216     }
        ADDS     R1,R1,#+1
??delay_2:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+100
        BLT.N    ??delay_1
        ADDS     R0,R0,#+1
??delay_0:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVW     R1,#+20000
        CMP      R0,R1
        BGE.N    ??delay_3
        MOVS     R1,#+0
        B.N      ??delay_2
//  217   }
//  218 }
??delay_3:
        BX       LR               ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
?_0:
        DATA
        DC8 255, 0

        END
// 
//   104 bytes in section .bss
//     1 byte  in section .data
//     2 bytes in section .rodata
// 1 196 bytes in section .text
// 
// 1 196 bytes of CODE  memory
//     2 bytes of CONST memory
//   105 bytes of DATA  memory
//
//Errors: none
//Warnings: none
