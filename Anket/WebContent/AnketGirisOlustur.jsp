<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Enumeration"%>
<%
String anketadi = request.getParameter("anketadi");
<<<<<<< HEAD

=======
>>>>>>> 2ebebd68b9405bdc4557c7d3a410260548f0aea8
if(anketadi==null || anketadi.equals("")){
	response.sendRedirect("YeniAnket.jsp");
	return;
}
String baslangictarihi = request.getParameter("baslangictarih");
String bitistarihi = request.getParameter("bitistarihi");
String ipKullanim = request.getParameter("ipkullanim");
String[] str = request.getParameterValues("kategori");

int[] kategoriid = new int[str.length];
if(str!=null)
for(int i =0;i<str.length;i++){
	kategoriid[i] = Integer.parseInt(str[i]);
}
Connection con = null;
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = (Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1/AnketSitesi","root","tellioglu");
	String query ="insert into Anket (KullaniciID,AnketAdi,IPKullanimIzin) VALUES("+(Integer)(session.getAttribute("userid"))+",'"+anketadi+"',"+Boolean.parseBoolean(ipKullanim)+")";
	Statement st = con.prepareStatement(query);
	/*st.setInt(1,1);//(Integer)(session.getAttribute("userid"))
	st.setString(2,anketadi);
	//st.setDate(3,Date.valueOf());
	//st.setDate(4,Date.valueOf(bitistarihi));
	st.setBoolean(3, Boolean.parseBoolean(ipKullanim));*/
	long num = st.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
	if(num==0){
		// hata cozumu yap
		out.println("Hata Olustu");
	}else{
		// returns last id !!
		ResultSet generatedKeys = st.getGeneratedKeys(); 
        if (generatedKeys.next()) {
            num = generatedKeys.getLong(1);
        }
	String queryKategori = "insert into AnketKategori (AnketID,KategoriID) VALUES(?,?)";
	PreparedStatement st2 = con.prepareStatement(queryKategori);
	st2.setLong(1, num);
	for(int i =0;i<kategoriid.length;i++){
		st2.setInt(2, kategoriid[i]);
		st2.execute();
	}
	response.sendRedirect("AnketSorular.jsp?anketid="+num);
	}
	
}catch(ClassNotFoundException ex){
	ex.printStackTrace();
} 
catch(Exception e){
	e.printStackTrace();
}
finally{
	try {
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
		// TODO: handle exception
	}
}

%>