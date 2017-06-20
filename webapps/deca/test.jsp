<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "db_ini.jsp"%>
<%
	String a = request.getParameter("a");
	String b = request.getParameter("b");
	String c = request.getParameter("c");
	String d = request.getParameter("d");
	Statement stmt = null;
	ResultSet rs = null;
	stmt = con.createStatement();
	String query ="";
	
	if(d.equals("1")){
	query = "SELECT * FROM item WHERE sport_cat='"+a+"';";
	}else if(d.equals("2")){
		query = "SELECT * FROM item WHERE cat='" + b + "' AND cust_cat='" + c + "';";
	}else{
		query = "SELECT * FROM item WHERE cat='"+b+"';";
	}
	
	stmt.executeQuery(query);
	rs = stmt.getResultSet();
	
%>
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
body{font-family:微軟正黑體;list-style-type:none;}
.dropbtn {
    color: black;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
	font-weight: bold;
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
    display: block;
		text-decoration: none;
}

.dropdown-content a:hover {background-color: #f1f1f1; text-decoration: none;}
h{text-decoration: none;}
p{text-decoration: none;}
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
	outline: 1px solid #ccc;
}
img {
    display: block;
    max-height: 100%;
    max-width: 100%;
}

</style>
</head>
<body>

<div id="includedContent"></div>
<h2 style="padding-left:100px;color:#666">☛商品列表☚</h2>
<div class="container" style="outline: 1px solid #0172b8; margin-top:20px">

	<div class="col-md-1">	
	</div>
	<div class="col-md-10">
		<div class="row">
			<%
				if (rs != null){
				  while(rs.next()){
					String Iid = rs.getString("Iid");
					String sport_cat = rs.getString("sport_cat");
					String cat = rs.getString("cat");
					String cust_cat = rs.getString("cust_cat");
					String price = rs.getString("price");
					String storage = rs.getString("storage");
					String name = rs.getString("name");
					String illustration = rs.getString("illustration");
					String image = rs.getString("image");
			%>
			<div class="col-md-4" style="margin-top:20px;margin-bottom:20px	">
				<a href="item.jsp?Iid=<%=Iid%>" style="text-decoration:none">
				<div class="card"  style="vertical-align:middle; text-align:center">
					<div class="card-image" style="padding:2vh;">
						<img src="<%=image%>" style="text-align:center;vertical-align:middle;">
					</div>
					<div class="card-stacked">
						<div class="card-content">
							<a href="item.jsp?Iid=<%=Iid%>" style=":hover {text-decoration: underline}"><p>NT$<%=price%></p></a>
							<h style="font-size:20px;line-height:30px;font-weight:bold;"><%=name%></h>
						</div>
					</div>
				</div></a>
			</div>
			<%
				}}
				stmt.close();
				rs.close();
				con.close();
			%>
		</div>
	</div>
	<div class="col-md-1">	
	</div>
</div>
<br><br>
</body>
</html>
