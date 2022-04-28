<%@ page language="java" 
contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" 
%>

<%@page import="java.util.*" %>

<% 
	

	class Personatge {
	
	
		protected int fue;
		protected int des;
		protected int con;
		protected int Int;
		protected int sab;
		protected int car;
		
		protected int pv;
		protected int pm;
		
		protected int fueF;
		protected int desF;
		protected int conF;
		protected int IntF;
		protected int sabF;
		protected int carF;
		
		protected int mods[] = {0,0,0,0,0,0};
		
		// Elfs, Nans, Gnom, Mitjans, Semi-Orc i humans
		// 1      2     3      4          5        6
		
		/* 



		// FUE DES CON INT SAB CAR

		
		*/
	
	Personatge(int dau) {
		

		switch(dau)
		{
		
		  case 1 : // Elfs: +2DES/-2CON/+2INT       FUE DES CON INT SAB CAR
			  
		  	setStats();
		  	
		  	this.desF += 2;
		  	this.conF -= 2;
		  	this.IntF += 2;
		  	
		  	this.mods[1] = +2;
		  	this.mods[2] = -2;
		  	this.mods[3] = +2;

		      break; 
		   
		   case 2 :  // Nans:+2CON/-2CAR/+2SAB       FUE DES CON INT SAB CAR
			
			   
			  	setStats();
			  	
			  	this.conF += 2;
			  	this.carF -= 2;
			  	this.sabF += 2;
			  	
			  	this.mods[2] = +2;
			  	this.mods[4] = +2;
			  	this.mods[5] = -2;
			  	
			  	
			  	
		      break;
		      
		   case 3 :  // Gnom:+2CON/-2FUE/+2CAR       FUE DES CON INT SAB CAR
			   
			   
			  	setStats();
			  	
			  	this.conF += 2;
			  	this.fueF -= 2;
			  	this.carF += 2;
			  	
			  	this.mods[0] = -2;
			  	this.mods[2] = +2;
			  	this.mods[5] = +2;
		   
		   
			   break;
		   
		   case 4 :  // Mitjans:+2DES/-2FUE       FUE DES CON INT SAB CAR
			   
			   
			  	setStats();
			  	
			  	this.desF += 2;
			  	this.fueF -= 2;	
			  	
			  	this.mods[1] = +2;
			  	this.mods[0] = -2;
		   
			   break;
		   
		   case 5 :   // SemiOrc:+2FUE/-2INT/-2CAR       FUE DES CON INT SAB CAR
			   
			   
			  	setStats();
			  	
			  	this.fueF += 2;
			  	this.IntF -= 2;
			  	this.carF -= 2;
			  	
			  	this.mods[0] = +2;
			  	this.mods[3] = -2;
			  	this.mods[5] = +2;
		   
			   break;
		   
		   case 6 :   // HUMANS   
			  	setStats();	   
			   break;
		   
		   default : 
		     
		}
		
	}
	
	public void setStats() {
		
		this.fue = (int) caracrandom();
		this.des = (int) caracrandom();
		this.con = (int) caracrandom();
		this.Int = (int) caracrandom();
		this.sab = (int) caracrandom();
		this.car = (int) caracrandom();
		
		this.pv = (int) (this.con * dau8());
		this.pm = (int) ( ((this.Int + this.sab)/2) * dau4());
		
		this.fueF = this.fue;
		this.desF = this.des;
		this.conF = this.con;
		this.IntF = this.Int;
		this.sabF = this.sab;
		this.carF = this.car;
		
	}
	
	public double dau() {
		
		return Math.floor(Math.random() * (6 - 1 + 1)) + 1;
	}
	
	public double dau8() {
		
		return Math.floor(Math.random() * (8 - 1 + 1)) + 1;
	}
	
	public double dau4() {
		
		return Math.floor(Math.random() * (4 - 1 + 1)) + 1;
	}
	
	public double caracrandom() {
		
		double a = dau();
		
		double b = dau();
		
		double c = dau();
		
		double d = dau();
		
		Double[] arrai = {a,b,c,d};
		
		Arrays.sort(arrai, Collections.reverseOrder());
		
		return (arrai[0] + arrai[1] + arrai[2]);
		
	}
	
	
	
	
}


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css"><link>
<title>M8DAW2 Adrian Ursu</title>
</head>
<body>
<h1 style="border: 5px solid white;background-color: blue;color:white;text-align:center;padding:10px;">Creador de personatge</h1>

<% 

	int i = (int) Math.floor(Math.random() * (6 - 1 + 1)) + 1;

	Personatge pers = new Personatge(i);
	
	/* PER EL FORMULARI PER POSAR EL VALOR request.getParameter() */
	
%>



<table class="tg center" style="height:437px;">
<tbody>
	 
  <tr>
    <td class="tg-0pky centerrr" rowspan="9" style="border-bottom: 0px;"><img src="img/<%out.print(i); %>.png" width="400" height="300" style="object-fit: contain;"><p></td>
    <td class="tg-fymr">Nom</td>
  	<td class="tg-fymr" colspan="3"><input type="text" id="nom"></input></td>
  	</tr>
  	<tr>
    <td class="tg-fymr">Carac.</td>
    <td class="tg-fymr">Valor Base</td>
    <td class="tg-fymr">Mod.</td>
    <td class="tg-fymr">Valor Final</td>
  </tr>
  <tr>
    <td class="tg-fymr">FUE:</td>
    <td class="tg-0pky"><% out.print(pers.fue); %></td>
    <td class="tg-0pky"><% out.print(pers.mods[0]); %></td>
    <td class="tg-0pky"><% out.print(pers.fueF); %></td>
  </tr>
  <tr>
    <td class="tg-fymr">DES:</td>
    <td class="tg-0pky"><% out.print(pers.des); %></td>
    <td class="tg-0pky"><% out.print(pers.mods[1]); %></td>
    <td class="tg-0pky"><% out.print(pers.desF); %></td>
  </tr>
  <tr>
    <td class="tg-fymr">CON:</td>
    <td class="tg-0pky"><% out.print(pers.con); %></td>
    <td class="tg-0pky"><% out.print(pers.mods[2]); %></td>
    <td class="tg-0pky"><% out.print(pers.conF); %></td>
  </tr>
  <tr>
    <td class="tg-fymr">INT:</td>
    <td class="tg-0pky"><% out.print(pers.fue); %></td>
    <td class="tg-0pky"><% out.print(pers.mods[3]); %></td>
    <td class="tg-0pky"><% out.print(pers.fueF); %></td>
  </tr>
  <tr>
    <td class="tg-fymr">SAB:</td>
    <td class="tg-0pky"><% out.print(pers.sab); %></td>
    <td class="tg-0pky"><% out.print(pers.mods[4]); %></td>
    <td class="tg-0pky"><% out.print(pers.sabF); %></td>
  </tr>
  <tr>
    <td class="tg-fymr">CAR:</td>
    <td class="tg-0pky"><% out.print(pers.car); %></td>
    <td class="tg-0pky"><% out.print(pers.mods[5]); %></td>
    <td class="tg-0pky"><% out.print(pers.carF); %></td>
  </tr>
  <tr>
    <td class="tg-fymr">P.V(<% out.print(pers.pv); %>) </td>
    <td class="tg-0pky" colspan="3"><progress value="<%out.print(pers.pv); %>" max="160"></progress></td>
  </tr>
  <tr style="height:50px;">
  	<td class="tg-fymr" style="text-align:center;border-top: 0px;"><h3 style="font-size: 30px;margin:0px;"><%

switch(i)
{

/* ELF NAN GNOM MITJA SEMIORC HUMA*/


  case 1 :
	  out.print("Elf");
	  break;
  case 2:
	  out.print("Nan");
	  break;
  case 3 :
	  out.print("Gnom");
	  break;
  case 4 :
	  out.print("Mitjà");
	  break;
  case 5:
	  out.print("Semiorc");
	  break;
  case 6 :
	  out.print("Humà");
	  break;
	  
} %></h3></td>
    <td class="tg-fymr">P.M(<% out.print(pers.pm); %>)</td>
    <td class="tg-0pky" colspan="3"><progress value="<%out.print(pers.pm); %>" max="80"></progress>
 </td>
  </tr>
</tbody>
</table>

<a href="form.jsp">Formulari</a>

</body>
</html>