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
		return;
	}	
	Anket anket = Anket.anketiGetir(anketid);
	if(anket==null){
		response.sendRedirect("Profil.jsp");
		return;
	}
	System.out.println(anket.getAnketOzellik());
	
	if(userID==anket.getKullaniciId() && (anket.getAnketOzellik().getOzellikId()==2 && anket.getAnketOzellik().getOzellikDurum()==1)){
		response.sendRedirect("AnketSonuc.jsp?anketid="+anketid);
		return;
	}
	if(anket.getBitisTarihi().before(new Date())){
		response.sendRedirect("AnketSonuc.jsp?anketid="+anketid);
		return;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="Site.css">
<script type="text/javascript" src="jquery-1.11.3.min.js"></script>
<script type="PopupJavascript.js"></script>
<script type="text/javascript">
function validPost(){
	return true;
}
function getElementsByClassName(classname,tag) {
	 if(!tag) tag = "*";
	 var anchs =  document.getElementsByTagName(tag);
	 var total_anchs = anchs.length;
	 var regexp = new RegExp('\\b' + classname + '\\b');
	 var class_items = new Array()
	 
	 for(var i=0;i<total_anchs;i++) { //Go thru all the links seaching for the class name
	  var this_item = anchs[i];
	  if(regexp.test(this_item.className)) {
	   class_items.push(this_item);
	  }
	 }
	 return class_items;
	}
function openPopup() {
var url = this.href;
window.open(url, "popup_id", "scrollbars,resizable,width=200,height=400");
return false;
}
function init() {
var popups = getElementsByClassName("popup");
for(var i=0;i<popups.length;i++) {
 popups[i].onclick=openPopup;
}
}
window.onload=init;
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%out.print(anket.getAnketAdi()); %></title>
</head>
<body>
	<div id="anketonbilgiler" class="gradientBoxesWithOuterShadows">
		<%
		out.print(anket.toString());
		if(userID!=anket.getKullaniciId()){
			out.print("<a href='AnketSikayet.jsp?anketid="+anketid+"' class='popup'>Anketi Sikayet Etmek İçin Buraya Tıklayınız</a>");
		}
		%>
	</div>
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