<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="back/css/icon.css" />
<link type="text/css" rel="stylesheet" href="back/css/easyui.css" />
<style>
.t1 {
	background-color: #9BBDF2;
}
</style>
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>
</head>

<body>
	<form method="post" action="showPublicCharRegester.action">
		<p class="p1">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--公共属性设置</p>
		<div style="position: relative; left: 1000px;">
			<input type="submit" value="添加" onclick="" />
		</div>
		<table border="1" width="1000" align="center" bgcolor="#E0ECFF">
			<tr>
				<td width="45%" class="t1">属性种类</td>
				<td width="41%" class="t1">属性名称</td>
				<td width="7%" class="t1" align="center">删除</td>
			</tr>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.attribute_kind}</td>
					<td>${list.attribute_name}</td>
					<td align="center">
						<a id="btn" align="center" href="delPublicChar.action?pbc_id=${list.pbc_id}" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">删除</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>
