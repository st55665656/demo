<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%
	String del_id = request.getParameter("del_id");
	ArrayList<String> obj = (ArrayList<String>)session.getAttribute("list");
	int i=0;
	int back = obj.size()-1;
	for(i=back;i>=0;i--){
		obj.remove(del_id);
	}
	
	out.print("<br>all:");
	for(i=0;i<obj.size();i++){
		out.print(obj.get(i));
	}
%>