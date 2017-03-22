#include "common.h"
#include "include.h"

FTM_InitTypeDef motor_init_struct;

void motor_init()
{
  motor_init_struct.FTM_Ftmx=FTM0;
  motor_init_struct.FTM_Mode=FTM_MODE_PWM;
  motor_init_struct.FTM_PwmFreq=25000;
  LPLD_FTM_Init(motor_init_struct);
  LPLD_FTM_PWM_Enable(FTM0,FTM_Ch2,1500,PTC3,ALIGN_LEFT);
  LPLD_FTM_PWM_Enable(FTM0,FTM_Ch3,0,PTC4,ALIGN_LEFT);
}