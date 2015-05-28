<%@page import="yapiPackage.Kullanici"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="yapiPackage.Connections"%>
<%@page import="java.sql.Connection"%>
<%@page import="yapiPackage.Log"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
<%
String username2 = (String)session.getAttribute("username");
if(username2==null){
	response.sendRedirect("../KullaniciGiris.jsp");
	return;
}
if((Integer)session.getAttribute("userrole")!=1){
	response.sendRedirect("../KullaniciGiris.jsp");
	return;
}
String username = request.getParameter("username");
String password = request.getParameter("password");
String email = request.getParameter("email");

	if(username!=null && password !=null && email!=null){
		int rol = Integer.parseInt(request.getParameter("rol"));
		ArrayList<Kullanici> listKullanici = Kullanici.kullaniciListesi();
		int i =0;
		boolean controlValues = false;
		while(i<listKullanici.size() && !controlValues){
			if(listKullanici.get(i).getKullaniciAdi().equals(username)){
				response.sendRedirect("Kullanicilar.jsp?error=1");
				return;
			}else if (listKullanici.get(i).getEmail().equals(email)){
				response.sendRedirect("Kullanicilar.jsp?error=2");
				return;
			}else{
				i++;
			}
			
		}
		Kullanici.kullaniciEkle(username, password, email, rol);
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Kullanıcılar</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		<div>
		<form name="usersignup" action="Kullanicilar.jsp" onsubmit="inputControls()" method="POST" >
			<h1>Kayıt Ol</h1>
				
				Kullanıcı Adı :<br />
				<input type="text" name="username"><br />
				Şifre : <br />
				<input type="password" name="password"> <br />
				Şifre Tekrar : <br />
				<input type="password" name="passwordagain"> <br />
				Email : <br />
				
				<input type="text" name="email"> <br /><br />
				Kullanıcı Rolü : <br/>
				<select name="rol">
					<option value="2">Normal Uye</option>
					<option value="1">Admin Uye</option>
				</select>
				<input type="submit" value="Kayıt Ol"><br /><br />
				<%
					if(request.getParameter("error")!=null){
						if(request.getParameter("error").equals("1")){
							out.println("Başka kullanıcı adı deneyin");
						}else if(request.getParameter("error").equals("2")){
							out.println("Email adresi kayitli!");
						}
					}
				%>
	</form>
		</div>
				<div class ="gradientBoxesWithOuterShadows" >
				<p style="font-size:large; margin: auto; font-family: verdana; ">Log listesi</p>
					<table id="myTable">
					<thead>
						<tr>
							<th>Kullanıcı Id</th>
							<th>Kullanici Adı  </th>
							<th>Email</th>
							<th>Rol</th>
						</tr>
					</thead>
					<tbody>
						<%
						ArrayList<Kullanici> kullanicilar = Kullanici.kullaniciListesi();
						for(int i =0;i<kullanicilar.size();i++){
							Kullanici tmp = kullanicilar.get(i);
							String rolt ;
							if(tmp.getRolId()!=2){
								rolt= "Admin";
							}else{
								rolt = "Kullanici";
							}
							out.print("<tr>"+
									"<td><b><i>"+tmp.getKullaniciId()+"</i></b></td>"+
									"<td><b><i></i>"+tmp.getKullaniciAdi()+"</b></td>"+
									"<td><b><i></i>"+tmp.getEmail()+"</b></td>"+
									"<td><b><i></i>"+rolt+"</b></td></tr>");
						}
					
						%>
					
					</tbody>
				</table>
			</div>
			
			
		
	</div>
</body>
</html>