///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       22/Dec/2015  18:54:50
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\app\Global_var.c
//    Command line =  
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\app\Global_var.c
//        -D LPLD_K60 -D USE_K60D10 -lCN
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\RAM\List\
//        -lB
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\RAM\List\
//        -o
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\RAM\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M4 -e --fpu=None --dlib_config "C:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\app\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\CPU\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\common\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\LPLD\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\LPLD\HW\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\LPLD\DEV\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\LPLD\FUNC\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\uCOS-II\Source\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\FatFs\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\FatFs\option\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\USB\common\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\USB\driver\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\USB\descriptor\
//        -I
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\..\..\..\lib\USB\class\
//        -Ol -I "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\" -D ARM_MATH_CM4
//    List file    =  
//        C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\iar\RAM\List\Global_var.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC Img
        PUBLIC Img_prve
        PUBLIC Pix_Data
        PUBLIC camera_flag
        PUBLIC device_id
        PUBLIC pixel_left
        PUBLIC pixel_right
        PUBLIC show_img_flag
        PUBLIC steering_err
        PUBLIC steering_left
        PUBLIC steering_middle
        PUBLIC steering_p
        PUBLIC steering_right
        PUBLIC sterring_out

// C:\Users\a3910\Desktop\Freescale\K60_LPLD\LPLD_OSKinetis_V3\project\SX_test4\app\Global_var.c
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
//    5 uint8 Img[60][80];           //解压后的数据
Img:
        DS8 4800

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    6 uint8 Img_prve[60][80];     //上一帧
Img_prve:
        DS8 4800

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    7 uint8 camera_flag = 0;         //0表示不可采集，1表示可以采集
camera_flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    8 uint8 show_img_flag = 0;       //0表示不可显示，1表示可以显示
show_img_flag:
        DS8 1
//    9 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 int pixel_left;
pixel_left:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 int pixel_right;
pixel_right:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 float steering_err = 0;
steering_err:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   13 float steering_p = 10;
steering_p:
        DATA
        DC32 41200000H
//   14 
//   15 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   16 int steering_middle = 775;
steering_middle:
        DATA
        DC32 775

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   17 int steering_left = 565;
steering_left:
        DATA
        DC32 565

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   18 int steering_right = 955;
steering_right:
        DATA
        DC32 955

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   19 float sterring_out = 775;
sterring_out:
        DATA
        DC32 4441C000H

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   20 
// 
// 10 215 bytes in section .bss
//     20 bytes in section .data
// 
// 10 235 bytes of DATA memory
//
//Errors: none
//Warnings: none
