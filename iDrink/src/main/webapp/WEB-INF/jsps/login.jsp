<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName()
			+ ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>iDrink</title>
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/signin.css" rel="stylesheet">
	<link rel="shortcut icon" href="#">
</head>

<body>
<div class="container">
	<form class="form-signin" action="${pageContext.request.contextPath }/login.action" method="post">
		<h2 class="form-signin-heading">
			欢迎登录iDrink系统
		</h2>
		<label for="a_phone" class="sr-only">账号</label>
		<input type="text" id="a_phone" name="a_phone" class="form-control" placeholder="手机" required autofocus />
		<label for="a_password" class="sr-only">密码</label>
		<input type="password" id="a_password" name="a_password" class="form-control" placeholder="密码" required />
		<div class="checkbox">
			<label>
				<input type="checkbox" value="记住我" /> 记住我
			</label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
		<a href="#" data-toggle="modal" data-target="#adRegist" onclick="regist()">
			<input class="btn btn-lg btn-default btn-block" type="button" value="注册">
		</a>
		<span data-toggle="modal" id="message" class="text-center" style="color: #8c8c8c">${msg}</span>
	</form>
</div>

<%--新增框--%>
<div class="modal fade" id="adRegist" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<%--模态框头--%>
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="add">用户注册</h4>
			</div>
			<%--模态框体--%>
			<div class="modal-body">
				<form class="form-horizontal" id="add_ad">
					<div class="form-group">
						<label for="add_name" class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="add_name" placeholder="请输入真实姓名" name="a_name">
						</div>
					</div>

					<div class="form-group">
						<label for="add_address" class="col-sm-2 control-label">地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="add_address" placeholder="请输入地址" name="a_address">
						</div>
					</div>

					<div class="form-group">
						<label for="add_phone" class="col-sm-2 control-label">手机号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="add_phone" placeholder="请输入手机号" name="a_phone">
						</div>
					</div>

					<div class="form-group">
						<label for="add_password" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="add_password" placeholder="请设置密码" name="a_password">
						</div>
					</div>

					<div class="form-group">
						<label for="confirm_password" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="confirm_password" placeholder="请确认密码" name="c_password">
						</div>
					</div>

				</form>
			</div>

			<%-- 模态框脚--%>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" onclick="check()">注册</button>
			</div>
		</div>
	</div>
</div>

<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<script type="text/javascript">

	function regist() {
		$.ajax({
			type:"get",
			url:"<%=basePath%>/login/add.action",
			data:{},
			success:function(data) {
			}
		});
	}

	function check() {
		if($("#add_password").val() != $("#confirm_password").val()) {
			alert("两次密码不一致，请重新输入！");
			window.location.reload();
		} else {
			doRegist();
		}
	}

	function doRegist() {
		$.post("<%=basePath%>/login/doAdd.action",
				$("#add_ad").serialize(),
				function(data) {
					alert("注册成功");
					window.location.reload();
				});
	}
</script>
</body>
</html>