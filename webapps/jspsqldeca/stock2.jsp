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
    String sql = "select * from item where Iid = '" + Iid + "';";
    rs = stmt.executeQuery(sql);

    %>
<!DOCTYPE html>
<html>
    <head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
              <tr><th>運動類型</th><th>種類</th><th>族群</th><th>價格</th><th>數量</th><th>商品</th><th>描述</th><th>圖片</th></tr>
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
                    String image = rs.getString("image");
              %>
			  <script>
				var sport_cat="<%=sport_cat%>";
				var cat="<%=cat%>";
				var cust_cat="<%=cust_cat%>";
				var price="<%=price%>";
				var storage="<%=storage%>";
				var name="<%=name%>";
				var illustration="<%=illustration%>";
        var image="<%=image%>";
			  </script>
                 <td><%=sport_cat%></td>
                 <td><%=cat%></td>
                 <td><%=cust_cat%></td>
                 <td><%=price%></td>
                 <td><%=storage%></td>
                 <td><%=name%></td>
                 <td><%=illustration%></td>
                 <td><img src="<%=image%>" style="width:15vh;height:18vh;"></td></tr>
                 <td><SELECT name="sport_cat" size=1 id="box1">
                   <OPTION value ="workout" >健身</OPTION>
                   <OPTION value ="swimming" >游泳</OPTION>
                   <OPTION value ="running" >跑步</OPTION>
                   <OPTION value ="badminton" >球類</OPTION>
                   <OPTION value ="biking" >自行車</OPTION>
                   <OPTION value ="other" >其他</OPTION>
                    </SELECT></td>
                 <td><SELECT name="cat" size=1 id="box2">
                   <OPTION value ="shirt" >上衣</OPTION>
                   <OPTION value ="short" >短褲</OPTION>
                   <OPTION value ="shoes" >鞋子</OPTION>
                   <OPTION value ="accessory" >配件</OPTION>
                  	</SELECT></td>
                 <td><SELECT name="cust_cat" size=1 id="box3">
                  		<OPTION value ="man" >男士</OPTION>
                  		<OPTION value ="woman" >女士</OPTION>
                  		<OPTION value ="child" >小孩</OPTION>
                  	</SELECT></td>
                 <td><input type="text" name="price" class="form-control" placeholder="請輸入" id="input1"/></td>
                 <td><input type="text" name="storage" class="form-control" placeholder="請輸入" id="input2"/></td>
                 <td><input type="text" name="name" class="form-control" placeholder="請輸入" id="input3" /></td>
                 <td><input type="text" name="illustration" class="form-control" placeholder="請輸入" id="input4"/></td>
                 <td><input type="text" name="image" class="form-control" placeholder="請輸入" id="input5"/></td></tr>
				 <script>
					$("#box1").val(sport_cat);
					$("#box2").val(cat);
					$("#box3").val(cust_cat);
					$("#input1").val(price);
					$("#input2").val(storage);
					$("#input3").val(name);
					$("#input4").val(illustration);
          $("#input5").val(image);
				</script>
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
