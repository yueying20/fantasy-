﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <base href="<%=basePath%>">
    <title>分页查询</title>
	<link href="css/admin/common.css" type="text/css" rel="stylesheet">
	<style type="text/css">
		table{
			text-align: center;
			border-collapse: collapse;
		}
		.bgcolor{
		  	background-color: #F08080;
		}
	</style>

</head>
<body>
	<c:if test="${allGoods.size() == 0 }">
		您还没有商品。
	</c:if>
	<c:if test="${allGoods.size() != 0 }">
		<table border="1" bordercolor="PaleGreen">
			<tr>
				<th width="100px">ID</th>
				<th width="200px">名称</th>
				<th width="200px">价格</th>
				<th width="100px">库存</th>
				<th width="100px">详情</th>
				<th width="100px">操作</th>
			</tr>
			<c:forEach items="${allGoods }" var="goods">
				<tr >
					<td>${goods.id }</td>
					<td>${goods.gname }</td>
					<td>${goods.grprice }</td>
					<td>${goods.gstore }</td>
					<td><a href="adminGoods/selectAGoods?id=${goods.id }" >详情</a></td>
					<td><a href="adminGoods/selectAGoods?id=${goods.id }&act=updateAgoods" target="center" >修改</a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6" align="right">
					&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;共${totalCount}条记录&nbsp;&nbsp;共${totalPage}页&nbsp;&nbsp;
					第${pageCur}页&nbsp;&nbsp;
					<c:url var="url_pre" value="adminGoods/selectGoods">
						<c:param name="pageCur" value="${pageCur - 1 }"/>
						<c:param name="act" value="updateSelect"/>
					</c:url>
					<c:url var="url_next" value="adminGoods/selectGoods">
						<c:param name="pageCur" value="${pageCur + 1 }"/>
						<c:param name="act" value="updateSelect"/>
					</c:url>
					
					<c:if test="${pageCur != 1 }">
						<a href="${url_pre}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</c:if>
					
					<c:if test="${pageCur != totalPage && totalPage != 0}">
						<a href="${url_next}">下一页</a>
					</c:if>
				</td>
			</tr> 
		</table>
	</c:if>
</body>
</html>