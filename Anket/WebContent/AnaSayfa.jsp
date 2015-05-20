<%@page import="java.util.ArrayList"%>
<%@page import="yapiPackage.Soru"%>
<%@page import="yapiPackage.Anket"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String username =(String)session.getAttribute("username");
if(username==null || username.equals("")){
	response.sendRedirect("KullaniciGiris.jsp");
	return;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="Site.css">
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
<title>Ana Sayfa</title>
</head>
<body>
	<ul id = "menu">
		<li><a href='AnaSayfa.jsp'>Ana Sayfa</a></li>
		<li><a href='Profil.jsp'>Profil</a></li>
		<li><a href='YeniAnket.jsp'>Anket Oluştur</a></li>
		<li><a href='CikisYap.jsp'>Çıkış Yap</a></li>
	</ul>
	<div id="main" style="color:black; " >
				<div class ="gradientBoxesWithOuterShadows" >
				<p style="font-size:large; margin: auto; font-family: verdana; ">Davet Edildiğim Anketler</p>
					<table id="myTable">
					<thead>
						<tr>
							<th>Anket Adı</th>
							<th>Koyulma Tarihi</th>
							<th>Bitiş Tarihi</th>
						</tr>
					</thead>
					<tbody>
						<%
						String email = (String)session.getAttribute("useremail");
						ArrayList<Anket> lstAnket = Anket.kullanicininDavetEdildigiAnketler(email);
						System.out.println("anket size : "+lstAnket.size());
							for(int i =0;i<lstAnket.size();i++){
								Anket anketim = lstAnket.get(i);
								String myout = "Anket.jsp?anketid="+String.valueOf(anketim.getId());
								out.print("<tr>"+
								"<td><b><i><a href ="+myout+">"+anketim.getAnketAdi()+"</a></i></b></td>"+
								"<td><b><i>"+anketim.getKoyulmaTarihi()+"</i></b></td>"+
								"<td><b><i>"+anketim.getBitisTarihi()+"</i></b></td></tr>");
							}
						
						%>
					
					</tbody>
				</table>
			</div>
			<div class="gradientBoxesWithOuterShadows" >
			<p style="font-size:large; margin: auto; font-family: verdana; ">Halka Açık Anketler</p>
			<table id="MyTableDate">
					<thead>
						<tr>
							<th>Anket Adı</th>
							<th>Koyulma Tarihi</th>
							<th>Bitiş Tarihi</th>
						</tr>
					</thead>
						<%
						ArrayList<Anket> lstTumAnketler = Anket.anketListesi("Select * From Anket where Anket.KullaniciID != "+(Integer)session.getAttribute("userid"));
						System.out.println(lstAnket.size());
							for(int i =0;i<lstTumAnketler.size();i++){
								Anket anketim = lstTumAnketler.get(i);
								String myout = "Anket.jsp?anketid="+String.valueOf(anketim.getId());
								out.print("<tr>"+
								"<td><b><i><a href ="+myout+">"+anketim.getAnketAdi()+"</a></b></td>"+
								"<td><b>"+anketim.getKoyulmaTarihi()+"</b></td>"+
								"<td><b>"+anketim.getBitisTarihi()+"</b></td></tr>");
							}
						
						%>
				</table>
			</div>
			
		
	</div>
</body>
</html>