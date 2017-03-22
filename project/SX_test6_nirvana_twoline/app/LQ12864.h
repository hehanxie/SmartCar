#ifndef _LQ12864_H_
#define _LQ12864_H_

#define byte unsigned char  //自己加的   记得除去试试
#define word unsigned int   //自己加的

/*
4线SPI使用说明：
VBT 供内部DC-DC电压，3.3~4.3V，如果使用5V电压，为保险起见串一个100~500欧的电阻
VCC 供内部逻辑电压 1.8~6V   
GND 地

BS0 低电平
BS1 低电平
BS2 低电平

CS  片选管脚
DC  命令数据选择管脚
RES 模块复位管脚 
D0（SCLK） ，时钟脚，由MCU控制
D1（MOSI） ，主输出从输入数据脚，由MCU控制

D2 悬空      
D3-D7 ， 低电平 ， 也可悬空，但最好设为低电平
RD  低电平 ，也可悬空，但最好设为低电平
RW  低电平 ，也可悬空，但最好设为低电平
RD  低电平 ，也可悬空，但最好设为低电平   
*/
#define LCD_SCL PTA14_O  /*D0*///K60的管脚配置 PTE3脚输出
#define LCD_SDA	PTA16_O  /*D1*/
#define LCD_RST PTB21_O  /*RST*/ 
#define LCD_DC  PTB20_O  /*DC*/ 

#define XLevelL		0x00
#define XLevelH		0x10
#define XLevel		((XLevelH&0x0F)*16+XLevelL)
#define Max_Column	128
#define Max_Row		  64
#define	Brightness	0xCF 

#define Dot_Size 3                  // 小数点后数位

#define X_WIDTH 128
#define Y_WIDTH 64

extern byte LIBLOGO60x58[480];

extern unsigned char str1[6];
extern unsigned char str2[6];
extern unsigned char str3[8];

extern unsigned char str4[6];
extern unsigned char str5[6];
extern unsigned char str6[8];

void init_gpio_OLED();
int Dly_ms(int ms);
void LCD_WrDat(byte data);     //写数据
void LCD_WrCmd(byte cmd);     //写命令
void LCD_Set_Pos(byte x, byte y);     //设置起始位置
void LCD_Fill(byte dat);     //填充屏幕为黑或白
void LCD_CLS(void);     //清屏

void LCD_Init(void);     //初始化
void LCD_Fill(byte bmp_data);     //填充整个屏幕白或黑
void LCD_PutPixel(byte x,byte y);     //绘制一个点
void LCD_Rectangle(byte x1,byte y1,byte x2,byte y2,byte gif);     //绘制一个矩形
void LCD_P6x8Str(byte x,byte y,byte ch[]);       //显示字体大小6x8个像素
void LCD_P6x8Str2(byte x,byte y,byte ch[]);      //显示字体大小6x8个像素 前景背景交换
void LCD_P8x16Str(byte x,byte y,byte ch[]);      //显示字体大小8x16个像素
void LCD_P8x16Str2(byte x,byte y,byte ch[]);     //显示字体大小8x16个像素
void LCD_P14x16Str(byte x,byte y,byte ch[]);     //显示字体大小14x16个像素
void LCD_P14x16Str2(byte x,byte y,byte ch[]);    //显示字体大小14x16个像素 翻转像素
void LCD_Print(byte x, byte y, byte ch[]);
void Draw_BMP(byte x0,byte y0,byte x1,byte y1,byte bmp[]);      //绘制BMP图像
void Draw_LQLogo(void);     //龙邱的LOGO
void Draw_LibLogo(void);     //lib的LOGO
void LED_PrintImage(unsigned char *pucTable,unsigned short usRowNum, unsigned short usColumnNum);     //绘制图像
void LED_PrintImag2(unsigned char *pucTable,unsigned short usRowNum, unsigned short usColumnNum);       //非反白
void floatToInt(float fl,byte n,byte s);     //浮点转整型
void floatToInt2(float fl,byte n,byte s);     //浮点转整型2

void Paint_Angle(float Angle);     //刷新角度，已曲线方式进行
void LCD_Fill_Line(byte line,byte bmp_data);  //自加  填充一列为黑或白
void LCD_PaintTSL1401_Line(byte data[],float avange);    //函数型
void LCD_PaintTSL1401_Bulk(byte y1,byte y2,byte data[]);     //块状型
extern void LCD_Write_Float(unsigned char x,unsigned char y,float Number);    //这句神坑 注意存在同名文件的情况
void LCD_Write_Float_Dot(unsigned char x,unsigned char y,float Number,int dotNumber);     //浮点型显示，包括小数点位数
void LCD_Write_Float_Dot_Chinese(unsigned char x,unsigned char y,float Number,int dotNumber);     //浮点型显示，包括小数点位数

#endif

