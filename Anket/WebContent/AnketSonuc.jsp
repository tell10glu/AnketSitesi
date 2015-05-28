<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="yapiPackage.Connections"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="yapiPackage.Soru"%>
<%@page import="yapiPackage.Anket"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	// Kullanici giris yapmis mi ? 
	// Anket ID doğru mu ? (veritabaninda da var mi diye bak)
	// Anket Aktif mi ? Aktif değil ise sahibi mi ? sahibi değilse başka sayfaya yönelt.
	// Anket Herkese Açık mı veya Davet Listesinde Kullanici Adi var mi ? (Anket Sahibi mi ?)
	// Anket süresi devam ediyor ise anketi , etmiyor ise raporları göster .
		
	if(session.getAttribute("userid")==null){
		response.sendRedirect("KullaniciGiris.jsp");
		return;
	}
	int userID = (Integer)session.getAttribute("userid");
	int anketid = -1;
	String anketidStr = request.getParameter("anketid");
	if(anketidStr==null){
		response.sendRedirect("AnaSayfa.jsp");
		return;
	}
	try{
		anketid = Integer.parseInt(anketidStr);
	}catch(Exception ex){
		ex.printStackTrace();
		response.sendRedirect("AnaSayfa.jsp");
		return;
	}	
	Anket anket = Anket.anketiGetir(anketid);
	if(anket==null){
		response.sendRedirect("AnaSayfa.jsp");
		return;
	}
	if(userID!=anket.getKullaniciId()){
		if(!anket.halkAcikDurumunuGetir()){
			if(!anket.kullaniciAnketeDavetlimi((String)session.getAttribute("useremail"), anket.getId())){
				response.sendRedirect("AnaSayfa.jsp");
				return;
			}
		}
		if(!anket.aktiflikDurumunuGetir()){
			response.sendRedirect("AnaSayfa.jsp");
			return;
		}
		if (!Anket.kullaniciAnketiCozmusmu(userID, anket.getId())){
			response.sendRedirect("Anket.jsp?anketid="+anketid);
			return;
		}
	}
	if(anket.engelDurumuGetir()){
		out.print("Bu anket admin tarafından engellenmiştir...");
		return;
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="Site.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/jquery-latest.js">   </script>
<script language="javascript" type="text/javascript" src="chartscripts/jquery.min.js"></script>
<script language="javascript" type="text/javascript" src="chartscripts/jquery.jqplot.min.js"></script>
<script language="javascript" type="text/javascript" src="chartscripts/jqplot.pieRenderer.min.js"></script>
<script type="text/javascript" src="chartscripts/jqplot.dateAxisRenderer.min.js"></script>
<script type="text/javascript" src="chartscripts/jqplot.canvasTextRenderer.min.js"></script>
<script type="text/javascript" src="chartscripts/jqplot.canvasAxisTickRenderer.min.js"></script>
<script type="text/javascript" src="chartscripts/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript" src="chartscripts/jqplot.barRenderer.min.js"></script>
<script src="chartscripts/jqplot.donutRenderer.min.js"></script>
<script type="text/javascript" src="chartscripts/jqplot.donutRenderer.min.js"></script>
<link rel="stylesheet" type="text/css" href="chartscripts/jquery.jqplot.css" />
        <script>
        $(document).ready(function() {
        	$("#sorubutton").click(function(){
        		$("#soruid").val($("#sorum").val());
        		veriCek();
        	});
        	veriCek();
        
        	
        });
        function veriCek(){
        	var anketid = $("#anketid").val();
        	var sorudata = $("#soruid").val();
        	if(sorudata>0){
        		$.get("chartServlets?anketid="+anketid+"&soruid="+sorudata+"", function(data, textStatus) {
            		//soruların hepsi geldi
            	    // cevap metni ,sayısı
            	    var chartArray = [];
            		var donenEleman = data.split(";;");// burada soruların hepsi ,, şekillerle ayrılmış
            		for(var i=0;i<donenEleman.length-1;i++){
            	   		var sonData = donenEleman[i].split(",,");// burada soruid,metin,sayi var
            			chartArray.push([sonData[0],sonData[1]*10]);
            	   	}
            		//piechart
            		jQuery.jqplot ('chart1', [chartArray], 
    					    { 
    					      seriesDefaults: {
    					        renderer: jQuery.jqplot.PieRenderer, 
    					        rendererOptions: {
    					          showDataLabels: true
    					        }
    					      }, 
    					      legend: { show:true, location: 'e' }
    					    }
    					  );
            		//plot 
            		 
            		jQuery.jqplot ('chart2', [chartArray], 
            			    {
            			      seriesDefaults: {
            			        renderer: jQuery.jqplot.PieRenderer, 
            			        rendererOptions: {
            			          // Turn off filling of slices.
            			          fill: false,
            			          showDataLabels: true, 
            			          // Add a margin to seperate the slices.
            			          sliceMargin: 4, 
            			          // stroke the slices with a little thicker line.
            			          lineWidth: 5
            			        }
            			      }, 
            			      legend: { show:true, location: 'e' }
            			    }
            			  );
            		$.jqplot('chart3', [chartArray], {
        			    seriesDefaults: {
        			      // make this a donut chart.
        			      renderer:$.jqplot.DonutRenderer,
        			      rendererOptions:{
        			        // Donut's can be cut into slices like pies.
        			        sliceMargin: 3,
        			        // Pies and donuts can start at any arbitrary angle.
        			        startAngle: -90,
        			        showDataLabels: true,
        			        // By default, data labels show the percentage of the donut/pie.
        			        // You can show the data 'value' or data 'label' instead.
        			        dataLabels: 'value'
        			      }
        			    }
        			  });
            		 $.jqplot('chart4', [chartArray], {
            			    series:[{renderer:$.jqplot.BarRenderer}, {xaxis:'x2axis', yaxis:'y2axis'}],
            			    axesDefaults: {
            			        tickRenderer: $.jqplot.CanvasAxisTickRenderer ,
            			        tickOptions: {
            			          angle: 30
            			        }
            			    },
            			    axes: {
            			      xaxis: {
            			        renderer: $.jqplot.CategoryAxisRenderer
            			      },
            			      x2axis: {
            			        renderer: $.jqplot.CategoryAxisRenderer
            			      },
            			      yaxis: {
            			        autoscale:true
            			      },
            			      y2axis: {
            			        autoscale:true
            			      }
            			    }
            			  });
            	});
        	}
        }
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<form onsubmit="return validPost()" method="GET" action="chartServlets">
	<input type="hidden" name="anketid" id="anketid" value='<%out.print(anketid);%>'>
	<input type="hidden" name="soruid" id="soruid" value=<%out.print("-1");%>>
	</form>
	<select id="sorum" name="sorum" onchange="soruTipiSecildiginde()">
	  			<option value='SecimYap'>Lütfen Bir Seçim Yapınız</option>
	  				<%
	  				ArrayList<Soru> listSorular = Soru.anketSoruListesi(anketid);
	  				for(int i=0;i<listSorular.size();i++){
	  					out.print("<option value = '"+listSorular.get(i).getId()+"' >"+listSorular.get(i).getSoruYazisi()+"</option>");
	  				}
	  				%>
	  			</select>
	  			<button type="button" id="sorubutton">Sorunun Grafiklerini Göster </button>
	<div id="chart1" style="height:400px;"></div>
	<div id="chart2" style="height:400px;"></div>
	<div id="chart3" style="height:400px;"></div>
	<div id="chart4" style="height:400px;">
	
	</div>
	
</body>
</html>