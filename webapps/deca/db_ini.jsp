<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
	String ip = "140.120.49.205";
	String user = "team2";
	String pwd = "NCHUTeam2!";
	String db = "team2";
	String driver = "com.mysql.jdbc.Driver";
	Connection con = null;
	try{
		String url = "jdbc:mysql://" + ip + "/" + db + "?useUnicode=true&characterEncoding=utf-8";
		Class.forName(driver).newInstance();
		con = DriverManager.getConnection(url,user,pwd);
	}catch(Exception ex){
		out.println(ex);
	}
%>
