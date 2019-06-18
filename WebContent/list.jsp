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
<script src="<%=path%>/resource/bs/js/bootstrap.min.js"></script><!-- 引入bootstrap.min.js -->
<title>用户列表</title>
</head>
<body>
	<section class="container">
		<div class="row">
			<div class="col-md-3">
				<button class="btn btn-danger" data-toggle="modal"
					data-target="#addModal">新增</button>
			</div>

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
	</section>
</body>

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
							type="text" name="nd" class="form-control" id="type"
							value="${ks1.nd}" required>
					</div>
					<div class="form-group">
						<label for="password" class="control-label">难 度:</label> <input
							type="text" name="type" class="form-control" id="nd"
							value="${ks1.type }" required>
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


<script type="text/javascript">
	// 删除按钮
	$(".delBtn").on("click", function() {
		$("#delid").val($(this).val());	// 获取当前点击按钮的值value值,并赋值给删除模态框的<input name="id"
	});
	// 编辑按钮
	 $(".edBtn").on("click", function() {
		$("#edId").val($(this).val());	// 获取当前点击按钮的值value值,并赋值给编辑模态框的<input name="id"
		$("#tm").val($(this).attr("n"));	//取按钮上的自定义属性值
		$("#km").val($(this).attr("p"));	//取按钮上的自定义属性值
		$("#type").val($(this).attr("t"));
		$("#nd").val($(this).attr("e"));
	
	}); 
</script>
</html>