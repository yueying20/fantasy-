<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>购物车</title>
<link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
<link href="css/before/common.css" rel="stylesheet" type="text/css" />
<link href="css/before/style.css" rel="stylesheet" type="text/css" />
<!--location 位置-->
<script type="text/javascript">
	//确认
	function  goOrderConfirm(){
		window.location.href="/CC/cart/orderConfirm";
	}
	//删除
	function deleteAgoods(gno){
		if(window.confirm("删除该商品吗？")){
			window.location.href="/CC/cart/deleteAgoods?id=" + gno;
			return true;
		}
		return false;
	}
</script>
</head>
<body>
	<div class="blank"></div>
	<div class="block clearfix">
		<div class="location ared">
			当前位置： <a>首页</a> > 购物流程 > 购物车
		</div>
		<div class="blank"></div>
		<div>
			<div class="nFlowBox">
				<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1" >
					<tr bgcolor="#dddddd">
						<th>商品信息</th>
						<th>单价（元）</th>
						<th>数量</th>
						<th>总价</th>
						<th>操作</th>
					</tr>					
				<tr>
				<td colspan="5" height="15px"style="border: 0 none; background: #FFF"></td>
				</tr> 
					<c:forEach var="ce" items="${cartlist}"> 
				<tr>
			   <td align="center">	
               <img style="width: 100px; height: 100px;"src="logos/${ce.gpicture}" border="0"title="${ce.gname}" />
                <br/>	            						
                <a  href="goodsDetail?id=${ce.id}" >${ce.gname}</a>
			  </td>
				<td width="110px" align="center">
			       <span>${ce.grprice}</span>
				      </td>
							<td align="center"  width="115px"
								valign="middle">
		                     <input type="text" name="goods_number"
								value="${ce.shoppingnum}" size="4" 
								style="text-align: center; width: 36px;" />
							</td>
								
							<td align="center" width="115px">
							￥<span>${ce.smallsum}</span>
							</td>
							
							<td align="center"  width="185px">
							<a href="javaScript:deleteAgoods('${ce.id}')"
							title="删除">
							<img src="images/before/sc.png" /></a>
							</td>
						</tr>
					</c:forEach>
					
					<tr>
						<td align="right"  colspan="4" height="41px;"
							style="border-left: 0 none;">
							<font style="color: #a60401; font-size: 13px; 
							font-weight: bold; letter-spacing: 0px;">
								购物金额总计 ￥${total}元</font>
						</td>
					</tr>
					<tr>
						<td align="center">
							<a href="javascript:goOrderConfirm()">
							<img src="images/before/qjs.jpg" alt="checkout" /></a>			
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
