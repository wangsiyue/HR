<%@page import="com.yc.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<link type="text/css" rel="stylesheet" href="back/css/icon.css" />
<link type="text/css" rel="stylesheet" href="back/css/easyui.css" />
<style>


.t1 {
	background-color: #9BBDF2;
}

td textarea {
	width: 100%;
	border: none;
	height: 80px;
}
</style>
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
function add(){
	var first_kind_id=$('#first_kind_id').val();
	var first_kind_name=$('#first_kind_name').val();
	var second_kind_id=$('#second_kind_id').val();
	var second_kind_name=$('#second_kind_name').val();
	var third_kind_name=$('#third_kind_name').val();
	var third_kind_id=$('#third_kind_id').val();
	var major_kind_id=$('#major_kind_id').val();
	var major_kind_name=$('#major_kind_name').val();
	var major_id=$('#major_id').val();
	var major_name=$('#major_name').val();
	
	var engage_type=$('#engage_type').val();
	var human_amount=$('#human_amount').val();
	var deadline=$('#deadline').val();
	var register=$('#register').val();
	var regist_time=$('#regist_time').val();
	var major_describe=$('#major_describe').val();
	var engage_required=$('#engage_required').val();
	$.post('addEngageMajorRelease.action',{
		first_kind_id:first_kind_id,
		first_kind_name:first_kind_name,
		second_kind_id:second_kind_id,
		second_kind_name:second_kind_name,
		third_kind_name:third_kind_name,
		third_kind_id:third_kind_id,
		major_kind_id:major_kind_id,
		major_kind_name:major_kind_name,
		major_id:major_id,
		major_name:major_name,
		third_kind_name:third_kind_name,
		engage_type:engage_type,
		human_amount:human_amount,
		deadline:deadline,
		register:register,
		regist_time:regist_time,
		major_describe:major_describe,
		engage_required:engage_required
	},function(data){
		window.location.href=data;
	},'text'); 
}

</script>
</head>
<body>
	<p>您正在做的业务是：人力资源--招聘管理--职位发布管理--职位发布登记</p>
	<form method="post">
		<div style="position: relative; left: 960px;">
			<input type="button" value="提交" onclick="add();"/> 
			<input type="button" value="返回" />
		</div>
		<input name="second_kind_name" id="second_kind_name" type="hidden" />
		<input name="third_kind_name" id="third_kind_name" type="hidden" />
		<input name="major_name" id="major_name" type="hidden" />
		<input name="major_kind_name" id="major_kind_name" type="hidden" /> 
		<input name="first_kind_name" id="first_kind_name" type="hidden" />
		<table border="1" width="1000" align="center" bgcolor="#E0ECFF">
			<tr>
				<td class="t1">I级机构</td>
				<td><input id="first_kind_id" name="first_kind_id" class="easyui-combobox"
					data-options="   
			        valueField: 'first_kind_id',
		        	textField: 'first_kind_name',
		        	url: 'findFirstKind.action',
		        	onSelect: function(rec){
		        		$('#first_kind_name').val(rec.first_kind_name);
		        		$('#first_kind_id').val(rec.first_kind_id);
			            var url = 'findSecondKindByFirstKindId.action?first_kind_id='+rec.first_kind_id;
			            $('#second_kind_id').combobox('reload', url);
		        	}" />
				</td>
				<td class="t1">II 级机构</td>
				<td><input id="second_kind_id" name="second_kind_id"  class="easyui-combobox"
					data-options="
					valueField:'second_kind_id',
					textField:'second_kind_name',
		        	onSelect: function(rec){
		        		$('#second_kind_id').val(rec.second_kind_id);
		        		$('#second_kind_name').val(rec.second_kind_name);
			            var url = 'findThirdKindBySecondKindId.action?second_kind_id='+rec.second_kind_id;   
			            $('#third_kind_id').combobox('reload', url);
					}" />
				</td>
				<td class="t1">III级机构</td>
				<td><input id="third_kind_id" name="third_kind_id" class="easyui-combobox"
					data-options="valueField:'third_kind_id',textField:'third_kind_name',
				onSelect: function(rec){ 
						$('#third_kind_id').val(rec.third_kind_id);
 		        		$('#third_kind_name').val(rec.third_kind_name);
 				}" />
				<td class="t1">招聘类型</td>
				<td><select id="engage_type" name="engage_type">
						<option value="校园招聘">校园招聘</option>
						<option value="社会招聘">社会招聘</option>
					</select>
				</td>
			<tr>
				<td class="t1">职位分类</td>
				<td><input  id="major_kind_id" name="major_kind_id" class="easyui-combobox"
					data-options="   
			        valueField: 'major_kind_id',
		        	textField: 'major_kind_name',
		        	url: 'findMajorKind.action',
		        	onSelect: function(rec){
		        	$('#major_kind_id').val(rec.major_kind_id);
		        		$('#major_kind_name').val(rec.major_kind_name);
			            var url = 'findMajorByKindId.action?major_kind_id='+rec.major_kind_id;
			            $('#major_id').combobox('reload', url);
		        	}" />
				</td>
				<td class="t1">职位名称</td>
				<td><input id="major_id" name="major_id" class="easyui-combobox"
					data-options="valueField:'major_id',textField:'major_name',onSelect: function(rec){
		        	$('#major_id').val(rec.major_id);
		        	$('#major_name').val(rec.major_name);
		        }" />
				</td>
				<td class="t1">招聘人数</td>
				<td><input id="human_amount" name="human_amount" type="text" /></td>
				<td class="t1">截止日期</td>
				<td>
					<input id="deadline" name="deadline" class="easyui-datebox"  value="2017-4-6"/>
				</td>
			<tr>
				<!-- <td class="t1">变更人</td>
				<td><input id="changer" name="changer" type="text"
					value="admin" /></td> -->
				<td class="t1">登记人</td>
				<td><input id="register" name="register" type="text"
					value="<% 
					Users user=(Users)session.getAttribute("user");
					out.print(user.getU_true_name()); 
				%>" /></td>
				<td class="t1">登记时间</td>
				<td><input id="regist_time" name="regist_time"  type="text"
					value=" ${date}" /></td>
				<td class="t1"></td>
				<td></td>
				<td class="t1"></td>
				<td></td>
			</tr>
			<tr>
				<td class="t1">职位描述</td>
				<td colspan="7"><textarea name="major_describe"
						id="major_describe"></textarea></td>
			</tr>
			<tr>
				<td class="t1">招聘要求</td>
				<td colspan="7"><textarea name="engage_required"
						id="engage_required"></textarea></td>
			</tr>
		</table>
	</form>
</body>
</html>
