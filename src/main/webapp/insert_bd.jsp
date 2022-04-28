<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rpg Card Generator</title>
 <link rel="stylesheet" href="css/styles.css" type="text/css" />
</head>
<body>
<%// variables per fer la connexio:
	 String user="emeseis";
	String password="12345";
	String host="localhost";
	String db = "jocdecartes";
	String url = "jdbc:mysql://"+host+"/"+db;
	Connection conn = null;
	Statement statement = null;
	ResultSet rs = null;
	
	
	// recollim valors formulari:
	String nom=request.getParameter("nomtom");
	String race=request.getParameter("race");
	String fue=request.getParameter("FUERZAF");
	int nfue=Integer.parseInt(fue);
	String des=request.getParameter("DESTREZAF");
	int ndes=Integer.parseInt(des);
	String con=request.getParameter("CONSTITUCIONF");
	int ncon=Integer.parseInt(con);
	String intt=request.getParameter("INTELIGENCIAF");
	int nint=Integer.parseInt(intt);
	String sab=request.getParameter("SABIDURIAF");
	int nsab=Integer.parseInt(sab);
	String car=request.getParameter("CARISMAF");
	int ncar=Integer.parseInt(car);
	String picture = "";
	
	
	
	switch(race) {
	
	case ("Elf"):
		ndes = ndes + 2;
		ncon = ncon - 2;
		nint = nint + 2;
		picture = "img/1.png";
		break;
	
	case ("Nan"):
		ncon = ncon + 2;
		ncar = ncar - 2;
		nsab = nsab + 2;
		picture = "img/2.png";
		break;
	
	case ("Gnom"):
		ncon = ncon + 2;
		nfue = nfue - 2;
		ncar = ncar + 2;
		picture = "img/3.png";
		break;
	
	case ("Mitjà"):
		ndes = ndes + 2;
		nfue = nfue - 2;
		picture = "img/4.png";
		break;
	
	case ("Semiorc"):
		nfue = nfue + 2;
		nint = nint - 2;
		ncar = ncar - 2;
		picture = "img/5.png";
		break;
	
	case ("Humà"):
		picture = "img/6.png";
		break;
	
	}
	
	int pv = (int) (ncon * (Math.floor(Math.random() * (8 - 1 + 1)) + 1));
	int pm = (int) (((nint + nsab) / 2) * Math.floor(Math.random() * (4 - 1 + 1)) + 1); 
	

try{

	Class.forName("com.mysql.jdbc.Driver").newInstance ();
		conn = DriverManager.getConnection(url, user, password);
		statement = conn.createStatement();
		//inmediatamente hacemos un insert amb les dades
		//creamos la consulta
int i=statement.executeUpdate("insert into Carta(NOM_carta,PIC_carta,RACE_carta,FUE_carta,DES_carta,CON_carta,INT_carta,SAB_carta,CAR_carta,PV_carta,PM_carta)values('"+nom+"','"+picture+"','"+race+"',"+nfue+","+ndes+","+ncon+","+nint+","+sab+","+car+","+pv+","+pm+")");
out.println("<h4>El personatge s'ha guardat correctament</h4><br><a href=\"index.jsp\">Retorna al menú principal</a>");
}catch(SQLException error) {
out.print("Error de Conexión : "+error.toString());
} 




%>
