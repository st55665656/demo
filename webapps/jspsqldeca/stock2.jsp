<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ include file = "db-con.jsp"%>
<%
    String Iid = request.getParameter("Iid");
    String acc= (String)session.getAttribute("acc");
    String login_or_yet = "";
		if(acc == null) {
      response.setHeader("Refresh", "0;index.html" );
      login_or_yet = "沒登入想幹嘛啦!!!!!!!!!!";
    }

    ResultSet rs = null;
    String result = null;
    Statement stmt =null;
    stmt = conn.createStatement();
    String sql = "select * from item where Iid = '" + Iid + "';";
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
              <div class="container">
              <form method="post" action="stock3.jsp?Iid=<%=Iid%>">
              <center><table class='table table-hover'>
              <tr><th>運動類型</th><th>種類</th><th>族群</th><th>價格</th><th>數量</th><th>商品</th><th>描述</th></tr>
              <%
                if (rs != null){
                  while(rs.next()){
                    String sport_cat = rs.getString("sport_cat");
                    String cat = rs.getString("cat");
                    String cust_cat = rs.getString("cust_cat");
                    String price = rs.getString("price");
                    String storage = rs.getString("storage");
                    String name = rs.getString("name");
                    String illustration = rs.getString("illustration");
              %>
                 <td><%=sport_cat%></td>
                 <td><%=cat%></td>
                 <td><%=cust_cat%></td>
                 <td><%=price%></td>
                 <td><%=storage%></td>
                 <td><%=name%></td>
                 <td><%=illustration%></td></tr>
                 <td><SELECT name="sport_cat" size=1>
                    		<OPTION value ="running" >跑步</OPTION>
                    		<OPTION value ="swimming" >游泳</OPTION>
                    		<OPTION value ="badminton" >羽球</OPTION>
                    </SELECT></td>
                 <td><SELECT name="cat" size=1>
                  		<OPTION value ="shirt" >上衣</OPTION>
                  		<OPTION value ="short" >短褲</OPTION>
                  		<OPTION value ="shoes" >鞋子</OPTION>
                  	</SELECT></td>
                 <td><SELECT name="cust_cat" size=1>
                  		<OPTION value ="man" >男士</OPTION>
                  		<OPTION value ="woman" >女士</OPTION>
                  		<OPTION value ="child" >小孩</OPTION>
                  	</SELECT></td>
                 <td><input type="text" name="price" class="form-control" placeholder="請輸入" /></td>
                 <td><input type="text" name="storage" class="form-control" placeholder="請輸入" /></td>
                 <td><input type="text" name="name" class="form-control" placeholder="請輸入" /></td>
                 <td><input type="text" name="illustration" class="form-control" placeholder="請輸入" /></td></tr>
              <%
                }}
                stmt.close();
                rs.close();
                conn.close();
              %>
              </table></center>
              <input type="submit" value="修改" class="btn btn-default">
              <input type="button" value="返回" class="btn btn-default" onclick="window.location='stock.jsp';"><br>
              </div>
            </body>
        </html>
