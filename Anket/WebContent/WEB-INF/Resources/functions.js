$(document).ready(function(){
$("#container_MultipleSeriesPie").data("function",MultipleSeriesPie);
	$("#container_MultipleSeriesPie").data("title","Multiple Series Pie");
	if ($("#container_MultipleSeriesPie").parent().attr("thumb_type") != "none") {	
		var chart_MultipleSeriesPie = new cfx.Chart();
		MultipleSeriesPie(chart_MultipleSeriesPie);		
		chart_MultipleSeriesPie.create(document.getElementById("container_MultipleSeriesPie"));
		if ($("#container_MultipleSeriesPie").parent().attr("thumb_type") == "crop") {
			Positioning(chart_MultipleSeriesPie,"","",$("#container_MultipleSeriesPie"),"chart_container");
		}
		else {
			fix_thumb(chart_MultipleSeriesPie, "chart");	
		}	
	}
	
	$("#container_DoughnutCharts2D").data("function",DoughnutCharts2D);
	$("#container_DoughnutCharts2D").data("title","Doughnut Charts 2D");
	if ($("#container_DoughnutCharts2D").parent().attr("thumb_type") != "none") {	
		var chart_DoughnutCharts2D = new cfx.Chart();
		DoughnutCharts2D(chart_DoughnutCharts2D);		
		chart_DoughnutCharts2D.create(document.getElementById("container_DoughnutCharts2D"));
		if ($("#container_DoughnutCharts2D").parent().attr("thumb_type") == "crop") {
			Positioning(chart_DoughnutCharts2D,"","",$("#container_DoughnutCharts2D"),"chart_container");
		}
		else {
			fix_thumb(chart_DoughnutCharts2D, "chart");	
		}	
	}
	
	$("#container_DoughnutCharts3D").data("function",DoughnutCharts3D);
	$("#container_DoughnutCharts3D").data("title","Doughnut Charts 3D");
	if ($("#container_DoughnutCharts3D").parent().attr("thumb_type") != "none") {	
		var chart_DoughnutCharts3D = new cfx.Chart();
		DoughnutCharts3D(chart_DoughnutCharts3D);		
		chart_DoughnutCharts3D.create(document.getElementById("container_DoughnutCharts3D"));
		if ($("#container_DoughnutCharts3D").parent().attr("thumb_type") == "crop") {
			Positioning(chart_DoughnutCharts3D,"","",$("#container_DoughnutCharts3D"),"chart_container");
		}
		else {
			fix_thumb(chart_DoughnutCharts3D, "chart");	
		}	
	}
	
	$("#container_ExplodedPie").data("function",ExplodedPie);
	$("#container_ExplodedPie").data("title","Exploded Pie");
	if ($("#container_ExplodedPie").parent().attr("thumb_type") != "none") {	
		var chart_ExplodedPie = new cfx.Chart();
		ExplodedPie(chart_ExplodedPie);		
		chart_ExplodedPie.create(document.getElementById("container_ExplodedPie"));
		if ($("#container_ExplodedPie").parent().attr("thumb_type") == "crop") {
			Positioning(chart_ExplodedPie,"","",$("#container_ExplodedPie"),"chart_container");
		}
		else {
			fix_thumb(chart_ExplodedPie, "chart");	
		}	
	}
	
	$("#container_Doughnut3DWithSeparateSlice").data("function",Doughnut3DWithSeparateSlice);
	$("#container_Doughnut3DWithSeparateSlice").data("title","Doughnut 3D with Separate Slice");
	if ($("#container_Doughnut3DWithSeparateSlice").parent().attr("thumb_type") != "none") {	
		var chart_Doughnut3DWithSeparateSlice = new cfx.Chart();
		Doughnut3DWithSeparateSlice(chart_Doughnut3DWithSeparateSlice);		
		chart_Doughnut3DWithSeparateSlice.create(document.getElementById("container_Doughnut3DWithSeparateSlice"));
		if ($("#container_Doughnut3DWithSeparateSlice").parent().attr("thumb_type") == "crop") {
			Positioning(chart_Doughnut3DWithSeparateSlice,"","",$("#container_Doughnut3DWithSeparateSlice"),"chart_container");
		}
		else {
			fix_thumb(chart_Doughnut3DWithSeparateSlice, "chart");	
		}	
	}
	
	$("#container_ConcentricPieCharts").data("function",ConcentricPieCharts);
	$("#container_ConcentricPieCharts").data("title","Concentric Pie Charts");
	if ($("#container_ConcentricPieCharts").parent().attr("thumb_type") != "none") {	
		var chart_ConcentricPieCharts = new cfx.Chart();
		ConcentricPieCharts(chart_ConcentricPieCharts);		
		chart_ConcentricPieCharts.create(document.getElementById("container_ConcentricPieCharts"));
		if ($("#container_ConcentricPieCharts").parent().attr("thumb_type") == "crop") {
			Positioning(chart_ConcentricPieCharts,"","",$("#container_ConcentricPieCharts"),"chart_container");
		}
		else {
			fix_thumb(chart_ConcentricPieCharts, "chart");	
		}	
	}	
});

function MultipleSeriesPie(chart1)
{
	PopulateCarProduction(chart1);
// RELEVANT CODE
chart1.setGallery(cfx.Gallery.Pie);
// END RELEVANT CODE
var data = chart1.getData();
data.setPoints(6);
data.setSeries(2);
var titles = chart1.getTitles();
var title = new cfx.TitleDockable();
title.setText("Vehicles Production First Semester 2012");
titles.add(title);
chart1.getAllSeries().getPointLabels().setVisible(true);
}
function DoughnutCharts2D(chart1)
{
	PopulateProductSales_Red(chart1);
var titles = chart1.getTitles();
var title = new cfx.TitleDockable();
title.setText("Red Wine Sales 2013");
titles.add(title);
// RELEVANT CODE
chart1.setGallery(cfx.Gallery.Doughnut);
// END RELEVANT CODE
chart1.getAllSeries().getPointLabels().setVisible(true);
chart1.getLegendBox().setVisible(false);
}
function DoughnutCharts3D(chart1)
{
	PopulateCarProduction_SUV(chart1);
// RELEVANT CODE
chart1.setGallery(cfx.Gallery.Doughnut);
chart1.getView3D().setEnabled(true);
// END RELEVANT CODE
chart1.getAllSeries().getPointLabels().setVisible(true);
chart1.getLegendBox().setVisible(false);
var titles = chart1.getTitles();
var title = new cfx.TitleDockable();
title.setText("SUV Production 2012");
titles.add(title);
}
function ExplodedPie(chart1)
{
	chart1.setGallery(cfx.Gallery.Pie);
chart1.getAllSeries().getPointLabels().setVisible(true);
var pie = chart1.getGalleryAttributes();
pie.setExplodingMode(cfx.ExplodingMode.All);

PopulateBrowserUsage(chart1);
var fields = chart1.getDataSourceSettings().getFields();

var field1 = new cfx.FieldMap();
field1.setName("Browser");
field1.setUsage(cfx.FieldUsage.RowHeading);
fields.add(field1);

var field2 = new cfx.FieldMap();
field2.setName("Region");
field2.setUsage(cfx.FieldUsage.ColumnHeading);
fields.add(field2);

var fieldVal = new cfx.FieldMap();
fieldVal.setName("Usage");
fieldVal.setUsage(cfx.FieldUsage.Value);
fields.add(fieldVal);

var crosstab = new cfx.data.CrosstabDataProvider();

crosstab.setDataSource(chart1.getDataSource());
chart1.setDataSource(crosstab);
var data = chart1.getData();
data.setSeries(1);

chart1.getAllSeries().getPointLabels().setVisible(true);
var titles = chart1.getTitles();
var title = new cfx.TitleDockable();
title.setText("Browser Usage in Africa on August 2013");
titles.add(title);
}
function Doughnut3DWithSeparateSlice(chart1)
{
	PopulateCarProduction_Sedan(chart1);
// RELEVANT CODE
chart1.setGallery(cfx.Gallery.Doughnut);
chart1.getView3D().setEnabled(true);
var pie = chart1.getGalleryAttributes();
pie.setExplodingMode(cfx.ExplodingMode.First);
pie.setSliceSeparation(20);
chart1.getPoints().getItem(2).setSeparateSlice(40);
// END RELEVANT CODE
chart1.getAllSeries().getPointLabels().setVisible(true);
var titles = chart1.getTitles();
var title = new cfx.TitleDockable();
title.setText("Sedan Production in 2012");
titles.add(title);
}
function ConcentricPieCharts(chart1)
{
	PopulateCarProduction(chart1);

var data = chart1.getData();
data.setSeries(3);
data.setPoints(6);
var j = chart1.getData().getSeries();
for(var i = 0;i < j;i++)
{
    chart1.getSeries().getItem(i).setText("");
}
chart1.setGallery(cfx.Gallery.Doughnut);

var doughnut = chart1.getGalleryAttributes();
doughnut.setStacked(true);
doughnut.setDoughnutThickness(20);

var series;
series = chart1.getSeries().getItem(0);
series.setVolume(100);
series = chart1.getSeries().getItem(1);
series.setVolume(75);
series = chart1.getSeries().getItem(2);
series.setGallery(cfx.Gallery.Pie);
series.setVolume(54);

var titles = chart1.getTitles();
var title = new cfx.TitleDockable();
title.setText("Vehicles Production First Semester 2012");
titles.add(title);

title = new cfx.TitleDockable();
title.setText("Rings Legend: Outer: Sedan - Center: Coupe - Inner: SUV");
title.setDock(cfx.DockArea.Bottom);
titles.add(title);
}

function PopulateCarProduction(chart1) {
        var items = [{
            "Sedan": 1760,
            "Coupe": 535,
            "SUV": 695,
            "Month": "Jan"
        }, {
            "Sedan": 1849,
            "Coupe": 395,
            "SUV": 688,
            "Month": "Feb"
        }, {
            "Sedan": 2831,
            "Coupe": 685,
            "SUV": 1047,
            "Month": "Mar"
        }, {
            "Sedan": 2851,
            "Coupe": 984,
            "SUV": 1652,
            "Month": "Apr"
        }, {
            "Sedan": 2961,
            "Coupe": 1579,
            "SUV": 1889,
            "Month": "May"
        }, {
            "Sedan": 1519,
            "Coupe": 1539,
            "SUV": 1766,
            "Month": "Jun"
        }, {
            "Sedan": 2633,
            "Coupe": 1489,
            "SUV": 1361,
            "Month": "Jul"
        }, {
            "Sedan": 1140,
            "Coupe": 650,
            "SUV": 874,
            "Month": "Aug"
        }, {
            "Sedan": 1626,
            "Coupe": 653,
            "SUV": 693,
            "Month": "Sep"
        }, {
            "Sedan": 1478,
            "Coupe": 2236,
            "SUV": 786,
            "Month": "Oct"
        }, {
            "Sedan": 1306,
            "Coupe": 1937,
            "SUV": 599,
            "Month": "Nov"
        }, {
            "Sedan": 1607,
            "Coupe": 2138,
            "SUV": 678,
            "Month": "Dec"
        }];
    
    
        chart1.setDataSource(items);
    }
    function PopulateProductSales_Red(chart1) {
        var items = [{
            "Month": "Jan",
            "White": 12560,
            "Red": 23400,
            "Sparkling": 34500
        }, {
            "Month": "Feb",
            "White": 13400,
            "Red": 21000,
            "Sparkling": 38900
        }, {
            "Month": "Mar",
            "White": 16700,
            "Red": 17000,
            "Sparkling": 42100
        }, {
            "Month": "Apr",
            "White": 12000,
            "Red": 19020,
            "Sparkling": 43800
        }, {
            "Month": "May",
            "White": 15800,
            "Red": 26500,
            "Sparkling": 37540
        }, {
            "Month": "Jun",
            "White": 9800,
            "Red": 27800,
            "Sparkling": 32580
        }, {
            "Month": "Jul",
            "White": 17800,
            "Red": 29820,
            "Sparkling": 34000
        }, {
            "Month": "Aug",
            "White": 19800,
            "Red": 17800,
            "Sparkling": 38000
        }, {
            "Month": "Sep",
            "White": 23200,
            "Red": 32000,
            "Sparkling": 41300
        }, {
            "Month": "Oct",
            "White": 16700,
            "Red": 26500,
            "Sparkling": 46590
        }, {
            "Month": "Nov",
            "White": 11800,
            "Red": 23000,
            "Sparkling": 48700
        }, {
            "Month": "Dec",
            "White": 13400,
            "Red": 15400,
            "Sparkling": 49100
        }];
        // Since not all the fields in the DataSource are required, we must perform the corresponding bindings
        var fields = chart1.getDataSourceSettings().getFields();
        var fieldRed = new cfx.FieldMap();
        fieldRed.setName("Red");
        fieldRed.setUsage(cfx.FieldUsage.Value);
        fields.add(fieldRed);
        var MonthField = new cfx.FieldMap();
        MonthField.setName("Month");
        MonthField.setUsage(cfx.FieldUsage.Label);
        fields.add(MonthField);
        chart1.setDataSource(items);
    }
    function PopulateCarProduction_SUV(chart1) {
        var items = [{
            "Sedan": 1760,
            "Coupe": 535,
            "SUV": 695,
            "Month": "Jan"
        }, {
            "Sedan": 1849,
            "Coupe": 395,
            "SUV": 688,
            "Month": "Feb"
        }, {
            "Sedan": 2831,
            "Coupe": 685,
            "SUV": 1047,
            "Month": "Mar"
        }, {
            "Sedan": 2851,
            "Coupe": 984,
            "SUV": 1652,
            "Month": "Apr"
        }, {
            "Sedan": 2961,
            "Coupe": 1579,
            "SUV": 1889,
            "Month": "May"
        }, {
            "Sedan": 1519,
            "Coupe": 1539,
            "SUV": 1766,
            "Month": "Jun"
        }, {
            "Sedan": 2633,
            "Coupe": 1489,
            "SUV": 1361,
            "Month": "Jul"
        }, {
            "Sedan": 1140,
            "Coupe": 650,
            "SUV": 874,
            "Month": "Aug"
        }, {
            "Sedan": 1626,
            "Coupe": 653,
            "SUV": 693,
            "Month": "Sep"
        }, {
            "Sedan": 1478,
            "Coupe": 2236,
            "SUV": 786,
            "Month": "Oct"
        }, {
            "Sedan": 1306,
            "Coupe": 1937,
            "SUV": 599,
            "Month": "Nov"
        }, {
            "Sedan": 1607,
            "Coupe": 2138,
            "SUV": 678,
            "Month": "Dec"
        }];
        // Since not all the fields in the DataSource are required, we must perform the corresponding bindings
        var fields = chart1.getDataSourceSettings().getFields();
        var fieldSUV = new cfx.FieldMap();
        fieldSUV.setName("SUV");
        fieldSUV.setUsage(cfx.FieldUsage.Value);
        fields.add(fieldSUV);
        var MonthField = new cfx.FieldMap();
        MonthField.setName("Month");
        MonthField.setUsage(cfx.FieldUsage.Label);
        fields.add(MonthField);
    
        chart1.setDataSource(items);
    }
    function PopulateBrowserUsage(chart1) {
        var items = [{
            "Browser": "Chrome",
            "Region": "Africa",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 41.07
        }, {
            "Browser": "Firefox",
            "Region": "Africa",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 30.75
        }, {
            "Browser": "IE",
            "Region": "Africa",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 21.42
        }, {
            "Browser": "Safari",
            "Region": "Africa",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 3.47
        }, {
            "Browser": "Opera",
            "Region": "Africa",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 1.52
        }, {
            "Browser": "Other",
            "Region": "Africa",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 1.77
        }, {
            "Browser": "Chrome",
            "Region": "Asia",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 48.78
        }, {
            "Browser": "Firefox",
            "Region": "Asia",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 16.88
        }, {
            "Browser": "IE",
            "Region": "Asia",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 25.49
        }, {
            "Browser": "Safari",
            "Region": "Asia",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 4
        }, {
            "Browser": "Opera",
            "Region": "Asia",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 1.02
        }, {
            "Browser": "Other",
            "Region": "Asia",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 3.83
        }, {
            "Browser": "Chrome",
            "Region": "Europe",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 38.52
        }, {
            "Browser": "Firefox",
            "Region": "Europe",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 26.25
        }, {
            "Browser": "IE",
            "Region": "Europe",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 21.37
        }, {
            "Browser": "Safari",
            "Region": "Europe",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 9.19
        }, {
            "Browser": "Opera",
            "Region": "Europe",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 2.31
        }, {
            "Browser": "Other",
            "Region": "Europe",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 2.36
        }, {
            "Browser": "Chrome",
            "Region": "North America",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 36.49
        }, {
            "Browser": "Firefox",
            "Region": "North America",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 16.24
        }, {
            "Browser": "IE",
            "Region": "North America",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 30.12
        }, {
            "Browser": "Safari",
            "Region": "North America",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 14.16
        }, {
            "Browser": "Opera",
            "Region": "North America",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 0.47
        }, {
            "Browser": "Other",
            "Region": "North America",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 2.52
        }, {
            "Browser": "Chrome",
            "Region": "Oceania",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 35.02
        }, {
            "Browser": "Firefox",
            "Region": "Oceania",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 18.9
        }, {
            "Browser": "IE",
            "Region": "Oceania",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 27.82
        }, {
            "Browser": "Safari",
            "Region": "Oceania",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 16.31
        }, {
            "Browser": "Opera",
            "Region": "Oceania",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 0.45
        }, {
            "Browser": "Other",
            "Region": "Oceania",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 1.5
        }, {
            "Browser": "Chrome",
            "Region": "South America",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 63.18
        }, {
            "Browser": "Firefox",
            "Region": "South America",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 15.26
        }, {
            "Browser": "IE",
            "Region": "South America",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 17.48
        }, {
            "Browser": "Safari",
            "Region": "South America",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 2.39
        }, {
            "Browser": "Opera",
            "Region": "South America",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 0.55
        }, {
            "Browser": "Other",
            "Region": "South America",
            "UsageDate": "2013-08-01T00:00:00.000Z",
            "Usage": 1.14
        }];
    
        chart1.setDataSource(items);
    }
    function PopulateCarProduction_Sedan(chart1) {
        var items = [{
            "Sedan": 1760,
            "Coupe": 535,
            "SUV": 695,
            "Month": "Jan"
        }, {
            "Sedan": 1849,
            "Coupe": 395,
            "SUV": 688,
            "Month": "Feb"
        }, {
            "Sedan": 2831,
            "Coupe": 685,
            "SUV": 1047,
            "Month": "Mar"
        }, {
            "Sedan": 2851,
            "Coupe": 984,
            "SUV": 1652,
            "Month": "Apr"
        }, {
            "Sedan": 2961,
            "Coupe": 1579,
            "SUV": 1889,
            "Month": "May"
        }, {
            "Sedan": 1519,
            "Coupe": 1539,
            "SUV": 1766,
            "Month": "Jun"
        }, {
            "Sedan": 2633,
            "Coupe": 1489,
            "SUV": 1361,
            "Month": "Jul"
        }, {
            "Sedan": 1140,
            "Coupe": 650,
            "SUV": 874,
            "Month": "Aug"
        }, {
            "Sedan": 1626,
            "Coupe": 653,
            "SUV": 693,
            "Month": "Sep"
        }, {
            "Sedan": 1478,
            "Coupe": 2236,
            "SUV": 786,
            "Month": "Oct"
        }, {
            "Sedan": 1306,
            "Coupe": 1937,
            "SUV": 599,
            "Month": "Nov"
        }, {
            "Sedan": 1607,
            "Coupe": 2138,
            "SUV": 678,
            "Month": "Dec"
        }];
        // Since not all the fields in the DataSource are required, we must perform the corresponding bindings
        var fields = chart1.getDataSourceSettings().getFields();
        var fieldSedan = new cfx.FieldMap();
        fieldSedan.setName("Sedan");
        fieldSedan.setUsage(cfx.FieldUsage.Value);
        fields.add(fieldSedan);
        var MonthField = new cfx.FieldMap();
        MonthField.setName("Month");
        MonthField.setUsage(cfx.FieldUsage.Label);
        fields.add(MonthField);
    
        chart1.setDataSource(items);
    }