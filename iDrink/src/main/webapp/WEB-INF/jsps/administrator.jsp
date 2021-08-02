<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="iDrink" uri="http://itheima.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>管理员信息-iDrinkCRM</title>
	<!-- 引入css样式文件 -->
	<!-- Bootstrap Core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
	<!-- Custom CSS -->
	<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
	<!-- Custom Fonts -->
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper">
  <!-- 导航栏部分 -->
  <nav class="navbar navbar-default navbar-static-top" role="navigation"
		 style="background: url(/images/h1.jpeg) center center fixed; margin-bottom: 0; height: 70px; border: #92B5D3">
	<div class="navbar-static-top" style="height: 70px">
		<a class="navbar-brand" style="padding-top: 20px; color: black; font-weight: bolder" href="<%=basePath%>administrator/list.action">iDrink饮料经销商CRM系统</a>
	</div>

	<!-- 左侧显示列表部分 start-->
	<div class="navbar-default sidebar" style="top: 20px" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="查询内容...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
							</button>
						</span>
					</div> 
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/administrator/list.action" class="active">
						<i class="fa fa-user fa-fw"></i> 管理员信息
				    </a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath }/product/list.action">
				      <i class="fa fa-cogs fa-fw" ></i> 商品信息
				    </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/supplier/list.action">
						<i class="fa fa-truck fa-fw" ></i> 供应商信息
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/customer/list.action">
						<i class="fa fa-shopping-cart fa-fw" ></i> 客户信息
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/logout.action">
						<i class="fa fa-sign-out fa-fw" ></i> 退出登录
					</a>
				</li>
			</ul>
		</div>
	</div>
  </nav>

    <!-- 客户列表查询部分  start-->
	<div id="page-wrapper" style="background: url(/images/b5.jpeg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">管理员信息</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">管理员信息列表</div>
					<table class="table table-bordered table-hover">
						<thead align="center">
							<tr>
								<th>编号</th>
								<th>姓名</th>
								<th>电话</th>
								<th>地址</th>
							</tr>
						</thead>
						<tbody align="center">
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td>${row.a_id}</td>
									<td>${row.a_name}</td>
									<td>${row.a_phone}</td>
									<td>${row.a_address}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<iDrink:page url="${pageContext.request.contextPath }/administrator/list.action" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>