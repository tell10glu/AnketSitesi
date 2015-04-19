<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul id = "menu">
		<li><a href='Profil.jsp'>Profil</a></li>
		<li><a href='AnketOlustur.jsp'>Anket Oluştur</a></li>
		<li><a href='AnketDoldur.jsp'>Anket Doldur</a></li>
		
		<li><a href='CikisYap.jsp'>Çıkış Yap</a></li>
	</ul>
	<div id="main">
		<h1>Profilim</h1>
		<fieldset>
			<legend>Kullanici Bilgileri</legend>
		</fieldset>
		<br />
		
		<fieldset>
			<legend>Anket Bilgileri</legend>
				<table>
					<tr>
						<th><b><i>Anket Adı</i></b></th>
						<th><b><i>Anket ID</i></b></th>
						<th><b><i>Kullanıcı Adı</i></b></th>
						<th><b><i>Koyulma Tarihi</i></b></th>
						<th><b><i>Bitis Tarihi</i></b></th>
					</tr>
				</table>
		</fieldset>
		
	</div>
</body>
</html>