<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script type="text/javascript">
  $(function() {
    $( "#bitistarihi" ).datepicker();
     
  });
  $(document).ready(function(){
	  var date =new Date();
	 
	  var month = date.getMonth()+1;
	  var day = date.getDay();
	  var year = date.getFullYear();
	  $("#baslangictarih").val(month+"/"+day+"/"+year);
	  
  });
  </script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Yeni Anket Oluştur</title>
</head>
<body>
	<form name="anketolustur" action="Anasayfa.jsp" onSubmit="return validForm()" method="POST" class ="pure-form pure-form-aligned" >
		 <div class="pure-control-group">
            <label for="name">Anket Adi :</label>
            <input name="anketadi" id="anketadi" type="text" >
        </div>
        <div class="pure-control-group">
            <label for="name">Başlangıç Tarihi:</label>
            <input name="baslangictarih" id="baslangictarih" type="text" disabled>
        </div>
         <div class="pure-control-group">
            <label for="name">Bitiş Tarihi:</label>
            <input name="bitistarihi" id="bitistarihi" type="text" >
        </div>
	</form>
	
	
</body>
</html>