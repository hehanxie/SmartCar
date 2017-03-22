///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       12/Jul/2016  22:03:02
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\app\Steering_Control.c
//    Command line =  
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\app\Steering_Control.c
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
//        C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\iar\FLASH\List\Steering_Control.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Center_Line
        EXTERN Img
        EXTERN LCD_Write_Float_Dot
        EXTERN LPLD_FTM_Init
        EXTERN LPLD_FTM_PWM_ChangeDuty
        EXTERN LPLD_FTM_PWM_Enable
        EXTERN Left_Line
        EXTERN Right_Line
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN __aeabi_memcpy4
        EXTERN steering_left
        EXTERN steering_middle
        EXTERN steering_out
        EXTERN steering_p
        EXTERN steering_right
        EXTERN turn_left
        EXTERN turn_right

        PUBLIC D_value
        PUBLIC D_value_old
        PUBLIC Left_Valid
        PUBLIC Left_flag
        PUBLIC Left_turnmax
        PUBLIC Right_Valid
        PUBLIC Right_flag
        PUBLIC Right_turnmax
        PUBLIC last_turn
        PUBLIC m_abs
        PUBLIC search_line
        PUBLIC steering_control
        PUBLIC steering_init
        PUBLIC steering_init_struct
        PUBLIC straight_cross
        PUBLIC turn
        PUBLIC turn1
        PUBLIC turn2

// C:\Users\whstarlit\Desktop\Smart_Car\project\SX_test6_nirvana_twoline\app\Steering_Control.c
//    1 #include "include.h"
//    2 /*后来加的变量*/
//    3 #define white 255
//    4 #define black 0
//    5 
//    6 
//    7 #define ROW_MAX 60
//    8 #define COL_MAX 80
//    9 
//   10 /* 80*60
//   11 */
//   12 
//   13 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 uint8 Left_Valid[ROW_MAX];
Left_Valid:
        DS8 60

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   15 uint8 Right_Valid[ROW_MAX];
Right_Valid:
        DS8 60
//   16 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   17 uint8 Left_turnmax=0;
Left_turnmax:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   18 uint8 Right_turnmax=0;
Right_turnmax:
        DS8 1
//   19 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   20 uint8 straight_cross=0;
straight_cross:
        DS8 1
//   21 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   22 uint8 Left_flag=0,Right_flag=0;
Left_flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
Right_flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   23 int turn=0;
turn:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   24 int turn1=0;
turn1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25 int turn2=0;
turn2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   26 int last_turn=0;
last_turn:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 int D_value=0;
D_value:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 int D_value_old=0;
D_value_old:
        DS8 4
//   29 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   30 FTM_InitTypeDef steering_init_struct;
steering_init_struct:
        DS8 28
//   31 uint8 m_abs(int m);
//   32 void  search_line(void);
//   33 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   34 void steering_init()
//   35 {
steering_init:
        PUSH     {R5-R7,LR}
//   36   steering_init_struct.FTM_Ftmx = FTM2;	
        LDR.W    R0,??DataTable2  ;; 0x400b8000
        LDR.W    R1,??DataTable2_1
        STR      R0,[R1, #+0]
//   37   steering_init_struct.FTM_Mode = FTM_MODE_PWM;	
        MOVS     R0,#+1
        LDR.W    R1,??DataTable2_1
        STRB     R0,[R1, #+4]
//   38   steering_init_struct.FTM_PwmFreq = 50;
        MOVS     R0,#+50
        LDR.W    R1,??DataTable2_1
        STR      R0,[R1, #+8]
//   39   
//   40   LPLD_FTM_Init(steering_init_struct);
        LDR.W    R1,??DataTable2_1
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+28
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_FTM_Init
//   41   
//   42   LPLD_FTM_PWM_Enable(FTM2, 
//   43                       FTM_Ch1, 
//   44                       steering_middle,  
//   45                       PTB19, 
//   46                       ALIGN_LEFT       
//   47                         );  
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        MOVS     R3,#+51
        LDR.W    R0,??DataTable2_2
        LDR      R2,[R0, #+0]
        MOVS     R1,#+1
        LDR.W    R0,??DataTable2  ;; 0x400b8000
        BL       LPLD_FTM_PWM_Enable
//   48 }
        POP      {R0-R2,PC}       ;; return
//   49 
//   50 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   51 void steering_control(void)
//   52 {
steering_control:
        PUSH     {R3-R5,LR}
//   53   search_line();
        BL       search_line
//   54   
//   55   
//   56   last_turn=turn;
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_4
        STR      R0,[R1, #+0]
//   57   turn1=Center_Line[39]-40;
        LDR.W    R0,??DataTable2_5
        LDR      R0,[R0, #+156]
        SUBS     R0,R0,#+40
        LDR.W    R1,??DataTable2_6
        STR      R0,[R1, #+0]
//   58   turn2=Center_Line[30]-40;
        LDR.W    R0,??DataTable2_5
        LDR      R0,[R0, #+120]
        SUBS     R0,R0,#+40
        LDR.W    R1,??DataTable2_7
        STR      R0,[R1, #+0]
//   59   turn=(turn1*8+turn2*2)/10;
        LDR.W    R0,??DataTable2_6
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_7
        LDR      R1,[R1, #+0]
        LSLS     R1,R1,#+1
        ADDS     R0,R1,R0, LSL #+3
        MOVS     R1,#+10
        SDIV     R0,R0,R1
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
//   60   
//   61   D_value=(-turn);
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        RSBS     R0,R0,#+0
        LDR.W    R1,??DataTable2_8
        STR      R0,[R1, #+0]
//   62   
//   63   if(turn_left&&turn_right)
        LDR.W    R0,??DataTable2_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??steering_control_0
        LDR.W    R0,??DataTable2_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??steering_control_0
//   64   steering_out=steering_middle-(D_value*(steering_p+20));//+(D_value-D_value_old*steering_d));
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R4,R0
        LDR.W    R0,??DataTable2_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R5,R0
        LDR.W    R0,??DataTable2_11
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable2_12  ;; 0x41a00000
        BL       __aeabi_fadd
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable2_13
        STR      R0,[R1, #+0]
        B.N      ??steering_control_1
//   65   
//   66   else
//   67      steering_out=steering_middle-(D_value*(steering_p));//+(D_value-D_value_old*steering_d));
??steering_control_0:
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R4,R0
        LDR.W    R0,??DataTable2_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.W    R1,??DataTable2_11
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable2_13
        STR      R0,[R1, #+0]
//   68   
//   69   
//   70    if(steering_out<=steering_left)
??steering_control_1:
        LDR.W    R0,??DataTable2_14
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.W    R1,??DataTable2_13
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfrcmple
        BHI.N    ??steering_control_2
//   71   {steering_out = steering_left;}
        LDR.W    R0,??DataTable2_14
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.W    R1,??DataTable2_13
        STR      R0,[R1, #+0]
//   72   if(steering_out>=steering_right)
??steering_control_2:
        LDR.W    R0,??DataTable2_15
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR.W    R0,??DataTable2_13
        LDR      R0,[R0, #+0]
        BL       __aeabi_cfrcmple
        BHI.N    ??steering_control_3
//   73   {steering_out = steering_right;}
        LDR.W    R0,??DataTable2_15
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.W    R1,??DataTable2_13
        STR      R0,[R1, #+0]
//   74    LCD_Write_Float_Dot(85,0,turn,2);
??steering_control_3:
        MOVS     R3,#+2
        MOVS     R4,R3
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R2,R0
        MOVS     R3,R4
        MOVS     R1,#+0
        MOVS     R0,#+85
        BL       LCD_Write_Float_Dot
//   75    
//   76    
//   77  LCD_Write_Float_Dot(108,2,Right_Line[30],0);
        MOVS     R3,#+0
        MOVS     R4,R3
        LDR.W    R0,??DataTable2_16
        LDR      R0,[R0, #+120]
        BL       __aeabi_i2f
        MOVS     R2,R0
        MOVS     R3,R4
        MOVS     R1,#+2
        MOVS     R0,#+108
        BL       LCD_Write_Float_Dot
//   78  LCD_Write_Float_Dot(85,2,Left_Line[30],0);
        MOVS     R3,#+0
        MOVS     R4,R3
        LDR.W    R0,??DataTable2_17
        LDR      R0,[R0, #+120]
        BL       __aeabi_i2f
        MOVS     R2,R0
        MOVS     R3,R4
        MOVS     R1,#+2
        MOVS     R0,#+85
        BL       LCD_Write_Float_Dot
//   79  
//   80     LCD_Write_Float_Dot(108,3,Right_Line[39],0);
        MOVS     R3,#+0
        MOVS     R4,R3
        LDR.W    R0,??DataTable2_16
        LDR      R0,[R0, #+156]
        BL       __aeabi_i2f
        MOVS     R2,R0
        MOVS     R3,R4
        MOVS     R1,#+3
        MOVS     R0,#+108
        BL       LCD_Write_Float_Dot
//   81   LCD_Write_Float_Dot(85,3,Left_Line[39],0);
        MOVS     R3,#+0
        MOVS     R4,R3
        LDR.W    R0,??DataTable2_17
        LDR      R0,[R0, #+156]
        BL       __aeabi_i2f
        MOVS     R2,R0
        MOVS     R3,R4
        MOVS     R1,#+3
        MOVS     R0,#+85
        BL       LCD_Write_Float_Dot
//   82   
//   83 //  for(uint8 i=59;i>19;i--)
//   84 //  {
//   85 //    LCD_PutPixel(i,Center_Line[i]); 
//   86 //    LCD_PutPixel(i,Left_Line[i]); 
//   87 //    LCD_PutPixel(i,Right_Line[i]); 
//   88 //  }
//   89    //   steering_err=40-(right[8]+left[8])/2;
//   90   LPLD_FTM_PWM_ChangeDuty(FTM2, FTM_Ch1, (int)steering_out);
        LDR.W    R0,??DataTable2_13
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        MOVS     R2,R0
        MOVS     R1,#+1
        LDR.W    R0,??DataTable2  ;; 0x400b8000
        BL       LPLD_FTM_PWM_ChangeDuty
//   91   
//   92   
//   93   turn_right=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_10
        STRB     R0,[R1, #+0]
//   94   turn_left=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_9
        STRB     R0,[R1, #+0]
//   95 straight_cross=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_18
        STRB     R0,[R1, #+0]
//   96 }
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   97 void  search_line(void)
//   98 {
search_line:
        PUSH     {R3-R11,LR}
//   99 
//  100   uint8 max_row=0;
        MOVS     R0,#+0
//  101   uint8 cross_flag=0;
        MOVS     R1,#+0
//  102 
//  103   
//  104   for(uint8 y=59;y>19;y--)
        MOVS     R0,#+59
        B.N      ??search_line_0
//  105   {
//  106     
//  107     Left_flag=0;
//  108     Right_flag=0;
//  109     
//  110     Left_Line[y]=1;//初始化左黑线为1
//  111     Right_Line[y]=78;//初始化右黑线为1
//  112     //左
//  113     for(uint8 xl=40;xl>1;xl--)
//  114     {
//  115       if(Img[y][xl]==white&&Img[y][xl-2]==black)
//  116       {
//  117         Left_Line[y]=xl+2;
//  118         Left_flag=1;
//  119         break;
//  120       }
//  121     
//  122     }
//  123     
//  124 
//  125     //右
//  126     for(uint8 xr=40;xr<78;xr++)
//  127     {
//  128       if(Img[y][xr]==white&&Img[y][xr+2]==black)
//  129       {
//  130         Right_Line[y]=xr-2;
//  131         Right_flag=1;
//  132         break;
//  133       }
//  134     }
//  135     
//  136     if(y>56)
//  137     {
//  138       if(!Right_flag&&!Left_flag)
//  139         cross_flag=1;
//  140     }
//  141     
//  142    if(Right_flag&&Left_flag)
//  143      Center_Line[y]=(Right_Line[y]+Left_Line[y])/2;
//  144     
//  145       // else if(!Right_flag&&!Left_flag)//直入十字
//  146     else if(Right_Line[y]-Left_Line[y]>60)
//  147    {
//  148      straight_cross++;
//  149    }
//  150     
//  151    else if(!Left_flag&&Right_flag&&!straight_cross)//左转
//  152    {
//  153      Center_Line[y]=Right_Line[y]-(Right_Line[y+1]-Center_Line[y+1]);
//  154      turn_left=1;
//  155    }
//  156    else if(Left_flag&&!Right_flag&&!straight_cross)//右转
??search_line_1:
        LDR.W    R1,??DataTable2_19
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??search_line_2
        LDR.W    R1,??DataTable2_20
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE.N    ??search_line_2
        LDR.W    R1,??DataTable2_18
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE.N    ??search_line_2
//  157    {
//  158      Center_Line[y]=Left_Line[y]+(Center_Line[y+1]-Left_Line[y+1]);
        LDR.W    R1,??DataTable2_17
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R1,[R1, R0, LSL #+2]
        LDR.W    R2,??DataTable2_5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R2,R0, LSL #+2
        LDR      R2,[R2, #+4]
        ADDS     R1,R2,R1
        LDR.W    R2,??DataTable2_17
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R2,R0, LSL #+2
        LDR      R2,[R2, #+4]
        SUBS     R1,R1,R2
        LDR.W    R2,??DataTable2_5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R1,[R2, R0, LSL #+2]
//  159      turn_right=1;
        MOVS     R1,#+1
        LDR.W    R2,??DataTable2_10
        STRB     R1,[R2, #+0]
//  160    }
??search_line_2:
        SUBS     R0,R0,#+1
??search_line_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+20
        BLT.W    ??search_line_3
        MOVS     R1,#+0
        LDR.W    R2,??DataTable2_19
        STRB     R1,[R2, #+0]
        MOVS     R1,#+0
        LDR.W    R2,??DataTable2_20
        STRB     R1,[R2, #+0]
        MOVS     R1,#+1
        LDR.W    R2,??DataTable2_17
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R1,[R2, R0, LSL #+2]
        MOVS     R1,#+78
        LDR.W    R2,??DataTable2_16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R1,[R2, R0, LSL #+2]
        MOVS     R1,#+40
        B.N      ??search_line_4
??search_line_5:
        SUBS     R1,R1,#+1
??search_line_4:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+2
        BLT.N    ??search_line_6
        LDR.W    R2,??DataTable2_21
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R3,#+80
        MLA      R2,R3,R0,R2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDRB     R2,[R1, R2]
        CMP      R2,#+255
        BNE.N    ??search_line_5
        LDR.N    R2,??DataTable2_21
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R3,#+80
        MLA      R2,R3,R0,R2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R2,R1,R2
        LDRB     R2,[R2, #-2]
        CMP      R2,#+0
        BNE.N    ??search_line_5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R1,R1,#+2
        LDR.N    R2,??DataTable2_17
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R1,[R2, R0, LSL #+2]
        MOVS     R1,#+1
        LDR.N    R2,??DataTable2_19
        STRB     R1,[R2, #+0]
??search_line_6:
        MOVS     R1,#+40
        B.N      ??search_line_7
??search_line_8:
        ADDS     R1,R1,#+1
??search_line_7:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+78
        BGE.N    ??search_line_9
        LDR.N    R2,??DataTable2_21
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R3,#+80
        MLA      R2,R3,R0,R2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDRB     R2,[R1, R2]
        CMP      R2,#+255
        BNE.N    ??search_line_8
        LDR.N    R2,??DataTable2_21
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R3,#+80
        MLA      R2,R3,R0,R2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R2,R1,R2
        LDRB     R2,[R2, #+2]
        CMP      R2,#+0
        BNE.N    ??search_line_8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R1,R1,#+2
        LDR.N    R2,??DataTable2_16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R1,[R2, R0, LSL #+2]
        MOVS     R1,#+1
        LDR.N    R2,??DataTable2_20
        STRB     R1,[R2, #+0]
??search_line_9:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+57
        BLT.N    ??search_line_10
        LDR.N    R1,??DataTable2_20
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE.N    ??search_line_10
        LDR.N    R1,??DataTable2_19
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE.N    ??search_line_10
        MOVS     R1,#+1
??search_line_10:
        LDR.N    R1,??DataTable2_20
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??search_line_11
        LDR.N    R1,??DataTable2_19
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??search_line_11
        LDR.N    R1,??DataTable2_16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R1,[R1, R0, LSL #+2]
        LDR.N    R2,??DataTable2_17
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        ADDS     R1,R2,R1
        MOVS     R2,#+2
        SDIV     R1,R1,R2
        LDR.N    R2,??DataTable2_5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R1,[R2, R0, LSL #+2]
        B.N      ??search_line_2
??search_line_11:
        LDR.N    R1,??DataTable2_16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R1,[R1, R0, LSL #+2]
        LDR.N    R2,??DataTable2_17
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        SUBS     R1,R1,R2
        CMP      R1,#+61
        BLT.N    ??search_line_12
        LDR.N    R1,??DataTable2_18
        LDRB     R1,[R1, #+0]
        ADDS     R1,R1,#+1
        LDR.N    R2,??DataTable2_18
        STRB     R1,[R2, #+0]
        B.N      ??search_line_2
??search_line_12:
        LDR.N    R1,??DataTable2_19
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE.W    ??search_line_1
        LDR.N    R1,??DataTable2_20
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.W    ??search_line_1
        LDR.N    R1,??DataTable2_18
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE.W    ??search_line_1
        LDR.N    R1,??DataTable2_16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R1,[R1, R0, LSL #+2]
        LDR.N    R2,??DataTable2_16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R2,R0, LSL #+2
        LDR      R2,[R2, #+4]
        SUBS     R1,R1,R2
        LDR.N    R2,??DataTable2_5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R2,R0, LSL #+2
        LDR      R2,[R2, #+4]
        ADDS     R1,R2,R1
        LDR.N    R2,??DataTable2_5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R1,[R2, R0, LSL #+2]
        MOVS     R1,#+1
        LDR.N    R2,??DataTable2_9
        STRB     R1,[R2, #+0]
        B.N      ??search_line_2
//  161 
//  162    
//  163    
//  164    
//  165 
//  166   }
//  167   
//  168   
//  169   if(straight_cross>3)
??search_line_3:
        LDR.N    R0,??DataTable2_18
        LDRB     R0,[R0, #+0]
        CMP      R0,#+4
        BLT.W    ??search_line_13
//  170   {
//  171      uint8 x1=0,y1=0;
        MOVS     R4,#+0
        MOVS     R5,#+0
//  172      uint8 x2=0,y2=0;
        MOVS     R6,#+0
        MOVS     R7,#+0
//  173      uint8 x3=0,y3=0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+2]
        MOVS     R8,#+0
//  174      uint8 x4=0,y4=0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  175      uint8 fLeft_Flag=0;
        MOVS     R9,#+0
//  176      uint8 fRight_Flag=0;
        MOVS     R10,#+0
//  177      uint8 mid=0;
        MOVS     R0,#+0
//  178      
//  179      float k1,k2;
//  180      for(uint8 i=59;i>19;i=i-5)
        MOVS     R11,#+59
        B.N      ??search_line_14
//  181      {
//  182        if((m_abs(Left_Line[i+1]-Left_Line[i]))>5)
//  183        {
//  184          x1=Left_Line[i+1];
??search_line_15:
        LDR.N    R0,??DataTable2_17
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        ADDS     R0,R0,R11, LSL #+2
        LDR      R4,[R0, #+4]
//  185          y1=i;
        MOV      R5,R11
//  186          fLeft_Flag=1;
        MOVS     R9,#+1
//  187        }
??search_line_16:
        SUBS     R11,R11,#+5
??search_line_14:
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+20
        BLT.N    ??search_line_17
        LDR.N    R0,??DataTable2_17
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        ADDS     R0,R0,R11, LSL #+2
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable2_17
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        LDR      R1,[R1, R11, LSL #+2]
        SUBS     R0,R0,R1
        BL       m_abs
        CMP      R0,#+6
        BGE.N    ??search_line_15
//  188        
//  189        else if((Right_Line[i]-Right_Line[i+1])>15)
        LDR.N    R0,??DataTable2_16
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        LDR      R0,[R0, R11, LSL #+2]
        LDR.N    R1,??DataTable2_16
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        ADDS     R1,R1,R11, LSL #+2
        LDR      R1,[R1, #+4]
        SUBS     R0,R0,R1
        CMP      R0,#+16
        BLT.N    ??search_line_18
//  190        {
//  191          x2=Right_Line[i+1];
        LDR.N    R0,??DataTable2_16
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        ADDS     R0,R0,R11, LSL #+2
        LDR      R6,[R0, #+4]
//  192          y2=i;
        MOV      R7,R11
//  193          fRight_Flag=1;
        MOVS     R10,#+1
        B.N      ??search_line_16
//  194        }
//  195        else if(fLeft_Flag&&fRight_Flag)
??search_line_18:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BEQ.N    ??search_line_16
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+0
        BEQ.N    ??search_line_16
//  196         break;       
//  197      }
//  198      
//  199      fLeft_Flag=0;     
??search_line_17:
        MOVS     R9,#+0
//  200      fRight_Flag=0;
        MOVS     R10,#+0
//  201      
//  202      if(y1>=y2)//左下点y1比右下点y2 低 
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R5,R7
        BCC.N    ??search_line_19
//  203      {
//  204        mid=(Right_Line[y1]+Left_Line[y1])/2;
        LDR.N    R0,??DataTable2_16
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR      R0,[R0, R5, LSL #+2]
        LDR.N    R1,??DataTable2_17
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR      R1,[R1, R5, LSL #+2]
        ADDS     R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        B.N      ??search_line_20
//  205 
//  206      }
//  207      
//  208       else    if(y1<y2)//左下点y1比右下点y2 高
??search_line_19:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R5,R7
        BCS.N    ??search_line_20
//  209      {
//  210        mid=(Right_Line[y2]+Left_Line[y2])/2;
        LDR.N    R0,??DataTable2_16
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDR      R0,[R0, R7, LSL #+2]
        LDR.N    R1,??DataTable2_17
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDR      R1,[R1, R7, LSL #+2]
        ADDS     R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
//  211      }
//  212      
//  213             
//  214        
//  215        for(uint8 i=y1;i>19;i--)
??search_line_20:
        MOVS     R0,R5
        B.N      ??search_line_21
??search_line_22:
        SUBS     R0,R0,#+1
??search_line_21:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+20
        BLT.N    ??search_line_23
//  216        {
//  217          if((Left_Line[i]-Left_Line[i+1])>15)
        LDR.N    R1,??DataTable2_17
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R1,[R1, R0, LSL #+2]
        LDR.N    R2,??DataTable2_17
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R2,R2,R0, LSL #+2
        LDR      R2,[R2, #+4]
        SUBS     R1,R1,R2
        CMP      R1,#+16
        BLT.N    ??search_line_22
//  218          {
//  219            y3=i;
        MOV      R8,R0
//  220            x3=Left_Line[i];
        LDR.N    R1,??DataTable2_17
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R0,[R1, R0, LSL #+2]
        STRB     R0,[SP, #+2]
//  221            break;
//  222          }
//  223        }
//  224        for(uint8 i=y2;i>19;i--)
??search_line_23:
        MOVS     R0,R7
        B.N      ??search_line_24
??search_line_25:
        SUBS     R0,R0,#+1
??search_line_24:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+20
        BLT.N    ??search_line_26
//  225        {
//  226          if((Right_Line[i+1]-Right_Line[i])>15)
        LDR.N    R1,??DataTable2_16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R1,R1,R0, LSL #+2
        LDR      R1,[R1, #+4]
        LDR.N    R2,??DataTable2_16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        SUBS     R1,R1,R2
        CMP      R1,#+16
        BLT.N    ??search_line_25
//  227          {
//  228            y4=i;
        STRB     R0,[SP, #+0]
//  229            x4=Right_Line[i];
        LDR.N    R1,??DataTable2_16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R0,[R1, R0, LSL #+2]
        STRB     R0,[SP, #+1]
//  230            break;
//  231          }
//  232        }
//  233      
//  234      k1=(y1-y3)/(x1-x3);
??search_line_26:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        SUBS     R0,R5,R8
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDRB     R1,[SP, #+2]
        SUBS     R1,R4,R1
        SDIV     R0,R0,R1
        BL       __aeabi_i2f
        MOVS     R4,R0
//  235      k2=(y2-y4)/(x2-x4);
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDRB     R0,[SP, #+0]
        SUBS     R0,R7,R0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDRB     R1,[SP, #+1]
        SUBS     R1,R6,R1
        SDIV     R0,R0,R1
        BL       __aeabi_i2f
//  236      
//  237      for(uint8 i=y3;y3<y1;y3++)
        MOV      R6,R8
        B.N      ??search_line_27
//  238      {
//  239        Left_Line[i]=Left_Line[i-1]+(int)k1;
??search_line_28:
        LDR.N    R0,??DataTable2_17
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADDS     R0,R0,R6, LSL #+2
        LDR      R7,[R0, #-4]
        MOVS     R0,R4
        BL       __aeabi_f2iz
        ADDS     R0,R0,R7
        LDR.N    R1,??DataTable2_17
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        STR      R0,[R1, R6, LSL #+2]
//  240      }
        ADDS     R8,R8,#+1
??search_line_27:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R8,R5
        BCC.N    ??search_line_28
//  241      
//  242      
//  243     // Center_Line[y]=(Right_Line[y]+Left_Line[y])/2;
//  244   }
//  245 }
??search_line_13:
        POP      {R0,R4-R11,PC}   ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x400b8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     steering_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     steering_middle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     turn

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     last_turn

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     Center_Line

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     turn1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     turn2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     D_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     turn_left

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     turn_right

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     steering_p

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     0x41a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     steering_out

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     steering_left

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     steering_right

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC32     Right_Line

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_17:
        DC32     Left_Line

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_18:
        DC32     straight_cross

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_19:
        DC32     Left_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_20:
        DC32     Right_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_21:
        DC32     Img
//  246 
//  247  
//  248 
//  249 /*
//  250 void  search_line(void)
//  251 {
//  252   uint8 Left_End=0;//有效结束行
//  253   uint8 Right_End=0;
//  254   
//  255   uint8 Left_Valid_Count=0;//默认左边沿有效连续计数值为0
//  256   uint8 Right_Valid_Count=0;//默认右边沿有效连续计数值为0
//  257   
//  258   uint8 Left_Invalid_Count=0;//默认左边沿无效连续计数值为0
//  259   uint8 Right_Invalid_Count=0;//默认右边沿无效连续计数值为0
//  260   
//  261   uint8 Left_Turn_Count=0;//收敛方向异常连续计数
//  262   uint8 Right_Turn_Count=0;
//  263   
//  264   uint8 Left_Break=0;
//  265   uint8 Right_Break=0;
//  266   
//  267   uint8 Cross_Flag=0;//默认无十字
//  268   Left_flag=0;
//  269   Right_flag=0;
//  270 
//  271   //前3行
//  272   for(uint8 i=59;i>56;i--)
//  273   {
//  274     Left_Line[i]=1;//初始化左黑线为1
//  275     Right_Line[i]=78;//初始化右黑线为78
//  276     Left_Valid[i]=0;//默认左边未找到黑线
//  277     Right_Valid[i]=0;//默认右边未找到黑线
//  278     Center_Line[i]=40;//默认中线为图像中间
//  279     //从中间到左
//  280     for(uint8 j=40;j>0;j--)
//  281     {
//  282       if(Img[i][j]==white&&Img[i][j-2]==black)
//  283       {
//  284         Left_Line[i]=j;//黑线位置
//  285         Left_Valid[i]=1;//此行左黑线有效位置1
//  286         Left_Valid_Count++;//连续有效行+1
//  287         Left_Invalid_Count=0;
//  288         break;
//  289       }
//  290     }
//  291     
//  292     if(Left_Valid[i]==0)
//  293     {
//  294       Left_Valid_Count=0;
//  295       Left_Invalid_Count++;
//  296     }
//  297     
//  298     //从中间到右边
//  299     for(uint8 k=40;k<80;k++)
//  300     {
//  301       if(Img[i][k]==white&&Img[i][k+2]==black)
//  302       {
//  303         Right_Line[i]=k;
//  304         Right_Valid[i]=1;
//  305         Right_Valid_Count++;
//  306         Right_Invalid_Count=0;
//  307         break;
//  308       }
//  309     }
//  310     if(Right_Valid[i]==0)
//  311     {
//  312       Right_Valid_Count=0;
//  313       Right_Invalid_Count++;
//  314     }
//  315     
//  316     
//  317     
//  318     Center_Line[i]=(Right_Line[i]+Left_Line[i])/2;
//  319   }
//  320   
//  321   
//  322   if(Left_Valid_Count==3&&Right_Valid_Count==3)
//  323   {
//  324     for(uint8 i=56;i>29;i--)
//  325     {
//  326       uint8 col;
//  327       
//  328       //中间往左
//  329       Left_Line[i]=1;//初始化为1
//  330       Left_Valid[i]=0;//初始化每行无效
//  331       
//  332       col=Left_Line[i+1]+6;//具体数值还需视情况而定
//  333       Left_End=Left_Line[i+1]-6;
//  334       
//  335     //  for(;col>Left_End;col--)     
//  336       for(uint8 m=40;m>0;m--)
//  337       {
//  338         if(Img[i][col]==white&&Img[i][col-2]==black)
//  339         {
//  340           Left_Line[i]=col;//黑线位置
//  341             Left_flag=1;
//  342           Left_Invalid_Count=0;//左线连续无效值清零
//  343           if(Left_Line[i]<Left_Line[i+1])//出现左线异常不向右收敛
//  344           {
//  345             Left_Turn_Count++;//左线收敛方向异常连续计数+1
//  346             Left_Valid[i]=1;//暂时标记此行左黑线有效位置1
//  347             break;
//  348           }
//  349           else//左线正常向右收敛
//  350           {
//  351             Left_Turn_Count=0;//左线收敛方向异常连续计数值清零
//  352             Left_Valid[i]=1;//此行左黑线有效位置1
//  353             break;
//  354           }
//  355         }
//  356         else 
//  357           Left_Line[m]=0;
//  358       }
//  359       if(Left_Valid[i]==0)//此行没有找到左黑线
//  360         Left_Invalid_Count++;
//  361       if(Left_Turn_Count==3)//左黑线收敛方向异常进一步判断是否为斜入十字
//  362       {
//  363         //继续判断十字
//  364       }
//  365       if(Left_Invalid_Count==3)
//  366       {
//  367         Left_Break=i+3;//左边黑线断点行记录
//  368         break;//跳出大循环，停止搜线
//  369       }
//  370       
//  371       
//  372       
//  373       Right_Line[i]=78;
//  374       Right_Valid[i]=0;
//  375       
//  376       col=Right_Line[i+1]-6;
//  377       Right_End=Right_Line[i+1]+6;
//  378       
//  379      // for(;col<Right_End;col++)
//  380       for(uint8 n=40;n<78;n++)
//  381       {
//  382         if(Img[i][col]==white&&Img[i][col+2]==black)
//  383         {
//  384           Right_Line[i]=col;
//  385            Right_flag=1;
//  386           Right_Invalid_Count=0;
//  387           if(Right_Line[i]>Right_Line[i+1])
//  388           {
//  389             Right_Turn_Count++;
//  390             Right_Valid[i]=1;
//  391             break;
//  392           }
//  393           else
//  394           {
//  395             Right_Turn_Count=0;
//  396             Right_Valid[i]=1;
//  397             break;
//  398           }
//  399         }
//  400         else
//  401           Right_Line[n]=79;
//  402       }
//  403       if(Right_Valid[i]==0)
//  404         Right_Invalid_Count++;
//  405       if(Right_Turn_Count==3)
//  406       {
//  407         //继续判断十字
//  408       }
//  409       if(Right_Invalid_Count==3)
//  410       {
//  411         Right_Break=i+3;
//  412         break;
//  413       }
//  414       if(Right_flag&&Left_flag)
//  415         Center_Line[i]=(Right_Line[i]+Left_Line[i])/2;
//  416       else if(!Left_flag&&Right_flag)//左转
//  417         Center_Line[i]=Right_Line[i]-(Right_Line[i+1]-Center_Line[i+1]);
//  418       else if(Left_flag&&!Right_flag)//右转
//  419         Center_Line[i]=Left_Line[i]+(Center_Line[i+1]-Left_Line[i+1]);
//  420     }
//  421     
//  422   }
//  423 }
//  424 */
//  425             
//  426             
//  427             

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  428  uint8 m_abs(int m)
//  429  {
//  430    if(m>0)
m_abs:
        CMP      R0,#+1
        BLT.N    ??m_abs_0
//  431      return m;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??m_abs_1
//  432    else 
//  433      return (-m);
??m_abs_0:
        RSBS     R0,R0,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??m_abs_1:
        BX       LR               ;; return
//  434  }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
//   177 bytes in section .bss
// 1 592 bytes in section .text
// 
// 1 592 bytes of CODE memory
//   177 bytes of DATA memory
//
//Errors: none
//Warnings: 4
