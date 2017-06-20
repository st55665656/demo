<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.*"%>
<%@ include file = "db_ini.jsp"%>
<%@ page import="java.lang.Integer" %>
<%
	Statement stmt = null;
	ResultSet rs = null;
	stmt = con.createStatement();
	int i=0;
	int row_total =0;
	int total_price = 0;
	try{
	ArrayList<String> obj = (ArrayList<String>)session.getAttribute("list");
	ArrayList obj2 = new ArrayList();
	Set<String> unique = new HashSet<String>(obj);

	String[] y = unique.toArray(new String[0]);
	int occurrences = 0;
	for(i=0;i<y.length;i++){
		occurrences = Collections.frequency(obj, y[i]);
		obj2.add(occurrences);
	}
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="dist/sweetalert.min.js"></script>
	<link href="dist/sweetalert.css" rel="stylesheet" type="text/css" />
		<script>
		$(function(){
      $("#includedContent").load("top.jsp"); 
    });
	</script>
	<style>
	.dropbtn {
	    color: black;
	    padding: 16px;
	    font-size: 16px;
	    border: none;
	    cursor: pointer;
		font-weight: bold;
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
	.card:hover{
		border: #00aeef 1px solid;
	}
	img {
	    display: block;
	    max-height: 100%;
	    max-width: 100%;
	}
	.button2 {
	-moz-box-shadow:inset 0px 0px 0px 0px #bee2f9;
	-webkit-box-shadow:inset 0px 0px 0px 0px #bee2f9;
	box-shadow:inset 0px 0px 0px 0px #bee2f9;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #94c3e0), color-stop(1, #468ccf));
	background:-moz-linear-gradient(top, #94c3e0 5%, #468ccf 100%);
	background:-webkit-linear-gradient(top, #94c3e0 5%, #468ccf 100%);
	background:-o-linear-gradient(top, #94c3e0 5%, #468ccf 100%);
	background:-ms-linear-gradient(top, #94c3e0 5%, #468ccf 100%);
	background:linear-gradient(to bottom, #94c3e0 5%, #468ccf 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#94c3e0', endColorstr='#468ccf',GradientType=0);
	background-color:#94c3e0;
	-moz-border-radius:20px;
	-webkit-border-radius:20px;
	border-radius:20px;
	border:1px solid #3866a3;
	display:inline-block;
	cursor:pointer;
	color:#14396a;
	font-family:'malgun gothic', simhei;
	font-size:27px;
	font-weight:bold;
	padding:21px 76px;
	text-decoration:none;
	text-shadow:0px 1px 0px #7cacde;
	width: 100%;
}
.button2:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #468ccf), color-stop(1, #94c3e0));
	background:-moz-linear-gradient(top, #468ccf 5%, #94c3e0 100%);
	background:-webkit-linear-gradient(top, #468ccf 5%, #94c3e0 100%);
	background:-o-linear-gradient(top, #468ccf 5%, #94c3e0 100%);
	background:-ms-linear-gradient(top, #468ccf 5%, #94c3e0 100%);
	background:linear-gradient(to bottom, #468ccf 5%, #94c3e0 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#468ccf', endColorstr='#94c3e0',GradientType=0);
	background-color:#468ccf;
}
.button2:active {
	position:relative;
	top:1px;
}
	li > a{
		color: white;
	}
	td {
		font-family: 'malgun gothic', simhei;
	}
	</style>
</head>
<body>
<div id="includedContent"></div>
<div class="container">
	<table class="table">
	<tr><th>ID</th><th>名稱</th><th>數量</th><th>價錢</th></tr>
<%
	for(i=0;i<obj2.size();i++){
		String query = "SELECT * FROM item where Iid = "+y[i];
		stmt.executeQuery(query);
		rs = stmt.getResultSet();
		if (rs != null){
			while(rs.next()){
				String sport_cat = rs.getString("sport_cat");
				String cat = rs.getString("cat");
				String cust_cat = rs.getString("cust_cat");
				String price = rs.getString("price");
				int ppp = Integer.parseInt(price);
				int ooo = (Integer)obj2.get(i);
				String storage = rs.getString("storage");
				String name = rs.getString("name");
				String illustration = rs.getString("illustration");
				String image = rs.getString("image");
				row_total = ooo*ppp;
				out.print("<tr class='info'><td>"+y[i]+ "</td>");
				out.print("<td>"+name+ "</td>");
				out.print("<td>"+obj2.get(i)+ "</td>");
				out.print("<td>"+row_total+ "</td>");
				total_price += row_total;
%>

<td><button class="btn btn-primary" id="<%=y[i]%>">刪除</button></td></tr>
<%
			}
		}
	}
	stmt.close();
	rs.close();
	con.close();
	}
	catch(Exception ex) {
		response.sendRedirect("index.jsp");
	}
%>
<script>
$(document).ready(function() {
	$('.btn').click(function(){
		var del_id = this.id;
		$.post("msession.jsp",
		{ del_id: del_id },
		function(response){
			var x = parseInt(response.trim(), 10);
		});
		location.reload();
	});
	$('#od').click(function(){
		var acc = "<%=session.getAttribute("acc")%>" ; 
		if (acc!=null && acc!= "null"){
			location.href='insertsession.jsp';
		}else{
			swal("請登入");
		}
		
	});
})
</script>
<tr><td><h3 style="font-family: 'malgun gothic', simhei;">總價格:</h3></td>
<td></td>
<td></td>
<td>
<h3 style="font-family: 'malgun gothic', simhei;"><%=total_price%></h3>
</td>
</table>
<input type="button" class="button button2" value="訂貨" id="od"/>
</body>
</html>
