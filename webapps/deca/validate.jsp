<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "db_ini.jsp"%>
<%
	String account = request.getParameter("account");
	String result = null;
	Statement stmt = null;
	ResultSet rs = null;
	stmt = con.createStatement();
	
	String query = "SELECT * FROM user WHERE account='" + account + "'";
	rs=stmt.executeQuery(query);
	
	if (!rs.next()){
		out.print("OK");
	}
	if (rs.first()){
		out.print("NO");
	}
	stmt.close();
	rs.close();
	con.close();
%>