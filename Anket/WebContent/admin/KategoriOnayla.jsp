<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="yapiPackage.Connections"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Enumeration"%>
<%@page import="yapiPackage.Log"%>

<%@page import="yapiPackage.Admin"%>


<%
String username = (String)session.getAttribute("username");
if(username==null || username.equals("")){
	response.sendRedirect("KullaniciGiris.jsp");
	return;
}
if((Integer)session.getAttribute("userrrole")==1){
	return;
}
String onay=request.getParameter("onaylanacak");
Admin.onayKategori(onay);
Log.i(username+" adli kullanici "+onay+ " adli kullaniciyi sildi.");
response.sendRedirect("Admin.jsp");
%>