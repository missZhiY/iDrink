<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>供应商信息-iDrinkCRM</title>
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
            <a class="navbar-brand" style="padding-top: 20px; font-weight: bolder; color: black" href="<%=basePath%>customer/list.action">iDrink饮料经销商CRM系统</a>
        </div>

        <!-- 左侧显示列表部分 -->
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
                        <a href="${pageContext.request.contextPath }/administrator/list.action">
                            <i class="fa fa-user fa-fw"></i> 管理员信息
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/product/list.action">
                            <i class="fa fa-cogs fa-fw" ></i> 商品信息
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/supplier/list.action" class="active">
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
    <!-- 客户列表查询部分 -->
    <div id="page-wrapper" style="background: url(/images/b5.jpeg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">供应商信息</h1>
            </div>

        </div>
    <!--  查询部分-->
        <div class="panel panel-default" style="border-bottom: 0px; border-left: 0px; border-top: 0px; border-right: 0px;">
            <div class="panel-body" style="background: #92B5D3">
                <form class="form-inline" method="get" action="${pageContext.request.contextPath }/supplier/list.action">
                    <div style="display: inline-block">
                        <label for="s_name">供应商名称</label>
                        <input type="text" class="form-control" id="s_name" value="${s_name}" name="s_name" placeholder="输入供应商名称"/>
                    </div>

                    <div class="form-group">
                        <label for="s_product">产品名称</label>
                        <select class="form-control" id="s_product" name="s_product">
                            <option value="">--请选择--</option>
                            <c:forEach items="${proType}" var="pro">
                                <option value="${pro.dict_item}">${pro.dict_item}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="s_address">产地</label>
                        <select class="form-control" id="s_address" name="s_address">
                            <option value="">--请选择--</option>
                            <c:forEach items="${supFrom}" var="from">
                                <option value="${from.dict_item}">${from.dict_item}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button style="float: right" type="submit" class="btn btn-primary">查询</button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">供应商列表</div>
                    <table class="table table-bordered table-hover">
                        <thead align="center">
                        <tr>
                            <th>编号</th>
                            <th>供货商名称</th>
                            <th>产品</th>
                            <th>产品进价</th>
                            <th>供应商地址</th>
                            <th>供应商电话</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody align="center">
                            <c:forEach items="${page.rows}" var="row">
                                <tr>
                                    <td>${row.s_id}</td>
                                    <td>${row.s_name}</td>
                                    <td>${row.s_product}</td>
                                    <td>${row.s_price}</td>
                                    <td>${row.s_address}</td>
                                    <td>${row.s_phone}</td>
                                    <td>
                                        <a href="#" class="btn btn-warning btn-xs" data-toggle="modal"  data-target="#customerEditDialog" onclick="editSup(${row.s_id})">修改</a>
                                        <a href="#" class="btn btn-success btn-xs" data-toggle="modal"  data-target="#customerAddDialog"  onclick="addSup()">新增</a>
                                        <a href="#" class="btn btn-danger btn-xs" onclick="deleteSup(${row.s_id})">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="col-md-12 text-right">
                        <iDrink:page url="${pageContext.request.contextPath }/supplier/list.action" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--新增框--%>
    <div class="modal fade" id="customerAddDialog" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <%--模态框头--%>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="add">新增供应商信息</h4>
                </div>
                <%--模态框体--%>
                <div class="modal-body">
                    <form class="form-horizontal" id="add_sup_form">
                        <div class="form-group">
                            <label for="add_customerName" class="col-sm-2 control-label">名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_customerName" placeholder="供应商名称" name="s_name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add_customerFrom" class="col-sm-2 control-label">产品</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_customerFrom" placeholder="产品名称" name="s_product">
                                </div>
                        </div>
                        <div class="form-group">
                            <label for="add_custLevel" style="float:left;padding:7px 15px 0 27px;">产品进价</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_custLevel" placeholder="产品进价" name="s_price">
                                </div>
                        </div>
                        <div class="form-group">
                            <label for="add_linkMan" class="col-sm-2 control-label">地址</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_linkMan" placeholder="供货商地址" name="s_address">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add_phone" class="col-sm-2 control-label">电话</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_phone" placeholder="固定电话" name="s_phone">
                            </div>
                        </div>
                    </form>
                </div>

                <%--                  模态框脚--%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="doAddSup()">保存</button>
                </div>
            </div>
        </div>
    </div>

<%--修改框--%>
    <div class="modal fade" id="customerEditDialog" tabindex="-2" role="dialog"
         aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="update">修改供应商信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="edit_sup_form">
                        <input type="hidden" id="edit_sid" name="s_id"/>
                        <div class="form-group">
                            <label for="edit_sname" class="col-sm-2 control-label">名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_sname" placeholder="供应商名称" name="s_name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_spro" class="col-sm-2 control-label">产品</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_spro" placeholder="产品名称" name="s_product">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_sprice" class="col-sm-2 control-label">产品进价</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_sprice" placeholder="产品进价" name="s_price">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_saddress" class="col-sm-2 control-label">地址</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_saddress" placeholder="供应商地址" name="s_address">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_sphone" class="col-sm-2 control-label">电话</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_sphone" placeholder="供应商电话" name="s_phone">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="updateSup()">保存</button>
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
        function addSup() {
            $.ajax({
                type:"get",
                url:"<%=basePath%>/supplier/add.action",
                data:{},
                success:function(data) {
                    // alert("add");
                }
            });
        }

        function doAddSup() {
            $.post("<%=basePath%>/supplier/doAdd.action",
                $("#add_sup_form").serialize(),
                function(data) {
                    alert("供应商信息保存成功！");
                    window.location.reload();
                });
        }

        function editSup(id) {
            $.ajax({
                type:"get",
                url:"<%=basePath%>/supplier/getSupById.action",
                data:{"id":id},
                success:function(data) {
                    $("#edit_sid").val(data.s_id);
                    $("#edit_sname").val(data.s_name);
                    $("#edit_spro").val(data.s_product);
                    $("#edit_saddress").val(data.s_address);
                    $("#edit_sphone").val(data.s_phone);
                    $("#edit_sprice").val(data.s_price);
                }
            });
        }
        // 执行修改客户操作
        function updateSup() {
            $.post("<%=basePath%>/supplier/update.action",$("#edit_sup_form").serialize(),
                function(data) {
                    if(data =="OK"){
                        alert("供应商信息更新成功！");
                        window.location.reload();
                    }else{
                        alert("供应商信息更新失败！");
                        window.location.reload();
                    }
            });
        }

        function deleteSup(id) {
            if(confirm('确定要删除这条供应商信息吗?')) {
                $.post(
                    "<%=basePath%>/supplier/delete.action",
                    {"id":id},
                    function(data){
                        if (data == "OK") {
                            alert("删除成功！");
                            window.location.reload();
                        } else {
                            alert("删除失败，请重试！");
                            window.location.reload();
                        }
                    });
            }
        }
    </script>
</body>
</html>