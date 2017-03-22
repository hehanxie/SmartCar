///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       12/Jul/2016  22:02:52
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\app\Global_var.c
//    Command line =  
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\app\Global_var.c
//        -D LPLD_K60 -D USE_K60D10 -lCN
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\FLASH\List\
//        -lB
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\FLASH\List\
//        -o
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\FLASH\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M4 -e --fpu=None --dlib_config
//        D:\IAR\arm\INC\c\DLib_Config_Normal.h -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\app\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\CPU\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\common\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\LPLD\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\LPLD\HW\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\LPLD\DEV\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\LPLD\FUNC\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\uCOS-II\Source\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\FatFs\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\FatFs\option\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\USB\common\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\USB\driver\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\USB\descriptor\
//        -I
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\..\..\..\lib\USB\class\
//        -Ol -I D:\IAR\arm\CMSIS\Include\ -D ARM_MATH_CM4
//    List file    =  
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\FLASH\List\Global_var.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC Center_Line
        PUBLIC Img
        PUBLIC Img_current
        PUBLIC Img_prve
        PUBLIC Left_Line
        PUBLIC Pix_Data
        PUBLIC Pix_Data_prev
        PUBLIC Right_Line
        PUBLIC camera_flag
        PUBLIC device_id
        PUBLIC pixchange_flag
        PUBLIC pixel_left
        PUBLIC pixel_right
        PUBLIC prev_mid
        PUBLIC show_img_flag
        PUBLIC steering_d
        PUBLIC steering_err
        PUBLIC steering_errprev
        PUBLIC steering_left
        PUBLIC steering_middle
        PUBLIC steering_out
        PUBLIC steering_p
        PUBLIC steering_right
        PUBLIC turn_left
        PUBLIC turn_right

// C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\app\Global_var.c
//    1 #include "include.h"
//    2 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    3 uint8 device_id = 0;
device_id:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 uint8 Pix_Data[600];       //采集60行 80列的图像数据
Pix_Data:
        DS8 600

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    5 uint8 Pix_Data_prev[600];       //采集60行 80列的图像数据
Pix_Data_prev:
        DS8 600
//    6 
//    7 
//    8 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 uint8 Img[60][80];           //解压后的数据
Img:
        DS8 4800

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 uint8 Img_prve[60][80];     //上一帧
Img_prve:
        DS8 4800

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 uint8 Img_current[60][80]; //当前帧
Img_current:
        DS8 4800

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   12 uint8 camera_flag = 0;         //0表示不可采集，1表示可以采集
camera_flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   13 uint8 show_img_flag = 0;       //0表示不可显示，1表示可以显示
show_img_flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 int pixchange_flag=0;
pixchange_flag:
        DS8 4
//   15 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16 int pixel_left;
pixel_left:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17 int pixel_right;
pixel_right:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   18 float steering_err = 0;
steering_err:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 float steering_errprev=0;
steering_errprev:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   20 float steering_p = 20;
steering_p:
        DATA
        DC32 41A00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   21 float steering_d = 20;
steering_d:
        DATA
        DC32 41A00000H
//   22 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   23 int steering_middle = 775
steering_middle:
        DATA
        DC32 775
//   24 ;

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   25 int steering_left = 565;
steering_left:
        DATA
        DC32 565

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   26 int steering_right = 955;
steering_right:
        DATA
        DC32 955

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   27 float steering_out = 775;
steering_out:
        DATA
        DC32 4441C000H
//   28 
//   29 
//   30 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   31 int Left_Line[60];
Left_Line:
        DS8 240

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   32 int Right_Line[60];
Right_Line:
        DS8 240

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   33 int Center_Line[60];
Center_Line:
        DS8 240
//   34 
//   35 
//   36 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   37 uint8 turn_right=0;
turn_right:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   38 uint8 turn_left=0;
turn_left:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   39 uint8 prev_mid=40;
prev_mid:
        DATA
        DC8 40

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   40 
// 
// 16 345 bytes in section .bss
//     25 bytes in section .data
// 
// 16 370 bytes of DATA memory
//
//Errors: none
//Warnings: none
