<%@page import="yapiPackage.Anket"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// Kullanici giris yapmis mi ? 
	// Anket ID doğru mu ? (veritabaninda da var mi diye bak)
	// Anket Herkese Açık mı veya Davet Listesinde Kullanici Adi var mi ? (Anket Sahibi mi ?)
	// Anket süresi devam ediyor ise anketi , etmiyor ise raporları göster .
	if(session.getAttribute("userid")==null){
		response.sendRedirect("KullaniciGiris.jsp");
		return;
	}
	int userID = (Integer)session.getAttribute("userid");
	int anketid = -1;
	String anketidStr = request.getParameter("anketid");
	if(anketidStr==null){
		response.sendRedirect("Profil.jsp");
		return;
	}
	try{
		anketid = Integer.parseInt(anketidStr);
	}catch(Exception ex){
		ex.printStackTrace();
		response.sendRedirect("Profil.jsp");
	}	
	Anket anket = Anket.anketiGetir(anketid);
	if(anket==null){
		response.sendRedirect("Profil.jsp");
	}
	out.print("Anket id : "+anketidStr);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>