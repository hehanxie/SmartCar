#ifndef __KEY_H__
#define __KEY_H__

#include "common.h"


#define KEY_PORT      PORTC     //KEY所在的端口 
//#define KEY_ROW1 11
//#define KEY_ROW2 12
//#define KEY_ROW3 13
//#define KEY_COL1 14
//#define KEY_COL2 15
//#define KEY_COL3 16

#define KEY_ROW1 3
#define KEY_ROW2 4
#define KEY_ROW3 5
#define KEY_COL1 6
#define KEY_COL2 7
#define KEY_COL3 8

//按键值枚举
typedef enum
{   
    KEY_NONE  = 0,//表示空的
    KEY_ONE  = 1,    
    KEY_TWO  = 2,
    KEY_THR  = 3,
    KEY_FOU  = 4,
    KEY_FIV  = 5,
    KEY_SIX  = 6, 
    KEY_SEV  = 7,
    KEY_EIG  = 8,
    KEY_NIN  = 9, //第九个按钮

}KEY_Value;
//按键端口号
//typedef enum KEY
//{
//  KEY_ROW1    =  11,              //对应行的引脚号  修改前为 11 12 13
//  KEY_ROW2    =  12,   
//  KEY_ROW3    =  13,
//  KEY_COL1    =  14,           //对应列的引脚号  修改前为 14 15 16
//  KEY_COL2    =  15,
//  KEY_COL3    =  16,
//}KEY;




void Keyboard_init();                    // KEY初始化    函数
void InitGPIOkey_I();
void InitGPIOkey_O();
uint8 key_scan();              //检测key状态

#endif  //__KEY_H__