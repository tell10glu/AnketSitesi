<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");

String today;
today = format.format(new Date());
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
  var emaillerdogrumu = false;
  $(function() {
    $( "#bitistarihi" ).datepicker();
     
  });
 /* $(document).ready(function(){
	  var date =new Date();
	  var month = date.getMonth()+1;
	  var day = date.getDay();
	  var year = date.getFullYear();
	  $("#baslangictarih").val(month+"/"+day+"/"+year);
	  $('#sorudiv').hide();
	 
  });*/
  function validPost(){
	  var selected = [];
	  $('#kategorilistesi input:checked').each(function() {
	      selected.push($(this).attr('name'));
	  });
	  if(selected.length==0){
		  alert("Kategori Boş Bırakılamaz!");
		  return false;
	  }
	  var bitistarihi = $("#bitistarihi").val();
	  if(bitistarihi==""){
		  alert("Bitiş Tarihi Boş Bırakılamaz!");
		  return false;
	  }
	  if($("#anketadi").val()==""){
		  alert("Anket Adı Boş Bırakılamaz!");
		  return false;
	  }
  }
  function emailleriKontrolEt(){
	  emaillerdogrumu = false;
	var count = document.getElementsByName("email").length;
	for(var i=0;i<count;i++){
		var element = document.getElementsByName("email")[i].value;
		if(!validateEmail(element)){
			alert("Email Adresi Doğru Değil");
			return false;
		}
	}
	emaillerdogrumu = true;
	return true;
  }
  index=1;
  function yeniEmail(){
		  //$('#emailler').append("<div><input name='email"+index+"' id='email"+index+"' style='color:black;' type='text' onblur='emailleriKontrolEt(this.value);'></div>");
  		  $('#emailler').append("<div><input name='davetemail' style='color:black;' type='text' onblur='emailleriKontrolEt(this.value);'></div>");
  		  
		  index++;
  		  $("emailindex").val(index);
  }
  function validateEmail(email) {
	    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	    return re.test(email);
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
		<form name="anketolustur" onsubmit="return validPost();" action="AnketGirisOlustur.jsp"  method="POST" class ="pure-form pure-form-aligned" >
		<input type="hidden" name="baslangictarih" id="baslangictarih" value="<%out.print(today);%>"> 
		<fieldset>
			<legend>Anket Bilgileri</legend>
				 <div class="pure-control-group">
	            <label for="name">Anket Adi :</label>
	            <input name="anketadi" id="anketadi" type="text" style="color:black;" >
	        </div>
	        <div class="pure-control-group">
	            <label for="name">Başlangıç Tarihi:</label>
	            <input  style="color:black;"  type="text" value="<%out.print(today);%>" disabled>
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
		        					
		        					out.print(" <input type='checkbox' name='kategori' value="+kat.getId()+">"+kat.getKategoriAdi()+"<br>");
			        	
		        				}
		        				
	        				}
	        				
	        			}
	        		
	        		%>
	        	</div>
	        </div>
	        <div class="pure-control-group">
	            <label for="name">Herkese Açık</label>
	        	<input name="HerkesGorebilir" id="HerkesGorebilir" type="checkbox" style="color:black;">
	        </div>
	        <div id="anketdavetlistesi">
	        	<div id="emailler">Davet Edilecek E-Posta Listesi</div>
	        	<button type="button" id="buttonMailEkle" onclick="yeniEmail();">Yeni Email</button>
	 
	        </div>
		</fieldset>
		<input type="hidden" name="emailindex" id ="emailindex" >
		<input type="submit" value="Anketi Kaydet" ><br />
		</form>
		
		
	</div>
	
	
	
</body>
</html>