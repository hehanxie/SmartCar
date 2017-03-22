#include "include.h"

GPIO_InitTypeDef pta_IIC;

void LPLD_IIC_Init(void)
{
  /********用户可修改值 开始***********/
  pta_IIC.GPIO_PTx = PTA;
  pta_IIC.GPIO_Pins = GPIO_Pin12 | GPIO_Pin13;
  /********用户可修改值 结束***********/
  pta_IIC.GPIO_Dir = DIR_OUTPUT;
  pta_IIC.GPIO_Output = OUTPUT_H;
  pta_IIC.GPIO_PinControl = NULL;
  LPLD_GPIO_Init(pta_IIC);
}


/**************************************
延时5微秒(STC90C52RC@12M)
不同的工作环境,需要调整此函数，注意时钟过快时需要修改
当改用1T的MCU时,请调整此延时函数
**************************************/
//void Delay5us()
//{
//   for(int i =0;i<1;i++)
//       for(int j = 0;j < 25;j++)
//     {;}
//}

void Delay5us()
{
  for(int i =0;i<1;i++)
    for(int j = 0;j < 15;j++)
    {;}
}

/**************************************
起始信号
**************************************/
void IIC_Start(void)

{
        SCL_Out;
        SDA_Out;                        //输出
        //dwt_delay_us(1000);
	SDA=1;
        //dwt_delay_us(1000);
        SCL=1;
	Delay5us();
	SDA=0;
	Delay5us();
	SCL=0;
	//Delay5us();
	//SCL=0;
        //dwt_delay_us(2000);
}

/**************************************
停止信号
**************************************/
void IIC_Stop(void)
//送停止位 SDA=0->1
{
	SDA_Out;
	SCL_Out;
	//dwt_delay_us(1000);
	SDA=0; //发送结束条件的数据信号
	//dwt_delay_us(1000);
	SCL=1; //发送结束条件的时钟信号
	Delay5us();
	SDA=1; //发送I2C总线结束信号
	Delay5us();      
        SCL=0;//***
  
  
  /*SDA_Out;                        //输出
	SCL=0;
	Delay5us();
	SDA=0;
	Delay5us();
	SCL=1;
	Delay5us();
	SDA=1;
	Delay5us();
	SCL=0;*/
}

/**************************************
发送应答信号
入口参数:ack (0:ACK 1:NAK)
**************************************/
void L3G4200D_SendACK(BYTE a)
{    
    SDA_Out;
	SCL_Out;
	//dwt_delay_us(1000);
	if(a==0) SDA=0; //在此发出应答或非应答信号
	else SDA=1;
	Delay5us();
	SCL=1;
	Delay5us();
	SCL=0; //清时钟线，钳住I2C总线以便继续接收
	//dwt_delay_us(2000);
  
  
  
  
  /*if(ack_main)GY_SDA=0;
    else GY_SDA = 1;             //写应答信号
    Delay5us();                

    GY_SCL = 1;                    //拉高时钟线
    Delay5us();               //延时
    GY_SCL = 0;       //拉低时钟线   */              
}

/**************************************
接收应答信号
**************************************/
/*uchar L3G4200D_RecvACK()
{
    GY_SCL = 1;                    //拉高时钟线
    Delay5us();                 //延时
    GY_CY = SDA;                   //读应答信号
    GY_SCL = 0;                    //拉低时钟线
    Delay5us();                 //延时

    return CY;
}
*/
/**************************************
向IIC总线发送一个字节数据
**************************************/
unsigned char Send_Byte(unsigned char c)
//字节发送程序
{
	
	unsigned char BitCnt;
        //unsigned char a;
	SCL_Out;
	SDA_Out;	
//	asm("nop");


	for(BitCnt=0;BitCnt<8;BitCnt++) //要传送的数据长度为8位
	{
		SCL=0;
		if(c&0x80) SDA=1; //判断发送位
		else SDA=0;
		c<<=1;
		Delay5us();
		SCL=1; //置时钟线为高，通知被控器开始接收数据位
		Delay5us();
		SCL=0;
	}
	Delay5us();
	SDA=1; //8位发送完后释放数据线，准备接收应答位
	Delay5us();
	SCL=1;
	//SDA_In;
	Delay5us();
	/*if(SDA_Read==1) a=ack;
	else a=no_ack; //判断是否接收到应答信号*/
	SCL=0;
	return ack;
  
  /*unsigned char i; 
	SDA_Out;
	for(i=0;i<8;i++)
	{
		SCL=0;
		if((SendChar<<i)&0x80)
		  SDA=1;                        //判断发送位
		else 
		  SDA=0;
		Delay5us();
		SCL=1;
		Delay5us();
		SCL=0;
	}
	Delay5us();
	SDA=1;                            //发送完8bit，释放总线准备接收应答位
	Delay5us();
	SCL=1;
	Delay5us();
	SCL=0; */
}
/**************************************
从IIC总线接收一个字节数据
**************************************/
unsigned char Read_Byte(void)
//字节接收程序
{
  unsigned char retc;
	unsigned char BitCnt;
	retc=0;
	SDA_Out;
	Delay5us();
	SDA=1; //置数据线为输入方式
	SDA_In;
	Delay5us();
	for(BitCnt=0;BitCnt<8;BitCnt++)
	{
		//dwt_delay_us(1000);
		SCL=0; //置时钟线为低，准备接收数据位
		Delay5us();
		SCL=1; //置时钟线为高使数据线上数据有效
		Delay5us();
		
		retc=retc<<1;
		if(SDA_Read==1) retc=retc+1; //读数据位,接收的数据位放入retc中
		Delay5us();
		
	}
	SCL=0;
	Delay5us();
	return(retc);
  
  
  /*unsigned char i;
  unsigned char ReadChar;
	ReadChar=0;
	SCL=0;
	Delay5us();
	SDA_Out;
	SDA=1;                            //置数据线为输入方式
	SDA_In;                       
	for(i=0;i<8;i++)
	{
		Delay5us();
		SCL=0;                          //置时钟线为低，准备接收数据位
		Delay5us();
		SCL=1;                          //置时钟线为高，使数据线上数据有效
		Delay5us();
		ReadChar<<=1;
		if(SDA_Read)
		ReadChar+=1;                    //读数据位，将接收的数据存c
	}
	SDA_Out;
	SCL=0;
	return ReadChar;*/
}
//单字节写入*******************************************

void GY_WriteByte(unsigned char Address, unsigned char Thedata)
//写入
{
	IIC_Start();		                  //启动
	Send_Byte(SlaveAddress);	                //写入设备ID及写信号
	Send_Byte(Address);	              //X地址
	Send_Byte(Thedata);	              //写入设备ID及读信
	IIC_Stop();
}

//单字节读取*****************************************
unsigned char GY_ReadByte(unsigned char Address)

{
       unsigned char Ret;
	IIC_Start();		                  //启动
	Send_Byte(SlaveAddress);	                //写入设备ID及写信号
	Send_Byte(Address);	              //X地址
	IIC_Start();		                  //重新发送开始
	Send_Byte(SlaveAddress+1);	                //写入设备ID及读信
	Ret=Read_Byte();	                //读取一字节
	IIC_Stop();
	return Ret;
}

