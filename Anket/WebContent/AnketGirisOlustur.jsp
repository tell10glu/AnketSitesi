<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="yapiPackage.Connections"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Enumeration"%>
<%
String anketadi = request.getParameter("anketadi");
if(anketadi==null || anketadi.equals("")){
	response.sendRedirect("YeniAnket.jsp");
	return;
}
String baslangictarihi = request.getParameter("baslangictarih");
String bitistarihi = request.getParameter("bitistarihi");
String ipKullanim = request.getParameter("ipkullanim");
String[] str = request.getParameterValues("kategori");
String[] davetListesi = request.getParameterValues("davetemail");

if(str==null || str.length==0){
		response.sendRedirect("YeniAnket.jsp?hata=Kategori Girilmeli!&anketadi="+anketadi);
		return;
}
int[] kategoriid = new int[str.length];
if(str!=null){
	for(int i =0;i<str.length;i++){
		kategoriid[i] = Integer.parseInt(str[i]);
		System.out.println(kategoriid[i]);
		}
}
	
Connection con = null;
try{
	SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
	Date dateBaslangic = format.parse(baslangictarihi);
	Date dateBitis = format.parse(bitistarihi);
	Class.forName("com.mysql.jdbc.Driver"); 
	con = Connections.getDatabaseConnectionPath();
	String query ="insert into Anket (KullaniciID,AnketAdi,KoyulmaTarihi,BitisTarihi,IPKullanimIzin,Aktif) VALUES(?,?,?,?,?,?)";// tarihler eklenmedi
	PreparedStatement st = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
	st.setInt(1,(Integer)(session.getAttribute("userid")));
	st.setString(2,anketadi);
	st.setDate(3, new java.sql.Date(dateBaslangic.getTime()));
	st.setDate(4,new java.sql.Date(dateBitis.getTime()));
	st.setBoolean(5, Boolean.parseBoolean(ipKullanim));
	st.setBoolean(6,false);
	long num = st.executeUpdate();
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
	if(davetListesi!=null && davetListesi.length!=0){
		String queryDavetListesi = "insert into AnketDavet (KullaniciEmail,anketId,mailGonderildi) VALUES(?,?,?)";
		st2.clearBatch();
		st2 = null;
		st2 = con.prepareStatement(queryDavetListesi);
		st2.setLong(2, num);
		st2.setBoolean(3, false);
		for(int i =0;i<davetListesi.length;i++){
			st2.setString(1, davetListesi[i]);
			
			st2.execute();
		}
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