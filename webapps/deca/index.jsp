<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>建立帳號</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>
		$(function(){
      $("#includedContent").load("top.jsp");
    });
	</script>
<style>
top.jsp{z-index:2;}
body{font-family:微軟正黑體;list-style-type:none;}
.dropbtn {
    color: black;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
		margin-left:0px;
	  font-weight: bold;
		padding: 15px 20px 15px 20px  ;
  background-color: #ededed;
}
.dropdown {
    position: relative;
    display: inline-block;

}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: #0082c3;
	color: white;
	font-weight: bold;
}
.mycontent-left {
  border-right: 1px dashed #333;
}
li > a{
	color: white;
}
</style>
<script type="text/javascript">
function bann(){
	var abcde = 5;
	var how = 4;
	var a = new Date();
	var b = a.getSeconds();
	var ad = b%how;
	ad+=1;
	if(ad==1){
		banner="banner_1.jpg";
		width="468";
		height="300";
	}
	if(ad==2){
		banner="banner_2.jpg";
		width="468";
		height="300";
	}
	if(ad==3){
		banner="banner_3.jpg";
		width="468";
		height="300";
	}
		$("#ban").attr("src",banner);
		var t = setTimeout(bann, 3000);

}
</script>


</head>
<body onload="bann()">
<div id="includedContent"></div>
<center>
	<img id="ban" src="" width="87%" height="530px" style="">
		<div id="txt"></div>
</center>
<br><br>
</body>
</html>
