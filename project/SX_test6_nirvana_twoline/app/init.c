#include "include.h"

void init_all()
{
  DisableInterrupts;
  
  LCD_Init();
  steering_init();
  motor_init();
  key_init();

  VSY_init();
  PCLK_init();
  DMA_init();
  IO_init();
  ov7725_init();
  //LPLD_SCCB_ReadReg(0x1C, &device_id, 1);
  //device_id=GY_ReadByte(0x1C);
  SCCB_ReadByte(&device_id,1,OV7725_COM4);
  //LPLD_GPIO_EnableIrq(VSY_init_struct);
  EnableInterrupts;
}
