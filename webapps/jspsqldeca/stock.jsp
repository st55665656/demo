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

    String b_count[]= new String[100];
    b_count = (String[])session.getAttribute("obj_h");
    for(int i=0 ; i<100; i++){
      if(b_count[i] != "hello"){
        ;
      }else{
        i=200;
      }
    }


    ResultSet rs = null;
    String result = null;
    Statement stmt =null;
    stmt = conn.createStatement();
    String sql = "select * from item;";
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
                    <h1>查詢結果</h1>
                    <div class="container">
                    <table class='table table-hover'>
                    <tr><th>運動類型</th><th>種類</th><th>族群</th><th>價格</th><th>數量</th><th>商品</th><th>描述</th><th>照片</th><th>　</th></tr>
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
                       <td><%=sport_cat%></td>
                       <td><%=cat%></td>
                       <td><%=cust_cat%></td>
                       <td><%=price%></td>
                       <td><%=storage%></td>
                       <td><%=name%></td>
                       <td><%=illustration%></td>
                       <td><img src="<%=image%>" style="width:15vh;height:18vh;"></td>
                       <td><input type="button" value="修改" class="btn btn-default" onclick="window.location='stock2.jsp?Iid=<%=Iid%>';"></td></tr>
                  	<%
                  		}}
                  		stmt.close();
                  		rs.close();
                      conn.close();
                  	%>
                    </table>
                    <input type="button" value="確認" class="btn btn-default" onclick="window.location='control.jsp';"><br>
                    </div>
            </body>
        </html>
