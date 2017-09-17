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

td input {
	width: 100%;
}
td select {
	width: 100%;
}

td textarea {
	width: 100%;
}
</style>
</head>
<body>
	<form:form commandName="configMajorKind" action="addMajorKind.action" method="post">
		<p class="p1">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--职位设置</p>
		<div style="position: relative; left: 1030px;">
			<input type="submit" value="提交">
		</div>
		<table border="1" width="1000" align="center" bgcolor="#E0ECFF">
			<tr>
				<td width="19%" class="t1">职位分类编号</td>
				<td width="81%" >
					<form:input path="major_kind_id" value="${majorKindId}"/>
				</td>
			</tr>
			<tr>
				<td width="19%" class="t1">职位分类名称</td>
				<td width="81%" ><form:input path="major_kind_name"/></td>
			</tr>
		</table>
	</form:form>
</body>
</html>