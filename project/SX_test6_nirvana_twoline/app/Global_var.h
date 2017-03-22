#ifndef __GLOBAL_VAR_H__
#define __GLOBAL_VAR_H__

typedef enum
{
    IMG_NOTINIT = 0,
    IMG_FINISH,             //图像采集完毕
    IMG_FAIL,               //图像采集失败(采集行数少了)
    IMG_GATHER,             //图像采集中
    IMG_START,              //开始采集图像
    IMG_STOP,               //禁止图像采集
} IMG_STATUS_e;

extern uint8 device_id;
extern uint8 Pix_Data[600];
extern uint8 Pix_Data_prev[600];   
extern uint8 Img[60][80];

extern uint8 Img_prve[60][80];


extern uint8 camera_flag;  
extern uint8 show_img_flag;
extern int pixchange_flag;

extern int pixel_left;
extern int pixel_right;
extern float steering_err;
extern float steering_errprev;
extern float steering_p;
extern float steering_d ;


extern int steering_middle;
extern int steering_left;
extern int steering_right;
extern float steering_out;


extern int Left_Line[60];
extern int Right_Line[60];
extern int Center_Line[60];

extern uint8 turn_right;
extern uint8 turn_left;

#endif 