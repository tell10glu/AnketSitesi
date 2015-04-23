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
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script>
index = 0;
function yeniCevapEkle(){
	$('#cevapbaslik').append("<input name='cevap' id='cevap' style='color:black;' type='text'><br>");
	
}
 function soruTipiSecildiginde(){
		  var str ="";
		  var value =  $('#sorutipi option:selected').each(function(){
			  str += $( this ).text();  
		  });
		  soruTipiValue = str;
		  if(str=="Coklu Secim"){
			  $('#cevapdiv').prepend("<div id='cevapbaslik' ></div>");
			 $('#cevapyazi').remove(); 
			  // coklu secim
		  }else if(str == "Tekli Secim"){
			  $('#cevapdiv').prepend("<div id='cevapbaslik'></div>");
			  $('#cevapyazi').remove(); 
			  // tekli secim
		  }else if(str == "Yazi"){
			  $('#cevapbaslik').remove();
			  $('#cevapdiv').prepend("<div id ='cevapyazi'><label for='name'>Cevap Başlığını Giriniz : </label><input name='cevapbaslik' id='cevapbaslik' style='color:black;'  type='text' ></div>");
			  // Yazi
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
	<form name="soruEkle" action="SoruEkle.jsp"  method="GET" >
		<input type ="hidden" name="anketid" value=<%String.valueOf(anketid);%>>
		<div id="sorudiv">
			<div class="pure-control-group">
				<label for='name'> Soru :</label>
				<input name='soruyazisi' id="soruyazisi" type='text' style="color:black;" >
			</div>
	  		<div class='pure-control-group'>
	  			<label for='tip'> Soru Tipi :</label>
	  			<select id="sorutipi" onchange="soruTipiSecildiginde()">
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
	  		Cevaplar
			<div id="cevapdiv">
				<div id="cevapbaslik">
					
				</div>
				<div id ="kisitlamalar" >
					Burada yazi ise kisitlamalar olcak
				</div>
				<button name="buttonyenicevap" type="button" id="yenicevap" onclick="yeniCevapEkle()"> Yeni Cevap</button>
			</div>
		</div>
		<button name="soruyukaydet" type="submit" id="soruyukaydet" onclick=""></button>
	</form>
</body>
</html>