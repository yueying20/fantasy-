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
<title>订单完成页面</title>
<link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
<link href="css/before/common.css" rel="stylesheet" type="text/css" />
<link href="css/before/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			//确定按钮
			function gogo(){
				document.payForm.submit();
			}
		</script>
  </head>
  <body>
  	<div class="blank"></div>
	<div class="block clearfix">
    <h2 style="text-align:center; height:30px; line-height:30px;">您的订单提交成功，
         	订单号: <font style="color:red" size='5'>${ordersn}</font></h2><br/>
      <center>
      <form action="order/pay" method="post" name="payForm">	
            <input type="image" src="images/before/alipay.png" onclick="gogo()"/>
      </form>
      </center>
    </div>
  </body>
</html>
