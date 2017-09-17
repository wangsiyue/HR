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
.t2{
	width: 100%;
}
</style>
</head>
<body>
	<form:form commandName="configPublicChar" action="addConfigPublicChar.action" method="post">
		<p class="p1">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--I级机构设置</p>
		<div style="position: relative; left: 1030px;">
			<input type="submit" value="提交" class="BUTTON_STYLE1">
		</div>
		<table border="1" width="1000" align="center" bgcolor="#E0ECFF">
			<tr>
				<td width="19%" class="t1">属性种类</td>
				<td width="81%">
					<form:select path="attribute_kind" class="t2">
						<option value="国籍">国籍</option>
						<option value="民族">民族</option>
						<option value="政治面貌">政治面貌</option>
						<option value="宗教信仰">宗教信仰</option>
						<option value="爱好">爱好</option>
						<option value="特长">特长</option>
						<option value="教育年限">教育年限</option>
						<option value="学历">学历</option>
						<option value="专业">专业</option>
						<option value="培训项目">培训项目</option>
						<option value="培训等级">培训等级</option>
						<option value="奖励项目">奖励项目</option>
						<option value="奖励等级">奖励等级</option>
					</form:select>
				</td>
			</tr>
			<tr>
				<td class="t1">属性名称</td>
				<td>
					<form:input class="t2" path="attribute_name" type="text"/>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>