<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="yapiPackage.Connections"%>
<%@page import="yapiPackage.Anket"%>
<%
String username =(String)session.getAttribute("username");
if(username==null || username.equals("")){
	response.sendRedirect("KullaniciGiris.jsp");
	return;
}
int useridStr = (int)session.getAttribute("userid");
/*if(useridStr==null){
	response.sendRedirect("KullaniciGiris.jsp");
	return;
}*/
int userid = useridStr;//Integer.parseInt(useridStr);
	if(request.getParameter("anketid")==null){
		response.sendRedirect("Profil.jsp");
		return;
	}
	int anketId =Integer.parseInt(request.getParameter("anketid"));
	Anket anket = Anket.anketiGetir(anketId);
	//Anket Sahibi mi ?
	if(anket.getKullaniciId()==userid ){
		response.sendRedirect("Anket.jsp?anketid="+anketId);
		return;
	}
	Connection con = null;
	int sorusayisi =Integer.parseInt(request.getParameter("sorusayisi"));
	ArrayList<String> listCevaplar = new ArrayList<String>();
	java.util.Enumeration<String> params = request.getParameterNames();
	while(params.hasMoreElements()){
		String paramName = (String) params.nextElement();
		if(paramName.startsWith("cevap")){
			String paramValue = request.getParameter(paramName);
			listCevaplar.add(paramName+";;;"+paramValue);
		}
		
	}
	Class.forName("com.mysql.jdbc.Driver"); 
	for(int i =0;i<listCevaplar.size();i++){
		System.out.println(listCevaplar.get(i));
		String cevaptanSonrasi = listCevaplar.get(i).split(";;;")[1];
		System.out.println(cevaptanSonrasi);
		//cevaptanSonrasi = cevaptanSonrasi.substring(5);//Cevap kelimesi oldugu icin 5 ten sonraki degerleri alinr.
		int cevapId = Integer.parseInt(cevaptanSonrasi);
		try{
			con = Connections.getDatabaseConnectionPath();
			String query ="Insert into KullaniciCevap(kullaniciId,cevapId,cevapdurum) VALUES (?,?,?) ";
			PreparedStatement st = con.prepareStatement(query);
			st.setInt(1,userid);
			st.setInt(2, cevapId);
			st.setString(3, "secildi");
			st.executeUpdate();
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
	}
%>
