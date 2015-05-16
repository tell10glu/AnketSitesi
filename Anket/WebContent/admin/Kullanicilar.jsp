<%@page import="java.util.ArrayList"%>
<%@page import="yapiPackage.Kullanici"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table  class="pure-table">
		<thead>
			<tr>
				<th>Kullanici ID</th>
				<th>Kullanici Adi</th>
				<th>Kullanici Sifre</th>
				<th>Kullanici Email</th>
				<th>Kullanici Rol</th>
			</tr>
		<tbody>
			<%
				
				ArrayList<Kullanici> list = Kullanici.kullaniciListesi();
				for(int i =0;i<list.size();i++){
					Kullanici kullanici = list.get(i);
					out.print("<tr class = 'pure-table-odd'>");
					out.print("<td>");
					out.print(kullanici.getKullaniciId());
					out.print("</td>");
					out.print("<td>");
					out.print(kullanici.getKullaniciAdi());
					out.print("</td>");
					out.print("<td>");
					out.print(kullanici.getKullaniciSifre());
					out.print("</td>");
					out.print("<td>");
					out.print(kullanici.getEmail());
					out.print("</td>");
					out.print("<td>");
					out.print(kullanici.getRolId());
					out.print("</td>");
					out.print("</tr>");
				}
			%>
		
		</tbody>
	</table>
</body>
</html>