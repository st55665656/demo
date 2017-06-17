<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%
    String ip ="140.120.49.205";
    String user = "team2";
    String pass = "NCHUTeam2!";
    String database = "team2";
    String driver ="com.mysql.jdbc.Driver";
    Connection conn = null;
    request.setCharacterEncoding("utf-8");
    try{
        String url = "jdbc:mysql://" + ip + "/" + database + "?useUnicode=true&characterEncoding=utf-8";
        Class.forName(driver).newInstance();
        conn = DriverManager.getConnection(url,user,pass);
    }catch(Exception ex){
        out.println(ex);
    }
    %>
