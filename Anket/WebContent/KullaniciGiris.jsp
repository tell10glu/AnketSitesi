<%@page import="yapiPackage.MailListener"%>
<%@page import="yapiPackage.DavetMail"%>
<%@page import="yapiPackage.Anket"%>
<%@page import="yapiPackage.Kullanici"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<%
String username = request.getParameter("username");
String password = request.getParameter("password");
if(username!=null && password!=null){
	try{
		Kullanici kul = Kullanici.kullaniciGiris(username, password);
		if(kul==null){
			out.println("Kullanici Giris Hatali!");
		}else{
			session.setAttribute("username", username);
			session.setAttribute("password",password);
			session.setAttribute("userid",kul.getKullaniciId());
			session.setAttribute("userrole",kul.getRolId());
			session.setAttribute("useremail",kul.getEmail());
			response.sendRedirect("Profil.jsp");
			
		}
	}catch(Exception ex){
		
		out.println(ex.getMessage());	
	}
}else{
	if(session.getAttribute("username")!=null ){
		response.sendRedirect("Profil.jsp");	
	}
}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="Site.css" rel="stylesheet" >
<script type="text/javascript">
function validForm(){
if (document.userlogin.username.value == ""){
	alert ( "Kullanici Adi Bos Birakilamaz." );
	document.loginform.username.focus();
	return false;
	}
if (document.userlogin.password.value == ""){
	alert ( "Sifre Bos Bırakılamaz." );
	document.userform.password.focus();
	return false;
	}	
	return true;
}
</script>
<title>Insert title here</title>
</head>
<body>
<form name="userlogin" action="KullaniciGiris.jsp" onSubmit="return validForm()" method="POST" >
		<h1>Giriş Yap</h1>
		Kullanıcı Adı: <br />
		<input type="text" name="username"><br />
		Şifre: <br />
		<input type="password" name="password" onblur="text_onblur(this);"> <br /><br />
		<input type="submit" value="Giriş Yap" onblur = "text_onblur(this);"><br /><br />
		<a href="KayitOl.jsp">Kayıt olmak için tıklayın</a>
		
	</form>
</body>
</html>