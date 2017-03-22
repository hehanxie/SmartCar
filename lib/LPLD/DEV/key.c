#include "key.h"


/*************************************************************************
*                           嘉庚学院智能车队
*
*  函数名称：key_init
*  功能说明：初始化key端口，设置行为输出，列为下拉输入
*  参数说明：无
*  函数返回：无
*  修改时间：2015-10-2   已测试
*  备    注：
*************************************************************************/



  GPIO_InitTypeDef InitGPIOKEY1; 
  GPIO_InitTypeDef InitGPIOKEY2;

void Keyboard_init()                                               // KEY初始化 函数
{
     InitGPIOkey_O();
     InitGPIOkey_I();
} 


/*************************************************************************
*                             嘉庚学院智能车队
*
*  函数名称：key_scan
*  功能说明:扫描按键的情况
*  参数说明：无
*  函数返回：被按下的按键键值,不支持两键同时按下
*  修改时间：2015-10-2   已测试
*  备    注：
*************************************************************************/
uint8 key_scan()
{

    uint8 KeyValue =0;//默认没有按键按下
    int i = 0;//初始扫描的端口
//    for(i=11;i<=13;i++)
//    {
//      LPLD_GPIO_Output_b(PTC, i, 1);//设置输出高电平
//      
//      if(LPLD_GPIO_Input_b(PTC, 14)==1)//表示第一列有按键按下
//      {
//        keyValue = 1+(i-11)*3;
//       while(LPLD_GPIO_Input_b(PTC, 14)==1);//等待按键放开
//      }
//      
//      else if(LPLD_GPIO_Input_b(PTC, 15)==1)//表示第二列有按键按下
//      {
//        keyValue = 2+(i-11)*3;
//        while(LPLD_GPIO_Input_b(PTC, 15)==1);//等待按键放开
//      }
//      
//      else if(LPLD_GPIO_Input_b(PTC, 16)==1)//表示第三列有按键按下
//      {
//        keyValue = 3+(i-11)*3;
//        while(LPLD_GPIO_Input_b(PTC, 16)==1);//等待按键放开
//      } 
//     LPLD_GPIO_Output_b(PTC, i, 0);//恢复低电平
//    }//逐行扫描
    
    for(i = 3;i <= 5;i++)
    {
      LPLD_GPIO_Output_b(PTC, i, 1);//设置输出高电平
      
      if(LPLD_GPIO_Input_b(PTC, 6) == 1)//表示第一列有按键按下
      {
        KeyValue = 1 + (i - 3) * 3;
        while(LPLD_GPIO_Input_b(PTC, 6) == 1);//等待按键放开
      }
      
      else if(LPLD_GPIO_Input_b(PTC, 7) == 1)//表示第二列有按键按下
      {
        KeyValue = 2 + (i - 3) * 3;
        while(LPLD_GPIO_Input_b(PTC, 7) == 1);//等待按键放开
      }
      
      else if(LPLD_GPIO_Input_b(PTC, 8) == 1)//表示第三列有按键按下
      {
        KeyValue = 3 + (i - 3) * 3;
        while(LPLD_GPIO_Input_b(PTC, 8) == 1);//等待按键放开
      }
      LPLD_GPIO_Output_b(PTC, i, 0);//恢复低电平
    }//逐行扫描
    return KeyValue;
}


void InitGPIOkey_O()
{
  /*配置结构体的GPIO_PTx变量，选择使用PTD组的PTE引脚
   *配置结构体的GPIO_Pins变量，选择使用编号为E0 -- E6的引脚
   *配置结构体的GPIO_Dir变量，设置PTD的相关引脚方向为输出
   *配置结构体的GPIO_Output变量，设置PTD的相关引脚初始化输出为高电平
   *配置结构体的GPIO_PinControl变量，配置端口的控制模式为禁止中断
   *调用GPIO初始化的库函数，并将初始化结构体变量传入其中，完成初始化*/

//  InitGPIOKEY1.GPIO_PTx = PTC;
//  InitGPIOKEY1.GPIO_Pins = GPIO_Pin11 | GPIO_Pin12 | GPIO_Pin13;
//  InitGPIOKEY1.GPIO_Dir = DIR_OUTPUT;
//  InitGPIOKEY1.GPIO_Output = OUTPUT_L;
//  InitGPIOKEY1.GPIO_PinControl = IRQC_DIS;
//  LPLD_GPIO_Init(InitGPIOKEY1);
  
  
  InitGPIOKEY1.GPIO_PTx = PTC;
  InitGPIOKEY1.GPIO_Pins = GPIO_Pin3 | GPIO_Pin4 | GPIO_Pin5;
  InitGPIOKEY1.GPIO_Dir = DIR_OUTPUT;
  InitGPIOKEY1.GPIO_Output = OUTPUT_L;
  InitGPIOKEY1.GPIO_PinControl = IRQC_DIS;
  LPLD_GPIO_Init(InitGPIOKEY1);
}
void InitGPIOkey_I()
{
  /*配置结构体的GPIO_PTx变量，选择使用PTD组的PTE引脚
   *配置结构体的GPIO_Pins变量，选择使用编号为E0 -- E6的引脚
   *配置结构体的GPIO_Dir变量，设置PTD的相关引脚方向为输入
   *配置结构体的GPIO_PinControl变量，配置端口的控制模式为禁止中断
   *调用GPIO初始化的库函数，并将初始化结构体变量传入其中，完成初始化*/
//  InitGPIOKEY2.GPIO_PTx = PTC;
//  InitGPIOKEY2.GPIO_Pins =GPIO_Pin14 | GPIO_Pin15 | GPIO_Pin16;
//  InitGPIOKEY2.GPIO_Dir = DIR_INPUT;
//  InitGPIOKEY2.GPIO_PinControl = INPUT_PULL_DOWN;
//  LPLD_GPIO_Init(InitGPIOKEY2);
  
  InitGPIOKEY2.GPIO_PTx = PTC;
  InitGPIOKEY2.GPIO_Pins =GPIO_Pin6 | GPIO_Pin7 | GPIO_Pin8;
  
  InitGPIOKEY2.GPIO_Dir = DIR_INPUT;
  InitGPIOKEY2.GPIO_PinControl = INPUT_PULL_DOWN;
  LPLD_GPIO_Init(InitGPIOKEY2);
}

