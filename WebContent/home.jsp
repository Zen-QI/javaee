<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=path%>/resource/bs/js/jquery-1.11.1.js"></script>	<!-- 引入jquery -->
<link rel="stylesheet" href="<%=path%>/resource/bs/css/bootstrap.css"> <!-- 引入bootstrap.css -->
<link rel="stylesheet" href="<%=path%>/resource/bs/css/main.css"> <!-- 引入bootstrap.css -->
<script src="<%=path%>/resource/bs/js/bootstrap.min.js"></script><!-- 引入bootstrap.min.js -->
<style>
body{

	width:100%;
	overflow-x:hidden;
	}


</style>
<title>首页</title>
</head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">题库管理系统系统设计与实现</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Help</a></li>
            <li><a  class="btn btn-danger"  style="color='black'" href="login.jsp">退出登录</a></li>	
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
           
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#" class="one">题目管理 <span class="sr-only">(current)</span></a></li>
            <li><a href="#" class="two">用户管理</a></li>
           
          </ul>
       </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          
			
          		
         
          <!-- 题库区域 -->
     			<section id="box1"  class="container">
     			<h2 class="sub-header">题目管理 </h2>
					<div class="row">
						<div class="col-md-3">
				<button class="btn btn-success" data-toggle="modal"
					data-target="#addModal">新增</button>
			</div>
				<table class="table table-striped table-bordered table-hover">
			<th>ID</th>
			<th>题目</th>
			<th>所属科目</th>
			<th>题型</th>
			<th>难度</th>
		
			
			<th>操作</th>
			
			<c:forEach items="${ksList}" var="list">
				<tr>
					<td>${list.id }</td>
					<td>${list.tm }</td>
					<td>${list.ky }</td>
					<td>${list.type }</td>
					<td>${list.nd }</td>
					
					<td colspan="2"><button class="btn btn-primary edBtn"
							data-toggle="modal" data-target="#edModal" value="${list.id }" 
							n="${ list.tm}" p="${list.ky }" t="${list.type}",
							e="${list.nd}" " >编辑</button>
						<button class="btn btn-danger delBtn" data-toggle="modal"
							data-target=".delModal" value="${list.id }">删除</button></td>
				</tr>
					</c:forEach>
				</table>
			</div>
		
			</section>
			 <!-- 题库区域end -->
			
     <!-- 用户区域 -->
         <section id="box2"  class="container">
     			<h2 class="sub-header">用户管理 </h2>
					<div class="row">
						<div class="col-md-3">
				<button class="btn btn-success" data-toggle="modal"
					data-target="#addddModal">新增</button>
			</div>
				<table class="table table-striped table-bordered table-hover">
			<th>ID</th>
			<th>姓名</th>
			<th>密码</th>
			<th>电话</th>
			<th>邮件</th>
			
			
		
			
			<th>操作</th>
			
			<c:forEach items="${userList}" var="userList">
				<tr>
					<td>${userList.id }</td>
					<td>${userList.username }</td>
					<td>${userList.password }</td>
					<td>${userList.tel }</td>
					<td>${userList.email }</td>
					
					<td colspan="2"><button class="btn btn-primary removeBtn"
							data-toggle="modal" data-target="#edddModal" value="${userList.id }" 
							n="${ userList.username}" p="${userList.password }" t="${userList.tel}",
							e="${userList.email}" " >编辑</button>
						<button class="btn btn-danger remove" data-toggle="modal"
							data-target=".removeModal" value="${userList.id }">删除</button></td>
				</tr>
					</c:forEach>
				</table>
			</div>
		
			</section>
			 <!-- 用户区域end -->
			
        </div>
      </div>
    </div>   
 
  
 <!-- 删除模态框 --> 
<div class="modal fade delModal" tabindex="-1" role="dialog"
	aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
			</div>
			<div class="modal-body">
				<h4>真的不要了吗?</h4>
			</div>
			<div class="modal-footer">
				<form action="ZssServlet?action=detele" method="post">
					<input id="delid" name="id" value="" hidden>
					<button type="button" class="btn btn-primary" data-dismiss="modal">留着</button>
					<button type="submit" class="btn btn-danger">删了</button>
				</form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- 编辑模态框 -->
<div class="modal fade" id="edModal" tabindex="-1" role="dialog"
	aria-labelledby="edModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">用户信息</h4>
			</div>
			<form action="ZssServlet?action=update" method="post">
				<div class="modal-body">
					<input id="edId" name="id" value="" hidden>
					<div class="form-group">
						<label for="username" class="control-label">题目:</label> <input
							type="text" name="tm" class="form-control" id="tm"
							value="${ks1.tm }" >
					</div>
					<div class="form-group">
						<label for="password" class="control-label">所属科目:</label> <input
							type="text" name="km" class="form-control" id="km"
							value="${ks1.ky }" required>
					</div>
					<div class="form-group">
						<label for="password" class="control-label">题 型:</label> <input
							type="text" name="type" class="form-control" id="type"
							value="${ks1.type}" required>
					</div>
					<div class="form-group">
						<label for="password" class="control-label">难 度:</label> <input
							type="text" name="nd" class="form-control" id="nd"
							value="${ks1.nd }" required>
					</div>
					
					

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary">更新</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- 添加模态框 -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
	aria-labelledby="edModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">添加科目</h4>
			</div>
			<form action="ZssServlet?action=add" method="post">
				<div class="modal-body">
					<input id="edId" name="id" value="" hidden>
					<div class="form-group">
						<label for="username" class="control-label">题 目:</label> <input
							type="text" name="tm" class="form-control"  required>
					</div>
					<div class="form-group">
						<label for="username" class="control-label">所属科目:</label> <input
							type="text" name="ky" class="form-control"  required>
					</div>
					
					<div class="form-group">
						<label for="username" class="control-label">题 型:</label> <input
							type="text" name="type" class="form-control"  required>
					</div>
					<div class="form-group">
						<label for="password" class="control-label">程 度:</label> <input
							type="text" name="nd" class="form-control"  required>
					</div>
					
					

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary">添加</button>
			    </div>
			 </form>
		 </div>
	 </div>
 </div>
 <!-- 用户添加模态框 -->
<div class="modal fade" id="addddModal" tabindex="-1" role="dialog"
	aria-labelledby="edModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">添加用户</h4>
			</div>
			<form action="ZssServlet?action=uadd" method="post">
				<div class="modal-body">
					<input id="removeId" name="id" value="" hidden>
					<div class="form-group">
						<label for="username" class="control-label">姓 名:</label> <input
							type="text" name="username" class="form-control"  required>
					</div>
					<div class="form-group">
						<label for="username" class="control-label">密 码:</label> <input
							type="password" name="password" class="form-control"  required>
					</div>
					
					<div class="form-group">
						<label for="username" class="control-label">电 话:</label> <input
							type="text" name="tel" class="form-control"  required>
					</div>
					<div class="form-group">
						<label for="password" class="control-label">邮 件:</label> <input
							type="text" name="email" class="form-control"  required>
					</div>
					
					

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary">添加</button>
			    </div>
			 </form>
		 </div>
	 </div>
 </div>
 <!-- 用户编辑模态框 -->
<div class="modal fade" id="edddModal" tabindex="-1" role="dialog"
	aria-labelledby="edModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">用户信息</h4>
			</div>
			<form action="ZssServlet?action=uedit" method="post">
				<div class="modal-body">
					<input id="edId1" name="yy" value="" hidden>
					<div class="form-group">
						<label for="username" class="control-label">姓名:</label> <input
							type="text" name="username" class="form-control" id="username"
							value="${user.username }" >
					</div>
					<div class="form-group">
						<label for="password" class="control-label">密码:</label> <input
							type="text" name="password" class="form-control" id="password"
							value="${user.password }" required>
					</div>
					<div class="form-group">
						<label for="password" class="control-label">电话:</label> <input
							type="text" name="tel" class="form-control" id="tel"
							value="${user.tel}" required>
					</div>
					<div class="form-group">
						<label for="password" class="control-label">邮件:</label> <input
							type="text" name="email" class="form-control" id="email"
							value="${user.email }" required>
					</div>
					
					

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary">更新</button>
				</div>
			</form>
		</div>
	</div>
</div>
  <!-- 用户删除模态框 --> 
<div class="modal fade removeModal" tabindex="-1" role="dialog"
	aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
			</div>
			<div class="modal-body">
				<h4>真的不要了吗?</h4>
			</div>
			<div class="modal-footer">
				<form action="ZssServlet?action=deteleuser" method="post">
					<input id="remove" name="zss" value="" hidden>
					<button type="button" class="btn btn-primary" data-dismiss="modal">留着</button>
					<button type="submit" class="btn btn-danger">删了</button>
				</form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
 </body>
<script type="text/javascript">
	// 科目删除按钮
	$(".delBtn").on("click", function() {
		$("#delid").val($(this).val());	// 获取当前点击按钮的值value值,并赋值给删除模态框的<input name="id"
	});
	// 科目编辑按钮
	 $(".edBtn").on("click", function() {
		$("#edId").val($(this).val());	// 获取当前点击按钮的值value值,并赋值给编辑模态框的<input name="id"
		$("#tm").val($(this).attr("n"));	//取按钮上的自定义属性值
		$("#km").val($(this).attr("p"));	//取按钮上的自定义属性值
		$("#type").val($(this).attr("t"));
		$("#nd").val($(this).attr("e"));
	
	}); 
	
	// 用户删除按钮
		$(".remove").on("click", function() {
			$("#remove").val($(this).val());	// 获取当前点击按钮的值value值,并赋值给删除模态框的<input name="id"
		});
		// 用户编辑按钮
		 $(".removeBtn").on("click", function() {
			$("#edId1").val($(this).val());	// 获取当前点击按钮的值value值,并赋值给编辑模态框的<input name="id"
			$("#username").val($(this).attr("n"));	//取按钮上的自定义属性值
			$("#password").val($(this).attr("p"));	//取按钮上的自定义属性值
			$("#tel").val($(this).attr("t"));
			$("#email").val($(this).attr("e"));
		
		}); 
	
	
	//显示与隐藏
	$('.one').on('click',function(){
		$('#box1').show();
		$('#box2').hide();
	});
	$('.two').on('click',function(){
		$('#box2').show();
		$('#box1').hide();
	})
	
	
	
</script>
</html>