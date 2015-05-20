<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.ArrayList"%>
<%@page import="yapiPackage.DavetMail"%>
<%@page import="yapiPackage.MailListener"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="yapiPackage.Connections"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String username =(String)session.getAttribute("username");
if(username==null || username.equals("")){
	response.sendRedirect("KullaniciGiris.jsp");
	return;
}
if(request.getParameter("anketid")==null){
	response.sendRedirect("AnaSayfa.jsp");
	return;
}
int anketid =Integer.parseInt(request.getParameter("anketid"));
Connection con = null;
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	con = Connections.getDatabaseConnectionPath();
	String query ="Update  AnketOzellik SET ozellikDurum = ? WHERE ozellikId = ? AND anketId=? ";
	PreparedStatement st = con.prepareStatement(query);
	st.setInt(1, 1);
	st.setInt(2,2);//anket aktif
	st.setInt(3, anketid);
	st.execute();
	
	query = "Select KullaniciEmail from AnketDavet where anketId = ? AND MailGonderildi=?";
	st.clearBatch();
	st = null;
	st = con.prepareStatement(query);
	st.setInt(1, anketid);
	st.setBoolean(2, false);
	ResultSet set = st.executeQuery();
	ArrayList<String> lstEmail = new ArrayList<String>();
	while(set.next()){
		lstEmail.add(set.getString(1));
	}
	String[] emailler = new String[lstEmail.size()];
	for(int i =0;i<lstEmail.size();i++){
		emailler[i] = lstEmail.get(i);
	}
	MailListener.MailEkle(new DavetMail(emailler,anketid,username));
	response.sendRedirect("Anket.jsp?anketid="+anketid);
	
}
catch(Exception ex){
	ex.printStackTrace();
}finally{
	try{
		con.close();
	}catch(Exception e){
		e.printStackTrace();	
	}
}
%>