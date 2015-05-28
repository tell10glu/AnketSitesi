<%@page import="yapiPackage.Log"%>
<%@page import="yapiPackage.Connections"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String anketid = request.getParameter("anketid");
if(anketid==null || anketid.equals("")){
	response.sendRedirect("AnketSorular.jsp");
	return;
}

String soru = request.getParameter("soruyazisi");
String soruTipi = request.getParameter("sorutipi");
String cevapindex = request.getParameter("cevapindex");
Connection con = null;
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = Connections.getDatabaseConnectionPath();
	String query ="insert into Soru (soru,anketID,soruTipi) values ( ? , ? , ? ) ";
	PreparedStatement st = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
	st.setString(1, soru);
	st.setInt(2, Integer.parseInt(anketid));
	st.setInt(3, Integer.parseInt(soruTipi));
	long num = st.executeUpdate();
		// returns last id !!
		ResultSet generatedKeys = st.getGeneratedKeys(); 
        if (generatedKeys.next()) {
            num = generatedKeys.getLong(1);
        }
        for(int i=1;i<=Integer.parseInt(cevapindex);i++){
        	String cvp = request.getParameter("cevap"+i);
        	
        	if(cvp!=null){
        		// Cevaplar Ekleniyor.
        		query = "insert into Cevap(cevap,soruID) VALUES(?,?)";
        		PreparedStatement st2 = con.prepareStatement(query);
        		st2.setString(1, cvp);
        		st2.setLong(2, num);
        		st2.execute();
        	}
        }
        response.sendRedirect("AnketSorular.jsp?anketid="+anketid);
	
}catch(Exception ex){
	Log.systemError(ex.getMessage().toString());
	ex.printStackTrace();
}finally{
	con.close();
}
String[] kisitlamalar = request.getParameterValues("Kisitlamalar");
System.out.println(soru);
System.out.println(soruTipi);

%>