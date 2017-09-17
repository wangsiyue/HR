<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<style>
.t1 {
	background-color: #9BBDF2;
}
td input{
	width: 100%;
}
td textarea{
	width: 100%;
}
</style>
</head>
<body>
	<form:form commandName="configQuestionFirstKind" action="addQuestionFirstKindRegister.action" method="post">
		<p class="p1">您正在做的业务是：人力资源--客户化设置--题库管理设置--试题一级分类设置</p>
		<div style="position: relative; left: 1030px;">
			<input type="submit" value="提交" class="BUTTON_STYLE1">
		</div>
		<table border="1" width="1000" align="center" bgcolor="#E0ECFF">
			<tr>
				<td width="19%" class="t1">一级分类编号</td>
				<td width="81%"><form:input id="first_kind_id" readonly="true"  path="first_kind_id" value="${first_kind_id }"/></td>
			</tr>
			<tr>
				<td class="t1">一级分类名称</td>
				<td><form:input path="first_kind_name" type="text"/></td>
			</tr>
		</table>
	</form:form>
</body>
</html>
