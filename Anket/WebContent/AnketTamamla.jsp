<%@page import="yapiPackage.Log"%>
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
int useridStr = (Integer)session.getAttribute("userid");
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
			System.out.println(paramName);
			String[] cevaplar = request.getParameterValues(paramName);
			for(int i=0;i<cevaplar.length;i++){
				System.out.println(cevaplar[i]);
				String paramValue = request.getParameter(cevaplar[i]);
				listCevaplar.add(paramName+";;;"+cevaplar[i]);
			}
			
		}
		
	}
	Class.forName("com.mysql.jdbc.Driver"); 
	System.out.println(listCevaplar.size());
	for(int i =0;i<listCevaplar.size();i++){
		
		System.out.println(listCevaplar.get(i));
		String cevaptanSonrasi = listCevaplar.get(i).split(";;;")[1];
		System.out.println(cevaptanSonrasi);
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
			Log.systemError(ex.getMessage().toString());
		}finally{
			try{
				con.close();
			}catch(Exception e){
				e.printStackTrace();	
			}
		}
	}
	response.sendRedirect("AnaSayfa.jsp");
%>
