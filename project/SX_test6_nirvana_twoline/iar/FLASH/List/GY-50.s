///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       15/Dec/2015  02:03:30
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\Freescale\Bubble_Kinetis\project\SX\app\GY-50.c
//    Command line =  
//        F:\Freescale\Bubble_Kinetis\project\SX\app\GY-50.c -D LPLD_K60 -D
//        USE_K60D10 -lCN
//        F:\Freescale\Bubble_Kinetis\project\SX\iar\FLASH\List\ -lB
//        F:\Freescale\Bubble_Kinetis\project\SX\iar\FLASH\List\ -o
//        F:\Freescale\Bubble_Kinetis\project\SX\iar\FLASH\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        F:\Freescale\Bubble_Kinetis\project\SX\iar\..\app\ -I
//        F:\Freescale\Bubble_Kinetis\project\SX\iar\..\..\..\lib\CPU\ -I
//        F:\Freescale\Bubble_Kinetis\project\SX\iar\..\..\..\lib\common\ -I
//        F:\Freescale\Bubble_Kinetis\project\SX\iar\..\..\..\lib\LPLD\ -I
//        F:\Freescale\Bubble_Kinetis\project\SX\iar\..\..\..\lib\LPLD\HW\ -I
//        F:\Freescale\Bubble_Kinetis\project\SX\iar\..\..\..\lib\LPLD\DEV\ -I
//        F:\Freescale\Bubble_Kinetis\project\SX\iar\..\..\..\lib\LPLD\FUNC\ -I
//        F:\Freescale\Bubble_Kinetis\project\SX\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        F:\Freescale\Bubble_Kinetis\project\SX\iar\..\..\..\lib\uCOS-II\Source\
//        -I F:\Freescale\Bubble_Kinetis\project\SX\iar\..\..\..\lib\FatFs\ -I
//        F:\Freescale\Bubble_Kinetis\project\SX\iar\..\..\..\lib\FatFs\option\
//        -I
//        F:\Freescale\Bubble_Kinetis\project\SX\iar\..\..\..\lib\USB\common\
//        -I
//        F:\Freescale\Bubble_Kinetis\project\SX\iar\..\..\..\lib\USB\driver\
//        -I
//        F:\Freescale\Bubble_Kinetis\project\SX\iar\..\..\..\lib\USB\descriptor\
//        -I F:\Freescale\Bubble_Kinetis\project\SX\iar\..\..\..\lib\USB\class\
//        -Ol -I "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\" -D ARM_MATH_CM4
//    List file    =  
//        F:\Freescale\Bubble_Kinetis\project\SX\iar\FLASH\List\GY-50.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_GPIO_Init
        EXTERN __aeabi_memcpy4

        PUBLIC Delay5us
        PUBLIC GY_ReadByte
        PUBLIC GY_WriteByte
        PUBLIC IIC_Start
        PUBLIC IIC_Stop
        PUBLIC L3G4200D_SendACK
        PUBLIC LPLD_IIC_Init
        PUBLIC Read_Byte
        PUBLIC Send_Byte
        PUBLIC pta_IIC

// F:\Freescale\Bubble_Kinetis\project\SX\app\GY-50.c
//    1 #include "include.h"
//    2 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    3 GPIO_InitTypeDef pta_IIC;
pta_IIC:
        DS8 20
//    4 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    5 void LPLD_IIC_Init(void)
//    6 {
LPLD_IIC_Init:
        PUSH     {R7,LR}
//    7   /********用户可修改值 开始***********/
//    8   pta_IIC.GPIO_PTx = PTA;
        LDR.N    R0,??DataTable5  ;; 0x400ff000
        LDR.N    R1,??DataTable5_1
        STR      R0,[R1, #+0]
//    9   pta_IIC.GPIO_Pins = GPIO_Pin12 | GPIO_Pin13;
        MOV      R0,#+12288
        LDR.N    R1,??DataTable5_1
        STR      R0,[R1, #+4]
//   10   /********用户可修改值 结束***********/
//   11   pta_IIC.GPIO_Dir = DIR_OUTPUT;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_1
        STRB     R0,[R1, #+12]
//   12   pta_IIC.GPIO_Output = OUTPUT_H;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_1
        STRB     R0,[R1, #+13]
//   13   pta_IIC.GPIO_PinControl = NULL;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_1
        STR      R0,[R1, #+8]
//   14   LPLD_GPIO_Init(pta_IIC);
        LDR.N    R1,??DataTable5_1
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   15 }
        POP      {R0,PC}          ;; return
//   16 
//   17 
//   18 /**************************************
//   19 延时5微秒(STC90C52RC@12M)
//   20 不同的工作环境,需要调整此函数，注意时钟过快时需要修改
//   21 当改用1T的MCU时,请调整此延时函数
//   22 **************************************/
//   23 //void Delay5us()
//   24 //{
//   25 //   for(int i =0;i<1;i++)
//   26 //       for(int j = 0;j < 25;j++)
//   27 //     {;}
//   28 //}
//   29 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   30 void Delay5us()
//   31 {
//   32   for(int i =0;i<1;i++)
Delay5us:
        MOVS     R0,#+0
        B.N      ??Delay5us_0
//   33     for(int j = 0;j < 15;j++)
??Delay5us_1:
        ADDS     R1,R1,#+1
??Delay5us_2:
        CMP      R1,#+15
        BLT.N    ??Delay5us_1
        ADDS     R0,R0,#+1
??Delay5us_0:
        CMP      R0,#+1
        BGE.N    ??Delay5us_3
        MOVS     R1,#+0
        B.N      ??Delay5us_2
//   34     {;}
//   35 }
??Delay5us_3:
        BX       LR               ;; return
//   36 
//   37 /**************************************
//   38 起始信号
//   39 **************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   40 void IIC_Start(void)
//   41 
//   42 {
IIC_Start:
        PUSH     {R7,LR}
//   43         SCL_Out;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_2  ;; 0x43fe02b0
        STR      R0,[R1, #+0]
//   44         SDA_Out;                        //输出
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_3  ;; 0x43fe02b4
        STR      R0,[R1, #+0]
//   45         //dwt_delay_us(1000);
//   46 	SDA=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_4  ;; 0x43fe0034
        STR      R0,[R1, #+0]
//   47         //dwt_delay_us(1000);
//   48         SCL=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_5  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//   49 	Delay5us();
        BL       Delay5us
//   50 	SDA=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_4  ;; 0x43fe0034
        STR      R0,[R1, #+0]
//   51 	Delay5us();
        BL       Delay5us
//   52 	SCL=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_5  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//   53 	//Delay5us();
//   54 	//SCL=0;
//   55         //dwt_delay_us(2000);
//   56 }
        POP      {R0,PC}          ;; return
//   57 
//   58 /**************************************
//   59 停止信号
//   60 **************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   61 void IIC_Stop(void)
//   62 //送停止位 SDA=0->1
//   63 {
IIC_Stop:
        PUSH     {R7,LR}
//   64 	SDA_Out;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_3  ;; 0x43fe02b4
        STR      R0,[R1, #+0]
//   65 	SCL_Out;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_2  ;; 0x43fe02b0
        STR      R0,[R1, #+0]
//   66 	//dwt_delay_us(1000);
//   67 	SDA=0; //发送结束条件的数据信号
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_4  ;; 0x43fe0034
        STR      R0,[R1, #+0]
//   68 	//dwt_delay_us(1000);
//   69 	SCL=1; //发送结束条件的时钟信号
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_5  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//   70 	Delay5us();
        BL       Delay5us
//   71 	SDA=1; //发送I2C总线结束信号
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_4  ;; 0x43fe0034
        STR      R0,[R1, #+0]
//   72 	Delay5us();      
        BL       Delay5us
//   73         SCL=0;//***
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_5  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//   74   
//   75   
//   76   /*SDA_Out;                        //输出
//   77 	SCL=0;
//   78 	Delay5us();
//   79 	SDA=0;
//   80 	Delay5us();
//   81 	SCL=1;
//   82 	Delay5us();
//   83 	SDA=1;
//   84 	Delay5us();
//   85 	SCL=0;*/
//   86 }
        POP      {R0,PC}          ;; return
//   87 
//   88 /**************************************
//   89 发送应答信号
//   90 入口参数:ack (0:ACK 1:NAK)
//   91 **************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   92 void L3G4200D_SendACK(BYTE a)
//   93 {    
L3G4200D_SendACK:
        PUSH     {R7,LR}
//   94     SDA_Out;
        MOVS     R1,#+1
        LDR.N    R2,??DataTable5_3  ;; 0x43fe02b4
        STR      R1,[R2, #+0]
//   95 	SCL_Out;
        MOVS     R1,#+1
        LDR.N    R2,??DataTable5_2  ;; 0x43fe02b0
        STR      R1,[R2, #+0]
//   96 	//dwt_delay_us(1000);
//   97 	if(a==0) SDA=0; //在此发出应答或非应答信号
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??L3G4200D_SendACK_0
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_4  ;; 0x43fe0034
        STR      R0,[R1, #+0]
        B.N      ??L3G4200D_SendACK_1
//   98 	else SDA=1;
??L3G4200D_SendACK_0:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_4  ;; 0x43fe0034
        STR      R0,[R1, #+0]
//   99 	Delay5us();
??L3G4200D_SendACK_1:
        BL       Delay5us
//  100 	SCL=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_5  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  101 	Delay5us();
        BL       Delay5us
//  102 	SCL=0; //清时钟线，钳住I2C总线以便继续接收
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_5  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  103 	//dwt_delay_us(2000);
//  104   
//  105   
//  106   
//  107   
//  108   /*if(ack_main)GY_SDA=0;
//  109     else GY_SDA = 1;             //写应答信号
//  110     Delay5us();                
//  111 
//  112     GY_SCL = 1;                    //拉高时钟线
//  113     Delay5us();               //延时
//  114     GY_SCL = 0;       //拉低时钟线   */              
//  115 }
        POP      {R0,PC}          ;; return
//  116 
//  117 /**************************************
//  118 接收应答信号
//  119 **************************************/
//  120 /*uchar L3G4200D_RecvACK()
//  121 {
//  122     GY_SCL = 1;                    //拉高时钟线
//  123     Delay5us();                 //延时
//  124     GY_CY = SDA;                   //读应答信号
//  125     GY_SCL = 0;                    //拉低时钟线
//  126     Delay5us();                 //延时
//  127 
//  128     return CY;
//  129 }
//  130 */
//  131 /**************************************
//  132 向IIC总线发送一个字节数据
//  133 **************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  134 unsigned char Send_Byte(unsigned char c)
//  135 //字节发送程序
//  136 {
Send_Byte:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  137 	
//  138 	unsigned char BitCnt;
//  139         //unsigned char a;
//  140 	SCL_Out;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_2  ;; 0x43fe02b0
        STR      R0,[R1, #+0]
//  141 	SDA_Out;	
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_3  ;; 0x43fe02b4
        STR      R0,[R1, #+0]
//  142 //	asm("nop");
//  143 
//  144 
//  145 	for(BitCnt=0;BitCnt<8;BitCnt++) //要传送的数据长度为8位
        MOVS     R5,#+0
        B.N      ??Send_Byte_0
//  146 	{
//  147 		SCL=0;
//  148 		if(c&0x80) SDA=1; //判断发送位
//  149 		else SDA=0;
??Send_Byte_1:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_4  ;; 0x43fe0034
        STR      R0,[R1, #+0]
//  150 		c<<=1;
??Send_Byte_2:
        LSLS     R4,R4,#+1
//  151 		Delay5us();
        BL       Delay5us
//  152 		SCL=1; //置时钟线为高，通知被控器开始接收数据位
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_5  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  153 		Delay5us();
        BL       Delay5us
//  154 		SCL=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_5  ;; 0x43fe0030
        STR      R0,[R1, #+0]
        ADDS     R5,R5,#+1
??Send_Byte_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BGE.N    ??Send_Byte_3
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_5  ;; 0x43fe0030
        STR      R0,[R1, #+0]
        LSLS     R0,R4,#+24
        BPL.N    ??Send_Byte_1
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_4  ;; 0x43fe0034
        STR      R0,[R1, #+0]
        B.N      ??Send_Byte_2
//  155 	}
//  156 	Delay5us();
??Send_Byte_3:
        BL       Delay5us
//  157 	SDA=1; //8位发送完后释放数据线，准备接收应答位
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_4  ;; 0x43fe0034
        STR      R0,[R1, #+0]
//  158 	Delay5us();
        BL       Delay5us
//  159 	SCL=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_5  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  160 	//SDA_In;
//  161 	Delay5us();
        BL       Delay5us
//  162 	/*if(SDA_Read==1) a=ack;
//  163 	else a=no_ack; //判断是否接收到应答信号*/
//  164 	SCL=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_5  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  165 	return ack;
        MOVS     R0,#+1
        POP      {R1,R4,R5,PC}    ;; return
//  166   
//  167   /*unsigned char i; 
//  168 	SDA_Out;
//  169 	for(i=0;i<8;i++)
//  170 	{
//  171 		SCL=0;
//  172 		if((SendChar<<i)&0x80)
//  173 		  SDA=1;                        //判断发送位
//  174 		else 
//  175 		  SDA=0;
//  176 		Delay5us();
//  177 		SCL=1;
//  178 		Delay5us();
//  179 		SCL=0;
//  180 	}
//  181 	Delay5us();
//  182 	SDA=1;                            //发送完8bit，释放总线准备接收应答位
//  183 	Delay5us();
//  184 	SCL=1;
//  185 	Delay5us();
//  186 	SCL=0; */
//  187 }
//  188 /**************************************
//  189 从IIC总线接收一个字节数据
//  190 **************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  191 unsigned char Read_Byte(void)
//  192 //字节接收程序
//  193 {
Read_Byte:
        PUSH     {R3-R5,LR}
//  194   unsigned char retc;
//  195 	unsigned char BitCnt;
//  196 	retc=0;
        MOVS     R4,#+0
//  197 	SDA_Out;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_3  ;; 0x43fe02b4
        STR      R0,[R1, #+0]
//  198 	Delay5us();
        BL       Delay5us
//  199 	SDA=1; //置数据线为输入方式
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_4  ;; 0x43fe0034
        STR      R0,[R1, #+0]
//  200 	SDA_In;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_3  ;; 0x43fe02b4
        STR      R0,[R1, #+0]
//  201 	Delay5us();
        BL       Delay5us
//  202 	for(BitCnt=0;BitCnt<8;BitCnt++)
        MOVS     R5,#+0
        B.N      ??Read_Byte_0
//  203 	{
//  204 		//dwt_delay_us(1000);
//  205 		SCL=0; //置时钟线为低，准备接收数据位
??Read_Byte_1:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_5  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  206 		Delay5us();
        BL       Delay5us
//  207 		SCL=1; //置时钟线为高使数据线上数据有效
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_5  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  208 		Delay5us();
        BL       Delay5us
//  209 		
//  210 		retc=retc<<1;
        LSLS     R4,R4,#+1
//  211 		if(SDA_Read==1) retc=retc+1; //读数据位,接收的数据位放入retc中
        LDR.N    R0,??DataTable5_6  ;; 0x43fe0234
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??Read_Byte_2
        ADDS     R4,R4,#+1
//  212 		Delay5us();
??Read_Byte_2:
        BL       Delay5us
//  213 		
//  214 	}
        ADDS     R5,R5,#+1
??Read_Byte_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BLT.N    ??Read_Byte_1
//  215 	SCL=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_5  ;; 0x43fe0030
        STR      R0,[R1, #+0]
//  216 	Delay5us();
        BL       Delay5us
//  217 	return(retc);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
//  218   
//  219   
//  220   /*unsigned char i;
//  221   unsigned char ReadChar;
//  222 	ReadChar=0;
//  223 	SCL=0;
//  224 	Delay5us();
//  225 	SDA_Out;
//  226 	SDA=1;                            //置数据线为输入方式
//  227 	SDA_In;                       
//  228 	for(i=0;i<8;i++)
//  229 	{
//  230 		Delay5us();
//  231 		SCL=0;                          //置时钟线为低，准备接收数据位
//  232 		Delay5us();
//  233 		SCL=1;                          //置时钟线为高，使数据线上数据有效
//  234 		Delay5us();
//  235 		ReadChar<<=1;
//  236 		if(SDA_Read)
//  237 		ReadChar+=1;                    //读数据位，将接收的数据存c
//  238 	}
//  239 	SDA_Out;
//  240 	SCL=0;
//  241 	return ReadChar;*/
//  242 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     pta_IIC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x43fe02b0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x43fe02b4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0x43fe0034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x43fe0030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x43fe0234
//  243 //单字节写入*******************************************
//  244 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  245 void GY_WriteByte(unsigned char Address, unsigned char Thedata)
//  246 //写入
//  247 {
GY_WriteByte:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  248 	IIC_Start();		                  //启动
        BL       IIC_Start
//  249 	Send_Byte(SlaveAddress);	                //写入设备ID及写信号
        MOVS     R0,#+66
        BL       Send_Byte
//  250 	Send_Byte(Address);	              //X地址
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Send_Byte
//  251 	Send_Byte(Thedata);	              //写入设备ID及读信
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Send_Byte
//  252 	IIC_Stop();
        BL       IIC_Stop
//  253 }
        POP      {R0,R4,R5,PC}    ;; return
//  254 
//  255 //单字节读取*****************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  256 unsigned char GY_ReadByte(unsigned char Address)
//  257 
//  258 {
GY_ReadByte:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  259        unsigned char Ret;
//  260 	IIC_Start();		                  //启动
        BL       IIC_Start
//  261 	Send_Byte(SlaveAddress);	                //写入设备ID及写信号
        MOVS     R0,#+66
        BL       Send_Byte
//  262 	Send_Byte(Address);	              //X地址
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Send_Byte
//  263 	IIC_Start();		                  //重新发送开始
        BL       IIC_Start
//  264 	Send_Byte(SlaveAddress+1);	                //写入设备ID及读信
        MOVS     R0,#+67
        BL       Send_Byte
//  265 	Ret=Read_Byte();	                //读取一字节
        BL       Read_Byte
        MOVS     R4,R0
//  266 	IIC_Stop();
        BL       IIC_Stop
//  267 	return Ret;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return
//  268 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  269 
// 
//  20 bytes in section .bss
// 544 bytes in section .text
// 
// 544 bytes of CODE memory
//  20 bytes of DATA memory
//
//Errors: none
//Warnings: none
