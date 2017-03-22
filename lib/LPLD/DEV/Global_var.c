#include "include.h"


uint8 Pix_Data[MAX_ROW*MAX_COL/8];     //采集60行 80列的图像数据  60*80/8;
uint8 Img[MAX_ROW][MAX_COL];          //解压后的数据
uint8 camera_flag = 0;                //0表示不可采集，1表示可以采集
uint8 show_img_flag = 0;              //0表示不可显示，1表示可以显示
uint8 device_id = 0;



/*--------------------全局初始变量--------------------*/
uint8 keyValue = 0;                   //输入键盘的值
float P = 35;
float D = 35;
int angle = 720;                  //舵机初始化值
int leftMaxAngle = 635;           //最大左打角
int rightMaxAngle = 815;          //最大右打角
int midAngle = 720;               //舵机中点值
float CAR_SPEED_SET = 100;        //预设速度
float crossScale = 0.8;           //误差比例
int SPEED = 2000;

/*-------------速度控制变量-------------*/
 
uint8 start = 0;
int speedCount = 0;
//uint8 speedFlag = 0;
float P_Speed = 50;                             //速度控制P   
float I_Speed = 25;                             //速度控制I  
float D_Speed = 8;                              //速度控制D  
float P_speed_out = 0;                          //速度控制中P的输出量
float I_speed_out = 0;                          //速度控制中I的输出量
float D_speed_out = 0;                          //速度控制中D的输出量
float speed_control_integeral = 0;              //i的积分
float speed_control_integeral_Max = 10000;      //i的积分最大值
float speed_control_integeral_Min = -10000;     //i的积分最小值
float dir_speed_radio = 0;                      //微分速度比
float Speed_Control_Max = 9500;                 //速度控制最大值
float Speed_Control_Min = -8000;                //速度控制最小值
int   Speed_Control_Period = 0;                 //车速控制的周期数
float SPEED_CONTROL_PERIOD = 8;  
float Speed_Car_Old;                            //旧速度(速度控制PID中用到)
float Speed_Car_New = 1000;                            //新速度(速度控制PID中用到)
float Speed_Car;                                //当前速度
float Speed_Control_Out;                        //速度控制输出速度
float Speed_Car_err = 0;             
float ref_speed = 0;                            //加减速 
float last_ref_speed = 0;                       //过去加减速
float before_last_ref_speed = 0;   

/*----------------------------------------------------------------------*/



/*-----------扫描图像------------*/
//图像在该行的最后一个白点
int leftDot[MAX_ROW];         //左边点位置
int rightDot[MAX_ROW];        //右边点位置
int midDot[MAX_ROW];          //中点位置
int countBlack[MAX_ROW];      //黑点个数
int absMid = MAX_COL/2 - 6;     //图像中值
int startLine = MAX_ROW-13;    //开始行
int endLine = 20;             //结束行 <= 预判行
int Left;                     //左赛道边界
int Right;                    //右赛道边界
int lostSide = 0;             //赛道哪边丢线


/*------------十字判定------------*/
int vertical[MAX_COL];        //竖直搜点
int runwayType = 9;           //赛道类型
int crossFlag = 0;            //十字标志

int index1 = -1;              //突变点坐标
int index2 = -1;
int index3 = -1;
int index4 = -1;
int col1 = -1;
int col2 = -1;
int col3 = -1;
int col4 = -1;

/*----------方向控制变量----------*/
int advanceLine = 20;         //预判行
int Line1 = 25;               //控制行
int Line2 = 35;
int Line3 = 45;

int curAver;
int devAver;
int averData[3] = {0};
int sumAverData;
int countAver;
int preAver;
        

/*
//控制变量(面积)
int line1;                  //三个定行
int line2;
int line3;
int s;                      //当前面积
int preS;                   //上次面积
int ctrLine = 35;           
float deviation = 0;        //两次面积的差
*/

/*----------------------------------------------------------------------*/





