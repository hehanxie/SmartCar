#ifndef _GY_50_H_
#define _GY_50_H_
#include "include.h"

//***************************************
// GY-50 L3G4200D IIC测试程序
// 使用单片机STC89C51 
// 晶振：11.0592M
// 显示：LCD1602
// 编译环境 Keil uVision2
// 参考宏晶网站24c04通信程序
// 时间：2011年9月1日
// QQ：531389319
//****************************************


/********用户可修改值 开始***********/
//定义SCCB设备地址
#define SCCB_DEV_ADR    ADR_OV7725

#define   uchar unsigned char
#define   uint unsigned int	

//定义SCL、SDA的引脚
#define SDA       PTA13_O
#define SDA_Read  PTA13_I
#define SDA_Out   DDRA13=1
#define SDA_In    DDRA13=0

#define SCL       PTA12_O
#define SCL_Out   DDRA12=1  

#define ack 1
#define no_ack 0  
#define _nop_() asm("nop");           
//****************************************
#define	SlaveAddress   0x42	  //定义器件在IIC总线中的从地址
                               
typedef unsigned char  BYTE;
typedef unsigned short WORD;

//void delay(unsigned int k);
//void InitL3G4200D();                //初始化L3G4200D
void LPLD_IIC_Init(void);
void Delay5us();
void GY_WriteByte(unsigned char Address, unsigned char Thedata);   //单个写入数据
unsigned char GY_ReadByte(unsigned char Address);                //单个读取内部寄存器数据
                             
 #endif