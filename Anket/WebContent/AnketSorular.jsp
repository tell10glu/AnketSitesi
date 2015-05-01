<%@page import="java.util.ArrayList"%>
<%@page import="yapiPackage.Soru"%>
<%@page import="yapiPackage.Anket"%>
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
<style type="text/css">
.gradientBoxesWithOuterShadows { 
height: auto;
width: %75; 
padding: 20px;
margin : auto;
background-color: white; 

/* outer shadows  (note the rgba is red, green, blue, alpha) */
-webkit-box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.4); 
-moz-box-shadow: 0px 1px 6px rgba(23, 69, 88, .5);

/* rounded corners */
-webkit-border-radius: 12px;
-moz-border-radius: 7px; 
border-radius: 7px;

/* gradients */
background: -webkit-gradient(linear, left top, left bottom, 
color-stop(0%, white), color-stop(15%, white), color-stop(100%, #D7E9F5)); 
background: -moz-linear-gradient(top, white 0%, white 55%, #D5E4F3 130%); 
}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
function soruSil(id){
	var element = document.getElementsByName("cevap"+id);
	$(element).remove();
	var elementbutton = document.getElementsByName("cevapsil"+id);
	$(elementbutton).remove();
	secim--;
}
index = 1;
secim=1;
function yeniCevapEkle(){
	var str ="";
	  var value =  $('#sorutipi option:selected').each(function(){
		  str += $( this ).text();  
	  });
	  if(str=="Coklu Secim")
		  {
	$('#cevapbaslik5').append("<div><label><input name='cevap"+index+"'  style='color:black;' type='text'></label><label><button name='cevapsil"+index+"' type='button' id='soruyukaydet' onclick='soruSil(this.value);' value='"+index+"'>Sil</button></label></div>");	
		  }
	  else{
	$('#cevapbaslik6').append("<div><label><input name='cevap"+index+"'  style='color:black;' type='text'></label><label><button name='cevapsil"+index+"' type='button' id='soruyukaydet' onclick='soruSil(this.value);' value='"+index+"'>Sil</button></label></div>");	
	  } 	
	index++;
	secim++;
	$('#cevapindex').val(index);
	
}
function soruTipiSecildiginde(){
	  var str ="";
	  var value =  $('#sorutipi option:selected').each(function(){
		  str += $( this ).text();  
	  });
	  soruTipiValue = str;
	  if(str=="Coklu Secim"){
		  $('#cevapdiv').prepend("<div id='cevapbaslik5'>Cevaplar</div>");
		  $('#cevapbaslik5').append("<div id='yenicevap'><button name='buttonyenicevap' type='button' id='buttonyenicevap' onclick='yeniCevapEkle();'>Yeni Cevap</button></div>");
		  $("#yenicevap").prepend("<div id='max'>Max SeÁilebilecek SeÁenek Say˝s˝ :<input name='maxseÁ' id='maxseÁ' style='color:black;'  type='text'></div>");
		 $('#cevapyazi').remove(); 
		 $('#cevapbaslik6').remove(); 
		 index = 1;
		 secim=1;
	  }else if(str == "Tekli Secim"){
		  $('#cevapdiv').prepend("<div id='cevapbaslik6'>Cevaplar</div>");
		  $('#cevapbaslik6').append("<div id='yenicevap'><button name='buttonyenicevap' type='button' id='buttonyenicevap' onclick='yeniCevapEkle();'>Yeni Cevap</button></div>");
		  $('#cevapyazi').remove(); 
		  $('#cevapbaslik5').remove();
		  index = 1;
		  secim=1;
	  }else if(str == "Yazi"){
		  $('#cevapbaslik5').remove(); 
		  $('#cevapbaslik6').remove(); 
		  $('#cevapdiv').prepend("<div id ='cevapyazi'><label for='name'>Cevap Ba˛l˝˝n˝ Giriniz : </label><input name='cevapbaslik' id='cevapbaslik' style='color:black;'  type='text' ></div>");
		  $('#cevapyazi').append("<div id='kisitlama'>K˝s˝tlama : <select id='kisitlamalar' onchange='kisitlama()'><option value='SecimYAp'>L¸tfen Bir SeÁim Yap˝n˝z</option><option value='Yaz˝'>Yaz˝</option><option value='Say˝'>Say˝</option></select></div>");
		  index = 1;
		  secim=1;
	  }
}
function kisitlama(){
	 var str ="";
	  var value =  $('#kisitlamalar option:selected').each(function(){
		  str += $( this ).text();  
	  });
	  soruTipiValue = str;
	if(str=="Yaz˝"){
		$('#lbl1').remove();
		$('#kisitlama').append("<label id='lbl2'><input name='cevapbaslik' id='cevapbaslik1' style='color:black;'  type='text'>(KaÁ karakter s˝n˝r˝ olaca˝n˝ giriniz.)</label>");
	}
	if(str=="Say˝"){
		$('#lbl2').remove();
		$('#kisitlama').append("<label id='lbl1'><input name='cevapbaslik' id='cevapbaslik2' style='color:black;'  type='text'>(Alabilecei deer aral˝˝n˝ arada virg¸l kullanarak giriniz)</label>");
	}
}
var SoruBilgileriAcikmi = false;
var AnketBilgileriAcikmi = false;
$(document).ready(function(){
	if(AnketBilgileriAcikmi==false){
		 $("#hideShowAnketBilgileri").click(function(){
		        $("#bilgiler").toggle();
		        $("#hideShowAnketBilgileri").attr("value","Anket Bilgilerini Gizle");
		        
		    });
		 AnketBilgileriAcikmi = true;
	}else{
		 $("#hideShowAnketBilgileri").click(function(){
		        $("#bilgiler").toggle();
		        $("#hideShowAnketBilgileri").attr("value","Anket Bilgilerini Göster");
		    });
		 AnketBilgileriAcikmi = false;
	}
   	if(SoruBilgileriAcikmi==false){
   	 $("#hideShowSoruBilgileri").click(function(){
	        $("#sorubilgileri").toggle();
	        $("#hideDivButton").attr("value","Soru Bilgilerini Gizle");
	        
	    });
   	}else{
   	 $("#hideShowSoruBilgileri").click(function(){
	        $("#sorubilgileri").toggle();
	        $("#hideDivButton").attr("value","Soru Bilgilerini Goster");
	        
	    });
   	}
   
});
</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="anketbilgileri" class="gradientBoxesWithOuterShadows">
	Anket Bilgileri
		<div id="bilgiler">
				<%
				Anket anket = Anket.anketiGetir(anketid); 
				out.println(anket.toString());
				
				
				%>
		</div>
	<input type="button" id="hideShowAnketBilgileri" value="Anket Bilgilerini Gizle">
	</div>
	<div id="sorular" class="gradientBoxesWithOuterShadows">
		<div id="sorubilgileri" >
			<%
				ArrayList<Soru> lstSoru = Soru.anketSoruListesi(anketid);
				if(lstSoru.size()==0){
					out.print("Eklenmiş Soru Bulunmamaktadır!");
				}else{
					for(int i=0;i<lstSoru.size();i++){
						Soru soru = lstSoru.get(i);
						out.print("<p>"+soru.getSoruYazisi());
						if(soru.getSoruTipi()==1){
							out.print("(Coklu Secim)</p>");
							for(int j=0;j<soru.getLstCevap().size();j++){
								out.print(soru.getLstCevap().get(j).getCevap());
								out.print("<br>");
							}
						}else if(soru.getSoruTipi()==2){
							out.print("(TekliSecim)</p>");
							for(int j=0;j<soru.getLstCevap().size();j++){
								out.print(soru.getLstCevap().get(j).getCevap());
								out.print("<br>");
							}
						}
						
					}
				}
				
			%>
		</div>
	<input type="button" id="hideShowSoruBilgileri" value="Soru Bilgilerini Gizle">
		
	</div>
	<div class="gradientBoxesWithOuterShadows"> 
	<form name="soruEkle" action="SoruEkle.jsp"  method="POST" >
		<input type ="hidden" id="cevapindex" name="cevapindex" >
		<input type ="hidden" name="anketid" value='<%out.print(anketid);%>'>
		<div id="sorudiv">
			<div class="pure-control-group">
				<label for='name'> Soru :</label>
				<input name='soruyazisi' id="soruyazisi" type='text' style="color:black;" >
			</div>
	  		<div class='pure-control-group'>
	  			<label for='tip'> Soru Tipi :</label>
	  			<select id="sorutipi" name="sorutipi" onchange="soruTipiSecildiginde()">
	  			<option value='SeÁimYap'>L¸tfen Bir SeÁim Yap˝n˝z</option>
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
				<div id ="kisitlamalar" >
				</div>
			</div>
		</div>
		<button name="soruyukaydet" type="submit" id="soruyukaydet" onclick=""></button>
	</form>
	</div>
</body>
</html>