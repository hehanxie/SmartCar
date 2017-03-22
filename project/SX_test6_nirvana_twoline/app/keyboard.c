#include "common.h"
void delay1(void);
/*void key_init(void)
功能：键盘GPIO初始化*/

void key_init(void)
{GPIO_InitTypeDef gpio_init_struct;
    //////////列初始化//////////////
  gpio_init_struct.GPIO_PTx=PTC;
  gpio_init_struct.GPIO_Pins=GPIO_Pin14|GPIO_Pin15|GPIO_Pin16;
  gpio_init_struct.GPIO_Dir=DIR_INPUT;
  gpio_init_struct.GPIO_PinControl=IRQC_DIS|INPUT_PULL_DOWN;
  gpio_init_struct.GPIO_Output=OUTPUT_L;
  LPLD_GPIO_Init(gpio_init_struct);
  
   //////////行初始化//////////////
  gpio_init_struct.GPIO_PTx=PTC;
  gpio_init_struct.GPIO_Pins=GPIO_Pin11|GPIO_Pin12|GPIO_Pin13;
  gpio_init_struct.GPIO_Dir=DIR_OUTPUT;
  gpio_init_struct.GPIO_PinControl=IRQC_DIS;
  gpio_init_struct.GPIO_Output=OUTPUT_L;
  LPLD_GPIO_Init(gpio_init_struct);
}
unsigned char key_scan(void)
{
  
    unsigned char keyvalue=0; 
  //////////第一行///////////////
  PTC11_O=1; 
  if(PTC14_I==1)
  {
    delay1();
    if(PTC14_I==1)
    {  

      keyvalue=1;
    }
      while(PTC14_I==1);
  } 
  else if(PTC15_I==1)
  {
    delay1();
    if(PTC15_I==1)
    {   

      keyvalue=2;
    }
      while(PTC15_I==1);
  } 
  else if(PTC16_I==1)
  {
    delay1();
    if(PTC16_I==1)
    {    

      keyvalue=3;
    }
      while(PTC16_I==1);
  } 
      PTC11_O=0;
 //////////////////第二行//////////////////////
 PTC12_O=1;
  
  if(PTC14_I==1)
  {
    delay1();
    if(PTC14_I==1)
    {
      keyvalue=4;
    }
    while(PTC14_I==1);
  } 
  else if(PTC15_I==1)
  {
    delay1();
    if(PTC15_I==1)
    {
      keyvalue=5;
    }
    while(PTC15_I==1);
  } 
  else if(PTC16_I==1)
  {
    delay1();
    if(PTC16_I==1)
    {
      keyvalue=6;
    }
    while(PTC16_I==1);

  } 
      PTC12_O=0;
    //////////第三行///////////////
  PTC13_O=1;
  
  if(PTC14_I==1)
  {
    delay1();
    if(PTC14_I==1)
    {
      keyvalue=7;
    }
    while(PTC14_I==1);
  } 
  else if(PTC15_I==1)
  {
    delay1();
    if(PTC15_I==1)
    {
      keyvalue=8;
    }
    while(PTC15_I==1);
  } 
  else if(PTC16_I==1)
  {
    delay1();
    if(PTC16_I==1)
    {
      keyvalue=9;
    }
    while(PTC16_I==1);

  } 
      PTC13_O=0;
  return keyvalue;
}

void delay1()
{
  uint16 i, n;
  for(i=0;i<300;i++)
  {
    for(n=0;n<50;n++)
    {
      asm("nop");
    }
  }
}