#ifndef __OV7725_H__
#define __OV7725_H__

extern GPIO_InitTypeDef VSY_init_struct;

void ov7725_init(void);
void VSY_init(void);
void PCLK_init(void);
void IO_init(void);
void DMA_init(void);
void VSY_isr(void);
void DMA_isr(void);
void img_extract(uint8 *dst, uint8 *src, uint32 srclen);
void delay();

void get_img();

#endif 
