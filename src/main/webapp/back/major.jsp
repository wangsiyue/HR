<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<style>
.t1 {
	background-color: #9BBDF2;
}
</style>
</head>

<body>
	<form method="post" action="toMajorRegister.action">
		<p class="p1">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--职位设置</p>
		<div style="position: relative; left: 1000px;">
			<input type="submit" value="添加"/>
		</div>
		<table border="1" width="1000" align="center" bgcolor="#E0ECFF">
			<tr>
				<td width="22%" class="t1">职位分类编号</td>
				<td width="23%" class="t1">职位分类名称</td>
				<td width="26%" class="t1">职位编号</td>
				<td width="24%" class="t1">职位名称</td>
				<td width="5%" class="t1" align="center">删除</td>
			</tr>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.major_kind_id}</td>
					<td>${list.major_kind_name}</td>
					<td>${list.major_id}</td>
					<td>${list.major_name}</td>
					<td align="center"><a href="delMajor.action?mak_id=${list.mak_id}">删除</a></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>
<iframe width=0 height=0></iframe>
