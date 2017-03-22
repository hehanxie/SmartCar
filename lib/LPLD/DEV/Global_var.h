#ifndef __GLOBAL_VAR_H__
#define __GLOBAL_VAR_H__


extern uint8 Pix_Data[MAX_ROW*MAX_COL/8];
extern uint8 Img[MAX_ROW][MAX_COL];

extern uint8 camera_flag;  
extern uint8 show_img_flag;
extern uint8 device_id;

/*--------------------全局初始变量--------------------*/
extern uint8 keyValue;            //输入键盘的值
extern float P;
extern float D;
extern int angle;                        //舵机初始化值
extern int leftMaxAngle;                 //最大左打角
extern int rightMaxAngle;                //最大右打角
extern int midAngle;                     //舵机中点值
extern int absMid;                       //赛道实际中点值
extern float CAR_SPEED_SET;              //预设速度
extern float crossScale;                 //误差比例
extern int SPEED;
 
/*-------------速度控制变量-------------*/
  
extern uint8 start;
extern int speedCount;
extern uint8 speedFlag;
extern float P_Speed;                                   //速度控制P   
extern float I_Speed;                                   //速度控制I  
extern float D_Speed;                                   //速度控制D  
extern float P_speed_out;                               //速度控制中P的输出量
extern float I_speed_out;                               //速度控制中I的输出量
extern float D_speed_out;                               //速度控制中D的输出量
extern float speed_control_integeral;                   //i的积分
extern float speed_control_integeral_Max;               //i的积分最大值
extern float speed_control_integeral_Min;               //i的积分最小值
extern float dir_speed_radio;                           //微分速度比
extern float Speed_Control_Max;                         //速度控制最大值
extern float Speed_Control_Min;                         //速度控制最小值
extern int   Speed_Control_Period;                      //车速控制的周期数
extern float SPEED_CONTROL_PERIOD;  
extern float Speed_Car_Old;                             //旧速度(速度控制PID中用到)
extern float Speed_Car_New;                             //新速度(速度控制PID中用到)
extern float Speed_Car;                                 //当前速度
extern float Speed_Control_Out;                         //速度控制输出速度
extern float Speed_Car_err;             
extern float ref_speed;                                 //加减速 
extern float last_ref_speed;                            //过去加减速
extern float before_last_ref_speed;   
 
/*----------------------------------------------------------------------*/
 
 
 
/*-----------扫描图像------------*/
//图像在该行的最后一个白点
extern int leftDot[MAX_ROW];          //左边点位置
extern int rightDot[MAX_ROW];         //右边点位置
extern int midDot[MAX_ROW];           //中点位置
extern int countBlack[MAX_ROW];       //黑点个数
extern int absMid;                    //图像中值
extern int startLine;                 //开始行
extern int endLine;                   //结束行
extern int Left;                      //左赛道边界
extern int Right;                     //右赛道边界
extern int lostSide;                  //赛道哪边丢线
 
 
/*------------十字判定------------*/
extern int vertical[MAX_COL];       //竖直搜点
extern int runwayType;              //赛道类型
extern int crossFlag;               //十字标志
extern int advanceLineStart;        //十字判定开始行
extern int advanceLineEnd;          //结束行
 
extern int index1;                  //突变点坐标
extern int index2;
extern int index3;
extern int index4;
extern int col1;
extern int col2;
extern int col3;
extern int col4;
 
 
/*----------方向控制变量----------*/
extern int advanceLine;         //预判行
extern int Line1;               //控制行
extern int Line2;
extern int Line3;

extern int curAver;
extern int devAver;
extern int averData[3];
extern int sumAverData;
extern int countAver;
extern int preAver;


 
 //拟合控制
extern float a_x;
extern float b_x;
extern float c_x;
extern float xxl;
extern float a_x1;
extern float b_x1;
extern float c_x1;
extern float a_x2;
extern float b_x2;
extern float c_x2;
extern int index[MAX_ROW];         

//控制变量(面积)
/*
extern int line1;                  //三个定行
extern int line2;
extern int line3;
extern int s;                      //当前面积
extern int preS;                   //上次面积
extern int ctrLine = 35;           
extern float deviation = 0;        //两次面积的差
*/

/*----------------------------------------------------------------------*/



//十字处理
typedef enum
{
    IMG_NOTINIT = 0,
    IMG_FINISH,                     //图像采集完毕
    IMG_FAIL,                       //图像采集失败(采集行数少了)
    IMG_GATHER,                     //图像采集中
    IMG_START,                      //开始采集图像
    IMG_STOP,                       //禁止图像采集
} IMG_STATUS_e;


#endif 