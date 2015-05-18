<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="yapiPackage.Soru"%>
<%@page import="yapiPackage.Anket"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	// Kullanici giris yapmis mi ? 
	// Anket ID doğru mu ? (veritabaninda da var mi diye bak)
	// Anket Aktif mi ? Aktif değil ise sahibi mi ? sahibi değilse başka sayfaya yönelt.
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
	if(userID==anket.getKullaniciId() && anket.isAktif()){
		out.print("Anket Aktif Durumda . Bu durumda ekleme çıkartma yapılamaz!");
		return;
	}
	if(anket.getBitisTarihi().before(new Date())){
		out.println("Anketin Tarihi Geçmiş");
		// rapor sayfasına yönlendir.
		
		return;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="Site.css">
<script type="text/javascript" src="jquery-1.11.3.min.js"></script>
<script type="text/javascript">
function validPost(){
	return true;
}
$(document).ready(function(){
	$("#anketbutton").click({
		
	});
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%out.print(anket.getAnketAdi()); %></title>
</head>
<body>
	<form onsubmit="return validPost()" method="get" action="AnketTamamla.jsp">
		<div id="sorular">
			<div class ="gradientBoxesWithOuterShadows">
			<%
				ArrayList<Soru> lst = Soru.anketSoruListesi(anketid); 
				out.print("<input type='hidden' name='sorusayisi' value='"+lst.size()+"'>");
				out.print("<input type='hidden' name='anketid' value='"+anketid+"'>");
				for(int i =0;i<lst.size();i++){
					out.print(String.valueOf(i+1)+".       ");
					out.print(lst.get(i).toString(i));
				}
			%>
			<button type="submit" id="anketbutton">Anketi Tamamla</button>
			</div>
		</div>
	</form>
	
</body>
</html>