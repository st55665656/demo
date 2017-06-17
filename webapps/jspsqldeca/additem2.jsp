<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ include file = "db-con.jsp"%>
<%
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	String result = null;

	String sport_cat = request.getParameter("sport_cat");
	String cat = request.getParameter("cat");
	String cust_cat = request.getParameter("cust_cat");
	String price = request.getParameter("price");
	String storage = request.getParameter("storage");
	String name = request.getParameter("name");
	String illustration = request.getParameter("illustration");
	String image = request.getParameter("image");


	stmt = conn.createStatement();

	String sql = "insert into item (sport_cat, cat, cust_cat, price, storage, name, illustration, image) values (?, ?, ?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, sport_cat);
	pstmt.setString(2, cat);
	pstmt.setString(3, cust_cat);
	pstmt.setString(4, price);
	pstmt.setString(5, storage);
	pstmt.setString(6, name);
	pstmt.setString(7, illustration);
	pstmt.setString(8, image);
	pstmt.executeUpdate();
	result = "upload successfully! <br />return home after 3 seconds! ";
  response.setHeader("Refresh" , "3;url=additem.jsp");

	pstmt.close();
  stmt.close();
  conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<div>
<h1><%=result%></h1>
</div>
</body>
</html>
