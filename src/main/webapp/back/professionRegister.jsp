<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<style>
.t1 {
	background-color: #9BBDF2;
}
.t2{
	width: 100%;
}
</style>
</head>
<body>
	<form:form commandName="configPublicChar" action="addProfession.action" method="post">
		<p class="p1">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--职称设置</p>
		<div style="position: relative; left: 1030px;">
			<input type="submit" value="提交" class="BUTTON_STYLE1">
		</div>
		<table border="1" width="1000" align="center" bgcolor="#E0ECFF">
		<form:hidden path="attribute_kind" value="职称"/>
			<tr>
				<td width="17%" class="t1">职称名称</td>
				<td width="83%" class="t1"><form:input path="attribute_name"/></td>
			</tr>
		</table>
	</form:form>
</body>
</html>
