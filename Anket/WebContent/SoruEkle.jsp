<%
String anketid = request.getParameter("anketid");
<<<<<<< HEAD
=======

>>>>>>> 2ebebd68b9405bdc4557c7d3a410260548f0aea8
if(anketid==null || anketid.equals("")){
	response.sendRedirect("AnketSorular.jsp");
	return;
}

String soru = request.getParameter("soruyazisi");
String soruTipi = request.getParameter("soruTipi");
String[] str = request.getParameterValues("cevap");
String[] kisitlamalar = request.getParameterValues("Kisitlamalar");


%>