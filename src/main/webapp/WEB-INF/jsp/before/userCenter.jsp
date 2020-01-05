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
<title>用户中心</title>
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
						<th>订单ID</th>
						<th>订单金额</th>
						<th>订单日期</th>
						<th>订单状态</th>
						<th>详情</th>
					</tr>				
					<c:forEach var="mo" items="${myOrder}"> 
						<tr>
							<td bgcolor="#ffffff" align="center">${mo.id}</td>
							<td bgcolor="#ffffff"  align="center">${mo.amount}</td>
							<td align="center" bgcolor="#ffffff">${mo.orderdate}</td>
							<td bgcolor="#ffffff"  align="center">
							<c:if test="${mo.status == 0}" >
							 未付款
							<a href="order/pay?ordersn=${mo.id}">去支付</a>
							</c:if>
							
							<c:if test="${mo.status == 1}" >已付款</c:if>
							</td>
							<td align="center">
							<a href="orderDetail?ordersn=${mo.id}" >详情</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
</body>
</html>