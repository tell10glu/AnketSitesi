<%@page import="yapiPackage.Anket"%>
<%
String username =(String)session.getAttribute("username");
if(username==null || username.equals("")){
	response.sendRedirect("KullaniciGiris.jsp");
	return;
}
int useridStr = (int)session.getAttribute("userid");
/*if(useridStr==null){
	response.sendRedirect("KullaniciGiris.jsp");
	return;
}*/
int userid = useridStr;//Integer.parseInt(useridStr);
	if(request.getParameter("anketid")==null){
		response.sendRedirect("Profil.jsp");
		return;
	}
	int anketId =Integer.parseInt(request.getParameter("anketid"));
	Anket anket = Anket.anketiGetir(anketId);
	if(anket.getKullaniciId()==userid ){
		response.sendRedirect("Anket.jsp?anketid="+anketId);
		return;
	}
	//Anket Sahibi mi ?
	

%>
