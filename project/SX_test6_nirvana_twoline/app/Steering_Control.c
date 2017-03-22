#include "include.h"
/*后来加的变量*/
#define white 255
#define black 0


#define ROW_MAX 60
#define COL_MAX 80

/* 80*60
*/


uint8 Left_Valid[ROW_MAX];
uint8 Right_Valid[ROW_MAX];

uint8 Left_turnmax=0;
uint8 Right_turnmax=0;

uint8 straight_cross=0;

uint8 Left_flag=0,Right_flag=0;
int turn=0;
int turn1=0;
int turn2=0;
int last_turn=0;
int D_value=0;
int D_value_old=0;

FTM_InitTypeDef steering_init_struct;
uint8 m_abs(int m);
void  search_line(void);

void steering_init()
{
  steering_init_struct.FTM_Ftmx = FTM2;	
  steering_init_struct.FTM_Mode = FTM_MODE_PWM;	
  steering_init_struct.FTM_PwmFreq = 50;
  
  LPLD_FTM_Init(steering_init_struct);
  
  LPLD_FTM_PWM_Enable(FTM2, 
                      FTM_Ch1, 
                      steering_middle,  
                      PTB19, 
                      ALIGN_LEFT       
                        );  
}


void steering_control(void)
{
  search_line();
  
  
  last_turn=turn;
  turn1=Center_Line[39]-40;
  turn2=Center_Line[30]-40;
  turn=(turn1*8+turn2*2)/10;
  
  D_value=(-turn);
  
  if(turn_left&&turn_right)
  steering_out=steering_middle-(D_value*(steering_p+20));//+(D_value-D_value_old*steering_d));
  
  else
     steering_out=steering_middle-(D_value*(steering_p));//+(D_value-D_value_old*steering_d));
  
  
   if(steering_out<=steering_left)
  {steering_out = steering_left;}
  if(steering_out>=steering_right)
  {steering_out = steering_right;}
   LCD_Write_Float_Dot(85,0,turn,2);
   
   
 LCD_Write_Float_Dot(108,2,Right_Line[30],0);
 LCD_Write_Float_Dot(85,2,Left_Line[30],0);
 
    LCD_Write_Float_Dot(108,3,Right_Line[39],0);
  LCD_Write_Float_Dot(85,3,Left_Line[39],0);
  
//  for(uint8 i=59;i>19;i--)
//  {
//    LCD_PutPixel(i,Center_Line[i]); 
//    LCD_PutPixel(i,Left_Line[i]); 
//    LCD_PutPixel(i,Right_Line[i]); 
//  }
   //   steering_err=40-(right[8]+left[8])/2;
  LPLD_FTM_PWM_ChangeDuty(FTM2, FTM_Ch1, (int)steering_out);
  
  
  turn_right=0;
  turn_left=0;
straight_cross=0;
}
void  search_line(void)
{

  uint8 max_row=0;
  uint8 cross_flag=0;

  
  for(uint8 y=59;y>19;y--)
  {
    
    Left_flag=0;
    Right_flag=0;
    
    Left_Line[y]=1;//初始化左黑线为1
    Right_Line[y]=78;//初始化右黑线为1
    //左
    for(uint8 xl=40;xl>1;xl--)
    {
      if(Img[y][xl]==white&&Img[y][xl-2]==black)
      {
        Left_Line[y]=xl+2;
        Left_flag=1;
        break;
      }
    
    }
    

    //右
    for(uint8 xr=40;xr<78;xr++)
    {
      if(Img[y][xr]==white&&Img[y][xr+2]==black)
      {
        Right_Line[y]=xr-2;
        Right_flag=1;
        break;
      }
    }
    
    if(y>56)
    {
      if(!Right_flag&&!Left_flag)
        cross_flag=1;
    }
    
   if(Right_flag&&Left_flag)
     Center_Line[y]=(Right_Line[y]+Left_Line[y])/2;
    
      // else if(!Right_flag&&!Left_flag)//直入十字
    else if(Right_Line[y]-Left_Line[y]>60)
   {
     straight_cross++;
   }
    
   else if(!Left_flag&&Right_flag&&!straight_cross)//左转
   {
     Center_Line[y]=Right_Line[y]-(Right_Line[y+1]-Center_Line[y+1]);
     turn_left=1;
   }
   else if(Left_flag&&!Right_flag&&!straight_cross)//右转
   {
     Center_Line[y]=Left_Line[y]+(Center_Line[y+1]-Left_Line[y+1]);
     turn_right=1;
   }

   
   
   

  }
  
  
  if(straight_cross>3)
  {
     uint8 x1=0,y1=0;
     uint8 x2=0,y2=0;
     uint8 x3=0,y3=0;
     uint8 x4=0,y4=0;
     uint8 fLeft_Flag=0;
     uint8 fRight_Flag=0;
     uint8 mid=0;
     
     float k1,k2;
     for(uint8 i=59;i>19;i=i-5)
     {
       if((m_abs(Left_Line[i+1]-Left_Line[i]))>5)
       {
         x1=Left_Line[i+1];
         y1=i;
         fLeft_Flag=1;
       }
       
       else if((Right_Line[i]-Right_Line[i+1])>15)
       {
         x2=Right_Line[i+1];
         y2=i;
         fRight_Flag=1;
       }
       else if(fLeft_Flag&&fRight_Flag)
        break;       
     }
     
     fLeft_Flag=0;     
     fRight_Flag=0;
     
     if(y1>=y2)//左下点y1比右下点y2 低 
     {
       mid=(Right_Line[y1]+Left_Line[y1])/2;

     }
     
      else    if(y1<y2)//左下点y1比右下点y2 高
     {
       mid=(Right_Line[y2]+Left_Line[y2])/2;
     }
     
            
       
       for(uint8 i=y1;i>19;i--)
       {
         if((Left_Line[i]-Left_Line[i+1])>15)
         {
           y3=i;
           x3=Left_Line[i];
           break;
         }
       }
       for(uint8 i=y2;i>19;i--)
       {
         if((Right_Line[i+1]-Right_Line[i])>15)
         {
           y4=i;
           x4=Right_Line[i];
           break;
         }
       }
     
     k1=(y1-y3)/(x1-x3);
     k2=(y2-y4)/(x2-x4);
     
     for(uint8 i=y3;y3<y1;y3++)
     {
       Left_Line[i]=Left_Line[i-1]+(int)k1;
     }
     
     
    // Center_Line[y]=(Right_Line[y]+Left_Line[y])/2;
  }
}

 

/*
void  search_line(void)
{
  uint8 Left_End=0;//有效结束行
  uint8 Right_End=0;
  
  uint8 Left_Valid_Count=0;//默认左边沿有效连续计数值为0
  uint8 Right_Valid_Count=0;//默认右边沿有效连续计数值为0
  
  uint8 Left_Invalid_Count=0;//默认左边沿无效连续计数值为0
  uint8 Right_Invalid_Count=0;//默认右边沿无效连续计数值为0
  
  uint8 Left_Turn_Count=0;//收敛方向异常连续计数
  uint8 Right_Turn_Count=0;
  
  uint8 Left_Break=0;
  uint8 Right_Break=0;
  
  uint8 Cross_Flag=0;//默认无十字
  Left_flag=0;
  Right_flag=0;

  //前3行
  for(uint8 i=59;i>56;i--)
  {
    Left_Line[i]=1;//初始化左黑线为1
    Right_Line[i]=78;//初始化右黑线为78
    Left_Valid[i]=0;//默认左边未找到黑线
    Right_Valid[i]=0;//默认右边未找到黑线
    Center_Line[i]=40;//默认中线为图像中间
    //从中间到左
    for(uint8 j=40;j>0;j--)
    {
      if(Img[i][j]==white&&Img[i][j-2]==black)
      {
        Left_Line[i]=j;//黑线位置
        Left_Valid[i]=1;//此行左黑线有效位置1
        Left_Valid_Count++;//连续有效行+1
        Left_Invalid_Count=0;
        break;
      }
    }
    
    if(Left_Valid[i]==0)
    {
      Left_Valid_Count=0;
      Left_Invalid_Count++;
    }
    
    //从中间到右边
    for(uint8 k=40;k<80;k++)
    {
      if(Img[i][k]==white&&Img[i][k+2]==black)
      {
        Right_Line[i]=k;
        Right_Valid[i]=1;
        Right_Valid_Count++;
        Right_Invalid_Count=0;
        break;
      }
    }
    if(Right_Valid[i]==0)
    {
      Right_Valid_Count=0;
      Right_Invalid_Count++;
    }
    
    
    
    Center_Line[i]=(Right_Line[i]+Left_Line[i])/2;
  }
  
  
  if(Left_Valid_Count==3&&Right_Valid_Count==3)
  {
    for(uint8 i=56;i>29;i--)
    {
      uint8 col;
      
      //中间往左
      Left_Line[i]=1;//初始化为1
      Left_Valid[i]=0;//初始化每行无效
      
      col=Left_Line[i+1]+6;//具体数值还需视情况而定
      Left_End=Left_Line[i+1]-6;
      
    //  for(;col>Left_End;col--)     
      for(uint8 m=40;m>0;m--)
      {
        if(Img[i][col]==white&&Img[i][col-2]==black)
        {
          Left_Line[i]=col;//黑线位置
            Left_flag=1;
          Left_Invalid_Count=0;//左线连续无效值清零
          if(Left_Line[i]<Left_Line[i+1])//出现左线异常不向右收敛
          {
            Left_Turn_Count++;//左线收敛方向异常连续计数+1
            Left_Valid[i]=1;//暂时标记此行左黑线有效位置1
            break;
          }
          else//左线正常向右收敛
          {
            Left_Turn_Count=0;//左线收敛方向异常连续计数值清零
            Left_Valid[i]=1;//此行左黑线有效位置1
            break;
          }
        }
        else 
          Left_Line[m]=0;
      }
      if(Left_Valid[i]==0)//此行没有找到左黑线
        Left_Invalid_Count++;
      if(Left_Turn_Count==3)//左黑线收敛方向异常进一步判断是否为斜入十字
      {
        //继续判断十字
      }
      if(Left_Invalid_Count==3)
      {
        Left_Break=i+3;//左边黑线断点行记录
        break;//跳出大循环，停止搜线
      }
      
      
      
      Right_Line[i]=78;
      Right_Valid[i]=0;
      
      col=Right_Line[i+1]-6;
      Right_End=Right_Line[i+1]+6;
      
     // for(;col<Right_End;col++)
      for(uint8 n=40;n<78;n++)
      {
        if(Img[i][col]==white&&Img[i][col+2]==black)
        {
          Right_Line[i]=col;
           Right_flag=1;
          Right_Invalid_Count=0;
          if(Right_Line[i]>Right_Line[i+1])
          {
            Right_Turn_Count++;
            Right_Valid[i]=1;
            break;
          }
          else
          {
            Right_Turn_Count=0;
            Right_Valid[i]=1;
            break;
          }
        }
        else
          Right_Line[n]=79;
      }
      if(Right_Valid[i]==0)
        Right_Invalid_Count++;
      if(Right_Turn_Count==3)
      {
        //继续判断十字
      }
      if(Right_Invalid_Count==3)
      {
        Right_Break=i+3;
        break;
      }
      if(Right_flag&&Left_flag)
        Center_Line[i]=(Right_Line[i]+Left_Line[i])/2;
      else if(!Left_flag&&Right_flag)//左转
        Center_Line[i]=Right_Line[i]-(Right_Line[i+1]-Center_Line[i+1]);
      else if(Left_flag&&!Right_flag)//右转
        Center_Line[i]=Left_Line[i]+(Center_Line[i+1]-Left_Line[i+1]);
    }
    
  }
}
*/
            
            
            
 uint8 m_abs(int m)
 {
   if(m>0)
     return m;
   else 
     return (-m);
 }