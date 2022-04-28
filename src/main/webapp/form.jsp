<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%
class persoonatge {

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

	protected int mods[] = { 0, 0, 0, 0, 0, 0 };
	
	protected String race;

	// Elfs, Nans, Gnom, Mitjans, Semi-Orc i humans
	// 1      2     3      4          5        6

	/* 
	
	
	
	// FUE DES CON INT SAB CAR
	
	
	*/

	persoonatge(int dau) {

		switch (dau) {

		case 1: // Elfs: +2DES/-2CON/+2INT       FUE DES CON INT SAB CAR

	setStats();

	this.desF += 2;
	this.conF -= 2;
	this.IntF += 2;

	this.mods[1] = +2;
	this.mods[2] = -2;
	this.mods[3] = +2;

	this.race = "Elf";
	
	break;

		case 2: // Nans:+2CON/-2CAR/+2SAB       FUE DES CON INT SAB CAR

	setStats();

	this.conF += 2;
	this.carF -= 2;
	this.sabF += 2;

	this.mods[2] = +2;
	this.mods[4] = +2;
	this.mods[5] = -2;

	this.race = "Nan";

	break;

		case 3: // Gnom:+2CON/-2FUE/+2CAR       FUE DES CON INT SAB CAR

	setStats();

	this.conF += 2;
	this.fueF -= 2;
	this.carF += 2;

	this.mods[0] = -2;
	this.mods[2] = +2;
	this.mods[5] = +2;

	this.race = "Gnom";

	break;

		case 4: // Mitjans:+2DES/-2FUE       FUE DES CON INT SAB CAR

	setStats();

	this.desF += 2;
	this.fueF -= 2;

	this.mods[1] = +2;
	this.mods[0] = -2;

	this.race = "Mitjà";

	break;

		case 5: // SemiOrc:+2FUE/-2INT/-2CAR       FUE DES CON INT SAB CAR

	setStats();

	this.fueF += 2;
	this.IntF -= 2;
	this.carF -= 2;

	this.mods[0] = +2;
	this.mods[3] = -2;
	this.mods[5] = +2;

	this.race = "Semiorc";

	break;

		case 6: // HUMANS   
	setStats();

	this.race = "Humà";
	
	break;

		default:

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
		this.pm = (int) (((this.Int + this.sab) / 2) * dau4());

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

		Double[] arrai = { a, b, c, d };

		Arrays.sort(arrai, Collections.reverseOrder());

		return (arrai[0] + arrai[1] + arrai[2]);

	}
	
	public int contar(int i) {
		
		return i++;
		
}
	
	 public String generarSelect(int num, int[] array) {
		 
			int i = (int) Math.floor(Math.random() * (6 - 1 + 1)) + 1;

			persoonatge perso = new persoonatge(i);

			int[] arrai = new int[] { perso.fue, perso.des, perso.con, perso.Int, perso.sab, perso.car };
			
			String[] nomarrai = new String[] {"FUERZAF", "DESTREZAF", "CONSTITUCIONF", "INTELIGENCIAF", "SABIDURIAF", "CARISMAF"};
			 
			int[] pos = new int[] { 1, 2, 3, 4, 5, 6 };
			
			String selec = "<select name="+nomarrai[num-1]+" id=\"select"+num+"\" required=\"true\">";
				
					for (int l = 0; l<6;l++) {
						
						selec = selec+"<option value="+array[l]+" class="+pos[l]+" onclick=\"console.log($(this).value);\" >" + array[l] + "</option>";
						
					}
			
			selec = selec + "</select>";
					
			return selec;
			
		}

}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="script.js"></script>
<link rel="stylesheet" href="style.css"><link>
<script src="jquery-3.6.0.min.js"></script>
<title>Formulari de personatge</title>
</head>
<body>
<script>

$(document).ready(function() {
    $('select').change(function() {
        $('option[value=' + $(this).val() + ']').attr('disabled', 'disabled');
    });
});



</script>
	
	<h1
		style="border: 5px solid white; background-color: blue; color: white; text-align: center; padding: 10px;">
		Crea el personatge</h1>

	<%

	/* PER EL FORMULARI PER POSAR EL VALOR request.getParameter() */

 	int i = (int) Math.floor(Math.random() * (6 - 1 + 1)) + 1;

 	persoonatge perso = new persoonatge(i);

 	int[] arrai = new int[] { perso.fue, perso.des, perso.con, perso.Int, perso.sab, perso.car };

// 	int[] arrai2 = arrai;

// 	/* PER EL FORMULARI PER POSAR EL VALOR request.getParameter() */

// 		out.print("Els stats a assignar son: " + arrai[0] + "," + arrai[1] + "," + arrai[2] + "," + arrai[3] + "," + arrai[4]
// 				+ "," + arrai[5]);
		
		
		
		%>
		
		<form action="insert_bd.jsp" method="GET">

	<table class="tg center" style="height: 437px;">
		<tbody>

			<tr>
				<td class="tg-0pky centerrr" rowspan="9" style="border-bottom: 0px;"><img name="picture" class="imatge"
					src="img/<%out.print(i);%>.png" width="400" height="300"
					style="object-fit: contain;">
					<input type="hidden" value="<% out.print(perso.race);%>" name="race" id="race"/>
				<p></td>
				<td class="tg-fymr">Nom</td>
				<td class="tg-fymr" colspan="3"><input type="text" id="nom" name="nomtom"></input></td>
			</tr>
			<tr>
				<td class="tg-fymr">Carac.</td>
				<td class="tg-fymr">Valor Base</td>
				<td class="tg-fymr">Mod.</td>
				<td class="tg-fymr">Valor Final</td>
			</tr>
			<tr>
				<td class="tg-fymr">FUE:</td>
				<td class="tg-0pky fuer">
					<%
					out.print(perso.generarSelect(1,arrai));
					%>
				</td>
				<td class="tg-0pky">
					<%
					out.print(perso.mods[0]);
					%>
				</td>
				<td class="tg-0pky">
					<% out.print(perso.fueF); %>
				</td>
			</tr>
			<tr>
				<td class="tg-fymr">DES:</td>
				<td class="tg-0pky dest">
					<%
					out.print(perso.generarSelect(2,arrai));
					%>
				</td>
				<td class="tg-0pky">
					<%
					out.print(perso.mods[1]);
					%>
				</td>
				<td class="tg-0pky">
					<%
					out.print(perso.desF);
					%>
				</td>
			</tr>
			<tr>
				<td class="tg-fymr">CON:</td>
				<td class="tg-0pky cons">
					<%
					out.print(perso.generarSelect(3,arrai));
					%>
				</td>
				<td class="tg-0pky">
					<%
					out.print(perso.mods[2]);
					%>
				</td>
				<td class="tg-0pky">
					<%
					out.print(perso.conF);
					%>
				</td>
			</tr>
			<tr>
				<td class="tg-fymr">INT:</td>
				<td class="tg-0pky inte">
					<%
					out.print(perso.generarSelect(4,arrai));
					%>
				</td>
				<td class="tg-0pky">
					<%
					out.print(perso.mods[3]);
					%>
				</td>
				<td class="tg-0pky">
					<%
					out.print(perso.IntF);
					%>
				</td>
			</tr>
			<tr>
				<td class="tg-fymr">SAB:</td>
				<td class="tg-0pky sabi">
					<%
					out.print(perso.generarSelect(5,arrai));
					%>
				</td>
				<td class="tg-0pky">
					<%
					out.print(perso.mods[4]);
					%>
				</td>
				<td class="tg-0pky">
					<%
					out.print(perso.sabF);
					%>
				</td>
			</tr>
			<tr>
				<td class="tg-fymr">CAR:</td>
				<td class="tg-0pky cari">
					<%
					out.print(perso.generarSelect(6,arrai));
					%>
				</td>
				<td class="tg-0pky">
					<%
					out.print(perso.mods[5]);
					%>
				</td>
				<td class="tg-0pky">
					<%
					out.print(perso.carF);
					%>
				</td>
			</tr>
			<tr>
				<td class="tg-fymr pv" name="pv">P.V(<%
				out.print(perso.pv);
				%>)
				</td>
				<td class="tg-0pky" colspan="3"><progress
						value="<%out.print(perso.pv);%>" max="160"></progress></td>
			</tr>
			<tr style="height: 50px;">
				<td class="tg-fymr" style="text-align: center; border-top: 0px;">
						<select class="selectrace">
							<option id=1 onclick="var img = document.querySelector('.imatge');img.src = 'img/1.png';document.getElementById('race').setAttribute('value','Elf');"><% out.print("Elf"); %></option>
							<option id=2 onclick="var img = document.querySelector('.imatge');img.src = 'img/2.png';document.getElementById('race').setAttribute('value','Nan');"><% out.print("Nan"); %></option>
							<option id=3 onclick="var img = document.querySelector('.imatge');img.src = 'img/3.png';document.getElementById('race').setAttribute('value','Gnom');"><% out.print("Gnom"); %></option>
							<option id=4 onclick="var img = document.querySelector('.imatge');img.src = 'img/4.png';document.getElementById('race').setAttribute('value','Mitjà');"><% out.print("Mitjà"); %></option>
							<option id=5 onclick="var img = document.querySelector('.imatge');img.src = 'img/5.png';document.getElementById('race').setAttribute('value','Semiorc');"><% out.print("Semiorc"); %></option>
							<option id=6 onclick="var img = document.querySelector('.imatge');img.src = 'img/6.png';document.getElementById('race').setAttribute('value','Humà');"><% out.print("Humà"); %></option>
						</select>	
					</td>
				<td class="tg-fymr pm" name="pm">P.M(<%
				out.print(perso.pm);
				%>)
				</td>
				<td class="tg-0pky" colspan="3"><progress
						value="<%out.print(perso.pm);%>" max="80"></progress></td>
			</tr>
		</tbody>
	</table>
	
	<div id="retornar">
	<input onclick="reseteja()" id="reset">Reseteja l'assignació</input>
	<a id = "retorn" href="index.jsp">Torna al menú principal</a>
	<button type="submit">Guarda el personatge</button>
</div>
	
	
	</form>


<!-- 	<h2> -->
<!-- 		<select id="select1"> -->
		
			
			
<!-- // 			String options = ""; -->
<!-- // 			String[] stats = new String[] { "FUE", "DES", "CON", "INT", "SAB", "CAR" }; -->
<!-- // 			int[] pos = new int[] { 1, 2, 3, 4, 5, 6 }; -->

<!-- // 			for (int k = 0; k < arrai.length; k++) { -->

<!-- // 				out.print("<option value=" + arrai[k] + " id=" + pos[k] + " onclick=\"var arraiii" + pos[k] + " = " + arrai -->
<!-- // 				+ ";  \">" + arrai[k] + "</option>"); -->

<!-- // 			} -->
			
<!-- 		</select> -->
<!-- 	</h2> -->



<script type="text/javascript">
	
var img = document.querySelector(".imatge");
var selectrace = document.querySelector(".selectrace");
var optionsrace = selectrace.querySelectorAll('options');

$(selectrace).ready(function() {
    $(selectrace).change(function() {

// 	img.src = "img/"+$(this).attr("id")+".png";
});
});



// $(document).ready(function() {
//     $('select').change(function() {
//         $('option[value=' + $(this).val() + ']').attr('disabled', 'disabled');
//     });
// });



</script>







</body>
</html>





