<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ include file = "db-con.jsp"%>
<%
    String Iid = request.getParameter("Iid");
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

    String sport_cat = request.getParameter("sport_cat");
  	String cat = request.getParameter("cat");
  	String cust_cat = request.getParameter("cust_cat");
  	String price = request.getParameter("price");
  	String storage = request.getParameter("storage");
  	String name = request.getParameter("name");
  	String illustration = request.getParameter("illustration");
    String image = request.getParameter("image");


    try{
      if(sport_cat != null ){
        String sql = "Update item set sport_cat = '" + sport_cat + "' where Iid = '" + Iid + "';";
        stmt.executeUpdate(sql);
      }
      if(cat != null ){
        String sql = "Update item set cat = '" + cat + "' where Iid = '" + Iid + "';";
        stmt.executeUpdate(sql);
      }
      if(cust_cat != null ){
        String sql = "Update item set cust_cat = '" + cust_cat + "' where Iid = '" + Iid + "';";
        stmt.executeUpdate(sql);
      }
      if(price != null ){
        String sql = "Update item set price = '" + price + "' where Iid = '" + Iid + "';";
        stmt.executeUpdate(sql);
      }
      if(storage != null ){
        String sql = "Update item set storage = '" + storage + "' where Iid = '" + Iid + "';";
        stmt.executeUpdate(sql);
      }
      if(name != null ){
        String sql = "Update item set name = '" + name + "' where Iid = '" + Iid + "';";
        stmt.executeUpdate(sql);
      }
      if(illustration != null ){
        String sql = "Update item set illustration = '" + illustration + "' where Iid = '" + Iid + "';";
        stmt.executeUpdate(sql);
      }
      if(image != null ){
        String sql = "Update item set image = '" + image + "' where Iid = '" + Iid + "';";
        stmt.executeUpdate(sql);
      }

    }catch(Exception ex){
      ;
    }
    stmt.close();
    conn.close();
    response.setHeader("Refresh", "0;stock.jsp" );
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
                    <h1>修改成功</h1>
                </div>
            </body>
        </html>
