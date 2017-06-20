<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.*"%>
<%@ include file = "db_ini.jsp"%>
<%@ page import="java.lang.Integer" %>
<%
	PreparedStatement pstmt = null;
	Statement stmt = null;
	stmt = con.createStatement();
	
	int i=0;
	int row_total =0;
	int total_price = 0;
	ArrayList<String> obj = (ArrayList<String>)session.getAttribute("list");
	ArrayList obj2 = new ArrayList();
	Set<String> unique = new HashSet<String>(obj);
	
	String[] y = unique.toArray(new String[0]);
	int occurrences = 0;
	for(i=0;i<y.length;i++){
		occurrences = Collections.frequency(obj, y[i]);
		obj2.add(occurrences);
	}
	String acc = (String)session.getAttribute("acc");
	for(i=0;i<obj2.size();i++){

		String sql = "insert into orddd (Uid, Iid, quantity) values (?, ?, ?)";
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, acc);
		pstmt.setString(2, y[i]);
		pstmt.setInt(3, (Integer)obj2.get(i));
		
		pstmt.executeUpdate();
		String sql2 = "update item set storage = storage - " + (Integer)obj2.get(i) + " where Iid = "  + y[i];
		int a = stmt.executeUpdate(sql2);
	}
	pstmt.close();
	stmt.close();
	con.close();
%>
<%session.invalidate();
response.sendRedirect("index.jsp");
%>
