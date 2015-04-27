<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getParameter("anketid")==null){
		response.sendRedirect("AnketGirisOlustur.jsp");
		return ;
	}
	int anketid = Integer.parseInt(request.getParameter("anketid"));
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
index = 1;
function yeniCevapEkle(){
	$('#cevapbaslik5').append("<p/><input name='cevap' id='cevap' style='color:black;' type='text'><br>");
	$('#coklu').append("<option value='"+index+"'>"+index+"</option>");
	$('#cevapbaslik6').append("<p/><input name='cevap' id='cevap' style='color:black;' type='text'><br>");
	index++;
	
}
 function soruTipiSecildiginde(){
		  var str ="";
		  var value =  $('#sorutipi option:selected').each(function(){
			  str += $( this ).text();  
		  });
		  soruTipiValue = str;
		  if(str=="Coklu Secim"){
			  $('#cevapdiv').prepend("<div id='cevapbaslik5' ></div>");
			  $('#cevapbaslik5').append("Max seçim sayısı: <select id='coklu'><option value='SeçimYAp'>Lütfen Bir Seçim Yapınız</option></select>");
			  $('#cevapbaslik5').append("<div>Cevaplar</div>");
			 $('#cevapyazi').remove(); 
			 $('#cevapbaslik6').remove(); 
			  // coklu secim
		  }else if(str == "Tekli Secim"){
			  $('#cevapdiv').prepend("<div id='cevapbaslik6'>Cevaplar</div>");
			  $('#cevapyazi').remove(); 
				 $('#cevapbaslik5').remove();
				 index=1;
			  // tekli secim
		  }else if(str == "Yazi"){
			  $('#cevapbaslik5').remove(); 
			  $('#cevapbaslik6').remove(); 
			  $('#cevapdiv').prepend("<div id ='cevapyazi'><label for='name'>Cevap Başlığını Giriniz : </label><input name='cevapbaslik' id='cevapbaslik' style='color:black;'  type='text' ></div>");
			  $('#cevapyazi').append("<div id='kisitlama'>Kısıtlama : <select id='kisitlamalar' onchange='kisitlama()'><option value='SeçimYAp'>Lütfen Bir Seçim Yapınız</option><option value='Yazı'>Yazı</option><option value='Sayı'>Sayı</option></select></div>");
			  index=1;
			  // Yazi
		  }
	 }
 
 function kisitlama(){
	 var str ="";
	  var value =  $('#kisitlamalar option:selected').each(function(){
		  str += $( this ).text();  
	  });
	  soruTipiValue = str;
	if(str=="Yazı"){
		$('#lbl1').remove();
		$('#kisitlama').append("<label id='lbl2'><input name='cevapbaslik' id='cevapbaslik1' style='color:black;'  type='text'>(Kaç karakter sınırı olacağını giriniz.)</label>");
	}
	if(str=="Sayı"){
		$('#lbl2').remove();
		$('#kisitlama').append("<label id='lbl1'><input name='cevapbaslik' id='cevapbaslik2' style='color:black;'  type='text'>(Alabileceği değer aralığını arada virgül kullanarak giriniz)</label>");
	}
}
</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	Anket Bilgileri
	<div id="anketbilgileri">
	Anket bilgileri burada listelencek. Açılır kapanır pencere halinde<br>
	</div>
	<div id="sorular">
	Sorular burada listelencek . Açılır kapanır pencere halinde<br>
	</div>
	<form name="soruEkle" action="SoruEkle.jsp"  method="POST" >
		<input type ="hidden" name="anketid" value=<%String.valueOf(anketid);%>>
		<div id="sorudiv">
			<div class="pure-control-group">
				<label for='name'> Soru :</label>
				<input name='soruyazisi' id="soruyazisi" type='text' style="color:black;" >
			</div>
	  		<div class='pure-control-group'>
	  			<label for='tip'> Soru Tipi :</label>
	  			<select id="sorutipi" onchange="soruTipiSecildiginde()">
	  			<option value='SeçimYAp'>Lütfen Bir Seçim Yapınız</option>
	  				<%
	  				Connection connection = (Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1/AnketSitesi","root","tellioglu");
	  				Statement statement = connection.createStatement();
	  				String sql = "Select * from SoruTipleri";
	  				ResultSet resultSet = statement.executeQuery(sql);
	  				while(resultSet.next()){
	  					out.print("<option value = '"+resultSet.getInt(1)+"' >"+resultSet.getString(2)+"</option>");
	  				}
	  				connection.close();
	  				%>
	  			</select>
	  		</div>
			<div id="cevapdiv">
				<div id="cevapbaslik">
				</div>
			</div>
		</div>
		<button name="buttonyenicevap" type="button" id="yenicevap" onclick="yeniCevapEkle()"> Yeni Cevap</button>
		<button name="soruyukaydet" type="submit" id="soruyukaydet" onclick=""></button>
	</form>
</body>
</html>