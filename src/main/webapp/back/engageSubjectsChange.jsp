<%@page import="com.yc.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

td form:input {
	width: 100%;
}

td textarea {
	width: 100%;
}
</style>
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
function del(){
	var sub_id=$('#sub_id').val();
	$.post('toDeleteEngageSubjects.action',{
		sub_id:sub_id
	},function(data){
		window.location.href=data;
	},'text');
}
</script>
</head>
<body>
	<form:form action="changeEngageSubjects.action" commandName="engageSubjects">
		<p class="p1">您正在做的业务是：人力资源--招聘管理--招聘考试题库管理--试题变更 </p>
		<div style="position: relative; left: 900px;">
			<input type="submit" value="提交">
			<input type="button" value="返回" onclick="history.back();">
			<input type="button" value="删除" onclick="del();">
		</div>
		<form:hidden path="first_kind_id" name="first_kind_id" id="first_kind_id" value="${engageSubjects.second_kind_id }"/> 
		<form:hidden path="second_kind_id" name="second_kind_id" id="second_kind_id" value="${engageSubjects.second_kind_id }"/>
		<form:hidden path="sub_id" name="sub_id" velue="${engageSubjects.sub_id }"/>
		<table border="1" width="1000" align="center" bgcolor="#E0ECFF">
			<tr class="t1">
				<td width="8%" nowrap class="t1">试题I级分类</td>
				<td width="14%">
					<form:input path="first_kind_name" id="first_kind_name" name="first_kind_name" style="width: 100%" value="${engageMajorRelease.first_kind_name }"/>
				</td>
				<td width="8%" nowrap class="t1">试题II级分类</td>
				<td width="14%">
				<form:input path="second_kind_name" id="second_kind_name" name="second_kind_name" style="width: 100%" value="${engageMajorRelease.second_kind_name }"/>
				</td>
				<td width="8%" nowrap class="t1">登记人</td>
				<td width="14%">
					<form:input path="changer" name="changer" id="changer" value="${user }" />
				</td>
				<td width="8%" class="t1">登记时间</td>
				<td width="14%">
					<form:input path="change_time" name="change_time" id="change_time" value="${date}" />
				</td>
			</tr>
			<tr>
				<td class="t1">题干</td>
				<td colspan="7">
					<form:textarea path="content" name="content" rows="4" vlaue="${engageMajorRelease.content }"/>
				</td>
			</tr>
			<tr>
				<td class="t1">答案a</td>
				<td colspan="7">
					<form:textarea path="key_a" name="key_a" rows="4" vlaue="${engageMajorRelease.key_a }"/>
				</td>
			</tr>
			<tr>
				<td class="t1">答案b</td>
				<td colspan="7">
					<form:textarea path="key_b" name="key_b" rows="4" vlaue="${engageMajorRelease.key_b }"/>
				</td>
			</tr>
			<tr>
				<td class="t1">答案c</td>
				<td colspan="7">
					<form:textarea path="key_c" name="key_c" rows="4" vlaue="${engageMajorRelease.key_c }"/>
				</td>
			</tr>
			<tr>
				<td class="t1">答案d</td>
				<td colspan="7">
					<form:textarea path="key_d" name="key_d" rows="4" vlaue="${engageMajorRelease.key_d }"/>
				</td>
			</tr>
			<tr>
				<td class="t1">答案e</td>
				<td colspan="7">
					<form:textarea path="key_e" name="key_e" rows="4" vlaue="${engageMajorRelease.key_e }"/>
				</td>
			</tr>
			<tr>
				<td class="t1">正确答案</td>
				<td>
					<form:input path="correct_key" vlaue="${engageMajorRelease.correct_key }"/>
				</td>
				<td class="t1">试题出处</td>
				<td>
					<form:input path="derivation" vlaue="${engageMajorRelease.derivation }"/>
				</td>
				<td class="t1"></td>
				<td></td>
				<td class="t1"></td>
				<td></td>
			</tr>
		</table>
	</form:form>
</body>
</html>