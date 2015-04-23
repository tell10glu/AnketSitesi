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
	}else{
		userid = (Integer)session.getAttribute("userid");
		System.out.println("burdayim");
		email = (String)session.getAttribute("useremail");
		System.out.println("burdayim");
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
<title>Insert title here</title>
</head>
<body>
	<ul id = "menu">
		<li><a href='Profil.jsp'>Profil</a></li>
		<li><a href='YeniAnket.jsp'>Anket Oluştur</a></li>
		<li><a href='AnketDoldur.jsp'>Anket Doldur</a></li>
		
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
				<table>
				<tr>
						<th><b><i>Anket Adı</i></b></th>
						<th><b><i>Koyulma Tarihi</i></b></th>
						<th><b><i>Bitis Tarihi</i></b></th>
					</tr>
					<%
						ArrayList<Anket> anketlerim = Anket.anketListesiGetir(userid);
						for(int i =0;i<anketlerim.size();i++){
							Anket anketim = anketlerim.get(i);
							String myout = "Anket.jsp?anketid="+String.valueOf(anketim.getId());
							out.print("<tr>"+
							"<th><b><i><a href ="+myout+">"+anketim.getAnketAdi()+"</a></i></b></th>"+
							"<th><b><i>"+anketim.getKoyulmaTarihi()+"</i></b></th>"+
							"<th><b><i>"+anketim.getBitisTarihi()+"</i></b></th></tr>");
						}
					%>
					
				</table>
		</fieldset>
		
	</div>
</body>
</html>