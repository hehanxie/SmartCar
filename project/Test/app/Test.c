#include "include.h"


void main (void)
{
  init_all();
  while(1)
  {
    keyValue = 0;
    keyValue = key_scan();
   
    changeVar(keyValue);
    
    get_img();
    LED_PrintImage(*Img, 60, 80);
    
    LCD_Write_Float_Dot(0, 0, P, 0);
    LCD_Write_Float_Dot(40, 0, D, 0);
    LCD_Write_Float_Dot(0, 1, index1, 0);
    LCD_Write_Float_Dot(40, 1, index2, 0);
    
    LCD_Write_Float_Dot(88, 0, curAver, 0);
    
    LCD_Write_Float_Dot(88, 3, midDot[Line2], 0);

    
    LCD_Write_Float_Dot(88, 5, crossScale, 1);
    LCD_Write_Float_Dot(88, 6, runwayType, 0);
    LCD_Write_Float_Dot(88, 7, SPEED, 0);
    
//    n++;
//    m = LPLD_FTM_GetCounter(FTM1);
//    if (n >= 3)
//    {
//      LPLD_FTM_ClearCounter(FTM1);
//    }
  } 
}

