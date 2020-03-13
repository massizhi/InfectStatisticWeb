<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pojo.Info" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//out.println(request.getAttribute("haha"));
	//未选择时间时，输出信息如下。
	if (request.getAttribute("info")==null) {
	%>
	<table>
		<tr>
		<td><%="现有确诊" %></td><td><%="现有疑似" %></td><td><%="现有重症" %></td>
		</tr>
		<tr>
		<td><%="13904" %></td><td><%="1724" %></td><td><%="---" %></td>
		</tr>
		<tr>
		<td><%="昨日+2461" %></td><td><%="昨日+277" %></td><td><%="昨日---" %></td>
		</tr>
		
		<tr>
		<td><%="累计确诊" %></td><td><%="累计治愈" %></td><td><%="累计死亡" %></td>
		</tr>
		<tr>
		<td><%="14503" %></td><td><%="295" %></td><td><%="304" %></td>
		</tr>
		<tr>
		<td><%="昨日+2586" %></td><td><%="昨日+80" %></td><td><%="昨日+45" %></td>
		</tr>
	</table>
	<%}
	else {
		
	%>		
	<%} 
%>
</body>
</html>