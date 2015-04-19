<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="yapiPackage.Kategoriler"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String username =(String)session.getAttribute("username");
String email = null;
if(username==null || username.equals("")){
	response.sendRedirect("KullaniciGiris.jsp");
}else{
	email = (String)session.getAttribute("useremail");
}

%>
<html>

<head>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link rel="stylesheet" href="Site.css">
  <script type="text/javascript">
  var soruTipiValue = -1;
  var soruEkleSayfasiAcikmi = false;
  $(function() {
    $( "#bitistarihi" ).datepicker();
     
  });
  $(document).ready(function(){
	  var date =new Date();
	  var month = date.getMonth()+1;
	  var day = date.getDay();
	  var year = date.getFullYear();
	  $("#baslangictarih").val(month+"/"+day+"/"+year);
	  $('#sorudiv').hide();
	  
  });
  function soruEkle(){
	 
	  if(soruEkleSayfasiAcikmi==false){
		  $('#sorudiv').show('slow');
		  soruEkleSayfasiAcikmi = true;
	  }else{
		  $('#sorudiv').hide('slow');
		  soruEkleSayfasiAcikmi = false;
	  }
  };
  function soruTipiSecildiginde(){
	  
	  var str ="";
	  var value =  $('#sorutipi option:selected').each(function(){
		  str += $( this ).text();  
	  });
	  soruTipiValue = str;
	  if(str=="Coklu Secim"){
		 $('#cevapyazi').remove(); 
		  // coklu secim
	  }else if(str == "Tekli Secim"){
			 $('#cevapyazi').remove(); 
		  // tekli secim
	  }else if(str == "Yazi"){
		  $('#sorudiv').append("<div class='pure-control-group' id ='cevapyazi'><label for='name'>Cevap Başlığını Giriniz : </label><input name='cevapbaslik' id='cevapbaslik' style='color:black;'  type='text' ></div>");
		  // Yazi
	  }
  }
  </script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Yeni Anket Oluştur</title>
</head>
<body>
	<ul id = "menu">
		<li><a href='Profil.jsp'>Profil</a></li>
		<li><a href='AnketOlustur.jsp'>Anket Oluştur</a></li>
		<li><a href='AnketDoldur.jsp'>Anket Doldur</a></li>
		
		<li><a href='CikisYap.jsp'>Çıkış Yap</a></li>
	</ul>
	<div id="#main">
		<form name="anketolustur" action="AnketGirisOlustur.jsp"  method="GET" class ="pure-form pure-form-aligned" >
			
		<fieldset>
			<legend>Anket Bilgileri</legend>
				 <div class="pure-control-group">
	            <label for="name">Anket Adi :</label>
	            <input name="anketadi" id="anketadi" type="text" style="color:black;" >
	        </div>
	        <div class="pure-control-group">
	            <label for="name">Başlangıç Tarihi:</label>
	            <input name="baslangictarih" id="baslangictarih" style="color:black;"  type="text" disabled>
	        </div>
	         <div class="pure-control-group">
	            <label for="name">Bitiş Tarihi:</label>
	            <input name="bitistarihi" id="bitistarihi" type="text" style="color:black;"  >
	        </div>
	        <div class="pure-control-group">
	            <label for="name">IP Kullanim izin :</label>
	            <input name="ipkullanim" id="ipkullanim" type="checkbox" style="color:black;" >
	        </div>
	        <div class= "pure-control-group">
	        	<label for="name">Kategoriler : </label>
	        	<div id ="kategorilistesi">
	        	<%
	        			ArrayList<Kategoriler> listKategori = Kategoriler.kategoriListesi();
	        			for(int i=0;i<listKategori.size();i++){
	        				out.print("<input type='checkbox' name='kategori' value="+listKategori.get(i).getId()+">"+listKategori.get(i).getKategoriAdi()+"<br>");
	        				if(listKategori.get(i).getAltKategori()!=null){
		        				for( int j=0;j<listKategori.get(i).getAltKategori().size();j++){
		        					Kategoriler kat  = listKategori.get(i).getAltKategori().get(j);
		        					out.print("<input type='checkbox' name='kategori' value="+kat.getId()+">"+kat.getKategoriAdi()+"<br>");
			        	
		        				}
		        				
	        				}
	        				
	        			}
	        		
	        		%>
	        	</div>
	        		
	        	
	        </div>
		</fieldset>
		
		<input type="submit" value="Anketi Kaydet" ><br />
		</form>
		
		
	</div>
	
	
	
</body>
</html>