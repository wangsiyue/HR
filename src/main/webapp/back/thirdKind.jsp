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
	<form method="post" action="toThirdKindRegister.action">
		<p class="p1">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--III级机构设置</p>
		<div style="position: relative; left: 1030px;">
			<input type="submit" value="添加"/>
		</div>
		<table border="1" width="1000" align="center" bgcolor="#E0ECFF">
			<tr>
				<td width="18%" class="t1">I级机构名称</td>
				<td width="17%" class="t1">II级机构名称</td>
				<td width="17%" class="t1">III级机构名称</td>
				<td width="17%" class="t1">销售责任人编号</td>
				<td width="17%" class="t1">是否为零售店</td>
				<td width="7%" class="t1" align="center">变更</td>
				<td width="7%" class="t1" align="center">删除</td>
			</tr>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.first_kind_name}</td>
					<td>${list.second_kind_name}</td>
					<td>${list.third_kind_name}</td>
					<td>${list.third_kind_sale_id}</td>
					<td>${list.third_kind_is_retail}</td>
					<td align="center"><a href="tochangeThirdKind.action?ftk_id=${list.ftk_id}">变更</a></td>
					<td align="center"><a href="DelThirdKind.action?ftk_id=${list.ftk_id}">删除</a></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>
<iframe width=0 height=0></iframe>
