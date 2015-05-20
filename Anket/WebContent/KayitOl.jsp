<%@page import="java.util.ArrayList"%>
<%@page import="yapiPackage.Kullanici"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String username2 = (String)session.getAttribute("username");
if(username2!=null){
	response.sendRedirect("Profil.jsp");
}
String username = request.getParameter("username");
String password = request.getParameter("password");
String email = request.getParameter("email");
	if(username!=null && password !=null && email!=null){
		int rol = 2;// Burada bir normalizasyon yapilacak . 
		ArrayList<Kullanici> listKullanici = Kullanici.kullaniciListesi();
		int i =0;
		boolean controlValues = false;
		while(i<listKullanici.size() && !controlValues){
			if(listKullanici.get(i).getKullaniciAdi().equals(username)){
				response.sendRedirect("KayitOl.jsp?error=1");
				return;
			}else if (listKullanici.get(i).getEmail().equals(email)){
				response.sendRedirect("KayitOl.jsp?error=2");
				return;
			}else{
				i++;
			}
			
		}
		Kullanici.kullaniciEkle(username, password, email, rol);
		response.sendRedirect("KullaniciGiris.jsp");
	}

%>
<html>
<head>
<script type="text/javascript">
function inputControls(){
if (document.usersignup.username.value == ""){
	alert ( "Kullanici Adi Bos Birakilamaz." );
	document.loginform.username.focus();
	return false;
	}
if (document.usersignup.password.value == ""){
	alert ( "Sifre Bos Bırakılamaz." );
	document.userform.password.focus();
	return false;
	}	
if(document.usersignup.password.value != document.usersignup.userpasswordagain.value){
	alert("Şifreler Birbiriyle Uyumlu Değil.");
	document.userform.passwordagain.focus();
	return false;
}
if (document.usersignup.email.value == ""){
	alert ( "Email Bos Bırakılamaz." );
	document.userform.email.focus();
	return false;
	}	
return true;
}
</script>
<link href="Site.css" rel="stylesheet" >
<meta name="viewport" content="width=device-width, initial-scale=1">	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="usersignup" action="KayitOl.jsp" onsubmit="inputControls()" method="POST" >
			<h1>Kayıt Ol</h1>
				
				Kullanıcı Adı :<br />
				<input type="text" name="username"><br />
				Şifre : <br />
				<input type="password" name="password"> <br />
				Şifre Tekrar : <br />
				<input type="password" name="passwordagain"> <br />
				Email : <br />
				<input type="text" name="email"> <br /><br />
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
</body>

</html>