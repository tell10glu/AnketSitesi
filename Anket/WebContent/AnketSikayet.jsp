<%@page import="yapiPackage.Anket"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//kullanici giris yap
	String username =(String)session.getAttribute("username");
	String email = null;
	int userid  =-1;
	if(username==null || username.equals("")){
		userid = (Integer)session.getAttribute("userid");
		response.sendRedirect("KullaniciGiris.jsp");
		return;
	}
	if(request.getParameter("anketid")==null){
		response.sendRedirect("AnaSayfa.jsp");
		return;
	}
	int anketid;
	try{
		anketid = Integer.parseInt(request.getParameter("anketid"));
	}catch(Exception ex){
		ex.printStackTrace();
		return;
	}
	Anket anketim = Anket.anketiGetir(anketid);
	if(anketim.getKullaniciId()==userid){
		out.print("Kendi anketini şikayet edemezsin ! Çok saçma...");
		return;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Anketi Sikayet Et</title>
</head>
<body>
		<form action="AnketSikayet.jsp" method="POST" class="pure-form">
		<input name="anketid" type="hidden" value='<%out.print(anketid); %>'>
		<fieldset>
			<legend>Anket Bilgileri</legend>
				 <div class="pure-control-group">
	            <label for="name">Anket Adı :</label>
	            <input name="anketadi" id="anketadi" type="text" style="color:black;" value='<%out.print(anketim.getAnketAdi()); %>' disabled >
	        </div>       
	        <div class= "pure-control-group">
	        	<label for="name">Şikayet Sebebi : </label>
	        	<input name="sikayetsebep" id="sikayetsebep" type="text" style="color:black;" >
	        </div>
	        <div class="pure-control-group">
	            <label for="name">Şikayet Açıklaması :</label>
	        	<textarea class="pure-input-1-2" name="sikayetaciklama"></textarea>
	        </div>
	        
		</fieldset>
		<input type="hidden" name="emailindex" id ="emailindex" >
		<input type="submit" value="Anketi Kaydet" ><br />
		</form>
</body>
</html>