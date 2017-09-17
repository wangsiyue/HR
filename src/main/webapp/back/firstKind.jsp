<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style>
.t1 {
	background-color: #9BBDF2;
}
</style>
</head>

<body>
	<form method="post" action="toFirstKindRegister.action">
		<p class="p1">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--I级机构设置</p>
		<div style="position: relative; left: 1030px;">
			<input type="submit" value="添加"/>
		</div>
		 <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
			<tr>
				<td width="20%" class="t1">I级机构编号</td>
				<td width="20%" class="t1">I级机构名称</td>
				<td width="25%" class="t1">薪酬发放责任人编号</td>
				<td width="25%" class="t1">销售责任人编号</td>
				<td width="5%" class="t1" align="center">变更</td>
				<td width="5%" class="t1" align="center">删除</td>
			</tr>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.first_kind_id}</td>
					<td>${list.first_kind_name}</td>
					<td>${list.first_kind_salary_id}</td>
					<td>${list.first_kind_sale_id}</td>
					<td align="center"><a href="tochangeFirstKind.action?first_kind_id=${list.first_kind_id}">变更</a></td>
					<td align="center"><a href="showFirstKindDelete.action?first_kind_id=${list.first_kind_id}">删除</a></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>
<iframe width=0 height=0></iframe>
