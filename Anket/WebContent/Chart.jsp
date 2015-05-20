<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="yapiPackage.ChartOlustur" %>
<%@ page import="yapiPackage.Soru" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
//burada cevap başlıkları olabilir
int soruid=25;
String soru=Soru.getSoruAdi(soruid);
List<String> cevapList = ChartOlustur.cevaplariAl(soruid);
List<String> sayiList = ChartOlustur.charthesapla(soruid);
 %>

 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
	var sorum="<%=soru%>";
    var carlar=[<% for (int i = 0; i < cevapList.size(); i++) { %>"<%= cevapList.get(i) %>"<%= i + 1 < cevapList.size() ? ",":"" %><% } %>];
    var numbers=[<% for (int i = 0; i < sayiList.size(); i++) { %>"<%= sayiList.get(i) %>"<%= i + 1 < sayiList.size() ? ",":"" %><% } %>];

      // Load the Visualization API and the piechart package.
      google.load('visualization', '1.0', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.setOnLoadCallback(drawChart);
	
      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        for (i = 0; i < carlar.length; i++) { 
        	var x=carlar[i];
        	var y=parseInt(numbers[i]);
           data.addRow([x,y]);
        };
        // Set chart options
        var options = {'title':sorum,
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <div id="chart_div"></div>
</body>
</html>