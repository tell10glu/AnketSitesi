<%
String anketid = request.getParameter("anketid");

if(anketid==null || anketid.equals("")){
	response.sendRedirect("AnketSorular.jsp");
	return;
}

String soru = request.getParameter("soruyazisi");
String soruTipi = request.getParameter("soruTipi");
String[] str = request.getParameterValues("cevap");
String[] kisitlamalar = request.getParameterValues("Kisitlamalar");


%>