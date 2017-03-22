/*
 * --------------基于"拉普兰德K60底层库V3"的工程（SX）-----------------
 * @file SX.c
 * @version 0.0
 * @date 2015-12-14
 * @brief 关于该工程的描述
 */
#include "include.h"

uint8 key=0;

void main (void)
{
  init_all();
  while(1)
  {
    
    

    get_img();
    
    
    
          for(uint8 y=59;y>19;y--)
   {
     Img[y][Center_Line[y]]=0;
     Img[y][Left_Line[y]]=0;
     Img[y][Right_Line[y]]=0;
   }
    
    
    
    LED_PrintImage(*Img, 60, 80);
    
    
//    for(uint8 i=0;i<30;i++)
//      LCD_PutPixel(i,39); 
    //键盘部分
    key=key_scan();
    if(key==1)
    {
      steering_p=steering_p+1;
    }
    else if(key==2)
    {
      steering_p=steering_p-1;
    }
        else if(key==4)
    {
      steering_p=steering_d+0.1;
    }
        else if(key==5)
    {
      steering_p=steering_d-0.1;
    }
    
    
    
 
    //显示部分
   LCD_Write_Float_Dot(85,5,steering_p,2);
    LCD_Write_Float_Dot(85,6,steering_out,2);
   
//    
//    int a=0;
//    for(int i=9;i>=0;i--)
//    {
//          LCD_Write_Float_Dot(85,a,left[i],0);
//          LCD_Write_Float_Dot(100,a,right[i],0);
//          a++;
//    }
  } 
}

