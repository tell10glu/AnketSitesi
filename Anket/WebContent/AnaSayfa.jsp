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
<style type="text/css">
table.imagetable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}
table.table1 {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#444444;
	border-width: 1px;
	border-color: #777777;
	border-collapse: collapse;
}
table.table1 th {
	background:#b5cfd2 url('cell-blue.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}
table.imagetable th {
	background:#b5cfd2 url('cell-blue.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}
table.table1 td {
	background:#dcddc0 url('cell-grey.jpg');
	border-width: 1px;
	padding: 15px;
	border-style: solid;
	border-color: #999999;
}
table.imagetable td {
	background:#dcddc0 url('cell-grey.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}
</style>
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
		<table class="table1">
					<tr>
						<td><b><i>
						Davet Edildiğim Anketler
						<table class="imagetable">
						<th><b><i>Anket Adı</i></b></th>
						<th><b><i>Başlangıç Tarihi</i></b></th>
						<th><b><i>Bitiş Tarihi</i></b></th>
						<%
						String email = (String)session.getAttribute("useremail");
						ArrayList<Anket> lstAnket = Anket.kullanicininDavetEdildigiAnketler(email);
						System.out.println(lstAnket.size());
							for(int i =0;i<lstAnket.size();i++){
								Anket anketim = lstAnket.get(i);
								String myout = "Anket.jsp?anketid="+String.valueOf(anketim.getId());
								out.print("<tr>"+
								"<td><b><i><a href ="+myout+">"+anketim.getAnketAdi()+"</a></i></b></td>"+
								"<td><b><i>"+anketim.getKoyulmaTarihi()+"</i></b></td>"+
								"<td><b><i>"+anketim.getBitisTarihi()+"</i></b></th></td>");
							}
						
						%>
						
						</table>
						</i></b>
						</td>
						<td><b><i>Yakında Bitecek Olan Anketler
								<table class="imagetable">
						<th><b><i>Anket Adı</i></b></th>
						<th><b><i>Başlangıç Tarihi</i></b></th>
						<th><b><i>Bitiş Tarihi</i></b></th>
						<%
						ArrayList<Anket> lstAnket2 = Anket.sontarih();
						System.out.println(lstAnket2.size());
							for(int i =0;i<lstAnket2.size();i++){
								Anket anketim = lstAnket2.get(i);
								String myout = "Anket.jsp?anketid="+String.valueOf(anketim.getId());
								out.print("<tr>"+
								"<td><b><i><a href ="+myout+">"+anketim.getAnketAdi()+"</a></i></b></td>"+
								"<td><b><i>"+anketim.getKoyulmaTarihi()+"</i></b></td>"+
								"<td><b><i>"+anketim.getBitisTarihi()+"</i></b></th></td>");
							}
						
						%>
						
						</table>
						
						
						
						
						</i></b></td>
						<td><b><i>Yeni Eklenen Anketler
						<table class="imagetable">
						<th><b><i>Anket Adı</i></b></th>
						<th><b><i>Başlangıç Tarihi</i></b></th>
						<th><b><i>Bitiş Tarihi</i></b></th>
						<%
						ArrayList<Anket> lstAnket3 = Anket.sontarih();
						System.out.println(lstAnket3.size());
							for(int i =0;i<lstAnket3.size();i++){
								Anket anketim = lstAnket3.get(i);
								String myout = "Anket.jsp?anketid="+String.valueOf(anketim.getId());
								out.print("<tr>"+
								"<td><b><i><a href ="+myout+">"+anketim.getAnketAdi()+"</a></i></b></td>"+
								"<td><b><i>"+anketim.getKoyulmaTarihi()+"</i></b></td>"+
								"<td><b><i>"+anketim.getBitisTarihi()+"</i></b></th></td>");
							}
						
						%>
						
						</table>
						
						
						
						
						</i></b></td>
					</tr>
					<tr>
					</tr>
					
				</table>		
	</div>
</body>
</html>