///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2016  20:40:42
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\whstarlit\Desktop\Smart_Car\lib\common\CameraScan.c
//    Command line =  
//        C:\Users\whstarlit\Desktop\Smart_Car\lib\common\CameraScan.c -D
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
//        C:\Users\whstarlit\Desktop\Smart_Car\project\Test\iar\FLASH\List\CameraScan.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Img
        EXTERN Left
        EXTERN Line2
        EXTERN Line3
        EXTERN Right
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_i2d
        EXTERN absMid
        EXTERN advanceLine
        EXTERN col1
        EXTERN col2
        EXTERN col3
        EXTERN col4
        EXTERN countBlack
        EXTERN crossFlag
        EXTERN endLine
        EXTERN index1
        EXTERN index2
        EXTERN index3
        EXTERN index4
        EXTERN leftDot
        EXTERN lostSide
        EXTERN midDot
        EXTERN rightDot
        EXTERN runwayType
        EXTERN startLine
        EXTERN vertical

        PUBLIC cameraScan
        PUBLIC handleImg
        PUBLIC identifyRunway
        PUBLIC isFindAngle
        PUBLIC isLost
        PUBLIC isOutCross
        PUBLIC leftProcess
        PUBLIC leftRepair
        PUBLIC paint
        PUBLIC reCameraScan
        PUBLIC rightProcess
        PUBLIC rightRepair
        PUBLIC straightRepair

// C:\Users\whstarlit\Desktop\Smart_Car\lib\common\CameraScan.c
//    1 #include "CameraScan.h"
//    2 #include "include.h"
//    3 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    4 void handleImg()
//    5 {
handleImg:
        PUSH     {R7,LR}
//    6   lostSide = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable9
        STR      R0,[R1, #+0]
//    7   runwayType = identifyRunway();
        BL       identifyRunway
        LDR.W    R1,??DataTable9_1
        STR      R0,[R1, #+0]
//    8   if (crossFlag == 1)
        LDR.W    R0,??DataTable10
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??handleImg_0
//    9   {
//   10     if (isOutCross() == 1)
        BL       isOutCross
        CMP      R0,#+1
        BNE.N    ??handleImg_0
//   11     {
//   12       crossFlag = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10
        STR      R0,[R1, #+0]
//   13     }
//   14 //    else
//   15 //    {
//   16       //int t = absMid - midDot[Line2];
//   17       //黑点数过多，或判断为直十字
//   18 //      if (runwayType == 0 || countBlack[Line2] >= 60 || countBlack[Line3] >= 60)
//   19 //      {
//   20 //        angle = midAngle;
//   21 //      }
//   22 //      else
//   23 //      {
//   24 //        //预判行的偏差量
//   25 //        angle = midAngle + t * 5;
//   26 //      }
//   27 //      if (leftDot[Line3] == 0 || rightDot[Line3] == MAX_COL-1)
//   28 //      {
//   29 //        angle = midAngle;
//   30 //      }
//   31       
//   32 //      if (runwayType == 0)
//   33 //      {
//   34 //        straightRepair();
//   35 //      }
//   36 //      else if (runwayType == 1)
//   37 //      {
//   38 //        rightRepair();
//   39 //      }
//   40 //      else
//   41 //      {
//   42 //        leftRepair();
//   43 //      }
//   44 //    }
//   45   }
//   46   
//   47   if (crossFlag == 0)
??handleImg_0:
        LDR.W    R0,??DataTable10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??handleImg_1
//   48   {
//   49     if (runwayType == 9)
        LDR.W    R0,??DataTable9_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+9
        BNE.N    ??handleImg_2
//   50     {
//   51       //哪一边丢线
//   52       lostSide = isLost();
        BL       isLost
        LDR.W    R1,??DataTable9
        STR      R0,[R1, #+0]
//   53       if (lostSide == -1)
        LDR.W    R0,??DataTable9
        LDR      R0,[R0, #+0]
        CMN      R0,#+1
        BNE.N    ??handleImg_3
//   54       {
//   55         //左大弯补线
//   56         leftProcess();
        BL       leftProcess
        B.N      ??handleImg_1
//   57       }
//   58       else if (lostSide == 1)
??handleImg_3:
        LDR.W    R0,??DataTable9
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??handleImg_1
//   59       {
//   60         //右大弯补线
//   61         rightProcess();
        BL       rightProcess
        B.N      ??handleImg_1
//   62       }
//   63     }
//   64     else
//   65     {
//   66       crossFlag = 1;
??handleImg_2:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable10
        STR      R0,[R1, #+0]
//   67     }
//   68   }
//   69 }
??handleImg_1:
        POP      {R0,PC}          ;; return
//   70 
//   71 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   72 void cameraScan()
//   73 {
cameraScan:
        PUSH     {R4-R6}
//   74   int i, j;
//   75   int t = absMid;
        LDR.W    R0,??DataTable9_2
        LDR      R0,[R0, #+0]
//   76   int left, right, temp;
//   77 
//   78   endLine = advanceLine; 
        LDR.W    R1,??DataTable9_3
        LDR      R1,[R1, #+0]
        LDR.W    R2,??DataTable9_4
        STR      R1,[R2, #+0]
//   79   
//   80   leftDot[startLine] = 0;
        MOVS     R1,#+0
        LDR.W    R2,??DataTable9_5
        LDR.W    R3,??DataTable9_6
        LDR      R3,[R3, #+0]
        STR      R1,[R2, R3, LSL #+2]
//   81   rightDot[startLine] = MAX_COL-1;
        MOVS     R1,#+79
        LDR.W    R2,??DataTable9_7
        LDR.W    R3,??DataTable9_6
        LDR      R3,[R3, #+0]
        STR      R1,[R2, R3, LSL #+2]
//   82 
//   83   //找边界点,并存入左右数组
//   84   for (i = startLine; i >= endLine; i--)
        LDR.W    R1,??DataTable9_6
        LDR      R1,[R1, #+0]
        B.N      ??cameraScan_0
//   85   {
//   86     left = 0;
//   87     right = MAX_COL-1;
//   88     //从上一行中点向左遇到的第一个黑点
//   89     if (0 == Img[i][t])
//   90     {
//   91       endLine = i;
//   92       break;
//   93     }
//   94     for (j = t; j >= 2; j--)
//   95     {
//   96       if (255 == Img[i][j] && 0 == Img[i][j-1] && 0 == Img[i][j-2])
//   97       {
//   98         left = j;
//   99         break;
//  100       }
//  101     }
//  102     //从上一行中点向右遇到的第一个黑点
//  103     for (j = t; j < MAX_COL-2; j++)
??cameraScan_1:
        ADDS     R4,R4,#+1
??cameraScan_2:
        CMP      R4,#+78
        BGE.N    ??cameraScan_3
//  104     { 
//  105       if (255 == Img[i][j] && 0 == Img[i][j+1] && 0 == Img[i][j+2])
        LDR.W    R0,??DataTable10_1
        MOVS     R5,#+80
        MLA      R0,R5,R1,R0
        LDRB     R0,[R4, R0]
        CMP      R0,#+255
        BNE.N    ??cameraScan_1
        LDR.W    R0,??DataTable10_1
        MOVS     R5,#+80
        MLA      R0,R5,R1,R0
        ADDS     R0,R4,R0
        LDRB     R0,[R0, #+1]
        CMP      R0,#+0
        BNE.N    ??cameraScan_1
        LDR.W    R0,??DataTable10_1
        MOVS     R5,#+80
        MLA      R0,R5,R1,R0
        ADDS     R0,R4,R0
        LDRB     R0,[R0, #+2]
        CMP      R0,#+0
        BNE.N    ??cameraScan_1
//  106       {
//  107         right = j;
        MOVS     R3,R4
//  108         break;
//  109       }
//  110     }
//  111     
//  112     temp = (left + right)/2;
??cameraScan_3:
        ADDS     R0,R3,R2
        MOVS     R4,#+2
        SDIV     R0,R0,R4
//  113     t = temp;
//  114     //左边点坐标，右边点坐标，中点坐标
//  115     leftDot[i] = left;
        LDR.W    R4,??DataTable9_5
        STR      R2,[R4, R1, LSL #+2]
//  116     rightDot[i] = right;
        LDR.W    R4,??DataTable9_7
        STR      R3,[R4, R1, LSL #+2]
//  117     midDot[i] = temp;
        LDR.W    R4,??DataTable9_8
        STR      R0,[R4, R1, LSL #+2]
//  118     countBlack[i] = right - left;
        SUBS     R2,R3,R2
        LDR.W    R3,??DataTable9_9
        STR      R2,[R3, R1, LSL #+2]
        SUBS     R1,R1,#+1
??cameraScan_0:
        LDR.W    R2,??DataTable9_4
        LDR      R2,[R2, #+0]
        CMP      R1,R2
        BLT.N    ??cameraScan_4
        MOVS     R2,#+0
        MOVS     R3,#+79
        LDR.W    R4,??DataTable10_1
        MOVS     R5,#+80
        MLA      R4,R5,R1,R4
        LDRB     R4,[R0, R4]
        CMP      R4,#+0
        BNE.N    ??cameraScan_5
        LDR.W    R0,??DataTable9_4
        STR      R1,[R0, #+0]
//  119   }
//  120   
//  121   
//  122   //图像左右边界
//  123 	Left = leftDot[startLine];
??cameraScan_4:
        LDR.W    R0,??DataTable9_5
        LDR.W    R1,??DataTable9_6
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.W    R1,??DataTable9_10
        STR      R0,[R1, #+0]
//  124 	Right = rightDot[startLine];
        LDR.W    R0,??DataTable9_7
        LDR.W    R1,??DataTable9_6
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.W    R1,??DataTable9_11
        STR      R0,[R1, #+0]
//  125 	if (Left == 0)
        LDR.W    R0,??DataTable9_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??cameraScan_6
//  126 	{
//  127 		Left = 1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_10
        STR      R0,[R1, #+0]
//  128 	}
//  129   if (Right == MAX_COL-1)
??cameraScan_6:
        LDR.W    R0,??DataTable9_11
        LDR      R0,[R0, #+0]
        CMP      R0,#+79
        BNE.N    ??cameraScan_7
//  130   {
//  131     Right = MAX_COL-2;
        MOVS     R0,#+78
        LDR.W    R1,??DataTable9_11
        STR      R0,[R1, #+0]
//  132   }
//  133 }
??cameraScan_7:
        POP      {R4-R6}
        BX       LR               ;; return
??cameraScan_5:
        MOVS     R4,R0
        B.N      ??cameraScan_8
??cameraScan_9:
        SUBS     R4,R4,#+1
??cameraScan_8:
        CMP      R4,#+2
        BLT.N    ??cameraScan_10
        LDR.W    R5,??DataTable10_1
        MOVS     R6,#+80
        MLA      R5,R6,R1,R5
        LDRB     R5,[R4, R5]
        CMP      R5,#+255
        BNE.N    ??cameraScan_9
        LDR.W    R5,??DataTable10_1
        MOVS     R6,#+80
        MLA      R5,R6,R1,R5
        ADDS     R5,R4,R5
        LDRB     R5,[R5, #-1]
        CMP      R5,#+0
        BNE.N    ??cameraScan_9
        LDR.W    R5,??DataTable10_1
        MOVS     R6,#+80
        MLA      R5,R6,R1,R5
        ADDS     R5,R4,R5
        LDRB     R5,[R5, #-2]
        CMP      R5,#+0
        BNE.N    ??cameraScan_9
        MOVS     R2,R4
??cameraScan_10:
        MOVS     R4,R0
        B.N      ??cameraScan_2
//  134 
//  135 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  136 int identifyRunway()
//  137 {
identifyRunway:
        PUSH     {R4,LR}
//  138   int lost;
//  139   lost = isLost();
        BL       isLost
//  140 
//  141   if (leftDot[Line3] == 0 && rightDot[Line3] == MAX_COL - 1)
        LDR.W    R1,??DataTable9_5
        LDR.W    R2,??DataTable10_2
        LDR      R2,[R2, #+0]
        LDR      R1,[R1, R2, LSL #+2]
        CMP      R1,#+0
        BNE.N    ??identifyRunway_0
        LDR.W    R1,??DataTable9_7
        LDR.W    R2,??DataTable10_2
        LDR      R2,[R2, #+0]
        LDR      R1,[R1, R2, LSL #+2]
        CMP      R1,#+79
        BNE.N    ??identifyRunway_0
//  142   {
//  143     return 0;
        MOVS     R0,#+0
        B.N      ??identifyRunway_1
//  144   }
//  145   //如果丢线，进一步判断是大弯还是十字
//  146   if (lost != 9)
??identifyRunway_0:
        CMP      R0,#+9
        BEQ.N    ??identifyRunway_2
//  147   {
//  148     int i, j;
//  149     for (j = 0; j < MAX_COL; j++)
        MOVS     R2,#+0
        B.N      ??identifyRunway_3
//  150     {
//  151       for (i = startLine; i > 0; i--)
??identifyRunway_4:
        SUBS     R1,R1,#+1
??identifyRunway_5:
        CMP      R1,#+1
        BLT.N    ??identifyRunway_6
//  152       {
//  153         if (Img[i][j] == 0 && Img[i-1][j] == 0)
        LDR.W    R3,??DataTable10_1
        MOVS     R4,#+80
        MLA      R3,R4,R1,R3
        LDRB     R3,[R2, R3]
        CMP      R3,#+0
        BNE.N    ??identifyRunway_4
        LDR.W    R3,??DataTable10_1
        MOVS     R4,#+80
        MLA      R3,R4,R1,R3
        ADDS     R3,R2,R3
        LDRB     R3,[R3, #-80]
        CMP      R3,#+0
        BNE.N    ??identifyRunway_4
//  154         {  
//  155           break;
//  156         }
//  157       }
//  158       vertical[j] = i;
??identifyRunway_6:
        LDR.W    R3,??DataTable10_3
        STR      R1,[R3, R2, LSL #+2]
        ADDS     R2,R2,#+1
??identifyRunway_3:
        CMP      R2,#+80
        BGE.N    ??identifyRunway_7
        LDR.W    R1,??DataTable9_6
        LDR      R1,[R1, #+0]
        B.N      ??identifyRunway_5
//  159     }
//  160     
//  161 
//  162     if (lost == -1)
??identifyRunway_7:
        CMN      R0,#+1
        BNE.N    ??identifyRunway_8
//  163     {
//  164       if (isFindAngle(-1) == -1)
        MOVS     R0,#-1
        BL       isFindAngle
        CMN      R0,#+1
        BNE.N    ??identifyRunway_9
//  165       {
//  166         return -1;
        MOVS     R0,#-1
        B.N      ??identifyRunway_1
//  167       }
//  168       else
//  169       {
//  170         return 9;
??identifyRunway_9:
        MOVS     R0,#+9
        B.N      ??identifyRunway_1
//  171       } 
//  172     }
//  173     else if (lost == 1)
??identifyRunway_8:
        CMP      R0,#+1
        BNE.N    ??identifyRunway_10
//  174     {
//  175       if (isFindAngle(1) == 1)
        MOVS     R0,#+1
        BL       isFindAngle
        CMP      R0,#+1
        BNE.N    ??identifyRunway_11
//  176         
//  177       {
//  178         return 1;
        MOVS     R0,#+1
        B.N      ??identifyRunway_1
//  179       } 
//  180       else
//  181       {
//  182         return 9;
??identifyRunway_11:
        MOVS     R0,#+9
        B.N      ??identifyRunway_1
//  183       }
//  184     }
//  185     else
//  186     {
//  187       return 0;
??identifyRunway_10:
        MOVS     R0,#+0
        B.N      ??identifyRunway_1
//  188     }
//  189   }
//  190   else
//  191   {
//  192     return 9;
??identifyRunway_2:
        MOVS     R0,#+9
??identifyRunway_1:
        POP      {R4,PC}          ;; return
//  193   }
//  194 }
//  195 
//  196 
//  197 //是否找到突变点

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  198 int isFindAngle(int flag)
//  199 {
//  200   int i, j, temp;
//  201 
//  202   index1 = -1;
isFindAngle:
        MOVS     R1,#-1
        LDR.W    R2,??DataTable10_4
        STR      R1,[R2, #+0]
//  203   index2 = -1;
        MOVS     R1,#-1
        LDR.W    R2,??DataTable10_5
        STR      R1,[R2, #+0]
//  204 
//  205   //右弯的图像
//  206   if (flag == 1)
        CMP      R0,#+1
        BNE.N    ??isFindAngle_0
//  207   {
//  208     //index1-----找右边界
//  209     for (i = startLine -2; i > endLine + 3; i--)
        LDR.W    R0,??DataTable9_6
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+2
        B.N      ??isFindAngle_1
??isFindAngle_2:
        SUBS     R0,R0,#+1
??isFindAngle_1:
        LDR.W    R1,??DataTable9_4
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+3
        CMP      R1,R0
        BGE.N    ??isFindAngle_3
//  210     {
//  211       //temp = leftDot[i] - leftDot[i - 1];
//  212       temp = rightDot[i] - rightDot[i - 1];
        LDR.W    R1,??DataTable9_7
        LDR      R1,[R1, R0, LSL #+2]
        LDR.W    R2,??DataTable9_7
        ADDS     R2,R2,R0, LSL #+2
        LDR      R2,[R2, #-4]
        SUBS     R1,R1,R2
//  213       if (temp >= 7 || temp <= -7)
        ADDS     R1,R1,#+6
        CMP      R1,#+13
        BCC.N    ??isFindAngle_2
//  214       {
//  215         index1 = i;
        LDR.W    R1,??DataTable10_4
        STR      R0,[R1, #+0]
//  216         break;
//  217       }
//  218     }
//  219 
//  220     if (index1 == -1)
??isFindAngle_3:
        LDR.W    R0,??DataTable10_4
        LDR      R0,[R0, #+0]
        CMN      R0,#+1
        BNE.N    ??isFindAngle_4
//  221     {
//  222       return 9;
        MOVS     R0,#+9
        B.N      ??isFindAngle_5
//  223     }
//  224 
//  225 
//  226     //index2-----找上边界
//  227     //for (j = Right; j > midDot[endLine+1]; j--)
//  228     for (j = Left + 1; j < midDot[Line3]; j++)
??isFindAngle_4:
        LDR.W    R0,??DataTable9_10
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        B.N      ??isFindAngle_6
??isFindAngle_7:
        ADDS     R0,R0,#+1
??isFindAngle_6:
        LDR.W    R1,??DataTable9_8
        LDR.W    R2,??DataTable10_2
        LDR      R2,[R2, #+0]
        LDR      R1,[R1, R2, LSL #+2]
        CMP      R0,R1
        BGE.N    ??isFindAngle_8
//  229     {
//  230       temp = vertical[j] - vertical[j - 1];
        LDR.W    R1,??DataTable10_3
        LDR      R1,[R1, R0, LSL #+2]
        LDR.W    R2,??DataTable10_3
        ADDS     R2,R2,R0, LSL #+2
        LDR      R2,[R2, #-4]
        SUBS     R1,R1,R2
//  231       if (temp >= 7 || temp <= -7)
        ADDS     R1,R1,#+6
        CMP      R1,#+13
        BCC.N    ??isFindAngle_7
//  232       {
//  233         //index2 = vertical[j-1];
//  234         index2 = j - 1;
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable10_5
        STR      R0,[R1, #+0]
//  235         break;
//  236       }
//  237     }
//  238     
//  239     if (-1 == index2)
??isFindAngle_8:
        LDR.W    R0,??DataTable10_5
        LDR      R0,[R0, #+0]
        CMN      R0,#+1
        BNE.N    ??isFindAngle_9
//  240     {
//  241       return 9;
        MOVS     R0,#+9
        B.N      ??isFindAngle_5
//  242     }
//  243     return 1;
??isFindAngle_9:
        MOVS     R0,#+1
        B.N      ??isFindAngle_5
//  244   }
//  245 
//  246 
//  247   //左弯的图像
//  248   else
//  249   {
//  250     //index1-----找左边界
//  251     for (i = startLine - 2; i > endLine + 3; i--)
??isFindAngle_0:
        LDR.W    R0,??DataTable9_6
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+2
        B.N      ??isFindAngle_10
??isFindAngle_11:
        SUBS     R0,R0,#+1
??isFindAngle_10:
        LDR.W    R1,??DataTable9_4
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+3
        CMP      R1,R0
        BGE.N    ??isFindAngle_12
//  252     {
//  253       //temp = rightDot[i] - rightDot[i - 1];
//  254       temp = leftDot[i] - leftDot[i-1];
        LDR.W    R1,??DataTable9_5
        LDR      R1,[R1, R0, LSL #+2]
        LDR.W    R2,??DataTable9_5
        ADDS     R2,R2,R0, LSL #+2
        LDR      R2,[R2, #-4]
        SUBS     R1,R1,R2
//  255       if (temp >= 7 || temp <= -7)
        ADDS     R1,R1,#+6
        CMP      R1,#+13
        BCC.N    ??isFindAngle_11
//  256       {
//  257         index1 = i;
        LDR.W    R1,??DataTable10_4
        STR      R0,[R1, #+0]
//  258         break;
//  259       } 
//  260     }
//  261     if (-1 == index1)
??isFindAngle_12:
        LDR.W    R0,??DataTable10_4
        LDR      R0,[R0, #+0]
        CMN      R0,#+1
        BNE.N    ??isFindAngle_13
//  262     {
//  263       return 9;
        MOVS     R0,#+9
        B.N      ??isFindAngle_5
//  264     }
//  265 
//  266     //index2-----找右上边界
//  267     //for (j = Left+1; j < midDot[endLine+1]; j++)
//  268     for (j = Right - 1; j > midDot[Line3]; j--)
??isFindAngle_13:
        LDR.W    R0,??DataTable9_11
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        B.N      ??isFindAngle_14
??isFindAngle_15:
        SUBS     R0,R0,#+1
??isFindAngle_14:
        LDR.W    R1,??DataTable9_8
        LDR.W    R2,??DataTable10_2
        LDR      R2,[R2, #+0]
        LDR      R1,[R1, R2, LSL #+2]
        CMP      R1,R0
        BGE.N    ??isFindAngle_16
//  269     {
//  270       temp = vertical[j] - vertical[j - 1];
        LDR.W    R1,??DataTable10_3
        LDR      R1,[R1, R0, LSL #+2]
        LDR.W    R2,??DataTable10_3
        ADDS     R2,R2,R0, LSL #+2
        LDR      R2,[R2, #-4]
        SUBS     R1,R1,R2
//  271       if (temp >= 7 || temp <= -7)
        ADDS     R1,R1,#+6
        CMP      R1,#+13
        BCC.N    ??isFindAngle_15
//  272       {
//  273         //index2 = vertical[j];
//  274         index2 = j;
        LDR.W    R1,??DataTable10_5
        STR      R0,[R1, #+0]
//  275         break;
//  276       }
//  277     }
//  278     
//  279     if (index2 == -1)
??isFindAngle_16:
        LDR.W    R0,??DataTable10_5
        LDR      R0,[R0, #+0]
        CMN      R0,#+1
        BNE.N    ??isFindAngle_17
//  280     {
//  281       return 9;
        MOVS     R0,#+9
        B.N      ??isFindAngle_5
//  282     }
//  283     return -1;
??isFindAngle_17:
        MOVS     R0,#-1
??isFindAngle_5:
        BX       LR               ;; return
//  284   }
//  285 }
//  286 
//  287 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  288 int isOutCross()
//  289 {
//  290   //两边都找到边界，则出十字
//  291   if (leftDot[Line2] != 0 && rightDot[Line2] != MAX_COL -1)
isOutCross:
        LDR.W    R0,??DataTable9_5
        LDR.W    R1,??DataTable11
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        CMP      R0,#+0
        BEQ.N    ??isOutCross_0
        LDR.W    R0,??DataTable9_7
        LDR.W    R1,??DataTable11
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        CMP      R0,#+79
        BEQ.N    ??isOutCross_0
//  292   {
//  293     return 1;
        MOVS     R0,#+1
        B.N      ??isOutCross_1
//  294   }
//  295   return 0;
??isOutCross_0:
        MOVS     R0,#+0
??isOutCross_1:
        BX       LR               ;; return
//  296 }
//  297 
//  298 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  299 void leftProcess()
//  300 {
//  301   int i, temp, rightGap;
//  302   for (i = startLine; i > endLine; i--)
leftProcess:
        LDR.W    R0,??DataTable9_6
        LDR      R0,[R0, #+0]
        B.N      ??leftProcess_0
??leftProcess_1:
        SUBS     R0,R0,#+1
??leftProcess_0:
        LDR.W    R1,??DataTable12
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BGE.N    ??leftProcess_2
//  303   {
//  304     temp = leftDot[i-1] - leftDot[i];
        LDR.W    R1,??DataTable9_5
        ADDS     R1,R1,R0, LSL #+2
        LDR      R1,[R1, #-4]
        LDR.W    R2,??DataTable9_5
        LDR      R2,[R2, R0, LSL #+2]
        SUBS     R1,R1,R2
//  305     if (leftDot[i] == 0 || (temp > 7 || temp < -7))
        LDR.W    R2,??DataTable9_5
        LDR      R2,[R2, R0, LSL #+2]
        CMP      R2,#+0
        BEQ.N    ??leftProcess_3
        ADDS     R1,R1,#+7
        CMP      R1,#+15
        BCC.N    ??leftProcess_1
//  306     {
//  307       break;
//  308     }
//  309   }
//  310 
//  311   temp = leftDot[i];
??leftProcess_3:
??leftProcess_2:
        LDR.W    R1,??DataTable9_5
        LDR      R1,[R1, R0, LSL #+2]
//  312   for (i = i-1; i > endLine; i--)
        SUBS     R0,R0,#+1
        B.N      ??leftProcess_4
//  313   {
//  314     rightGap = rightDot[i-1] - rightDot[i];
??leftProcess_5:
        LDR.W    R2,??DataTable9_7
        ADDS     R2,R2,R0, LSL #+2
        LDR      R2,[R2, #-4]
        LDR.W    R3,??DataTable9_7
        LDR      R3,[R3, R0, LSL #+2]
        SUBS     R2,R2,R3
//  315     temp = temp + rightGap;
        ADDS     R1,R2,R1
//  316     midDot[i] = (temp + rightDot[i])/2;
        LDR.W    R2,??DataTable9_7
        LDR      R2,[R2, R0, LSL #+2]
        ADDS     R2,R2,R1
        MOVS     R3,#+2
        SDIV     R2,R2,R3
        LDR.W    R3,??DataTable9_8
        STR      R2,[R3, R0, LSL #+2]
//  317   }
        SUBS     R0,R0,#+1
??leftProcess_4:
        LDR.W    R2,??DataTable12
        LDR      R2,[R2, #+0]
        CMP      R2,R0
        BLT.N    ??leftProcess_5
//  318 }
        BX       LR               ;; return
//  319 
//  320 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  321 void rightProcess()
//  322 {
//  323   int i, temp, leftGap;
//  324   for (i = startLine; i > endLine; i--)
rightProcess:
        LDR.W    R0,??DataTable9_6
        LDR      R0,[R0, #+0]
        B.N      ??rightProcess_0
??rightProcess_1:
        SUBS     R0,R0,#+1
??rightProcess_0:
        LDR.W    R1,??DataTable12
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BGE.N    ??rightProcess_2
//  325   {
//  326     temp = rightDot[i-1] - rightDot[i];
        LDR.W    R1,??DataTable9_7
        ADDS     R1,R1,R0, LSL #+2
        LDR      R1,[R1, #-4]
        LDR.W    R2,??DataTable9_7
        LDR      R2,[R2, R0, LSL #+2]
        SUBS     R1,R1,R2
//  327     if (rightDot[i] == MAX_COL-1 || (temp > 7 || temp < -7))
        LDR.W    R2,??DataTable9_7
        LDR      R2,[R2, R0, LSL #+2]
        CMP      R2,#+79
        BEQ.N    ??rightProcess_3
        ADDS     R1,R1,#+7
        CMP      R1,#+15
        BCC.N    ??rightProcess_1
//  328     {
//  329       break;
//  330     }
//  331   }
//  332 
//  333   temp = rightDot[i];
??rightProcess_3:
??rightProcess_2:
        LDR.W    R1,??DataTable9_7
        LDR      R1,[R1, R0, LSL #+2]
//  334   for (i = i-1; i > endLine; i--)
        SUBS     R0,R0,#+1
        B.N      ??rightProcess_4
//  335   {
//  336     leftGap = leftDot[i-1] - leftDot[i];
??rightProcess_5:
        LDR.W    R2,??DataTable9_5
        ADDS     R2,R2,R0, LSL #+2
        LDR      R2,[R2, #-4]
        LDR.W    R3,??DataTable9_5
        LDR      R3,[R3, R0, LSL #+2]
        SUBS     R2,R2,R3
//  337     temp = temp + leftGap;
        ADDS     R1,R2,R1
//  338     midDot[i] = (temp + leftDot[i])/2;
        LDR.W    R2,??DataTable9_5
        LDR      R2,[R2, R0, LSL #+2]
        ADDS     R2,R2,R1
        MOVS     R3,#+2
        SDIV     R2,R2,R3
        LDR.W    R3,??DataTable9_8
        STR      R2,[R3, R0, LSL #+2]
//  339   }
        SUBS     R0,R0,#+1
??rightProcess_4:
        LDR.W    R2,??DataTable12
        LDR      R2,[R2, #+0]
        CMP      R2,R0
        BLT.N    ??rightProcess_5
//  340 }
        BX       LR               ;; return
//  341 
//  342 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  343 int isLost()
//  344 {
isLost:
        PUSH     {R4}
//  345   /* 预判行附近是否丢线
//  346    * -1---左边丢线
//  347    * 0 ---不丢线
//  348    * 1 ---右边丢线
//  349    */
//  350   
//  351   int i;
//  352   int leftLost = 0;
        MOVS     R0,#+0
//  353   int rightLost = 0;
        MOVS     R1,#+0
//  354   int bothLost = 0;
        MOVS     R2,#+0
//  355   
//  356   //计算丢线行数
//  357   for (i = Line2; i > endLine; i--)
        LDR.W    R3,??DataTable11
        LDR      R3,[R3, #+0]
        B.N      ??isLost_0
//  358   {
//  359      if (leftDot[i] == 0 && rightDot[i] != MAX_COL-1)
//  360      {
//  361        leftLost++;
//  362      }
//  363      else if (rightDot[i] == MAX_COL-1 && leftDot[i] != 0)
//  364      {
//  365        rightLost++;
//  366      }
//  367      else if(leftDot[i] == 0 && rightDot[i] == MAX_COL-1)
??isLost_1:
        LDR.W    R4,??DataTable9_5
        LDR      R4,[R4, R3, LSL #+2]
        CMP      R4,#+0
        BNE.N    ??isLost_2
        LDR.W    R4,??DataTable9_7
        LDR      R4,[R4, R3, LSL #+2]
        CMP      R4,#+79
        BNE.N    ??isLost_2
//  368      {
//  369        bothLost++;
        ADDS     R2,R2,#+1
//  370      }
??isLost_2:
        SUBS     R3,R3,#+1
??isLost_0:
        LDR.W    R4,??DataTable9_4
        LDR      R4,[R4, #+0]
        CMP      R4,R3
        BGE.N    ??isLost_3
        LDR.W    R4,??DataTable9_5
        LDR      R4,[R4, R3, LSL #+2]
        CMP      R4,#+0
        BNE.N    ??isLost_4
        LDR.W    R4,??DataTable9_7
        LDR      R4,[R4, R3, LSL #+2]
        CMP      R4,#+79
        BEQ.N    ??isLost_4
        ADDS     R0,R0,#+1
        B.N      ??isLost_2
??isLost_4:
        LDR.W    R4,??DataTable9_7
        LDR      R4,[R4, R3, LSL #+2]
        CMP      R4,#+79
        BNE.N    ??isLost_1
        LDR.W    R4,??DataTable9_5
        LDR      R4,[R4, R3, LSL #+2]
        CMP      R4,#+0
        BEQ.N    ??isLost_1
        ADDS     R1,R1,#+1
        B.N      ??isLost_2
//  371   }
//  372   
//  373   if (bothLost >= 2)
??isLost_3:
        CMP      R2,#+2
        BLT.N    ??isLost_5
//  374   {
//  375     return 0;
        MOVS     R0,#+0
        B.N      ??isLost_6
//  376   }
//  377   
//  378   else if (leftLost <= 1 && rightLost <= 1)
??isLost_5:
        CMP      R0,#+2
        BGE.N    ??isLost_7
        CMP      R1,#+2
        BGE.N    ??isLost_7
//  379   {
//  380     return 9;
        MOVS     R0,#+9
        B.N      ??isLost_6
//  381   }
//  382   
//  383   //左边丢线数大于右边
//  384   else if (leftLost > rightLost)
??isLost_7:
        CMP      R1,R0
        BGE.N    ??isLost_8
//  385   {
//  386     return -1;
        MOVS     R0,#-1
        B.N      ??isLost_6
//  387   }
//  388   else
//  389   {
//  390     return 1;
??isLost_8:
        MOVS     R0,#+1
??isLost_6:
        POP      {R4}
        BX       LR               ;; return
//  391   }
//  392 }
//  393 
//  394 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  395 void paint()
//  396 { 
paint:
        PUSH     {R4,R5}
//  397   int i, j, l, m, r;
//  398   for (i = startLine; i >= endLine; i--)
        LDR.W    R0,??DataTable9_6
        LDR      R0,[R0, #+0]
        B.N      ??paint_0
//  399   {
//  400     l = leftDot[i];
??paint_1:
        LDR.W    R1,??DataTable9_5
        LDR      R2,[R1, R0, LSL #+2]
//  401     m = midDot[i];
        LDR.W    R1,??DataTable9_8
        LDR      R3,[R1, R0, LSL #+2]
//  402     r = rightDot[i];
        LDR.W    R1,??DataTable9_7
        LDR      R1,[R1, R0, LSL #+2]
//  403     Img[i][l+1] = 0;
        LDR.W    R4,??DataTable10_1
        MOVS     R5,#+80
        MLA      R4,R5,R0,R4
        ADDS     R2,R2,R4
        MOVS     R4,#+0
        STRB     R4,[R2, #+1]
//  404     Img[i][m] = 0;
        MOVS     R2,#+0
        LDR.W    R4,??DataTable10_1
        MOVS     R5,#+80
        MLA      R4,R5,R0,R4
        STRB     R2,[R3, R4]
//  405     Img[i][r-1] = 0;
        LDR.W    R2,??DataTable10_1
        MOVS     R3,#+80
        MLA      R2,R3,R0,R2
        ADDS     R1,R1,R2
        MOVS     R2,#+0
        STRB     R2,[R1, #-1]
//  406   }
        SUBS     R0,R0,#+1
??paint_0:
        LDR.W    R1,??DataTable12
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??paint_1
//  407   
//  408   for (j = 0; j < MAX_COL; j++)
        MOVS     R0,#+0
        B.N      ??paint_2
//  409   {
//  410     Img[endLine][j] = 255;
??paint_3:
        MOVS     R1,#+255
        LDR.W    R2,??DataTable10_1
        LDR.W    R3,??DataTable12
        LDR      R3,[R3, #+0]
        MOVS     R4,#+80
        MLA      R2,R4,R3,R2
        STRB     R1,[R0, R2]
//  411   }
        ADDS     R0,R0,#+1
??paint_2:
        CMP      R0,#+80
        BLT.N    ??paint_3
//  412 }
        POP      {R4,R5}
        BX       LR               ;; return
//  413 
//  414 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  415 void straightRepair()
//  416 {
straightRepair:
        PUSH     {R3-R5,LR}
//  417   int i = 0, j = 0;
        MOVS     R1,#+0
        MOVS     R0,#+0
//  418   int temp, k1, k2;
//  419   
//  420   //初始行丢线
//  421   if (leftDot[Line3] == 0 || rightDot[Line3] == MAX_COL-1)
        LDR.N    R0,??DataTable9_5
        LDR.W    R1,??DataTable10_2
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        CMP      R0,#+0
        BEQ.W    ??straightRepair_0
        LDR.N    R0,??DataTable9_7
        LDR.W    R1,??DataTable10_2
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        CMP      R0,#+79
        BEQ.W    ??straightRepair_0
//  422   {
//  423 
//  424   }
//  425   else
//  426   {
//  427     //找突变点：index1, index4
//  428     for (i = Left; i <= midDot[Line3]; i++)
        LDR.N    R0,??DataTable9_10
        LDR      R1,[R0, #+0]
        B.N      ??straightRepair_1
??straightRepair_2:
        ADDS     R1,R1,#+1
??straightRepair_1:
        LDR.N    R0,??DataTable9_8
        LDR.W    R2,??DataTable10_2
        LDR      R2,[R2, #+0]
        LDR      R0,[R0, R2, LSL #+2]
        CMP      R0,R1
        BLT.N    ??straightRepair_3
//  429     {
//  430       temp = vertical[i] - vertical[i-1];
        LDR.W    R0,??DataTable10_3
        LDR      R0,[R0, R1, LSL #+2]
        LDR.W    R2,??DataTable10_3
        ADDS     R2,R2,R1, LSL #+2
        LDR      R2,[R2, #-4]
        SUBS     R2,R0,R2
//  431       if (temp >= 7 || temp <= -7)
        ADDS     R0,R2,#+6
        CMP      R0,#+13
        BCC.N    ??straightRepair_2
//  432       { 
//  433         index1 = vertical[i-1];
        LDR.W    R0,??DataTable10_3
        ADDS     R0,R0,R1, LSL #+2
        LDR      R0,[R0, #-4]
        LDR.W    R2,??DataTable10_4
        STR      R0,[R2, #+0]
//  434         col1 = i - 1;
        SUBS     R0,R1,#+1
        LDR.W    R2,??DataTable12_1
        STR      R0,[R2, #+0]
//  435         
//  436         index4 = vertical[i+1];
        LDR.W    R0,??DataTable10_3
        ADDS     R0,R0,R1, LSL #+2
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable12_2
        STR      R0,[R1, #+0]
//  437         col4 = leftDot[index4];
        LDR.N    R0,??DataTable9_5
        LDR.W    R1,??DataTable12_2
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.W    R1,??DataTable12_3
        STR      R0,[R1, #+0]
//  438         break;
//  439       }
//  440     }
//  441 
//  442 
//  443     //验证index4
//  444     index4 -= 3;
??straightRepair_3:
        LDR.W    R0,??DataTable12_2
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+3
        LDR.W    R1,??DataTable12_2
        STR      R0,[R1, #+0]
//  445     for (j = col1; j < Right; j++)
        LDR.W    R0,??DataTable12_1
        LDR      R0,[R0, #+0]
        B.N      ??straightRepair_4
??straightRepair_5:
        ADDS     R0,R0,#+1
??straightRepair_4:
        LDR.N    R1,??DataTable9_11
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??straightRepair_6
//  446     {
//  447       if (255 == Img[index4][j] && 0 == Img[index4][j-1])
        LDR.W    R1,??DataTable10_1
        LDR.W    R2,??DataTable12_2
        LDR      R2,[R2, #+0]
        MOVS     R3,#+80
        MLA      R1,R3,R2,R1
        LDRB     R1,[R0, R1]
        CMP      R1,#+255
        BNE.N    ??straightRepair_5
        LDR.W    R1,??DataTable10_1
        LDR.W    R2,??DataTable12_2
        LDR      R2,[R2, #+0]
        MOVS     R3,#+80
        MLA      R1,R3,R2,R1
        ADDS     R1,R0,R1
        LDRB     R1,[R1, #-1]
        CMP      R1,#+0
        BNE.N    ??straightRepair_5
//  448       {
//  449         col4 = j;
        LDR.W    R1,??DataTable12_3
        STR      R0,[R1, #+0]
//  450         break;
//  451       }
//  452     }
//  453 
//  454     
//  455     //找突变点：index2, index3
//  456     for (i = Right; i >= midDot[Line3]; i--)
??straightRepair_6:
        LDR.N    R0,??DataTable9_11
        LDR      R1,[R0, #+0]
        B.N      ??straightRepair_7
??straightRepair_8:
        SUBS     R1,R1,#+1
??straightRepair_7:
        LDR.N    R0,??DataTable9_8
        LDR.W    R2,??DataTable10_2
        LDR      R2,[R2, #+0]
        LDR      R0,[R0, R2, LSL #+2]
        CMP      R1,R0
        BLT.N    ??straightRepair_9
//  457     {
//  458       temp = vertical[i] - vertical[i+1];
        LDR.W    R0,??DataTable10_3
        LDR      R0,[R0, R1, LSL #+2]
        LDR.W    R2,??DataTable10_3
        ADDS     R2,R2,R1, LSL #+2
        LDR      R2,[R2, #+4]
        SUBS     R2,R0,R2
//  459       if (temp >= 7 || temp <= -7)
        ADDS     R0,R2,#+6
        CMP      R0,#+13
        BCC.N    ??straightRepair_8
//  460       {
//  461         index2 = vertical[i+1];
        LDR.W    R0,??DataTable10_3
        ADDS     R0,R0,R1, LSL #+2
        LDR      R0,[R0, #+4]
        LDR.W    R2,??DataTable10_5
        STR      R0,[R2, #+0]
//  462         col2 = i + 1;
        ADDS     R0,R1,#+1
        LDR.W    R2,??DataTable12_4
        STR      R0,[R2, #+0]
//  463 
//  464         index3 = vertical[i-1];
        LDR.W    R0,??DataTable10_3
        ADDS     R0,R0,R1, LSL #+2
        LDR      R0,[R0, #-4]
        LDR.W    R1,??DataTable12_5
        STR      R0,[R1, #+0]
//  465         col3 = rightDot[index3];
        LDR.N    R0,??DataTable9_7
        LDR.W    R1,??DataTable12_5
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.W    R1,??DataTable12_6
        STR      R0,[R1, #+0]
//  466         break;
//  467       }
//  468     }
//  469 
//  470     //  验证index3
//  471     index3 -= 3;
??straightRepair_9:
        LDR.W    R0,??DataTable12_5
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+3
        LDR.W    R1,??DataTable12_5
        STR      R0,[R1, #+0]
//  472     for (j = col2; j > Left; j--)
        LDR.W    R0,??DataTable12_4
        LDR      R0,[R0, #+0]
        B.N      ??straightRepair_10
??straightRepair_11:
        SUBS     R0,R0,#+1
??straightRepair_10:
        LDR.N    R1,??DataTable9_10
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BGE.N    ??straightRepair_12
//  473     {
//  474       if (255 == Img[index3][j] && 0 == Img[index3][j+1])
        LDR.W    R1,??DataTable10_1
        LDR.W    R2,??DataTable12_5
        LDR      R2,[R2, #+0]
        MOVS     R3,#+80
        MLA      R1,R3,R2,R1
        LDRB     R1,[R0, R1]
        CMP      R1,#+255
        BNE.N    ??straightRepair_11
        LDR.W    R1,??DataTable10_1
        LDR.W    R2,??DataTable12_5
        LDR      R2,[R2, #+0]
        MOVS     R3,#+80
        MLA      R1,R3,R2,R1
        ADDS     R1,R0,R1
        LDRB     R1,[R1, #+1]
        CMP      R1,#+0
        BNE.N    ??straightRepair_11
//  475       {
//  476         col3 = j;
        LDR.W    R1,??DataTable12_6
        STR      R0,[R1, #+0]
//  477         break;
//  478       }
//  479     }
//  480 
//  481     
//  482     //近处的点找到
//  483     if (-1 != index3 && -1 != index4)
??straightRepair_12:
        LDR.W    R0,??DataTable12_5
        LDR      R0,[R0, #+0]
        CMN      R0,#+1
        BEQ.W    ??straightRepair_0
        LDR.W    R0,??DataTable12_2
        LDR      R0,[R0, #+0]
        CMN      R0,#+1
        BEQ.W    ??straightRepair_0
//  484     { 
//  485         //isRepaired = 1; 
//  486       if (col4 == col1)
        LDR.W    R0,??DataTable12_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable12_1
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??straightRepair_13
//  487       {
//  488         for (i = index4; i <= index1; i++)
        LDR.W    R0,??DataTable12_2
        LDR      R1,[R0, #+0]
??straightRepair_14:
        LDR.W    R0,??DataTable10_4
        LDR      R0,[R0, #+0]
        CMP      R0,R1
        BLT.N    ??straightRepair_15
//  489         {
//  490           temp = col4;
        LDR.W    R0,??DataTable12_3
        LDR      R2,[R0, #+0]
//  491           Img[i][temp] = 0;
        MOVS     R0,#+0
        LDR.W    R3,??DataTable10_1
        MOVS     R4,#+80
        MLA      R3,R4,R1,R3
        STRB     R0,[R2, R3]
//  492         }
        ADDS     R1,R1,#+1
        B.N      ??straightRepair_14
//  493       }
//  494       else
//  495       {
//  496         k1 = (index1 - index4)/((col4 - col1) * 1.0);
??straightRepair_13:
        LDR.W    R0,??DataTable10_4
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable12_2
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        BL       __aeabi_i2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable12_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable12_1
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable12_7  ;; 0x3ff00000
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
//  497         for (i = index4; i <= index1; i++)
        LDR.W    R1,??DataTable12_2
        LDR      R1,[R1, #+0]
        B.N      ??straightRepair_16
//  498         {
//  499           temp = (index4 - i)/k1 + col4;
//  500           if (temp >= MAX_COL)
//  501           {
//  502             temp = MAX_COL-1;
//  503           }
//  504           else if(temp < 0)
??straightRepair_17:
        CMP      R2,#+0
        BPL.N    ??straightRepair_18
//  505           {
//  506             temp = 0;
        MOVS     R2,#+0
//  507           }
//  508           Img[i][temp] = 128;
??straightRepair_18:
        MOVS     R3,#+128
        LDR.W    R4,??DataTable10_1
        MOVS     R5,#+80
        MLA      R4,R5,R1,R4
        STRB     R3,[R2, R4]
        ADDS     R1,R1,#+1
??straightRepair_16:
        LDR.W    R2,??DataTable10_4
        LDR      R2,[R2, #+0]
        CMP      R2,R1
        BLT.N    ??straightRepair_15
        LDR.W    R2,??DataTable12_2
        LDR      R2,[R2, #+0]
        SUBS     R2,R2,R1
        SDIV     R2,R2,R0
        LDR.W    R3,??DataTable12_3
        LDR      R3,[R3, #+0]
        ADDS     R2,R3,R2
        CMP      R2,#+80
        BLT.N    ??straightRepair_17
        MOVS     R2,#+79
        B.N      ??straightRepair_18
//  509         }
//  510       }
//  511 
//  512 
//  513       if (col3 == col2)
??straightRepair_15:
        LDR.W    R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable12_4
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??straightRepair_19
//  514       {
//  515         for (i = index3; i <= index2; i++)
        LDR.W    R0,??DataTable12_5
        LDR      R1,[R0, #+0]
??straightRepair_20:
        LDR.W    R0,??DataTable10_5
        LDR      R0,[R0, #+0]
        CMP      R0,R1
        BLT.N    ??straightRepair_0
//  516         {
//  517           temp = col3;
        LDR.W    R0,??DataTable12_6
        LDR      R2,[R0, #+0]
//  518           Img[i][temp] = 0;
        MOVS     R0,#+0
        LDR.W    R3,??DataTable10_1
        MOVS     R4,#+80
        MLA      R3,R4,R1,R3
        STRB     R0,[R2, R3]
//  519         }
        ADDS     R1,R1,#+1
        B.N      ??straightRepair_20
//  520       }
//  521       else
//  522       {
//  523         k2 = (index2 - index3)/((col3 - col2) * 1.0);
??straightRepair_19:
        LDR.W    R0,??DataTable10_5
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable12_5
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        BL       __aeabi_i2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable12_4
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable12_7  ;; 0x3ff00000
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
//  524         for (i = index3; i <= index2; i++)
        LDR.W    R1,??DataTable12_5
        LDR      R1,[R1, #+0]
        B.N      ??straightRepair_21
//  525         {
//  526           temp = (index3 - i)/k2 + col3;
//  527           
//  528           if (temp >= MAX_COL)
//  529           {
//  530             temp = MAX_COL-1;
//  531           }
//  532           else if(temp < 0)
??straightRepair_22:
        CMP      R2,#+0
        BPL.N    ??straightRepair_23
//  533           {
//  534             temp = 0;
        MOVS     R2,#+0
//  535           }
//  536           Img[i][temp] = 254;
??straightRepair_23:
        MOVS     R3,#+254
        LDR.W    R4,??DataTable10_1
        MOVS     R5,#+80
        MLA      R4,R5,R1,R4
        STRB     R3,[R2, R4]
        ADDS     R1,R1,#+1
??straightRepair_21:
        LDR.W    R2,??DataTable10_5
        LDR      R2,[R2, #+0]
        CMP      R2,R1
        BLT.N    ??straightRepair_0
        LDR.W    R2,??DataTable12_5
        LDR      R2,[R2, #+0]
        SUBS     R2,R2,R1
        SDIV     R2,R2,R0
        LDR.W    R3,??DataTable12_6
        LDR      R3,[R3, #+0]
        ADDS     R2,R3,R2
        CMP      R2,#+80
        BLT.N    ??straightRepair_22
        MOVS     R2,#+79
        B.N      ??straightRepair_23
//  537         } 
//  538       }
//  539     } 
//  540   }
//  541 }
??straightRepair_0:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     lostSide

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     runwayType

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     absMid

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     advanceLine

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     endLine

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_5:
        DC32     leftDot

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_6:
        DC32     startLine

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_7:
        DC32     rightDot

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_8:
        DC32     midDot

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_9:
        DC32     countBlack

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_10:
        DC32     Left

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_11:
        DC32     Right
//  542 
//  543 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  544 void leftRepair()
//  545 {
leftRepair:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+244
//  546   int i, j, k1, k2, temp;
//  547   //第一行左端丢线(无index1
//  548   if (vertical[0] <= 50 || leftDot[55] == 0)
        LDR.N    R0,??DataTable10_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+51
        BLT.W    ??leftRepair_0
        LDR.W    R0,??DataTable12_8
        LDR      R0,[R0, #+220]
        CMP      R0,#+0
        BEQ.W    ??leftRepair_0
//  549   {
//  550 
//  551   }
//  552 
//  553   //第一行不丢线
//  554   else
//  555   {
//  556     //index1-----找左边界
//  557     for (i = startLine; i >= endLine; i--)
        LDR.W    R0,??DataTable12_9
        LDR      R0,[R0, #+0]
        B.N      ??leftRepair_1
??leftRepair_2:
        SUBS     R0,R0,#+1
??leftRepair_1:
        LDR.W    R1,??DataTable12
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BLT.N    ??leftRepair_3
//  558     {
//  559       temp = leftDot[i] - leftDot[i - 1];
        LDR.W    R1,??DataTable12_8
        LDR      R1,[R1, R0, LSL #+2]
        LDR.W    R2,??DataTable12_8
        ADDS     R2,R2,R0, LSL #+2
        LDR      R2,[R2, #-4]
        SUBS     R1,R1,R2
//  560       if (temp >= 7 || temp <= -7)
        ADDS     R1,R1,#+6
        CMP      R1,#+13
        BCC.N    ??leftRepair_2
//  561       {
//  562 //        temp = leftDot[i-1] - leftDot[i-2];
//  563 //        if (temp < 0)
//  564 //        {
//  565 //          temp = temp * -1;
//  566 //        }
//  567 //        if (temp < 7)
//  568 //        {
//  569 //          //找到左边的点并记录
//  570 //          index1 = i;
//  571 //          col1 = leftDot[i];
//  572 //          break;
//  573 //        }
//  574         index1 = i;
        LDR.N    R1,??DataTable10_4
        STR      R0,[R1, #+0]
//  575         col1 = leftDot[i];
        LDR.W    R1,??DataTable12_8
        LDR      R0,[R1, R0, LSL #+2]
        LDR.W    R1,??DataTable12_1
        STR      R0,[R1, #+0]
//  576         break;
//  577       }
//  578     }
//  579 
//  580 
//  581     //index2-----找上边界
//  582     for (i = Right; i > Left; i--)
??leftRepair_3:
        LDR.W    R0,??DataTable12_10
        LDR      R0,[R0, #+0]
        B.N      ??leftRepair_4
??leftRepair_5:
        SUBS     R0,R0,#+1
??leftRepair_4:
        LDR.W    R1,??DataTable12_11
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BGE.N    ??leftRepair_6
//  583     {
//  584       temp = vertical[i] - vertical[i+1];
        LDR.N    R1,??DataTable10_3
        LDR      R1,[R1, R0, LSL #+2]
        LDR.N    R2,??DataTable10_3
        ADDS     R2,R2,R0, LSL #+2
        LDR      R2,[R2, #+4]
        SUBS     R1,R1,R2
//  585       if (temp < 0)
        CMP      R1,#+0
        BPL.N    ??leftRepair_7
//  586       {
//  587         temp = temp * -1;
        MOVS     R2,#-1
        MULS     R1,R2,R1
//  588       }
//  589       if (temp >= 10)
??leftRepair_7:
        CMP      R1,#+10
        BLT.N    ??leftRepair_5
//  590       {
//  591 //        temp = vertical[i-1] - vertical[i];
//  592 //        if (temp < 0)
//  593 //        {
//  594 //          temp = temp * -1;
//  595 //        }
//  596 //        if (temp <= 5)
//  597 //        {
//  598 //          index2 = vertical[i+1];
//  599 //          col2 = i + 1;
//  600 //          break;
//  601 //        }
//  602         index2 = vertical[i+1];
        LDR.N    R1,??DataTable10_3
        ADDS     R1,R1,R0, LSL #+2
        LDR      R1,[R1, #+4]
        LDR.W    R2,??DataTable12_12
        STR      R1,[R2, #+0]
//  603         col2 = i+1;
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable12_4
        STR      R0,[R1, #+0]
//  604         break;
//  605       }
//  606     }
//  607     
//  608     //index3-----找左边黑点
//  609     if (-1 != index2)
??leftRepair_6:
        LDR.W    R0,??DataTable12_12
        LDR      R0,[R0, #+0]
        CMN      R0,#+1
        BEQ.W    ??leftRepair_8
//  610     {
//  611       int leftBlack[60];
//  612       for (i = index2; i > endLine; i--)
        LDR.W    R0,??DataTable12_12
        LDR      R0,[R0, #+0]
        B.N      ??leftRepair_9
//  613       {
//  614         for (j = col2 - 3; j >= 0; j--)
??leftRepair_10:
        SUBS     R1,R1,#+1
??leftRepair_11:
        CMP      R1,#+0
        BMI.N    ??leftRepair_12
//  615         {
//  616           if (0 == Img[i][j])
        LDR.N    R2,??DataTable10_1
        MOVS     R3,#+80
        MLA      R2,R3,R0,R2
        LDRB     R2,[R1, R2]
        CMP      R2,#+0
        BNE.N    ??leftRepair_10
//  617           {
//  618             break;
//  619           }  
//  620         }
//  621         leftBlack[i] = j;
??leftRepair_12:
        ADD      R2,SP,#+0
        STR      R1,[R2, R0, LSL #+2]
        SUBS     R0,R0,#+1
??leftRepair_9:
        LDR.W    R1,??DataTable12
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BGE.N    ??leftRepair_13
        LDR.W    R1,??DataTable12_4
        LDR      R1,[R1, #+0]
        SUBS     R1,R1,#+3
        B.N      ??leftRepair_11
//  622       }
//  623 
//  624       for (i = index2; i > endLine; i--)
??leftRepair_13:
        LDR.W    R0,??DataTable12_12
        LDR      R0,[R0, #+0]
        B.N      ??leftRepair_14
//  625       {
//  626         temp = leftBlack[i-1] - leftBlack[i];
??leftRepair_15:
        ADD      R1,SP,#+0
        ADDS     R1,R1,R0, LSL #+2
        LDR      R1,[R1, #-4]
        ADD      R2,SP,#+0
        LDR      R2,[R2, R0, LSL #+2]
        SUBS     R1,R1,R2
//  627         if (temp >= 7 || temp <= -7)
        ADDS     R1,R1,#+6
        CMP      R1,#+13
        BCC.N    ??leftRepair_16
//  628         {
//  629 //          temp = leftBlack[i-1] - col2;
//  630 //          if (temp > -15 && temp < 15)
//  631 //          {
//  632 //            index3 = i-1;
//  633 //            col3 = leftBlack[index3];
//  634 //            break;
//  635 //          }
//  636           index3 = i - 1;
        SUBS     R1,R0,#+1
        LDR.W    R2,??DataTable12_5
        STR      R1,[R2, #+0]
//  637           col3 = leftBlack[index3];
        ADD      R1,SP,#+0
        LDR.W    R2,??DataTable12_5
        LDR      R2,[R2, #+0]
        LDR      R1,[R1, R2, LSL #+2]
        LDR.W    R2,??DataTable12_6
        STR      R1,[R2, #+0]
//  638         }
//  639       }
??leftRepair_16:
        SUBS     R0,R0,#+1
??leftRepair_14:
        LDR.W    R1,??DataTable12
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BLT.N    ??leftRepair_15
//  640       
//  641       //确认index3位置
//  642       for (j = col3; j > 0; j--)
        LDR.W    R0,??DataTable12_6
        LDR      R1,[R0, #+0]
        B.N      ??leftRepair_17
??leftRepair_18:
        SUBS     R1,R1,#+1
??leftRepair_17:
        CMP      R1,#+1
        BLT.N    ??leftRepair_19
//  643       {
//  644         if (255 == Img[index3][j] && 0 == Img[index3][j+1])
        LDR.N    R0,??DataTable10_1
        LDR.W    R2,??DataTable12_5
        LDR      R2,[R2, #+0]
        MOVS     R3,#+80
        MLA      R0,R3,R2,R0
        LDRB     R0,[R1, R0]
        CMP      R0,#+255
        BNE.N    ??leftRepair_18
        LDR.N    R0,??DataTable10_1
        LDR.W    R2,??DataTable12_5
        LDR      R2,[R2, #+0]
        MOVS     R3,#+80
        MLA      R0,R3,R2,R0
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        CMP      R0,#+0
        BNE.N    ??leftRepair_18
//  645         {
//  646           col3 = j;
        LDR.W    R0,??DataTable12_6
        STR      R1,[R0, #+0]
//  647           break;
//  648         }
//  649       }
//  650       
//  651       //index4
//  652       if (-1 != index3)
??leftRepair_19:
        LDR.W    R0,??DataTable12_5
        LDR      R0,[R0, #+0]
        CMN      R0,#+1
        BEQ.N    ??leftRepair_8
//  653       {
//  654         index4 = index3;
        LDR.W    R0,??DataTable12_5
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable12_2
        STR      R0,[R1, #+0]
//  655         for (j = col3; j > 0; j--)
        LDR.W    R0,??DataTable12_6
        LDR      R1,[R0, #+0]
        B.N      ??leftRepair_20
??leftRepair_21:
        SUBS     R1,R1,#+1
??leftRepair_20:
        CMP      R1,#+1
        BLT.N    ??leftRepair_8
//  656         {
//  657           if (255 == Img[index3][j] && 0 == Img[index3][j-1])
        LDR.N    R0,??DataTable10_1
        LDR.W    R2,??DataTable12_5
        LDR      R2,[R2, #+0]
        MOVS     R3,#+80
        MLA      R0,R3,R2,R0
        LDRB     R0,[R1, R0]
        CMP      R0,#+255
        BNE.N    ??leftRepair_21
        LDR.N    R0,??DataTable10_1
        LDR.W    R2,??DataTable12_5
        LDR      R2,[R2, #+0]
        MOVS     R3,#+80
        MLA      R0,R3,R2,R0
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-1]
        CMP      R0,#+0
        BNE.N    ??leftRepair_21
//  658           {
//  659             col4 = j;
        LDR.W    R0,??DataTable12_3
        STR      R1,[R0, #+0]
//  660             break;
//  661           }
//  662         }
//  663         //col4 = leftBlack[index3+1];
//  664       }
//  665     }
//  666     
//  667     
//  668 
//  669     //四个点都找到
//  670     if (-1 != index3 && -1 != index4)
??leftRepair_8:
        LDR.W    R0,??DataTable12_5
        LDR      R0,[R0, #+0]
        CMN      R0,#+1
        BEQ.W    ??leftRepair_0
        LDR.W    R0,??DataTable12_2
        LDR      R0,[R0, #+0]
        CMN      R0,#+1
        BEQ.W    ??leftRepair_0
//  671     {
//  672       if (col4 == col1)
        LDR.W    R0,??DataTable12_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable12_1
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??leftRepair_22
//  673       {
//  674         for (int i = index4; i <= index1; i++)
        LDR.W    R0,??DataTable12_2
        LDR      R0,[R0, #+0]
??leftRepair_23:
        LDR.N    R1,??DataTable10_4
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BLT.N    ??leftRepair_24
//  675         {
//  676           temp = col4;
        LDR.W    R1,??DataTable12_3
        LDR      R1,[R1, #+0]
//  677           Img[i][temp] = 0;
        MOVS     R2,#+0
        LDR.N    R3,??DataTable10_1
        MOVS     R4,#+80
        MLA      R3,R4,R0,R3
        STRB     R2,[R1, R3]
//  678         }
        ADDS     R0,R0,#+1
        B.N      ??leftRepair_23
//  679       }
//  680       else
//  681       {
//  682         k1 = (index1 - index4)/((col4 - col1) * 1.0);
??leftRepair_22:
        LDR.N    R0,??DataTable10_4
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable12_2
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        BL       __aeabi_i2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable12_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable12_1
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable12_7  ;; 0x3ff00000
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
//  683         
//  684         for (int i = index4; i <= index1; i++)
        LDR.W    R1,??DataTable12_2
        LDR      R2,[R1, #+0]
        B.N      ??leftRepair_25
//  685         {
//  686           temp = (index4 - i)/k1 + col4;
??leftRepair_26:
        LDR.W    R1,??DataTable12_2
        LDR      R1,[R1, #+0]
        SUBS     R1,R1,R2
        SDIV     R1,R1,R0
        LDR.W    R3,??DataTable12_3
        LDR      R3,[R3, #+0]
        ADDS     R1,R3,R1
//  687           if (temp >= 80)
        CMP      R1,#+80
        BLT.N    ??leftRepair_27
//  688           {
//  689             temp = 79;
        MOVS     R1,#+79
//  690           }
//  691           Img[i][temp] = 0;
??leftRepair_27:
        MOVS     R3,#+0
        LDR.N    R4,??DataTable10_1
        MOVS     R5,#+80
        MLA      R4,R5,R2,R4
        STRB     R3,[R1, R4]
//  692         }
        ADDS     R2,R2,#+1
??leftRepair_25:
        LDR.N    R1,??DataTable10_4
        LDR      R1,[R1, #+0]
        CMP      R1,R2
        BGE.N    ??leftRepair_26
//  693       }
//  694 
//  695 
//  696       if (col3 == col2)
??leftRepair_24:
        LDR.W    R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable12_4
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??leftRepair_28
//  697       {
//  698         for (int i = index3; i <= index2; i++)
        LDR.W    R0,??DataTable12_5
        LDR      R0,[R0, #+0]
??leftRepair_29:
        LDR.W    R1,??DataTable12_12
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BLT.N    ??leftRepair_0
//  699         {
//  700           temp = col3;
        LDR.W    R1,??DataTable12_6
        LDR      R1,[R1, #+0]
//  701           Img[i][temp] = 0;
        MOVS     R2,#+0
        LDR.N    R3,??DataTable10_1
        MOVS     R4,#+80
        MLA      R3,R4,R0,R3
        STRB     R2,[R1, R3]
//  702         }
        ADDS     R0,R0,#+1
        B.N      ??leftRepair_29
//  703       }
//  704       else
//  705       {
//  706         k2 = (index2 - index3)/((col3 - col2) * 1.0);
??leftRepair_28:
        LDR.W    R0,??DataTable12_12
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable12_5
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        BL       __aeabi_i2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable12_4
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable12_7  ;; 0x3ff00000
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
//  707         for (int i = index3; i <= index2; i++)
        LDR.W    R1,??DataTable12_5
        LDR      R2,[R1, #+0]
        B.N      ??leftRepair_30
//  708         {
//  709           temp = (index3 - i)/k2 + col3;
??leftRepair_31:
        LDR.W    R1,??DataTable12_5
        LDR      R1,[R1, #+0]
        SUBS     R1,R1,R2
        SDIV     R1,R1,R0
        LDR.W    R3,??DataTable12_6
        LDR      R3,[R3, #+0]
        ADDS     R1,R3,R1
//  710           if (temp >= 80)
        CMP      R1,#+80
        BLT.N    ??leftRepair_32
//  711           {
//  712             temp = 79;
        MOVS     R1,#+79
//  713           }
//  714           Img[i][temp] = 0;
??leftRepair_32:
        MOVS     R3,#+0
        LDR.N    R4,??DataTable10_1
        MOVS     R5,#+80
        MLA      R4,R5,R2,R4
        STRB     R3,[R1, R4]
//  715         }
        ADDS     R2,R2,#+1
??leftRepair_30:
        LDR.W    R1,??DataTable12_12
        LDR      R1,[R1, #+0]
        CMP      R1,R2
        BGE.N    ??leftRepair_31
//  716       }
//  717     }
//  718   }
//  719 }
??leftRepair_0:
        ADD      SP,SP,#+244
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     crossFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     Img

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     Line3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     vertical

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     index1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     index2
//  720 
//  721 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  722 void rightRepair()
//  723 {
rightRepair:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+244
//  724   int k1, k2, temp;
//  725   //第一行右端丢线(即找不到index1
//  726   if (vertical[79] <= 50 || rightDot[55] == 79)
        LDR.W    R0,??DataTable12_13
        LDR      R0,[R0, #+316]
        CMP      R0,#+51
        BLT.W    ??rightRepair_0
        LDR.W    R0,??DataTable12_14
        LDR      R0,[R0, #+220]
        CMP      R0,#+79
        BEQ.W    ??rightRepair_0
//  727   {
//  728     //isRepaired = 0;
//  729     //crossRightError();
//  730   }
//  731 
//  732   //第一行不丢线
//  733   else
//  734   {
//  735     int i , j;
//  736     //index1-----找右边界
//  737     for (i = 59; i >= endLine; i--)
        MOVS     R1,#+59
        B.N      ??rightRepair_1
??rightRepair_2:
        SUBS     R1,R1,#+1
??rightRepair_1:
        LDR.W    R0,??DataTable12
        LDR      R0,[R0, #+0]
        CMP      R1,R0
        BLT.N    ??rightRepair_3
//  738     {
//  739       temp = rightDot[i] - rightDot[i - 1];
        LDR.W    R0,??DataTable12_14
        LDR      R0,[R0, R1, LSL #+2]
        LDR.W    R2,??DataTable12_14
        ADDS     R2,R2,R1, LSL #+2
        LDR      R2,[R2, #-4]
        SUBS     R2,R0,R2
//  740       if (temp < 0)
        CMP      R2,#+0
        BPL.N    ??rightRepair_4
//  741       {
//  742         temp = temp * -1;
        MOVS     R0,#-1
        MULS     R2,R0,R2
//  743       }
//  744       if (temp >= 7)
??rightRepair_4:
        CMP      R2,#+7
        BLT.N    ??rightRepair_2
//  745       {
//  746 //        temp = rightDot[i-1] - rightDot[i-2];
//  747 //        if (temp < 0)
//  748 //        {
//  749 //          temp = temp * -1;
//  750 //        }
//  751 //        if (temp < 7)
//  752 //        {
//  753 //          //找到右边的点并记录
//  754 //          index1 = i;
//  755 //          col1 = rightDot[i];
//  756 //          break;
//  757 //        }
//  758         index1 = i;
        LDR.W    R0,??DataTable12_15
        STR      R1,[R0, #+0]
//  759         col1 = rightDot[i];
        LDR.W    R0,??DataTable12_14
        LDR      R0,[R0, R1, LSL #+2]
        LDR.W    R1,??DataTable12_1
        STR      R0,[R1, #+0]
//  760         break;
//  761       }
//  762     }
//  763 
//  764 
//  765     //index2-----找上边界
//  766     for (i = Left; i < Right; i++)
??rightRepair_3:
        LDR.W    R0,??DataTable12_11
        LDR      R1,[R0, #+0]
        B.N      ??rightRepair_5
??rightRepair_6:
        ADDS     R1,R1,#+1
??rightRepair_5:
        LDR.W    R0,??DataTable12_10
        LDR      R0,[R0, #+0]
        CMP      R1,R0
        BGE.N    ??rightRepair_7
//  767     {
//  768       temp = vertical[i] - vertical[i+1];
        LDR.W    R0,??DataTable12_13
        LDR      R0,[R0, R1, LSL #+2]
        LDR.W    R2,??DataTable12_13
        ADDS     R2,R2,R1, LSL #+2
        LDR      R2,[R2, #+4]
        SUBS     R2,R0,R2
//  769       if (temp < 0)
        CMP      R2,#+0
        BPL.N    ??rightRepair_8
//  770       {
//  771         temp = temp * -1;
        MOVS     R0,#-1
        MULS     R2,R0,R2
//  772       }
//  773       if (temp >= 10)
??rightRepair_8:
        CMP      R2,#+10
        BLT.N    ??rightRepair_6
//  774       {
//  775 //        temp = vertical[i-1] - vertical[i];
//  776 //        if (temp < 0)
//  777 //        {
//  778 //          temp = temp * -1;
//  779 //        }
//  780 //        if (temp <= 5)
//  781 //        {
//  782 //          index2 = vertical[i];
//  783 //          col2 = i;
//  784 //          break;
//  785 //        }
//  786         index2 = vertical[i];
        LDR.W    R0,??DataTable12_13
        LDR      R0,[R0, R1, LSL #+2]
        LDR.W    R2,??DataTable12_12
        STR      R0,[R2, #+0]
//  787         col2 = i;
        LDR.W    R0,??DataTable12_4
        STR      R1,[R0, #+0]
//  788         break;
//  789       }
//  790     }
//  791 
//  792   
//  793     if (-1 != index2)
??rightRepair_7:
        LDR.W    R0,??DataTable12_12
        LDR      R0,[R0, #+0]
        CMN      R0,#+1
        BEQ.N    ??rightRepair_9
//  794     {
//  795       //index3-----找右黑点
//  796       int rightBlack[60];
//  797       for (i = index2; i >= endLine; i--)
        LDR.W    R0,??DataTable12_12
        LDR      R1,[R0, #+0]
        B.N      ??rightRepair_10
//  798       {
//  799         for (j = col2 + 3; j < 80; j++)
??rightRepair_11:
        ADDS     R0,R0,#+1
??rightRepair_12:
        CMP      R0,#+80
        BGE.N    ??rightRepair_13
//  800         {
//  801           if (0 == Img[i][j])
        LDR.W    R2,??DataTable12_16
        MOVS     R3,#+80
        MLA      R2,R3,R1,R2
        LDRB     R2,[R0, R2]
        CMP      R2,#+0
        BNE.N    ??rightRepair_11
//  802           {
//  803             break;
//  804           }  
//  805         }
//  806         rightBlack[i] = j;
??rightRepair_13:
        ADD      R2,SP,#+0
        STR      R0,[R2, R1, LSL #+2]
        SUBS     R1,R1,#+1
??rightRepair_10:
        LDR.N    R0,??DataTable12
        LDR      R0,[R0, #+0]
        CMP      R1,R0
        BLT.N    ??rightRepair_14
        LDR.N    R0,??DataTable12_4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+3
        B.N      ??rightRepair_12
//  807       }
//  808       for (i = index2; i >= endLine; i--)
??rightRepair_14:
        LDR.N    R0,??DataTable12_12
        LDR      R1,[R0, #+0]
        B.N      ??rightRepair_15
??rightRepair_16:
        SUBS     R1,R1,#+1
??rightRepair_15:
        LDR.N    R0,??DataTable12
        LDR      R0,[R0, #+0]
        CMP      R1,R0
        BLT.N    ??rightRepair_17
//  809       {
//  810         temp = rightBlack[i-1] - rightBlack[i];
        ADD      R0,SP,#+0
        ADDS     R0,R0,R1, LSL #+2
        LDR      R0,[R0, #-4]
        ADD      R2,SP,#+0
        LDR      R2,[R2, R1, LSL #+2]
        SUBS     R2,R0,R2
//  811         if (temp >= 7 || temp <= -7)
        ADDS     R0,R2,#+6
        CMP      R0,#+13
        BCC.N    ??rightRepair_16
//  812         {
//  813 //          temp = rightBlack[i-1] - col2;
//  814 //          if (temp > -15 && temp < 15)
//  815 //          {
//  816 //            index3 = i - 1;
//  817 //            col3 = rightBlack[index3];
//  818 //            break;
//  819 //          }
//  820           index3 = i - 1;
        SUBS     R0,R1,#+1
        LDR.N    R1,??DataTable12_5
        STR      R0,[R1, #+0]
//  821           col3 = rightBlack[index3];
        ADD      R0,SP,#+0
        LDR.N    R1,??DataTable12_5
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.N    R1,??DataTable12_6
        STR      R0,[R1, #+0]
//  822           break;
//  823         }
//  824       }
//  825       
//  826       for (j = col3; j < 80; j++)
??rightRepair_17:
        LDR.N    R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        B.N      ??rightRepair_18
??rightRepair_19:
        ADDS     R0,R0,#+1
??rightRepair_18:
        CMP      R0,#+80
        BGE.N    ??rightRepair_20
//  827       {
//  828         if (255 == Img[index3][j] && 0 == Img[index3][j-1])
        LDR.N    R1,??DataTable12_16
        LDR.N    R2,??DataTable12_5
        LDR      R2,[R2, #+0]
        MOVS     R3,#+80
        MLA      R1,R3,R2,R1
        LDRB     R1,[R0, R1]
        CMP      R1,#+255
        BNE.N    ??rightRepair_19
        LDR.N    R1,??DataTable12_16
        LDR.N    R2,??DataTable12_5
        LDR      R2,[R2, #+0]
        MOVS     R3,#+80
        MLA      R1,R3,R2,R1
        ADDS     R1,R0,R1
        LDRB     R1,[R1, #-1]
        CMP      R1,#+0
        BNE.N    ??rightRepair_19
//  829         {
//  830           col3 = j;
        LDR.N    R1,??DataTable12_6
        STR      R0,[R1, #+0]
//  831           break;
//  832         }
//  833       }
//  834 
//  835       //index4
//  836       if (-1 != index3)
??rightRepair_20:
        LDR.N    R0,??DataTable12_5
        LDR      R0,[R0, #+0]
        CMN      R0,#+1
        BEQ.N    ??rightRepair_9
//  837       {
//  838         index4 = index3;
        LDR.N    R0,??DataTable12_5
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable12_2
        STR      R0,[R1, #+0]
//  839         for (j = col3; j < 80; j++)
        LDR.N    R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        B.N      ??rightRepair_21
??rightRepair_22:
        ADDS     R0,R0,#+1
??rightRepair_21:
        CMP      R0,#+80
        BGE.N    ??rightRepair_9
//  840         {
//  841           if (255 == Img[index3][j] && 0 == Img[index3][j+1])
        LDR.N    R1,??DataTable12_16
        LDR.N    R2,??DataTable12_5
        LDR      R2,[R2, #+0]
        MOVS     R3,#+80
        MLA      R1,R3,R2,R1
        LDRB     R1,[R0, R1]
        CMP      R1,#+255
        BNE.N    ??rightRepair_22
        LDR.N    R1,??DataTable12_16
        LDR.N    R2,??DataTable12_5
        LDR      R2,[R2, #+0]
        MOVS     R3,#+80
        MLA      R1,R3,R2,R1
        ADDS     R1,R0,R1
        LDRB     R1,[R1, #+1]
        CMP      R1,#+0
        BNE.N    ??rightRepair_22
//  842           {
//  843             col4 = j;
        LDR.N    R1,??DataTable12_3
        STR      R0,[R1, #+0]
//  844             break;
//  845           }
//  846         }
//  847         //col4 = rightBlack[index3+1];
//  848       }
//  849     }
//  850     
//  851     
//  852     //四个点都找到
//  853     if (-1 != index3 && -1 != index4)
??rightRepair_9:
        LDR.N    R0,??DataTable12_5
        LDR      R0,[R0, #+0]
        CMN      R0,#+1
        BEQ.W    ??rightRepair_0
        LDR.N    R0,??DataTable12_2
        LDR      R0,[R0, #+0]
        CMN      R0,#+1
        BEQ.W    ??rightRepair_0
//  854     {  
//  855       if (col4 == col1)
        LDR.N    R0,??DataTable12_3
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable12_1
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??rightRepair_23
//  856       {
//  857         for (i = index4; i <= index1; i++)
        LDR.N    R0,??DataTable12_2
        LDR      R1,[R0, #+0]
??rightRepair_24:
        LDR.N    R0,??DataTable12_15
        LDR      R0,[R0, #+0]
        CMP      R0,R1
        BLT.N    ??rightRepair_25
//  858         {
//  859           temp = col4;
        LDR.N    R0,??DataTable12_3
        LDR      R2,[R0, #+0]
//  860           Img[i][temp] = 0;
        MOVS     R0,#+0
        LDR.N    R3,??DataTable12_16
        MOVS     R4,#+80
        MLA      R3,R4,R1,R3
        STRB     R0,[R2, R3]
//  861         }
        ADDS     R1,R1,#+1
        B.N      ??rightRepair_24
//  862       }
//  863       else
//  864       {
//  865         k1 = (index1 - index4)/((col4 - col1) * 1.0);
??rightRepair_23:
        LDR.N    R0,??DataTable12_15
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable12_2
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        BL       __aeabi_i2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable12_3
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable12_1
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable12_7  ;; 0x3ff00000
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
//  866         for (i = index4; i <= index1; i++)
        LDR.N    R1,??DataTable12_2
        LDR      R1,[R1, #+0]
        B.N      ??rightRepair_26
//  867         {
//  868           temp = (index4 - i)/k1 + col4;
//  869           if (temp >= MAX_COL)
//  870           {
//  871             temp = 79;
//  872           }
//  873           else if(temp < 0)
??rightRepair_27:
        CMP      R2,#+0
        BPL.N    ??rightRepair_28
//  874           {
//  875             temp = 0;
        MOVS     R2,#+0
//  876           }
//  877           Img[i][temp] = 0;
??rightRepair_28:
        MOVS     R3,#+0
        LDR.N    R4,??DataTable12_16
        MOVS     R5,#+80
        MLA      R4,R5,R1,R4
        STRB     R3,[R2, R4]
        ADDS     R1,R1,#+1
??rightRepair_26:
        LDR.N    R2,??DataTable12_15
        LDR      R2,[R2, #+0]
        CMP      R2,R1
        BLT.N    ??rightRepair_25
        LDR.N    R2,??DataTable12_2
        LDR      R2,[R2, #+0]
        SUBS     R2,R2,R1
        SDIV     R2,R2,R0
        LDR.N    R3,??DataTable12_3
        LDR      R3,[R3, #+0]
        ADDS     R2,R3,R2
        CMP      R2,#+80
        BLT.N    ??rightRepair_27
        MOVS     R2,#+79
        B.N      ??rightRepair_28
//  878         }
//  879       }
//  880 
//  881      
//  882       if (col3 == col2)
??rightRepair_25:
        LDR.N    R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable12_4
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??rightRepair_29
//  883       {
//  884         for (i = index3; i <= index2; i++)
        LDR.N    R0,??DataTable12_5
        LDR      R1,[R0, #+0]
??rightRepair_30:
        LDR.N    R0,??DataTable12_12
        LDR      R0,[R0, #+0]
        CMP      R0,R1
        BLT.N    ??rightRepair_0
//  885         {
//  886           temp = col3;
        LDR.N    R0,??DataTable12_6
        LDR      R2,[R0, #+0]
//  887           Img[i][temp] = 0;
        MOVS     R0,#+0
        LDR.N    R3,??DataTable12_16
        MOVS     R4,#+80
        MLA      R3,R4,R1,R3
        STRB     R0,[R2, R3]
//  888         }
        ADDS     R1,R1,#+1
        B.N      ??rightRepair_30
//  889       }
//  890       else
//  891       {
//  892         k2 = (index2 - index3)/((col3 - col2) * 1.0);
??rightRepair_29:
        LDR.N    R0,??DataTable12_12
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable12_5
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        BL       __aeabi_i2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable12_4
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable12_7  ;; 0x3ff00000
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
//  893         for (int i = index3; i <= index2; i++)
        LDR.N    R1,??DataTable12_5
        LDR      R1,[R1, #+0]
        B.N      ??rightRepair_31
//  894         {
//  895           temp = (index3 - i)/k2 + col3;
//  896           if (temp >= MAX_COL)
//  897           {
//  898             temp = 79;
//  899           }
//  900           else if(temp < 0)
??rightRepair_32:
        CMP      R2,#+0
        BPL.N    ??rightRepair_33
//  901           {
//  902             temp = 0;
        MOVS     R2,#+0
//  903           }
//  904           Img[i][temp] = 0;
??rightRepair_33:
        MOVS     R3,#+0
        LDR.N    R4,??DataTable12_16
        MOVS     R5,#+80
        MLA      R4,R5,R1,R4
        STRB     R3,[R2, R4]
        ADDS     R1,R1,#+1
??rightRepair_31:
        LDR.N    R2,??DataTable12_12
        LDR      R2,[R2, #+0]
        CMP      R2,R1
        BLT.N    ??rightRepair_0
        LDR.N    R2,??DataTable12_5
        LDR      R2,[R2, #+0]
        SUBS     R2,R2,R1
        SDIV     R2,R2,R0
        LDR.N    R3,??DataTable12_6
        LDR      R3,[R3, #+0]
        ADDS     R2,R3,R2
        CMP      R2,#+80
        BLT.N    ??rightRepair_32
        MOVS     R2,#+79
        B.N      ??rightRepair_33
//  905         }
//  906       }
//  907     }
//  908   }
//  909 }
??rightRepair_0:
        ADD      SP,SP,#+244
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     Line2
//  910 
//  911 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  912 void reCameraScan()
//  913 {
reCameraScan:
        PUSH     {R4-R6}
//  914   int i, j;
//  915   int t = absMid;
        LDR.N    R0,??DataTable12_17
        LDR      R0,[R0, #+0]
//  916   int left, right, temp;
//  917 
//  918   endLine = 5; 
        MOVS     R1,#+5
        LDR.N    R2,??DataTable12
        STR      R1,[R2, #+0]
//  919   leftDot[startLine] = 0;
        MOVS     R1,#+0
        LDR.N    R2,??DataTable12_8
        LDR.N    R3,??DataTable12_9
        LDR      R3,[R3, #+0]
        STR      R1,[R2, R3, LSL #+2]
//  920   rightDot[startLine] = MAX_COL-1;
        MOVS     R1,#+79
        LDR.N    R2,??DataTable12_14
        LDR.N    R3,??DataTable12_9
        LDR      R3,[R3, #+0]
        STR      R1,[R2, R3, LSL #+2]
//  921 
//  922   //找边界点,并存入左右数组
//  923   for (i = startLine; i >= endLine; i--)
        LDR.N    R1,??DataTable12_9
        LDR      R1,[R1, #+0]
        B.N      ??reCameraScan_0
//  924   {
//  925     left = 0;
//  926     right = MAX_COL-1;
//  927     //从上一行中点向左遇到的第一个黑点
//  928     if (0 == Img[i][t])
//  929     {
//  930       endLine = i;
//  931       break;
//  932     }
//  933     for (j = t; j >= 2; j--)
//  934     {
//  935       if (255 == Img[i][j] && 0 == Img[i][j-1])
//  936       {
//  937         left = j;
//  938         break;
//  939       }
//  940     }
//  941     //从上一行中点向右遇到的第一个黑点
//  942     for (j = t; j < MAX_COL-2; j++)
??reCameraScan_1:
        ADDS     R4,R4,#+1
??reCameraScan_2:
        CMP      R4,#+78
        BGE.N    ??reCameraScan_3
//  943     { 
//  944       if (255 == Img[i][j] && 0 == Img[i][j+1])
        LDR.N    R0,??DataTable12_16
        MOVS     R5,#+80
        MLA      R0,R5,R1,R0
        LDRB     R0,[R4, R0]
        CMP      R0,#+255
        BNE.N    ??reCameraScan_1
        LDR.N    R0,??DataTable12_16
        MOVS     R5,#+80
        MLA      R0,R5,R1,R0
        ADDS     R0,R4,R0
        LDRB     R0,[R0, #+1]
        CMP      R0,#+0
        BNE.N    ??reCameraScan_1
//  945       {
//  946         right = j;
        MOVS     R3,R4
//  947         break;
//  948       }
//  949     }
//  950     
//  951     temp = (left + right)/2;
??reCameraScan_3:
        ADDS     R0,R3,R2
        MOVS     R4,#+2
        SDIV     R0,R0,R4
//  952     t = temp;
//  953     //左边点坐标，右边点坐标，中点坐标
//  954     leftDot[i] = left;
        LDR.N    R4,??DataTable12_8
        STR      R2,[R4, R1, LSL #+2]
//  955     rightDot[i] = right;
        LDR.N    R2,??DataTable12_14
        STR      R3,[R2, R1, LSL #+2]
//  956     midDot[i] = temp;
        LDR.N    R2,??DataTable12_18
        STR      R0,[R2, R1, LSL #+2]
        SUBS     R1,R1,#+1
??reCameraScan_0:
        LDR.N    R2,??DataTable12
        LDR      R2,[R2, #+0]
        CMP      R1,R2
        BLT.N    ??reCameraScan_4
        MOVS     R2,#+0
        MOVS     R3,#+79
        LDR.N    R4,??DataTable12_16
        MOVS     R5,#+80
        MLA      R4,R5,R1,R4
        LDRB     R4,[R0, R4]
        CMP      R4,#+0
        BNE.N    ??reCameraScan_5
        LDR.N    R0,??DataTable12
        STR      R1,[R0, #+0]
//  957   }
//  958 }
??reCameraScan_4:
        POP      {R4-R6}
        BX       LR               ;; return
??reCameraScan_5:
        MOVS     R4,R0
        B.N      ??reCameraScan_6
??reCameraScan_7:
        SUBS     R4,R4,#+1
??reCameraScan_6:
        CMP      R4,#+2
        BLT.N    ??reCameraScan_8
        LDR.N    R5,??DataTable12_16
        MOVS     R6,#+80
        MLA      R5,R6,R1,R5
        LDRB     R5,[R4, R5]
        CMP      R5,#+255
        BNE.N    ??reCameraScan_7
        LDR.N    R5,??DataTable12_16
        MOVS     R6,#+80
        MLA      R5,R6,R1,R5
        ADDS     R5,R4,R5
        LDRB     R5,[R5, #-1]
        CMP      R5,#+0
        BNE.N    ??reCameraScan_7
        MOVS     R2,R4
??reCameraScan_8:
        MOVS     R4,R0
        B.N      ??reCameraScan_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     endLine

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     col1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     index4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     col4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     col2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     index3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     col3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_7:
        DC32     0x3ff00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_8:
        DC32     leftDot

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_9:
        DC32     startLine

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_10:
        DC32     Right

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_11:
        DC32     Left

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_12:
        DC32     index2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_13:
        DC32     vertical

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_14:
        DC32     rightDot

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_15:
        DC32     index1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_16:
        DC32     Img

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_17:
        DC32     absMid

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_18:
        DC32     midDot

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
// 4 380 bytes in section .text
// 
// 4 380 bytes of CODE memory
//
//Errors: none
//Warnings: 6
