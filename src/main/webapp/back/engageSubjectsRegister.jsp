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
</head>
<body>
	<form:form action="addEngageSubjects.action" commandName="engageSubjects">
		<p class="p1">您正在做的业务是：人力资源--招聘管理--招聘考试题库管理--试题登记</p>
		<div style="position: relative; left: 980px;">
			<input type="submit" value="提交">
			<input type="button" value="清除">
		</div>
		<form:hidden path="first_kind_name" name="first_kind_name" id="first_kind_name"/> 
		<form:hidden path="second_kind_name" name="second_kind_name" id="second_kind_name"/>
		<table border="1" width="1000" align="center" bgcolor="#E0ECFF">
			<tr class="t1">
				<td width="8%" nowrap class="t1">试题I级分类</td>
				<td width="14%">
					<form:input path="first_kind_id" id="first_kind_id" name="first_kind_id" style="width: 100%"
					class="easyui-combobox"
					data-options="   
			        valueField: 'first_kind_id',
		        	textField: 'first_kind_name',
		        	url: 'findQuestionFirstKind.action',
		        	onSelect: function(rec){
		        		$('#first_kind_name').val(rec.first_kind_name);
			            var url = 'findQuestionSecondKindByFirstKindId.action?first_kind_id='+rec.first_kind_id;
			            $('#second_kind_id').combobox('reload', url);
		        	}" />
				</td>
				<td width="8%" nowrap class="t1">试题II级分类</td>
				<td width="14%">
				<form:input path="second_kind_id" id="second_kind_id" name="second_kind_id" style="width: 110%"
					 class="easyui-combobox"
					data-options="valueField:'second_kind_id',textField:'second_kind_name',
				onSelect: function(rec){ 
 		        		$('#second_kind_name').val(rec.second_kind_name);
 				}" />
				</td>
				<td width="8%" nowrap class="t1">登记人</td>
				<td width="14%">
					<form:input path="register" class="easyui-validatebox" name="register" id="register"
					 value="${user }" />
				</td>
				<td width="8%" class="t1">登记时间</td>
				<td width="14%">
					<form:input path="regist_time" name="regist_time" id="regist_time" value="${date}" />
				</td>
			</tr>
			<tr>
				<td class="t1">题干</td>
				<td colspan="7">
					<form:textarea path="content" name="content" rows="4" />
				</td>
			</tr>
			<tr>
				<td class="t1">答案a</td>
				<td colspan="7">
					<form:textarea path="key_a" name="key_a" rows="4" />
				</td>
			</tr>
			<tr>
				<td class="t1">答案b</td>
				<td colspan="7">
					<form:textarea path="key_b" name="key_b" rows="4" />
				</td>
			</tr>
			<tr>
				<td class="t1">答案c</td>
				<td colspan="7">
					<form:textarea path="key_c" name="key_c" rows="4" />
				</td>
			</tr>
			<tr>
				<td class="t1">答案d</td>
				<td colspan="7">
					<form:textarea path="key_d" name="key_d" rows="4" />
				</td>
			</tr>
			<tr>
				<td class="t1">答案e</td>
				<td colspan="7">
					<form:textarea path="key_e" name="key_e" rows="4" />
				</td>
			</tr>
			<tr>
				<td class="t1">正确答案</td>
				<td>
					<form:input path="correct_key"/>
				</td>
				<td class="t1">试题出处</td>
				<td>
					<form:input path="derivation"/>
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