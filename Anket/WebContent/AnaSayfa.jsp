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
<link href="Site.css" rel="stylesheet" >
<title>Ana Sayfa</title>
</head>
<body>
	<ul id = "menu">
		<li><a href='AnaSayfa.jsp'>Ana Sayfa</a></li>
		<li><a href='Profil.jsp'>Profil</a></li>
		<li><a href='YeniAnket.jsp'>Anket Oluştur</a></li>
		<li><a href='AnketDoldur.jsp'>Anket Doldur</a></li>
		<li><a href='CikisYap.jsp'>Çıkış Yap</a></li>
	</ul>
	<div id="main" style="color:black;">
				Davet Edildiğim Anketler
		<table>
					<tr>
						<th><b><i>Davet Edildiğim Anketler</i></b></th>
						<th><b><i>Son Eklenen Anketler</i></b></th>
						<th><b><i>En Çok Çözülen Anketler</i></b></th>
					</tr>
					<tr>
						<%
						String email = (String)session.getAttribute("useremail");
						ArrayList<Anket> lstAnket = Anket.kullanicininDavetEdildigiAnketler(email);
						System.out.println(lstAnket.size());
							for(int i =0;i<lstAnket.size();i++){
								Anket anketim = lstAnket.get(i);
								String myout = "Anket.jsp?anketid="+String.valueOf(anketim.getId());
								out.print("<tr>"+
								"<th><b><i><a href ="+myout+">"+anketim.getAnketAdi()+"</a></i></b></th>"+
								"<th><b><i>"+anketim.getKoyulmaTarihi()+"</i></b></th>"+
								"<th><b><i>"+anketim.getBitisTarihi()+"</i></b></th></tr>");
							}
						
						%>
					</tr>
					
				</table>
		
			Son Eklenen Anketler
		
		
	</div>
</body>
</html>