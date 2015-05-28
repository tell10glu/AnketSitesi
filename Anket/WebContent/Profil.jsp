<%@page import="java.util.ArrayList"%>
<%@page import="yapiPackage.Anket"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String username =(String)session.getAttribute("username");
	String email = null;
	int userid  =-1;
	if(username==null || username.equals("")){
		response.sendRedirect("KullaniciGiris.jsp");
		return;
	}else{
		userid = (Integer)session.getAttribute("userid");
		email = (String)session.getAttribute("useremail");
	}
	
%>
<html>
<head>
<style>
th{
	color:black;

}
th b i{
	color:black;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="Site.css" rel="stylesheet" >
<title>Profil</title>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.7/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.js"></script>
<script>
$(document).ready(function(){
    $("#myTable").DataTable();
});
</script>
</head>
<body>
	<ul id = "menu">
		<li><a href='AnaSayfa.jsp'>Ana Sayfa</a></li>
		<li><a href='Profil.jsp'>Profil</a></li>
		<li><a href='YeniAnket.jsp'>Anket Oluştur</a></li>
		<li><a href='CikisYap.jsp'>Çıkış Yap</a></li>
	</ul>
	<div id="main">
		<h1>Profilim</h1>
		<fieldset>
			<legend>Kullanici Bilgileri</legend>
				<p >Kullanıcı Adı : <%out.print(username); %></p>
				<p >Email : <%  out.print(email);%></p>
		</fieldset>
		<br />
		
		<fieldset>
			<legend>Anket Bilgileri</legend>
				<table id="myTable">
				<thead>
				<tr>
						<th><b><i>Anket Adı</i></b></th>
						<th><b><i>Koyulma Tarihi</i></b></th>
						<th><b><i>Bitis Tarihi</i></b></th>
				</tr>
				</thead>
				<tbody>
					<%
					
					// Kullanıcının anketleri , halka açık anketler , vs vs ayrı ayrı listelenmeli
						ArrayList<Anket> anketlerim = Anket.anketListesiGetir(userid);
						for(int i =0;i<anketlerim.size();i++){
							Anket anketim = anketlerim.get(i);
							String aktiflik  = ":(Aktif Degil)";
							if(anketim.aktiflikDurumunuGetir()){
								aktiflik = ":(Aktif)";
							}
							
							String myout = "Anket.jsp?anketid="+String.valueOf(anketim.getId());
							out.print("<tr>"+
							"<th><b><i><a href ="+myout+">"+anketim.getAnketAdi()+aktiflik 
							+"</a></i></b></th>"+
							"<th><b><i>"+anketim.getKoyulmaTarihi()+"</i></b></th>"+
							"<th><b><i>"+anketim.getBitisTarihi()+"</i></b></th></tr>");
						}
					%>
					
					
				</tbody>
				</table>
		</fieldset>
		
	</div>
</body>
</html>