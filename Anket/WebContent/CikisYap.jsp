<%
	session.removeAttribute("username");
	session.removeAttribute("password");
	session.removeAttribute("userid");
	session.removeAttribute("userrole");
	response.sendRedirect("KullaniciGiris.jsp");

%>