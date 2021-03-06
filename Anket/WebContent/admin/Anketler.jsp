<%@page import="yapiPackage.Kullanici"%>
<%@page import="yapiPackage.Anket"%>
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
if(request.getParameter("anketid")!=null){
	int anketid= -1;
	try{
		anketid = Integer.parseInt(request.getParameter("anketid"));
	}catch(Exception ex){
		ex.printStackTrace();
	}
	if(anketid!=-1){
		Anket.anketiGetir(anketid).anketiEngelle();
		
	}
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
				<div class="gradientBoxesWithOuterShadows" >
			ANKET ENGELLEMEK ICIN UZERINE BASINIZ!;
			
			<table id="MyTableDate">
					<thead>
						<tr>
							<th>Anket Adı</th>
							<th>Koyulma Tarihi</th>
							<th>Bitiş Tarihi</th>
							<th>Anket Sahibi</th>
							<th>Ozellikleri</th>
						</tr>
					</thead>
						<%
						ArrayList<Anket> lstTumAnketler = Anket.anketListesi("Select* From Anket");
							for(int i =0;i<lstTumAnketler.size();i++){
								Anket anketim = lstTumAnketler.get(i);
								String anketaktif = anketim.aktiflikDurumunuGetir()?"aktif":"aktif degil";
								String anketengel = anketim.engelDurumuGetir()?"engel":"engelli degil";
								String myout = "Anket.jsp?anketid="+String.valueOf(anketim.getId());
								out.print("<tr>"+
								"<td><b><i><a href =Anketler.jsp?anketid="+anketim.getId()+">"+anketim.getAnketAdi()+"</a></b></td>"+
								"<td><b>"+anketim.getKoyulmaTarihi()+"</b></td>"+
								"<td><b>"+anketim.getBitisTarihi()+"</b></td>"+
								"<td><b>"+Kullanici.kullaniciAdiniGetir(anketim.getKullaniciId())+"</a></b></td>"+
								"<td><b>"+anketaktif+" , "+anketengel+"</a></b></td></tr>");
							}
						
						%>
				</table>
			</div>
			
			
		
	</div>
</body>
</html>