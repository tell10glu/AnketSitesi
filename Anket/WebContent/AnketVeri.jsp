<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<!-- <%@page errorPage="" %> -->
<%
	String AnketID = request.getParameter("aid");
	
	Connection connection = (Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1/AnketSitesi","root","tellioglu");
	Statement statement = connection.createStatement();
	String sql = "Select * from Soru where anketID = '"+AnketID+"'";
	
	ResultSet resultSet = statement.executeQuery(sql);
	


%>