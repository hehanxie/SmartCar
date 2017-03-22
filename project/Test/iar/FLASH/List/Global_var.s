///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       19/Jul/2016  11:51:43
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\whstarlit\Desktop\Smart_Car\lib\LPLD\DEV\Global_var.c
//    Command line =  
//        C:\Users\whstarlit\Desktop\Smart_Car\lib\LPLD\DEV\Global_var.c -D
//        LPLD_K60 -D USE_K60D10 -lCN
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\FLASH\List\ -lB
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\FLASH\List\ -o
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\FLASH\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M4 -e --fpu=None --dlib_config
//        D:\IAR\arm\INC\c\DLib_Config_Normal.h -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\app\ -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\CPU\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\common\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\LPLD\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\LPLD\HW\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\LPLD\DEV\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\LPLD\FUNC\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\uCOS-II\Source\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\FatFs\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\FatFs\option\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\USB\common\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\USB\driver\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\USB\descriptor\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\..\..\..\lib\USB\class\
//        -I C:\Users\whstarlit\Desktop\Smart_Car\lib\ -Ol -I
//        D:\IAR\arm\CMSIS\Include\ -D ARM_MATH_CM4
//    List file    =  
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\FLASH\List\Global_var.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC CAR_SPEED_SET
        PUBLIC D
        PUBLIC D_Speed
        PUBLIC D_speed_out
        PUBLIC I_Speed
        PUBLIC I_speed_out
        PUBLIC Img
        PUBLIC Left
        PUBLIC Line1
        PUBLIC Line2
        PUBLIC Line3
        PUBLIC P
        PUBLIC P_Speed
        PUBLIC P_speed_out
        PUBLIC Pix_Data
        PUBLIC Right
        PUBLIC SPEED
        PUBLIC SPEED_CONTROL_PERIOD
        PUBLIC Speed_Car
        PUBLIC Speed_Car_New
        PUBLIC Speed_Car_Old
        PUBLIC Speed_Car_err
        PUBLIC Speed_Control_Max
        PUBLIC Speed_Control_Min
        PUBLIC Speed_Control_Out
        PUBLIC Speed_Control_Period
        PUBLIC absMid
        PUBLIC advanceLine
        PUBLIC angle
        PUBLIC averData
        PUBLIC before_last_ref_speed
        PUBLIC camera_flag
        PUBLIC col1
        PUBLIC col2
        PUBLIC col3
        PUBLIC col4
        PUBLIC countAver
        PUBLIC countBlack
        PUBLIC crossFlag
        PUBLIC crossScale
        PUBLIC curAver
        PUBLIC devAver
        PUBLIC device_id
        PUBLIC dir_speed_radio
        PUBLIC endLine
        PUBLIC index1
        PUBLIC index2
        PUBLIC index3
        PUBLIC index4
        PUBLIC keyValue
        PUBLIC last_ref_speed
        PUBLIC leftDot
        PUBLIC leftMaxAngle
        PUBLIC lostSide
        PUBLIC midAngle
        PUBLIC midDot
        PUBLIC preAver
        PUBLIC ref_speed
        PUBLIC rightDot
        PUBLIC rightMaxAngle
        PUBLIC runwayType
        PUBLIC show_img_flag
        PUBLIC speedCount
        PUBLIC speed_control_integeral
        PUBLIC speed_control_integeral_Max
        PUBLIC speed_control_integeral_Min
        PUBLIC start
        PUBLIC startLine
        PUBLIC sumAverData
        PUBLIC vertical

// C:\Users\whstarlit\Desktop\Smart_Car\lib\LPLD\DEV\Global_var.c
//    1 #include "include.h"
//    2 
//    3 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 uint8 Pix_Data[MAX_ROW*MAX_COL/8];     //采集60行 80列的图像数据  60*80/8;
Pix_Data:
        DS8 600

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    5 uint8 Img[MAX_ROW][MAX_COL];          //解压后的数据
Img:
        DS8 4800

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    6 uint8 camera_flag = 0;                //0表示不可采集，1表示可以采集
camera_flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    7 uint8 show_img_flag = 0;              //0表示不可显示，1表示可以显示
show_img_flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    8 uint8 device_id = 0;
device_id:
        DS8 1
//    9 
//   10 
//   11 
//   12 /*--------------------全局初始变量--------------------*/

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   13 uint8 keyValue = 0;                   //输入键盘的值
keyValue:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   14 float P = 35;
P:
        DATA
        DC32 420C0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   15 float D = 35;
D:
        DATA
        DC32 420C0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   16 int angle = 720;                  //舵机初始化值
angle:
        DATA
        DC32 720

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   17 int leftMaxAngle = 635;           //最大左打角
leftMaxAngle:
        DATA
        DC32 635

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   18 int rightMaxAngle = 815;          //最大右打角
rightMaxAngle:
        DATA
        DC32 815

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   19 int midAngle = 720;               //舵机中点值
midAngle:
        DATA
        DC32 720

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   20 float CAR_SPEED_SET = 100;        //预设速度
CAR_SPEED_SET:
        DATA
        DC32 42C80000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   21 float crossScale = 0.8;           //误差比例
crossScale:
        DATA
        DC32 3F4CCCCDH

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   22 int SPEED = 2000;
SPEED:
        DATA
        DC32 2000
//   23 
//   24 /*-------------速度控制变量-------------*/
//   25  

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   26 uint8 start = 0;
start:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 int speedCount = 0;
speedCount:
        DS8 4
//   28 //uint8 speedFlag = 0;

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   29 float P_Speed = 50;                             //速度控制P   
P_Speed:
        DATA
        DC32 42480000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   30 float I_Speed = 25;                             //速度控制I  
I_Speed:
        DATA
        DC32 41C80000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   31 float D_Speed = 8;                              //速度控制D  
D_Speed:
        DATA
        DC32 41000000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   32 float P_speed_out = 0;                          //速度控制中P的输出量
P_speed_out:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   33 float I_speed_out = 0;                          //速度控制中I的输出量
I_speed_out:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   34 float D_speed_out = 0;                          //速度控制中D的输出量
D_speed_out:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   35 float speed_control_integeral = 0;              //i的积分
speed_control_integeral:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   36 float speed_control_integeral_Max = 10000;      //i的积分最大值
speed_control_integeral_Max:
        DATA
        DC32 461C4000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   37 float speed_control_integeral_Min = -10000;     //i的积分最小值
speed_control_integeral_Min:
        DATA
        DC32 0C61C4000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   38 float dir_speed_radio = 0;                      //微分速度比
dir_speed_radio:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   39 float Speed_Control_Max = 9500;                 //速度控制最大值
Speed_Control_Max:
        DATA
        DC32 46147000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   40 float Speed_Control_Min = -8000;                //速度控制最小值
Speed_Control_Min:
        DATA
        DC32 0C5FA0000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   41 int   Speed_Control_Period = 0;                 //车速控制的周期数
Speed_Control_Period:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   42 float SPEED_CONTROL_PERIOD = 8;  
SPEED_CONTROL_PERIOD:
        DATA
        DC32 41000000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   43 float Speed_Car_Old;                            //旧速度(速度控制PID中用到)
Speed_Car_Old:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   44 float Speed_Car_New = 1000;                            //新速度(速度控制PID中用到)
Speed_Car_New:
        DATA
        DC32 447A0000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   45 float Speed_Car;                                //当前速度
Speed_Car:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   46 float Speed_Control_Out;                        //速度控制输出速度
Speed_Control_Out:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   47 float Speed_Car_err = 0;             
Speed_Car_err:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   48 float ref_speed = 0;                            //加减速 
ref_speed:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   49 float last_ref_speed = 0;                       //过去加减速
last_ref_speed:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   50 float before_last_ref_speed = 0;   
before_last_ref_speed:
        DS8 4
//   51 
//   52 /*----------------------------------------------------------------------*/
//   53 
//   54 
//   55 
//   56 /*-----------扫描图像------------*/
//   57 //图像在该行的最后一个白点

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   58 int leftDot[MAX_ROW];         //左边点位置
leftDot:
        DS8 240

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   59 int rightDot[MAX_ROW];        //右边点位置
rightDot:
        DS8 240

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   60 int midDot[MAX_ROW];          //中点位置
midDot:
        DS8 240

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   61 int countBlack[MAX_ROW];      //黑点个数
countBlack:
        DS8 240

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   62 int absMid = MAX_COL/2 - 6;     //图像中值
absMid:
        DATA
        DC32 34

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   63 int startLine = MAX_ROW-13;    //开始行
startLine:
        DATA
        DC32 47

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   64 int endLine = 20;             //结束行 <= 预判行
endLine:
        DATA
        DC32 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   65 int Left;                     //左赛道边界
Left:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   66 int Right;                    //右赛道边界
Right:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   67 int lostSide = 0;             //赛道哪边丢线
lostSide:
        DS8 4
//   68 
//   69 
//   70 /*------------十字判定------------*/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   71 int vertical[MAX_COL];        //竖直搜点
vertical:
        DS8 320

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   72 int runwayType = 9;           //赛道类型
runwayType:
        DATA
        DC32 9

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   73 int crossFlag = 0;            //十字标志
crossFlag:
        DS8 4
//   74 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   75 int index1 = -1;              //突变点坐标
index1:
        DATA
        DC32 -1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   76 int index2 = -1;
index2:
        DATA
        DC32 -1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   77 int index3 = -1;
index3:
        DATA
        DC32 -1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   78 int index4 = -1;
index4:
        DATA
        DC32 -1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   79 int col1 = -1;
col1:
        DATA
        DC32 -1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   80 int col2 = -1;
col2:
        DATA
        DC32 -1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   81 int col3 = -1;
col3:
        DATA
        DC32 -1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   82 int col4 = -1;
col4:
        DATA
        DC32 -1
//   83 
//   84 /*----------方向控制变量----------*/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   85 int advanceLine = 20;         //预判行
advanceLine:
        DATA
        DC32 20

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   86 int Line1 = 25;               //控制行
Line1:
        DATA
        DC32 25

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   87 int Line2 = 35;
Line2:
        DATA
        DC32 35

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   88 int Line3 = 45;
Line3:
        DATA
        DC32 45
//   89 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   90 int curAver;
curAver:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   91 int devAver;
devAver:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   92 int averData[3] = {0};
averData:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   93 int sumAverData;
sumAverData:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   94 int countAver;
countAver:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   95 int preAver;
preAver:
        DS8 4

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   96         
//   97 
//   98 /*
//   99 //控制变量(面积)
//  100 int line1;                  //三个定行
//  101 int line2;
//  102 int line3;
//  103 int s;                      //当前面积
//  104 int preS;                   //上次面积
//  105 int ctrLine = 35;           
//  106 float deviation = 0;        //两次面积的差
//  107 */
//  108 
//  109 /*----------------------------------------------------------------------*/
//  110 
//  111 
//  112 
//  113 
//  114 
// 
// 6 789 bytes in section .bss
//   136 bytes in section .data
// 
// 6 925 bytes of DATA memory
//
//Errors: none
//Warnings: none
