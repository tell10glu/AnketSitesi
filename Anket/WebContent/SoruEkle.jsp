<%
String anketid = request.getParameter("anketid");
if(anketid==null || anketid.equals("")){
	response.sendRedirect("AnketSorular.jsp");
	return;
}

String soru = request.getParameter("soruyazisi");
String soruTipi = request.getParameter("sorutipi");
String cevapindex = request.getParameter("cevapindex");
for(int i=1;i<=Integer.parseInt(cevapindex);i++){
	String cvp = request.getParameter("cevap"+i);
	if(cvp!=null){
		System.out.println(cvp);
	}
}
String[] kisitlamalar = request.getParameterValues("Kisitlamalar");
System.out.println(soru);
System.out.println(soruTipi);

%>