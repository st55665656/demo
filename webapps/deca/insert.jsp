<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "db_ini.jsp"%>
<%	
	request.setCharacterEncoding("UTF-8");
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	String result = null;

	String account = request.getParameter("account");
	String password = request.getParameter("password");
		
	stmt = con.createStatement();
	String test = "select * from user where account='"+account+"';";
	rs = stmt.executeQuery(test);
	
	if(rs.first()){
		result ="account already exsists! <br />return home after 3 seconds! ";
		response.setHeader("Refresh" , "3;url=index.jsp");
	}else{
		String sql = "insert into user (account, password) values (?, ?)";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, account);
		pstmt.setString(2, password);
		pstmt.executeUpdate();
		result = "register successfully! <br />return home after 3 seconds! ";
		response.setHeader("Refresh" , "3;url=index.jsp");
		
	}
	stmt.close();
	rs.close();
	pstmt.close();
	con.close();
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