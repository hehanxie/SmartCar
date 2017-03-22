///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       22/Dec/2015  18:54:50
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\app\DEV_SCCB.c
//    Command line =  
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\app\DEV_SCCB.c
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
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\RAM\List\DEV_SCCB.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_GPIO_Init
        EXTERN __aeabi_memcpy4

        PUBLIC SCCB_GPIO_init
        PUBLIC SCCB_ReadByte
        PUBLIC SCCB_WriteByte

// C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\app\DEV_SCCB.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       VCAN_SCCB.c
//   11  * @brief      OV摄像头配置总线SCCB函数库
//   12  * @author     山外科技
//   13  * @version    v5.0
//   14  * @date       2013-09-01
//   15  */
//   16 
//   17 
//   18 #include "include.h"
//   19 
//   20 
//   21 static void SCCB_delay(uint16 i);
//   22 
//   23 /*!
//   24  *  @brief      SCCB延迟函数
//   25  *  @param      time    延时时间
//   26  *  @since      v5.0
//   27  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   28 static void SCCB_delay(volatile uint16 time)
//   29 {
SCCB_delay:
        PUSH     {R0}
        B.N      ??SCCB_delay_0
//   30     while(time)
//   31     {
//   32         time--;
??SCCB_delay_1:
        LDRH     R0,[SP, #+0]
        SUBS     R0,R0,#+1
        STRH     R0,[SP, #+0]
//   33     }
??SCCB_delay_0:
        LDRH     R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??SCCB_delay_1
//   34 }
        ADD      SP,SP,#+4
        BX       LR               ;; return
//   35 
//   36 /*!
//   37  *  @brief      SCCB管脚配置
//   38  *  @since      v5.0
//   39  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   40 void SCCB_GPIO_init(void)
//   41 {
SCCB_GPIO_init:
        PUSH     {LR}
        SUB      SP,SP,#+28
//   42   GPIO_InitTypeDef pta;
//   43   /********用户可修改值 开始***********/
//   44   pta.GPIO_PTx = PTA;
        LDR.N    R0,??DataTable7  ;; 0x400ff000
        STR      R0,[SP, #+4]
//   45   pta.GPIO_Pins = GPIO_Pin12 | GPIO_Pin13;
        MOV      R0,#+12288
        STR      R0,[SP, #+8]
//   46   /********用户可修改值 结束***********/
//   47   pta.GPIO_Dir = DIR_OUTPUT;
        MOVS     R0,#+1
        STRB     R0,[SP, #+16]
//   48   pta.GPIO_Output = OUTPUT_H;
        MOVS     R0,#+1
        STRB     R0,[SP, #+17]
//   49   pta.GPIO_PinControl = NULL;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//   50   LPLD_GPIO_Init(pta);
        ADD      R1,SP,#+4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   51 }
        ADD      SP,SP,#+28
        POP      {PC}             ;; return
//   52 
//   53 /*!
//   54  *  @brief      SCCB起始信号
//   55  *  @since      v5.0
//   56  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   57 static uint8 SCCB_Start(void)
//   58 {
SCCB_Start:
        PUSH     {R7,LR}
//   59     SDA_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_1  ;; 0x43fe0034
        STR      R0,[R1, #+0]
//   60     SCL_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//   61     SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//   62 
//   63     SDA_DDR_IN();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_3  ;; 0x43fe02b4
        STR      R0,[R1, #+0]
//   64     if(!SDA_IN())
        LDR.N    R0,??DataTable7_4  ;; 0x43fe0234
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SCCB_Start_0
//   65     {
//   66         SDA_DDR_OUT();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_3  ;; 0x43fe02b4
        STR      R0,[R1, #+0]
//   67         return 0;   /* SDA线为低电平则总线忙,退出 */
        MOVS     R0,#+0
        B.N      ??SCCB_Start_1
//   68     }
//   69     SDA_DDR_OUT();
??SCCB_Start_0:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_3  ;; 0x43fe02b4
        STR      R0,[R1, #+0]
//   70     SDA_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_1  ;; 0x43fe0034
        STR      R0,[R1, #+0]
//   71 
//   72     SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//   73     SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//   74 
//   75     if(SDA_IN())
        LDR.N    R0,??DataTable7_4  ;; 0x43fe0234
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SCCB_Start_2
//   76     {
//   77         SDA_DDR_OUT();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_3  ;; 0x43fe02b4
        STR      R0,[R1, #+0]
//   78         return 0;   /* SDA线为高电平则总线出错,退出 */
        MOVS     R0,#+0
        B.N      ??SCCB_Start_1
//   79     }
//   80     //SDA_DDR_OUT();
//   81     //SDA_L();
//   82     //SCCB_delay();
//   83     return 1;
??SCCB_Start_2:
        MOVS     R0,#+1
??SCCB_Start_1:
        POP      {R1,PC}          ;; return
//   84 }
//   85 
//   86 /*!
//   87  *  @brief      SCCB停止信号
//   88  *  @since      v5.0
//   89  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   90 static void SCCB_Stop(void)
//   91 {
SCCB_Stop:
        PUSH     {R7,LR}
//   92     SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//   93     //SCCB_DELAY();
//   94     SDA_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_1  ;; 0x43fe0034
        STR      R0,[R1, #+0]
//   95     SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//   96     SCL_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//   97     SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//   98     SDA_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_1  ;; 0x43fe0034
        STR      R0,[R1, #+0]
//   99     SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//  100 }
        POP      {R0,PC}          ;; return
//  101 
//  102 /*!
//  103  *  @brief      SCCB应答信号
//  104  *  @since      v5.0
//  105  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  106 static void SCCB_Ack(void)
//  107 {
SCCB_Ack:
        PUSH     {R7,LR}
//  108     SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  109     SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//  110     SDA_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_1  ;; 0x43fe0034
        STR      R0,[R1, #+0]
//  111     SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//  112     SCL_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  113     SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//  114     SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  115     SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//  116 }
        POP      {R0,PC}          ;; return
//  117 
//  118 /*!
//  119  *  @brief      SCCB无应答信号
//  120  *  @since      v5.0
//  121  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  122 static void SCCB_NoAck(void)
//  123 {
SCCB_NoAck:
        PUSH     {R7,LR}
//  124     SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  125     SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//  126     SDA_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_1  ;; 0x43fe0034
        STR      R0,[R1, #+0]
//  127     SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//  128     SCL_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  129     SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//  130     SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  131     SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//  132 }
        POP      {R0,PC}          ;; return
//  133 
//  134 /*!
//  135  *  @brief      SCCB 等待应答
//  136  *  @return     应答结果（0表示无应答，1表示有应答）
//  137  *  @since      v5.0
//  138  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  139 static int SCCB_WaitAck(void)
//  140 {
SCCB_WaitAck:
        PUSH     {R7,LR}
//  141     SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  142     //SDA_H();
//  143     SDA_DDR_IN();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_3  ;; 0x43fe02b4
        STR      R0,[R1, #+0]
//  144 
//  145     SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//  146     SCL_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  147 
//  148     SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//  149 
//  150     if(SDA_IN())           //应答为高电平，异常，通信失败
        LDR.N    R0,??DataTable7_4  ;; 0x43fe0234
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SCCB_WaitAck_0
//  151     {
//  152         SDA_DDR_OUT();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_3  ;; 0x43fe02b4
        STR      R0,[R1, #+0]
//  153         SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  154         return 0;
        MOVS     R0,#+0
        B.N      ??SCCB_WaitAck_1
//  155     }
//  156     SDA_DDR_OUT();
??SCCB_WaitAck_0:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_3  ;; 0x43fe02b4
        STR      R0,[R1, #+0]
//  157     SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  158     return 1;
        MOVS     R0,#+1
??SCCB_WaitAck_1:
        POP      {R1,PC}          ;; return
//  159 }
//  160 
//  161 /*!
//  162  *  @brief      SCCB 发送的数据
//  163  *  @param      SendByte    需要发送的数据
//  164  *  @since      v5.0
//  165  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  166 static void SCCB_SendByte(uint8 SendByte)
//  167 {
SCCB_SendByte:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
//  168     uint8 i = 8;
        MOVS     R4,#+8
        B.N      ??SCCB_SendByte_0
//  169     while(i--)
//  170     {
//  171 
//  172         if(SendByte & 0x80)     //SDA 输出数据
//  173         {
//  174             SDA_H();
//  175         }
//  176         else
//  177         {
//  178             SDA_L();
??SCCB_SendByte_1:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_1  ;; 0x43fe0034
        STR      R0,[R1, #+0]
//  179         }
//  180         SendByte <<= 1;
??SCCB_SendByte_2:
        LSLS     R5,R5,#+1
//  181         SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//  182         SCL_H();                //SCL 拉高，采集信号
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  183         SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//  184         SCL_L();                //SCL 时钟线拉低
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
??SCCB_SendByte_0:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SCCB_SendByte_3
        LSLS     R0,R5,#+24
        BPL.N    ??SCCB_SendByte_1
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_1  ;; 0x43fe0034
        STR      R0,[R1, #+0]
        B.N      ??SCCB_SendByte_2
//  185         //SCCB_DELAY();
//  186     }
//  187     //SCL_L();
//  188 }
??SCCB_SendByte_3:
        POP      {R0,R4,R5,PC}    ;; return
//  189 
//  190 /*!
//  191  *  @brief      接收SCCB总线的数据
//  192  *  @return     接收到的数据
//  193  *  @since      v5.0
//  194  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  195 static int SCCB_ReceiveByte(void)
//  196 {
SCCB_ReceiveByte:
        PUSH     {R3-R5,LR}
//  197     uint8 i = 8;
        MOVS     R4,#+8
//  198     uint8 ReceiveByte = 0;
        MOVS     R5,#+0
//  199 
//  200     //SDA_H();
//  201     //SCCB_DELAY();
//  202     SDA_DDR_IN();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_3  ;; 0x43fe02b4
        STR      R0,[R1, #+0]
        B.N      ??SCCB_ReceiveByte_0
//  203 
//  204     while(i--)
//  205     {
//  206         ReceiveByte <<= 1;
??SCCB_ReceiveByte_1:
        LSLS     R5,R5,#+1
//  207         SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  208         SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//  209         SCL_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  210         SCCB_DELAY();
        MOV      R0,#+400
        BL       SCCB_delay
//  211 
//  212         if(SDA_IN())
        LDR.N    R0,??DataTable7_4  ;; 0x43fe0234
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SCCB_ReceiveByte_0
//  213         {
//  214             ReceiveByte |= 0x01;
        ORRS     R5,R5,#0x1
//  215         }
//  216 
//  217 
//  218     }
??SCCB_ReceiveByte_0:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SCCB_ReceiveByte_1
//  219     SDA_DDR_OUT();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_3  ;; 0x43fe02b4
        STR      R0,[R1, #+0]
//  220     SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_2  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  221     return ReceiveByte;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,R5
        POP      {R1,R4,R5,PC}    ;; return
//  222 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0x43fe0034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     0x43fe0030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     0x43fe02b4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     0x43fe0234
//  223 
//  224 /*****************************************************************************************
//  225 * 函数名：SCCB_WriteByte
//  226 * 描述  ：写一字节数据
//  227 * 输入  ：- WriteAddress: 待写入地址    - SendByte: 待写入数据  - DeviceAddress: 器件类型
//  228 * 输出  ：返回为:=1成功写入,=0失败
//  229 * 注意  ：无
//  230 *****************************************************************************************/
//  231 static int SCCB_WriteByte_one( uint16 WriteAddress , uint8 SendByte );
//  232 
//  233 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  234 int SCCB_WriteByte( uint16 WriteAddress , uint8 SendByte )            //考虑到用sccb的管脚模拟，比较容易失败，因此多试几次
//  235 {
SCCB_WriteByte:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  236     uint8 i = 0;
        MOVS     R6,#+0
//  237     while( 0 == SCCB_WriteByte_one ( WriteAddress, SendByte ) )
??SCCB_WriteByte_0:
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       SCCB_WriteByte_one
        CMP      R0,#+0
        BNE.N    ??SCCB_WriteByte_1
//  238     {
//  239         i++;
        ADDS     R6,R6,#+1
//  240         if(i == 20)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+20
        BNE.N    ??SCCB_WriteByte_0
//  241         {
//  242             return 0 ;
        MOVS     R0,#+0
        B.N      ??SCCB_WriteByte_2
//  243         }
//  244     }
//  245     return 1;
??SCCB_WriteByte_1:
        MOVS     R0,#+1
??SCCB_WriteByte_2:
        POP      {R4-R6,PC}       ;; return
//  246 }
//  247 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  248 int SCCB_WriteByte_one( uint16 WriteAddress , uint8 SendByte )
//  249 {
SCCB_WriteByte_one:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  250     if(!SCCB_Start())
        BL       SCCB_Start
        CMP      R0,#+0
        BNE.N    ??SCCB_WriteByte_one_0
//  251     {
//  252         return 0;
        MOVS     R0,#+0
        B.N      ??SCCB_WriteByte_one_1
//  253     }
//  254     SCCB_SendByte( DEV_ADR );                    /* 器件地址 */
??SCCB_WriteByte_one_0:
        MOVS     R0,#+66
        BL       SCCB_SendByte
//  255     if( !SCCB_WaitAck() )
        BL       SCCB_WaitAck
        CMP      R0,#+0
        BNE.N    ??SCCB_WriteByte_one_2
//  256     {
//  257         SCCB_Stop();
        BL       SCCB_Stop
//  258         return 0;
        MOVS     R0,#+0
        B.N      ??SCCB_WriteByte_one_1
//  259     }
//  260     SCCB_SendByte((uint8)(WriteAddress & 0x00FF));   /* 设置低起始地址 */
??SCCB_WriteByte_one_2:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SCCB_SendByte
//  261     SCCB_WaitAck();
        BL       SCCB_WaitAck
//  262     SCCB_SendByte(SendByte);
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SCCB_SendByte
//  263     SCCB_WaitAck();
        BL       SCCB_WaitAck
//  264     SCCB_Stop();
        BL       SCCB_Stop
//  265     return 1;
        MOVS     R0,#+1
??SCCB_WriteByte_one_1:
        POP      {R1,R4,R5,PC}    ;; return
//  266 }
//  267 
//  268 
//  269 
//  270 
//  271 /******************************************************************************************************************
//  272  * 函数名：SCCB_ReadByte
//  273  * 描述  ：读取一串数据
//  274  * 输入  ：- pBuffer: 存放读出数据  - length: 待读出长度    - ReadAddress: 待读出地址        - DeviceAddress: 器件类型
//  275  * 输出  ：返回为:=1成功读入,=0失败
//  276  * 注意  ：无
//  277  **********************************************************************************************************************/
//  278 static int SCCB_ReadByte_one(uint8 *pBuffer,   uint16 length,   uint8 ReadAddress);
//  279 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  280 int SCCB_ReadByte(uint8 *pBuffer,   uint16 length,   uint8 ReadAddress)
//  281 {
SCCB_ReadByte:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  282     uint8 i = 0;
        MOVS     R7,#+0
//  283     while( 0 == SCCB_ReadByte_one(pBuffer, length, ReadAddress) )
??SCCB_ReadByte_0:
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       SCCB_ReadByte_one
        CMP      R0,#+0
        BNE.N    ??SCCB_ReadByte_1
//  284     {
//  285         i++;
        ADDS     R7,R7,#+1
//  286         if(i == 30)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+30
        BNE.N    ??SCCB_ReadByte_0
//  287         {
//  288             return 0 ;
        MOVS     R0,#+0
        B.N      ??SCCB_ReadByte_2
//  289         }
//  290     }
//  291     return 1;
??SCCB_ReadByte_1:
        MOVS     R0,#+1
??SCCB_ReadByte_2:
        POP      {R1,R4-R7,PC}    ;; return
//  292 }
//  293 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  294 int SCCB_ReadByte_one(uint8 *pBuffer,   uint16 length,   uint8 ReadAddress)
//  295 {
SCCB_ReadByte_one:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  296     if(!SCCB_Start())
        BL       SCCB_Start
        CMP      R0,#+0
        BNE.N    ??SCCB_ReadByte_one_0
//  297     {
//  298         return 0;
        MOVS     R0,#+0
        B.N      ??SCCB_ReadByte_one_1
//  299     }
//  300     SCCB_SendByte( DEV_ADR );         /* 器件地址 */
??SCCB_ReadByte_one_0:
        MOVS     R0,#+66
        BL       SCCB_SendByte
//  301     if( !SCCB_WaitAck() )
        BL       SCCB_WaitAck
        CMP      R0,#+0
        BNE.N    ??SCCB_ReadByte_one_2
//  302     {
//  303         SCCB_Stop();
        BL       SCCB_Stop
//  304         return 0;
        MOVS     R0,#+0
        B.N      ??SCCB_ReadByte_one_1
//  305     }
//  306     SCCB_SendByte( ReadAddress );           /* 设置低起始地址 */
??SCCB_ReadByte_one_2:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SCCB_SendByte
//  307     SCCB_WaitAck();
        BL       SCCB_WaitAck
//  308     SCCB_Stop();
        BL       SCCB_Stop
//  309 
//  310     if(!SCCB_Start())
        BL       SCCB_Start
        CMP      R0,#+0
        BNE.N    ??SCCB_ReadByte_one_3
//  311     {
//  312         return 0;
        MOVS     R0,#+0
        B.N      ??SCCB_ReadByte_one_1
//  313     }
//  314     SCCB_SendByte( DEV_ADR + 1 );               /* 器件地址 */
??SCCB_ReadByte_one_3:
        MOVS     R0,#+67
        BL       SCCB_SendByte
//  315 
//  316     if(!SCCB_WaitAck())
        BL       SCCB_WaitAck
        CMP      R0,#+0
        BNE.N    ??SCCB_ReadByte_one_4
//  317     {
//  318         SCCB_Stop();
        BL       SCCB_Stop
//  319         return 0;
        MOVS     R0,#+0
        B.N      ??SCCB_ReadByte_one_1
//  320     }
//  321     while(length)
//  322     {
//  323         *pBuffer = SCCB_ReceiveByte();
//  324         if(length == 1)
//  325         {
//  326             SCCB_NoAck();
//  327         }
//  328         else
//  329         {
//  330             SCCB_Ack();
??SCCB_ReadByte_one_5:
        BL       SCCB_Ack
//  331         }
//  332         pBuffer++;
??SCCB_ReadByte_one_6:
        ADDS     R4,R4,#+1
//  333         length--;
        SUBS     R5,R5,#+1
??SCCB_ReadByte_one_4:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??SCCB_ReadByte_one_7
        BL       SCCB_ReceiveByte
        STRB     R0,[R4, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+1
        BNE.N    ??SCCB_ReadByte_one_5
        BL       SCCB_NoAck
        B.N      ??SCCB_ReadByte_one_6
//  334     }
//  335     SCCB_Stop();
??SCCB_ReadByte_one_7:
        BL       SCCB_Stop
//  336     return 1;
        MOVS     R0,#+1
??SCCB_ReadByte_one_1:
        POP      {R4-R6,PC}       ;; return
//  337 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  338 
//  339 
//  340 
//  341 
// 
// 880 bytes in section .text
// 
// 880 bytes of CODE memory
//
//Errors: none
//Warnings: none
