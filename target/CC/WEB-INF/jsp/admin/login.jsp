<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>  
  <base href="<%=basePath%>">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录</title>
	<style type="text/css">
	table{
		text-align: center;
	}
	.textSize{
		width: 120px;
		height: 25px;
	}
	* {
		margin: 0px;
		padding: 0px;
	}
	body {
		font-family: Arial, Helvetica, sans-serif;
		font-size: 12px;
		margin: 10px 10px auto;
		background-image: url(images/admin/brief.jpg);
	}
	</style>
	<script type="text/javascript">
	//确定按钮
    //document.forms[0]：获取当前页面的第一个表单
	function gogo(){
		document.forms[0].submit();
	}
	//取消按钮
	function cancel(){
		document.forms[0].action = "";
	}
	</script>
  </head>
  <body>
  
  	<form:form action="admin/login" modelAttribute="auser" method="post">
  	<center>
  	<h1>管理员登录</h1>
	<table>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
		<tr>
			<td colspan="2"><img src="images/admin/adminlog.gif"></td>
		</tr>
		<tr>
		<td>姓名:</td>
			<td>
				<form:input path="aname" cssClass="textSize"/>
			</td>
		</tr>
		<tr>
		<td>密码:</td>
			<td>
				<form:password path="apwd" cssClass="textSize" maxlength="20"/>
			</td>
		</tr>
		<tr>
			<td colspan="10">
			    	<input type="image" src="images/admin/logins.png" onclick="gogo()" >
				    <input type="image" src="images/admin/register.png" onclick="cancel()" >
			</td>
		</tr>
	</table>
	</center>
	</form:form>	<br>
	<center>
	        ${msg }
    </center>
  </body>
</html>
