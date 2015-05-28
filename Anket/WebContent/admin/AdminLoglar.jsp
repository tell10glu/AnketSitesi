<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="yapiPackage.Connections"%>
<%@page import="java.sql.Connection"%>
<%@page import="yapiPackage.Log"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
    <%
String username =(String)session.getAttribute("username");
String email = null;
int userid  =-1;
if(username==null || username.equals("")){
	response.sendRedirect("../KullaniciGiris.jsp");
	return;
}
if((Integer)session.getAttribute("userrole")!=1){
	response.sendRedirect("../KullaniciGiris.jsp");
	return;
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Loglar</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="../Site.css">
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.7/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.js"></script>
<script>
$(document).ready(function(){
    $("#myTable").DataTable();
    $("#MyTableDate").DataTable();
});
</script>
<style type="text/css">
.gradientBoxesWithOuterShadows { 
height: auto;
width: %75; 
padding: 20px;
margin : auto;
background-color: white; 
-webkit-box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.4); 
-moz-box-shadow: 0px 1px 6px rgba(23, 69, 88, .5);
-webkit-border-radius: 12px;
-moz-border-radius: 7px; 
border-radius: 7px;
background: -webkit-gradient(linear, left top, left bottom, 
color-stop(0%, white), color-stop(15%, white), color-stop(100%, #D7E9F5)); 
background: -moz-linear-gradient(top, white 0%, white 55%, #D5E4F3 130%); 
}
</style>
</head>
<body>
	<ul id = "menu">
		<li><a href='../AnaSayfa.jsp'>Site Ana Sayfa</a></li>
		<li><a href='Anketler.jsp'>Anketler</a></li>
		<li><a href='AdminLoglar.jsp'>Loglar</a></li>
		<li><a href='Kullanicilar.jsp'>Kullanicilar</a></li>
		<li><a href='../CikisYap.jsp'>Cikis Yap</a></li>
	</ul>
	<div id="main" style="color:black; " >
				<div class ="gradientBoxesWithOuterShadows" >
				<p style="font-size:large; margin: auto; font-family: verdana; ">Log listesi</p>
					<table id="myTable">
					<thead>
						<tr>
							<th>Tarih</th>
							<th>Saat  </th>
							<th>Aksiyon Adi</th>
							<th>Cikti</th>
						</tr>
					</thead>
					<tbody>
						<%
						Connection con = null;
						try{
							Class.forName("com.mysql.jdbc.Driver"); 
							con = Connections.getDatabaseConnectionPath();
							String query = "Select * from Log";
							Statement st = con.createStatement();
							ResultSet rs = st.executeQuery(query);
							while(rs.next()){
								out.print("<tr>"+
										"<td><b><i>"+rs.getString(2)+"</i></b></td>"+
										"<td><b><i></i>"+rs.getString(3)+"</b></td>"+
										"<td><b><i></i>"+rs.getString(4)+"</b></td>"+
										"<td><b><i></i>"+rs.getString(5)+"</b></td></tr>");
							}
						}catch(ClassNotFoundException ex){
							ex.printStackTrace();
						} 
						catch(Exception e){
							Log.systemError(e.getMessage().toString());
							e.printStackTrace();
						}
						finally{
							try {
								con.close();
							} catch (Exception e) {
								// TODO: handle exception
							}
						}
						
					
						%>
					
					</tbody>
				</table>
			</div>
			
			
		
	</div>
</body>
</html>