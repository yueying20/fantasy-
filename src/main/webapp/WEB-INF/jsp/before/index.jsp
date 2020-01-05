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
<title>首页</title>
<link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
<link href="css/before/common.css" rel="stylesheet" type="text/css" />
<link href="css/before/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
h3{
color:#F07B06;
}
</style>
</head>
<body>
	<!--左边的图片内容-->
	<div class="blank"></div>
	<div class="block clearfix">
		<div class="AreaL" >
			<div class="box">
				<div class="box_2">
				<img src="images/before/th.jpg" />
				</div>
			</div>
		</div>
		<!--中间的图片内容-->
		<div class="AreaR">
			<div class="AreaR">
				<div class="AreaM clearfix">
					<div id="focus">
						<img src="images/before/king.jpg" />
					</div>
				</div>
				<!--右边的图片内容-->
				<div class="AreaRR clearfix">

					<div class="box">
						<div class="box_1">
                            <img src="images/before/bg3.jpg" />
                            <img src="images/before/bgs.jpg" />
					   </div>
				    </div>
		           </div>
                   </div>

			<div class="AreaR">
				<div class="blank5"></div>
				<div class="box">
					<div class="box_color ared">	
							<h3>商品列表</h3>				
						<div class="itemgood_nr clearfix">
							<ul>
							<c:forEach items="${lastedlist }" var="sg">
							<li>
							<div>
					<p class="pic">
			    	<a href="goodsDetail?id=${sg.id }"><img src="logos/${sg.gpicture}" /></a>
				    </p>
					<p class="wz">
					<strong>${sg.gname }</strong>
					<!-- em 区分标签 -->
						<em>现价:<span>￥${sg.grprice}</span></em>
						</p>
					</div>
				</li>
			 </c:forEach>
					</ul>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</body>
</html>
