<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<table width="300" align="center" bgcolor="#E0ECFF">
			<tr>
				<td width="60%" class="t1">项目名</td>
				<td width="20%" class="t1" align="center">操作</td>
				<td width="20%" class="t1" align="center">操作</td>
			</tr>
			<c:forEach items="${configPublicCharList}" var="list">
				<c:if test="${list.attribute_kind=='薪酬设置'}">
					<tr>
						<form:form commandName="configPublicChar" action="updSalaryProject.action" method="post">
							<form:hidden path="pbc_id" value="${list.pbc_id}"/>
							<td>
								<form:input path="attribute_name" class="easyui-validatebox" value="${list.attribute_name}" />
							</td>
							<td>
								<input id="submit" type="submit" value="修改"/>
							</td>
						</form:form>
						<form:form commandName="configPublicChar" action="delSalaryProject.action" method="post">
							<form:hidden path="pbc_id" value="${list.pbc_id}"/>
							<td>
								<input id="submit" type="submit" value="删除"/>
							</td>
						</form:form>
					</tr>
				</c:if>
			</c:forEach>
			<form:form commandName="configPublicChar" action="addSalaryProject.action" method="post">
				<tr>
					<td>
						<form:input path="attribute_name" class="easyui-validatebox"/>
					</td>
					<td></td>
					<td>
						<input id="submit" type="submit" value="添加" onClick="add()"/>
					</td>
				</tr>
			</form:form>
		</table>
</body>
</html>