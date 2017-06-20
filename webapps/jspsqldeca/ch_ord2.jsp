<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ include file = "db-con.jsp"%>
<%
    String Oid = request.getParameter("Oid");
    String acc= (String)session.getAttribute("acc");
    String login_or_yet = "";
		if(acc == null) {
      response.setHeader("Refresh", "0;index.jsp" );
      login_or_yet = "沒登入想幹嘛啦!!!!!!!!!!";
    }

    ResultSet rs = null;
    String result = null;
    Statement stmt =null;
    stmt = conn.createStatement();

      if(Oid != null){
        String sql = "delete from orddd where Oid = '" + Oid + "';";
        stmt.executeUpdate(sql);
        stmt.close();
        conn.close();
        response.setHeader("Refresh", "0;ch_ord.jsp" );
      }

    %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
            <title>Register</title>
            <!-- 最新編譯和最佳化的 CSS -->
          	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
          	<!-- 選擇性佈景主題 -->
          	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
          	<!-- 最新編譯和最佳化的 JavaScript -->
          	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
            <link rel="stylesheet" type="text/css" href="css_style.css"></head>

            <body>
                <div>
                    <h1>刪除成功</h1>
                </div>
            </body>
        </html>
