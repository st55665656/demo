<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.Integer" %>
<%@ include file = "db_ini.jsp"%>

<%	
	String find = request.getParameter("find");
	String quan = request.getParameter("quan");
	int qq = Integer.parseInt(quan);
	String result = null;
	Statement stmt = null;
	ResultSet rs = null;
	stmt = con.createStatement();
	int i=0;
	
	String query = "SELECT * FROM item WHERE Iid='" + find + "'";
	rs=stmt.executeQuery(query);
	if (rs != null){
		if (rs.next()){
			String storage = rs.getString("storage");
			String name = rs.getString("name");
			String Iid = rs.getString("Iid");
			if ((ArrayList<String>)session.getAttribute("list") != null){
				ArrayList<String> al = (ArrayList<String>)session.getAttribute("list");
				for (i=0;i<qq;i++){
				al.add(Iid);
				}
				session.setAttribute("list", al);
				out.print(storage);
			}else{
				ArrayList<String> al = new ArrayList<String>();
				for (i=0;i<qq;i++){
				al.add(Iid);
				}
				session.setAttribute("list", al);
			}
		}
	}else{
		out.print("fuck");
	}
	stmt.close();
	rs.close();
	con.close();
%>
