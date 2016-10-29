<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.thirts.pi.PiVo"%>
<%@ page import="com.thirts.pi.PiService"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<% 
	List<PiVo> LPV = (List<PiVo>)request.getAttribute("lpv");
	int size = LPV.size();
	
	String[][] axis = new String[size][40];
	
	PiVo pv = new PiVo();
	pv = LPV.get(size-50);
	axis[0] = pv.getAxis().split(",");
	
	// triangle accuracy & draw
	int size_axis = axis[0].length;
	double x =0;
	double y =0;
	String[] axis_x = new String[size_axis/2];
	String[] axis_y = new String[size_axis/2];
	
	int[] point_x = {30,120,210,300,390,30,120,210,300,390,30,120,210,300,390,30,120,210,300,390,30,120,210,300,390};
	int[] point_y = {70,70,70,70,70,170,170,170,170,170,290,290,290,290,290,420,420,420,420,420,550,550,550,550,550};
	
	int[] accuracy = new int[6];//0~1, 1~2, 2~3, 3~4, 4~5, 5
	int accuracy_check =0;
	
	for(int k=0; k<25; k++)
	{
		pv = LPV.get(size-51+k);
		axis[k] = pv.getAxis().split(",");
		for(int i=1; i < size_axis/2; i++)
		{
			axis_x[i-1] = axis[k][(2*i)];
			axis_y[i-1] = axis[k][1+(2*i)];
			x = Float.parseFloat(axis_x[i-1]);
			y = Float.parseFloat(axis_y[i-1]);
			if(x > 0)
			{
				accuracy_check = (int)Math.sqrt((x-point_x[k])*(x-point_x[k])+(y-point_y[k])*(y-point_y[k]));
				if(accuracy_check <= 100)
				{
					accuracy[0] +=1;
				}
				else if(accuracy_check <= 200)
				{
					accuracy[1] +=1;
				}
				else if(accuracy_check <= 300)
				{
					accuracy[2] +=1;
				}
				else if(accuracy_check <= 400)
				{
					accuracy[3] +=1;
				}
				else if(accuracy_check <= 500)
				{
					accuracy[4] +=1;
				}
				else
				{
					accuracy[5] +=1;
				}
				
			}
		}
	}
	int percent = (accuracy[0]+accuracy[1]+accuracy[2]+accuracy[3]+accuracy[4]+accuracy[5])*100 / 750 ;
	int percent_0 = accuracy[0]*100/(accuracy[0]+accuracy[1]+accuracy[2]+accuracy[3]+accuracy[4]+accuracy[5]);
	int percent_1 = accuracy[1]*100/(accuracy[0]+accuracy[1]+accuracy[2]+accuracy[3]+accuracy[4]+accuracy[5]);
	int percent_2 = accuracy[2]*100/(accuracy[0]+accuracy[1]+accuracy[2]+accuracy[3]+accuracy[4]+accuracy[5]);
	int percent_3 = accuracy[3]*100/(accuracy[0]+accuracy[1]+accuracy[2]+accuracy[3]+accuracy[4]+accuracy[5]);
	int percent_4 = accuracy[4]*100/(accuracy[0]+accuracy[1]+accuracy[2]+accuracy[3]+accuracy[4]+accuracy[5]);
	int percent_5 = accuracy[5]*100/(accuracy[0]+accuracy[1]+accuracy[2]+accuracy[3]+accuracy[4]+accuracy[5]);
	
	PiVo fingervo = new PiVo();
	String[][] cell = new String[25][25];
	int[][] cell_count = new int[25][25];
	int[] fin_accuracy = new int[5];//0,1,2,3,4
	
	for(int j=0; j <25; j++ )
	{
		fingervo = LPV.get(size-26+j);
		cell[j] = fingervo.getBeacon3().split(",");
		
		//System.out.println(cell_count[j][j]);
		
		for(int k=0; k<25; k++)
		{
			cell_count[j][k] = Integer.parseInt(cell[j][k]);
		}
		
		fin_accuracy[0] += cell_count[j][j];
	}

	for(int t=0; t<25; t++)
	{
		if(t==0)
		{
			fin_accuracy[1] += cell_count[t][t+1];
			fin_accuracy[1] += cell_count[t][t+5];
			fin_accuracy[1] += cell_count[t][t+6];
			
			fin_accuracy[2] += cell_count[t][t+2];
			fin_accuracy[2] += cell_count[t][t+7];
			fin_accuracy[2] += cell_count[t][t+10];
			fin_accuracy[2] += cell_count[t][t+11];
			fin_accuracy[2] += cell_count[t][t+12];
			
			fin_accuracy[3] += cell_count[t][t+3];
			fin_accuracy[3] += cell_count[t][t+8];
			fin_accuracy[3] += cell_count[t][t+13];
			fin_accuracy[3] += cell_count[t][t+15];
			fin_accuracy[3] += cell_count[t][t+16];
			fin_accuracy[3] += cell_count[t][t+17];
			fin_accuracy[3] += cell_count[t][t+18];
			
			fin_accuracy[4] += cell_count[t][t+4];
			fin_accuracy[4] += cell_count[t][t+9];
			fin_accuracy[4] += cell_count[t][t+14];
			fin_accuracy[4] += cell_count[t][t+19];
			fin_accuracy[4] += cell_count[t][t+20];
			fin_accuracy[4] += cell_count[t][t+21];
			fin_accuracy[4] += cell_count[t][t+22];
			fin_accuracy[4] += cell_count[t][t+23];
			fin_accuracy[4] += cell_count[t][t+24];
		}
		else if(t==1 || t==2 || t==3)
		{
			fin_accuracy[1] += cell_count[t][t+1];
			fin_accuracy[1] += cell_count[t][t+4];
			fin_accuracy[1] += cell_count[t][t+5];
			fin_accuracy[1] += cell_count[t][t+6];
			fin_accuracy[1] += cell_count[t][t-1];
			if(t==1)
			{
				fin_accuracy[2] += cell_count[t][t+2];
				fin_accuracy[2] += cell_count[t][t+7];
				fin_accuracy[2] += cell_count[t][t+9];
				fin_accuracy[2] += cell_count[t][t+10];
				fin_accuracy[2] += cell_count[t][t+11];
				fin_accuracy[2] += cell_count[t][t+12];
				
				fin_accuracy[3] += cell_count[t][t+3];
				fin_accuracy[3] += cell_count[t][t+8];
				fin_accuracy[3] += cell_count[t][t+13];
				fin_accuracy[3] += cell_count[t][t+14];
				fin_accuracy[3] += cell_count[t][t+15];
				fin_accuracy[3] += cell_count[t][t+16];
				fin_accuracy[3] += cell_count[t][t+17];
				fin_accuracy[3] += cell_count[t][t+18];
				
				fin_accuracy[4] += cell_count[t][t+19];
				fin_accuracy[4] += cell_count[t][t+20];
				fin_accuracy[4] += cell_count[t][t+21];
				fin_accuracy[4] += cell_count[t][t+22];
				fin_accuracy[4] += cell_count[t][t+23];
			}
			if(t==2)
			{
				fin_accuracy[2] += cell_count[t][t+2];
				fin_accuracy[2] += cell_count[t][t+3];
				fin_accuracy[2] += cell_count[t][t+7];
				fin_accuracy[2] += cell_count[t][t+8];
				fin_accuracy[2] += cell_count[t][t+9];
				fin_accuracy[2] += cell_count[t][t+10];
				fin_accuracy[2] += cell_count[t][t+11];
				fin_accuracy[2] += cell_count[t][t+12];
				fin_accuracy[2] += cell_count[t][t-2];
				
				fin_accuracy[3] += cell_count[t][15];
				fin_accuracy[3] += cell_count[t][16];
				fin_accuracy[3] += cell_count[t][17];
				fin_accuracy[3] += cell_count[t][18];
				fin_accuracy[3] += cell_count[t][19];
				
				fin_accuracy[4] += cell_count[t][20];
				fin_accuracy[4] += cell_count[t][21];
				fin_accuracy[4] += cell_count[t][22];
				fin_accuracy[4] += cell_count[t][23];
				fin_accuracy[4] += cell_count[t][24];
			}
			if(t==3)
			{
				fin_accuracy[2] += cell_count[t][t-2];
				fin_accuracy[2] += cell_count[t][t+3];
				fin_accuracy[2] += cell_count[t][t+8];
				fin_accuracy[2] += cell_count[t][t+9];
				fin_accuracy[2] += cell_count[t][t+10];
				fin_accuracy[2] += cell_count[t][t+11];
				
				fin_accuracy[3] += cell_count[t][0];
				fin_accuracy[3] += cell_count[t][5];
				fin_accuracy[3] += cell_count[t][10];
				fin_accuracy[3] += cell_count[t][15];
				fin_accuracy[3] += cell_count[t][16];
				fin_accuracy[3] += cell_count[t][17];
				fin_accuracy[3] += cell_count[t][18];
				fin_accuracy[3] += cell_count[t][19];
				
				fin_accuracy[4] += cell_count[t][20];
				fin_accuracy[4] += cell_count[t][21];
				fin_accuracy[4] += cell_count[t][22];
				fin_accuracy[4] += cell_count[t][23];
				fin_accuracy[4] += cell_count[t][24];
			}
			
		}
		else if(t==4)
		{
			fin_accuracy[1] += cell_count[t][t+4];
			fin_accuracy[1] += cell_count[t][t+5];
			fin_accuracy[1] += cell_count[t][t-1];
			
			fin_accuracy[2] += cell_count[t][2];
			fin_accuracy[2] += cell_count[t][7];
			fin_accuracy[2] += cell_count[t][12];
			fin_accuracy[2] += cell_count[t][13];
			fin_accuracy[2] += cell_count[t][14];
			
			fin_accuracy[3] += cell_count[t][1];
			fin_accuracy[3] += cell_count[t][6];
			fin_accuracy[3] += cell_count[t][11];
			fin_accuracy[3] += cell_count[t][16];
			fin_accuracy[3] += cell_count[t][17];
			fin_accuracy[3] += cell_count[t][18];
			fin_accuracy[3] += cell_count[t][19];
			
			fin_accuracy[4] += cell_count[t][0];
			fin_accuracy[4] += cell_count[t][5];
			fin_accuracy[4] += cell_count[t][10];
			fin_accuracy[4] += cell_count[t][15];
			fin_accuracy[4] += cell_count[t][20];
			fin_accuracy[4] += cell_count[t][21];
			fin_accuracy[4] += cell_count[t][22];
			fin_accuracy[4] += cell_count[t][23];
			fin_accuracy[4] += cell_count[t][24];
		}
		else if(t==5 || t==10 || t==15)
		{
			fin_accuracy[1] += cell_count[t][t+1];
			fin_accuracy[1] += cell_count[t][t+5];
			fin_accuracy[1] += cell_count[t][t+6];
			fin_accuracy[1] += cell_count[t][t-4];
			fin_accuracy[1] += cell_count[t][t-5];
			
			if(t==5)
			{
				fin_accuracy[2] += cell_count[t][2];
				fin_accuracy[2] += cell_count[t][7];
				fin_accuracy[2] += cell_count[t][12];
				fin_accuracy[2] += cell_count[t][15];
				fin_accuracy[2] += cell_count[t][16];
				fin_accuracy[2] += cell_count[t][17];
				
				fin_accuracy[3] += cell_count[t][3];
				fin_accuracy[3] += cell_count[t][8];
				fin_accuracy[3] += cell_count[t][13];
				fin_accuracy[3] += cell_count[t][18];
				fin_accuracy[3] += cell_count[t][20];
				fin_accuracy[3] += cell_count[t][21];
				fin_accuracy[3] += cell_count[t][22];
				fin_accuracy[3] += cell_count[t][23];
				
				fin_accuracy[4] += cell_count[t][4];
				fin_accuracy[4] += cell_count[t][9];
				fin_accuracy[4] += cell_count[t][14];
				fin_accuracy[4] += cell_count[t][19];
				fin_accuracy[4] += cell_count[t][24];
			}
			if(t==10)
			{
				fin_accuracy[2] += cell_count[t][0];
				fin_accuracy[2] += cell_count[t][1];
				fin_accuracy[2] += cell_count[t][2];
				fin_accuracy[2] += cell_count[t][7];
				fin_accuracy[2] += cell_count[t][12];
				fin_accuracy[2] += cell_count[t][17];
				fin_accuracy[2] += cell_count[t][20];
				fin_accuracy[2] += cell_count[t][21];
				fin_accuracy[2] += cell_count[t][22];
				
				fin_accuracy[3] += cell_count[t][3];
				fin_accuracy[3] += cell_count[t][8];
				fin_accuracy[3] += cell_count[t][13];
				fin_accuracy[3] += cell_count[t][18];
				fin_accuracy[3] += cell_count[t][23];
				
				fin_accuracy[4] += cell_count[t][4];
				fin_accuracy[4] += cell_count[t][9];
				fin_accuracy[4] += cell_count[t][14];
				fin_accuracy[4] += cell_count[t][19];
				fin_accuracy[4] += cell_count[t][24];
			}
			if(t==15)
			{
				fin_accuracy[2] += cell_count[t][5];
				fin_accuracy[2] += cell_count[t][6];
				fin_accuracy[2] += cell_count[t][7];
				fin_accuracy[2] += cell_count[t][12];
				fin_accuracy[2] += cell_count[t][17];
				fin_accuracy[2] += cell_count[t][22];
				
				fin_accuracy[3] += cell_count[t][0];
				fin_accuracy[3] += cell_count[t][1];
				fin_accuracy[3] += cell_count[t][2];
				fin_accuracy[3] += cell_count[t][3];
				fin_accuracy[3] += cell_count[t][8];
				fin_accuracy[3] += cell_count[t][13];
				fin_accuracy[3] += cell_count[t][18];
				fin_accuracy[3] += cell_count[t][23];
				
				fin_accuracy[4] += cell_count[t][4];
				fin_accuracy[4] += cell_count[t][9];
				fin_accuracy[4] += cell_count[t][14];
				fin_accuracy[4] += cell_count[t][19];
				fin_accuracy[4] += cell_count[t][24];
			}
		}
		else if(t==6 || t==7 || t==8 || t==11 || t==12 || t==13 || t==16 || t==17 || t==18)
		{
			fin_accuracy[1] += cell_count[t][t+1];
			fin_accuracy[1] += cell_count[t][t+4];
			fin_accuracy[1] += cell_count[t][t+5];
			fin_accuracy[1] += cell_count[t][t+6];
			fin_accuracy[1] += cell_count[t][t-1];
			fin_accuracy[1] += cell_count[t][t-4];
			fin_accuracy[1] += cell_count[t][t-5];
			fin_accuracy[1] += cell_count[t][t-6];
			if(t==6)
			{
				fin_accuracy[2] += cell_count[t][3];
				fin_accuracy[2] += cell_count[t][8];
				fin_accuracy[2] += cell_count[t][13];
				fin_accuracy[2] += cell_count[t][15];
				fin_accuracy[2] += cell_count[t][16];
				fin_accuracy[2] += cell_count[t][17];
				fin_accuracy[2] += cell_count[t][18];
				
				fin_accuracy[3] += cell_count[t][4];
				fin_accuracy[3] += cell_count[t][9];
				fin_accuracy[3] += cell_count[t][14];
				fin_accuracy[3] += cell_count[t][19];
				fin_accuracy[3] += cell_count[t][20];
				fin_accuracy[3] += cell_count[t][21];
				fin_accuracy[3] += cell_count[t][22];
				fin_accuracy[3] += cell_count[t][23];
				fin_accuracy[3] += cell_count[t][24];
			}
			
			if(t==7)
			{
				fin_accuracy[2] += cell_count[t][0];
				fin_accuracy[2] += cell_count[t][4];
				fin_accuracy[2] += cell_count[t][5];
				fin_accuracy[2] += cell_count[t][9];
				fin_accuracy[2] += cell_count[t][10];
				fin_accuracy[2] += cell_count[t][14];
				fin_accuracy[2] += cell_count[t][15];
				fin_accuracy[2] += cell_count[t][16];
				fin_accuracy[2] += cell_count[t][17];
				fin_accuracy[2] += cell_count[t][18];
				fin_accuracy[2] += cell_count[t][19];
				
				fin_accuracy[3] += cell_count[t][20];
				fin_accuracy[3] += cell_count[t][21];
				fin_accuracy[3] += cell_count[t][22];
				fin_accuracy[3] += cell_count[t][23];
				fin_accuracy[3] += cell_count[t][24];
			}
			
			if(t==8)
			{
				fin_accuracy[2] += cell_count[t][1];
				fin_accuracy[2] += cell_count[t][6];
				fin_accuracy[2] += cell_count[t][11];
				fin_accuracy[2] += cell_count[t][16];
				fin_accuracy[2] += cell_count[t][17];
				fin_accuracy[2] += cell_count[t][18];
				fin_accuracy[2] += cell_count[t][19];
				
				fin_accuracy[3] += cell_count[t][0];
				fin_accuracy[3] += cell_count[t][5];
				fin_accuracy[3] += cell_count[t][10];
				fin_accuracy[3] += cell_count[t][15];
				fin_accuracy[3] += cell_count[t][20];
				fin_accuracy[3] += cell_count[t][21];
				fin_accuracy[3] += cell_count[t][22];
				fin_accuracy[3] += cell_count[t][23];
				fin_accuracy[3] += cell_count[t][24];
			}
			
			if(t==11)
			{
				fin_accuracy[2] += cell_count[t][0];
				fin_accuracy[2] += cell_count[t][1];
				fin_accuracy[2] += cell_count[t][2];
				fin_accuracy[2] += cell_count[t][3];
				fin_accuracy[2] += cell_count[t][8];
				fin_accuracy[2] += cell_count[t][13];
				fin_accuracy[2] += cell_count[t][18];
				fin_accuracy[2] += cell_count[t][20];
				fin_accuracy[2] += cell_count[t][21];
				fin_accuracy[2] += cell_count[t][22];
				fin_accuracy[2] += cell_count[t][23];
				
				fin_accuracy[3] += cell_count[t][4];
				fin_accuracy[3] += cell_count[t][9];
				fin_accuracy[3] += cell_count[t][14];
				fin_accuracy[3] += cell_count[t][19];
				fin_accuracy[3] += cell_count[t][24];
			}
			
			if(t==12)
			{
				fin_accuracy[2] += cell_count[t][0];
				fin_accuracy[2] += cell_count[t][1];
				fin_accuracy[2] += cell_count[t][2];
				fin_accuracy[2] += cell_count[t][3];
				fin_accuracy[2] += cell_count[t][4];
				fin_accuracy[2] += cell_count[t][5];
				fin_accuracy[2] += cell_count[t][9];
				fin_accuracy[2] += cell_count[t][10];
				fin_accuracy[2] += cell_count[t][14];
				fin_accuracy[2] += cell_count[t][15];
				fin_accuracy[2] += cell_count[t][19];
				fin_accuracy[2] += cell_count[t][20];
				fin_accuracy[2] += cell_count[t][21];
				fin_accuracy[2] += cell_count[t][22];
				fin_accuracy[2] += cell_count[t][23];
				fin_accuracy[2] += cell_count[t][24];
			}
			
			if(t==13)
			{
				fin_accuracy[2] += cell_count[t][1];
				fin_accuracy[2] += cell_count[t][2];
				fin_accuracy[2] += cell_count[t][3];
				fin_accuracy[2] += cell_count[t][4];
				fin_accuracy[2] += cell_count[t][6];
				fin_accuracy[2] += cell_count[t][11];
				fin_accuracy[2] += cell_count[t][16];
				fin_accuracy[2] += cell_count[t][21];
				fin_accuracy[2] += cell_count[t][22];
				fin_accuracy[2] += cell_count[t][23];
				fin_accuracy[2] += cell_count[t][24];
				
				fin_accuracy[3] += cell_count[t][0];
				fin_accuracy[3] += cell_count[t][5];
				fin_accuracy[3] += cell_count[t][10];
				fin_accuracy[3] += cell_count[t][15];
				fin_accuracy[3] += cell_count[t][20];
			}
			if(t==16)
			{
				fin_accuracy[2] += cell_count[t][5];
				fin_accuracy[2] += cell_count[t][6];
				fin_accuracy[2] += cell_count[t][7];
				fin_accuracy[2] += cell_count[t][8];
				fin_accuracy[2] += cell_count[t][13];
				fin_accuracy[2] += cell_count[t][18];
				fin_accuracy[2] += cell_count[t][23];
				
				fin_accuracy[3] += cell_count[t][0];
				fin_accuracy[3] += cell_count[t][1];
				fin_accuracy[3] += cell_count[t][2];
				fin_accuracy[3] += cell_count[t][3];
				fin_accuracy[3] += cell_count[t][4];
				fin_accuracy[3] += cell_count[t][9];
				fin_accuracy[3] += cell_count[t][14];
				fin_accuracy[3] += cell_count[t][19];
				fin_accuracy[3] += cell_count[t][24];
			}
			
			if(t==17)
			{
				fin_accuracy[2] += cell_count[t][5];
				fin_accuracy[2] += cell_count[t][6];
				fin_accuracy[2] += cell_count[t][7];
				fin_accuracy[2] += cell_count[t][8];
				fin_accuracy[2] += cell_count[t][9];
				fin_accuracy[2] += cell_count[t][10];
				fin_accuracy[2] += cell_count[t][14];
				fin_accuracy[2] += cell_count[t][15];
				fin_accuracy[2] += cell_count[t][19];
				fin_accuracy[2] += cell_count[t][20];
				fin_accuracy[2] += cell_count[t][24];
				
				fin_accuracy[3] += cell_count[t][0];
				fin_accuracy[3] += cell_count[t][1];
				fin_accuracy[3] += cell_count[t][2];
				fin_accuracy[3] += cell_count[t][3];
				fin_accuracy[3] += cell_count[t][4];
			}
			
			if(t==18)
			{
				fin_accuracy[2] += cell_count[t][6];
				fin_accuracy[2] += cell_count[t][7];
				fin_accuracy[2] += cell_count[t][8];
				fin_accuracy[2] += cell_count[t][9];
				fin_accuracy[2] += cell_count[t][11];
				fin_accuracy[2] += cell_count[t][16];
				fin_accuracy[2] += cell_count[t][21];
				
				fin_accuracy[3] += cell_count[t][0];
				fin_accuracy[3] += cell_count[t][1];
				fin_accuracy[3] += cell_count[t][2];
				fin_accuracy[3] += cell_count[t][3];
				fin_accuracy[3] += cell_count[t][4];
				fin_accuracy[3] += cell_count[t][5];
				fin_accuracy[3] += cell_count[t][10];
				fin_accuracy[3] += cell_count[t][15];
				fin_accuracy[3] += cell_count[t][20];
			}
		}
		else if(t==9 || t==14 || t==19)
		{
			fin_accuracy[1] += cell_count[t][t+4];
			fin_accuracy[1] += cell_count[t][t+5];
			fin_accuracy[1] += cell_count[t][t-1];
			fin_accuracy[1] += cell_count[t][t-4];
			fin_accuracy[1] += cell_count[t][t-6];
			
			if(t==9)
			{
				fin_accuracy[2] += cell_count[t][2];
				fin_accuracy[2] += cell_count[t][7];
				fin_accuracy[2] += cell_count[t][12];
				fin_accuracy[2] += cell_count[t][17];
				fin_accuracy[2] += cell_count[t][18];
				fin_accuracy[2] += cell_count[t][19];
				
				fin_accuracy[3] += cell_count[t][1];
				fin_accuracy[3] += cell_count[t][6];
				fin_accuracy[3] += cell_count[t][11];
				fin_accuracy[3] += cell_count[t][16];
				fin_accuracy[3] += cell_count[t][21];
				fin_accuracy[3] += cell_count[t][22];
				fin_accuracy[3] += cell_count[t][23];
				fin_accuracy[3] += cell_count[t][24];
				
				fin_accuracy[4] += cell_count[t][0];
				fin_accuracy[4] += cell_count[t][5];
				fin_accuracy[4] += cell_count[t][10];
				fin_accuracy[4] += cell_count[t][15];
				fin_accuracy[4] += cell_count[t][20];
			}
			if(t==14)
			{
				fin_accuracy[2] += cell_count[t][2];
				fin_accuracy[2] += cell_count[t][3];
				fin_accuracy[2] += cell_count[t][4];
				fin_accuracy[2] += cell_count[t][7];
				fin_accuracy[2] += cell_count[t][12];
				fin_accuracy[2] += cell_count[t][17];
				fin_accuracy[2] += cell_count[t][22];
				fin_accuracy[2] += cell_count[t][23];
				fin_accuracy[2] += cell_count[t][24];
				
				fin_accuracy[3] += cell_count[t][1];
				fin_accuracy[3] += cell_count[t][6];
				fin_accuracy[3] += cell_count[t][11];
				fin_accuracy[3] += cell_count[t][16];
				fin_accuracy[3] += cell_count[t][21];
				
				fin_accuracy[4] += cell_count[t][0];
				fin_accuracy[4] += cell_count[t][5];
				fin_accuracy[4] += cell_count[t][10];
				fin_accuracy[4] += cell_count[t][15];
				fin_accuracy[4] += cell_count[t][20];
			}
			if(t==19)
			{
				fin_accuracy[2] += cell_count[t][7];
				fin_accuracy[2] += cell_count[t][8];
				fin_accuracy[2] += cell_count[t][9];
				fin_accuracy[2] += cell_count[t][12];
				fin_accuracy[2] += cell_count[t][17];
				fin_accuracy[2] += cell_count[t][22];
				
				fin_accuracy[3] += cell_count[t][1];
				fin_accuracy[3] += cell_count[t][2];
				fin_accuracy[3] += cell_count[t][3];
				fin_accuracy[3] += cell_count[t][4];
				fin_accuracy[3] += cell_count[t][6];
				fin_accuracy[3] += cell_count[t][11];
				fin_accuracy[3] += cell_count[t][16];
				fin_accuracy[3] += cell_count[t][21];
				
				fin_accuracy[4] += cell_count[t][0];
				fin_accuracy[4] += cell_count[t][5];
				fin_accuracy[4] += cell_count[t][10];
				fin_accuracy[4] += cell_count[t][15];
				fin_accuracy[4] += cell_count[t][20];
			}
		}
		else if(t==20)
		{
			fin_accuracy[1] += cell_count[t][t+1];
			fin_accuracy[1] += cell_count[t][t-4];
			fin_accuracy[1] += cell_count[t][t-5];
			
			fin_accuracy[2] += cell_count[t][10];
			fin_accuracy[2] += cell_count[t][11];
			fin_accuracy[2] += cell_count[t][12];
			fin_accuracy[2] += cell_count[t][17];
			fin_accuracy[2] += cell_count[t][22];
			
			fin_accuracy[3] += cell_count[t][5];
			fin_accuracy[3] += cell_count[t][6];
			fin_accuracy[3] += cell_count[t][7];
			fin_accuracy[3] += cell_count[t][8];
			fin_accuracy[3] += cell_count[t][13];
			fin_accuracy[3] += cell_count[t][18];
			fin_accuracy[3] += cell_count[t][23];
			
			fin_accuracy[4] += cell_count[t][0];
			fin_accuracy[4] += cell_count[t][1];
			fin_accuracy[4] += cell_count[t][2];
			fin_accuracy[4] += cell_count[t][3];
			fin_accuracy[4] += cell_count[t][4];
			fin_accuracy[4] += cell_count[t][9];
			fin_accuracy[4] += cell_count[t][14];
			fin_accuracy[4] += cell_count[t][19];
			fin_accuracy[4] += cell_count[t][24];
		}
		else if(t==21 || t==22 || t==23)
		{
			fin_accuracy[1] += cell_count[t][t+1];
			fin_accuracy[1] += cell_count[t][t-1];
			fin_accuracy[1] += cell_count[t][t-4];
			fin_accuracy[1] += cell_count[t][t-5];
			fin_accuracy[1] += cell_count[t][t-6];
			
			if(t==21)
			{
				fin_accuracy[2] += cell_count[t][10];
				fin_accuracy[2] += cell_count[t][11];
				fin_accuracy[2] += cell_count[t][12];
				fin_accuracy[2] += cell_count[t][13];
				fin_accuracy[2] += cell_count[t][18];
				fin_accuracy[2] += cell_count[t][23];
				
				fin_accuracy[3] += cell_count[t][5];
				fin_accuracy[3] += cell_count[t][6];
				fin_accuracy[3] += cell_count[t][7];
				fin_accuracy[3] += cell_count[t][8];
				fin_accuracy[3] += cell_count[t][9];
				fin_accuracy[3] += cell_count[t][14];
				fin_accuracy[3] += cell_count[t][19];
				fin_accuracy[3] += cell_count[t][24];
				
				fin_accuracy[4] += cell_count[t][0];
				fin_accuracy[4] += cell_count[t][1];
				fin_accuracy[4] += cell_count[t][2];
				fin_accuracy[4] += cell_count[t][3];
				fin_accuracy[4] += cell_count[t][4];
			}
			if(t==22)
			{
				fin_accuracy[2] += cell_count[t][10];
				fin_accuracy[2] += cell_count[t][11];
				fin_accuracy[2] += cell_count[t][12];
				fin_accuracy[2] += cell_count[t][13];
				fin_accuracy[2] += cell_count[t][14];
				fin_accuracy[2] += cell_count[t][15];
				fin_accuracy[2] += cell_count[t][19];
				fin_accuracy[2] += cell_count[t][20];
				fin_accuracy[2] += cell_count[t][24];
				
				fin_accuracy[3] += cell_count[t][5];
				fin_accuracy[3] += cell_count[t][6];
				fin_accuracy[3] += cell_count[t][7];
				fin_accuracy[3] += cell_count[t][8];
				fin_accuracy[3] += cell_count[t][9];
				
				fin_accuracy[4] += cell_count[t][0];
				fin_accuracy[4] += cell_count[t][1];
				fin_accuracy[4] += cell_count[t][2];
				fin_accuracy[4] += cell_count[t][3];
				fin_accuracy[4] += cell_count[t][4];
			}
			if(t==23)
			{
				fin_accuracy[2] += cell_count[t][11];
				fin_accuracy[2] += cell_count[t][12];
				fin_accuracy[2] += cell_count[t][13];
				fin_accuracy[2] += cell_count[t][14];
				fin_accuracy[2] += cell_count[t][16];
				fin_accuracy[2] += cell_count[t][21];
				
				fin_accuracy[3] += cell_count[t][5];
				fin_accuracy[3] += cell_count[t][6];
				fin_accuracy[3] += cell_count[t][7];
				fin_accuracy[3] += cell_count[t][8];
				fin_accuracy[3] += cell_count[t][9];
				fin_accuracy[3] += cell_count[t][10];
				fin_accuracy[3] += cell_count[t][15];
				fin_accuracy[3] += cell_count[t][20];
				
				fin_accuracy[4] += cell_count[t][0];
				fin_accuracy[4] += cell_count[t][1];
				fin_accuracy[4] += cell_count[t][2];
				fin_accuracy[4] += cell_count[t][3];
				fin_accuracy[4] += cell_count[t][4];
			}
		}
		else if(t==24)
		{
			fin_accuracy[1] += cell_count[t][t-1];
			fin_accuracy[1] += cell_count[t][t-5];
			fin_accuracy[1] += cell_count[t][t-6];
			
			fin_accuracy[2] += cell_count[t][12];
			fin_accuracy[2] += cell_count[t][13];
			fin_accuracy[2] += cell_count[t][14];
			fin_accuracy[2] += cell_count[t][17];
			fin_accuracy[2] += cell_count[t][22];
			
			fin_accuracy[3] += cell_count[t][6];
			fin_accuracy[3] += cell_count[t][7];
			fin_accuracy[3] += cell_count[t][8];
			fin_accuracy[3] += cell_count[t][9];
			fin_accuracy[3] += cell_count[t][11];
			fin_accuracy[3] += cell_count[t][16];
			fin_accuracy[3] += cell_count[t][21];
			
			fin_accuracy[4] += cell_count[t][0];
			fin_accuracy[4] += cell_count[t][1];
			fin_accuracy[4] += cell_count[t][2];
			fin_accuracy[4] += cell_count[t][3];
			fin_accuracy[4] += cell_count[t][4];
			fin_accuracy[4] += cell_count[t][5];
			fin_accuracy[4] += cell_count[t][10];
			fin_accuracy[4] += cell_count[t][15];
			fin_accuracy[4] += cell_count[t][20];
		}
	}
	int fin_percent = (fin_accuracy[0]+fin_accuracy[1]+fin_accuracy[2]+fin_accuracy[3]+fin_accuracy[4])*100 / 750 ;
	int fin_percent_0 = fin_accuracy[0]*100/(fin_accuracy[0]+fin_accuracy[1]+fin_accuracy[2]+fin_accuracy[3]+fin_accuracy[4]);
	int fin_percent_1 = fin_accuracy[1]*100/(fin_accuracy[0]+fin_accuracy[1]+fin_accuracy[2]+fin_accuracy[3]+fin_accuracy[4]);
	int fin_percent_2 = fin_accuracy[2]*100/(fin_accuracy[0]+fin_accuracy[1]+fin_accuracy[2]+fin_accuracy[3]+fin_accuracy[4]);
	int fin_percent_3 = fin_accuracy[3]*100/(fin_accuracy[0]+fin_accuracy[1]+fin_accuracy[2]+fin_accuracy[3]+fin_accuracy[4]);
	int fin_percent_4 = fin_accuracy[4]*100/(fin_accuracy[0]+fin_accuracy[1]+fin_accuracy[2]+fin_accuracy[3]+fin_accuracy[4]);
	
%>



<script src="//www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
	function drawChart() {

		var accuracyArr = new Array();
		<%for (int j = 0; j < 6; j++) {%>
		accuracyArr[<%=j%>] = <%=accuracy[j]%>;
		<%}%>
		
		

	var data = new google.visualization.DataTable();

		data.addColumn('number', '횟수');
		data.addColumn('number', 'Triangle-accuracay 수신률:<%=percent %>%');
		
	
			for (var i = 0; i < 6; i++) {
				data.addRows([[ i, accuracyArr[i]] ]);
			
			}
			 var options = {
			          curveType: 'function',
			          legend: { position: 'bottom' }
			        };

			        var chart = new google.visualization.LineChart(document.getElementById('curve_chart1'));

			        chart.draw(data, options);
			      }
	
</script>

<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
	function drawChart() {

		var fin_accuracyArr = new Array();
		<%for (int j = 0; j < 5; j++) {%>
		fin_accuracyArr[<%=j%>] = <%=fin_accuracy[j]%>;
		<%}%>
		
		

	var data = new google.visualization.DataTable();

		data.addColumn('number', '횟수');
		data.addColumn('number', 'Fingerprinting-accuracay 수신률:<%=fin_percent %>%');
		
	
			for (var i = 0; i < 5; i++) {
				data.addRows([[ i, fin_accuracyArr[i]] ]);
			
			}
			 var options = {
			          curveType: 'function',
			          legend: { position: 'bottom' }
			        };

			        var chart = new google.visualization.LineChart(document.getElementById('curve_chart2'));

			        chart.draw(data, options);
			      }

	
</script>
<html>
<body>

<div class="panel-body">
<div style="float: left">
	<div id="curve_chart1" style="width:900px;height: 400px;"></div>
	<h3 style="margin-left:30px"> 1M 이하 : <%=percent_0 %>% / 1~2M : <%=percent_1 %>% / 2~3M : <%=percent_2 %>% / 3~4M : <%=percent_3 %>% / 4~5M : <%=percent_4 %>% / 5M 이상 : <%=percent_5 %>%</h3>
</div>
<div style="float: right">
	<div id="curve_chart2" style="width:900px;height: 400px;"></div>
	<h3 style="margin-left:50px"> 일치 : <%=fin_percent_0 %>% / 1cell 오차 : <%=fin_percent_1 %>% / 2cell 오차 : <%=fin_percent_2 %>% / 3cell 오차 : <%=fin_percent_3 %>% / 4cell 오차 : <%=fin_percent_4 %>% </h3>
</div>
</body>
</html>
