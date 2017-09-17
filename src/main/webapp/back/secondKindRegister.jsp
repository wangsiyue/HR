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
	<form:form commandName="configFileSecondKind"
		action="addConfigFileSecondkind.action" method="post">
		<p class="p1">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--I级机构设置</p>
		<div style="position: relative; left: 1030px;">
			<input type="submit" value="提交">
		</div>
		<table border="1" width="1000" align="center" bgcolor="#E0ECFF">
			<tr>
				<td width="19%" class="t1">I级机构编号/名称</td>
				<td width="81%" >
					<form:select path="first_kind_id">
						<c:forEach items="${list }" var="list">
							<option value="${list.first_kind_id }/${list.first_kind_name }">${list.first_kind_id }/${list.first_kind_name }</option>
						</c:forEach>
					</form:select>
				</td>
			</tr>
			<tr>
				<td class="t1">II级机构名称</td>
				<td ><form:input type="text" path="second_kind_name"/> </td>
			</tr>
			<tr>
				<td class="t1">薪酬发放责任人编号（多个编号之间请用"半角逗号"加"一个空格"隔开，如", "）</td>
				<td ><form:textarea path="second_salary_id" rows="4"></form:textarea></td>
			</tr>
			<tr>
				<td class="t1">销售责任人编号（多个编号之间请用"半角逗号"加"一个空格"隔开，如", "）</td>
				<td ><form:textarea path="second_sale_id" rows="4"></form:textarea></td>
			</tr>
		</table>
	</form:form>
</body>
</html>