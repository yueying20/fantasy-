<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>订单详情</title>
<link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
<link href="css/before/common.css" rel="stylesheet" type="text/css" />
<link href="css/before/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="blank"></div>
	<div class="block clearfix">
		<div class="location ared">
            <a href="before?id=0">返回首页</a>
		</div>
			<div class="nFlowBox">
				<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1" bgcolor="#dddddd">
					<tr>
						<th>商品ID</th>
						<th>商品名称</th>
						<th>商品图片</th>
						<th>商品价格</th>
						<th>购买数量</th>
					</tr>
					<tr>			
					<c:forEach var="mf" items="${myOrderDetail}"> 
						<tr>
							<td align="center" bgcolor="#ffffff">${mf.id}</td>
							<td align="center" bgcolor="#ffffff">${mf.gname}</td>
							<td align="center" height="60px" > 
							<img style="width: 50px; height: 50px;"
						src="logos/${mf.gpicture}" border="0"title="${mf.gname}" /> </td>
							<td align="center" bgcolor="#ffffff">${mf.grprice}</td>
							<td align="center" bgcolor="#ffffff">${mf.shoppingnum}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
</body>
</html>