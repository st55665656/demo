<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ include file = "db-con.jsp"%>
<%
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
    String sql = "select * from user;";
    rs = stmt.executeQuery(sql);
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
                    <h1 id="demo">查詢結果</h1>
                    <center><table class='table table-hover'>
                    <tr><th>帳號</th><th>密碼</th><th>　</th></tr>
                    <%
                  		if (rs != null){
                  		  while(rs.next()){
                        String Uid = rs.getString("Uid");
                  			String account = rs.getString("account");
                  			String password = rs.getString("password");
                  	%>
                	     <td><%=account%></td>
                       <td><%=password%></td>
                       <td><input type="button" value="刪除" class="btn btn-default" onclick="window.location='member2.jsp?Uid=<%=Uid%>';"></td></tr>
                  	<%
                  		}}
                  		stmt.close();
                  		rs.close();
                      conn.close();
                  	%>
                    </table></center>
                    <input type="button" value="返回" class="btn btn-default" onclick="window.location='control.jsp';">
                    <br>
                </div>

            </body>
        </html>
