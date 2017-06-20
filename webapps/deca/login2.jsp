<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ include file = "db_ini.jsp" %>
<%
  request.setCharacterEncoding("UTF-8");
    ResultSet rs = null;
    String result = null;
    Statement stmt =null;
    stmt = con.createStatement();

    try{
      //登入
      String ac =request.getParameter("account");
      if( ac != null){
        String pa =request.getParameter("password");
        String sql = "select * from user where account = '" + ac + "' AND password ='" + pa + "';";
        rs = stmt.executeQuery(sql);

        if(rs.first()){
          String Uid = rs.getString("Uid");
          String abc = rs.getString("account");
          //set session
          session.setAttribute("acc", Uid);
          session.setAttribute("a",abc);
          result = "登　入　成　功";
          response.setHeader("refresh","0;URL=index.jsp");
        }else{
          response.setHeader("refresh","1;URL=index.jsp");
          result = "錯誤的帳號或密碼，即將回登入頁面";
        }
      //登入
        stmt.close();
      	rs.close();
      	con.close();
      }else{
        response.setHeader("refresh","0;URL=index.jsp");
        result = "想幹嘛???";
      }
    }catch(Exception ex){
      out.println(ex);
    }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
            <title>Login</title>
            <link rel="stylesheet" type="text/css" href="css_style.css"></head>

            <body>
                <div>
                    <h1><%=result%></h1>
                </div>
            </body>
        </html>
