<%@page import="yapiPackage.Connections"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<!-- <%@page errorPage="" %> -->
<%
	String AnketID = request.getParameter("aid");
	
	Connection connection = Connections.getDatabaseConnectionPath();
	Statement statement = connection.createStatement();
	String sql = "Select * from Soru where anketID = '"+AnketID+"'";
	
	ResultSet resultSet = statement.executeQuery(sql);
	


%>