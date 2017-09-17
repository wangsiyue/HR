<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<link type="text/css" rel="stylesheet" href="back/css/icon.css" />
<link type="text/css" rel="stylesheet" href="back/css/easyui.css" />
<style>
.p1 {
	color: #36F;
}

p {
	margin-left: 180px;
}

td select {
	width: 100%;
	height: 30px;
	border: none;
}

.t1 {
	background-color: #9BBDF2;
	width: 200px;
}
</style>

</head>

<body>
	<p class="p1">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案更改查询</p>
	<div style="position: relative; left: 900px;">
		<input type="submit" value="查询" onclick="find();"/>
	</div>
	<table border="1" width="1000" align="center" bgcolor="#E0ECFF">
		<tr>
			<td class="t1">请选择员工所在I级机构</td>
			<td style="width: 23%">
				<input name="first_kind_id" style="width: 100%" id="cc1" class="easyui-combobox"
					data-options="   
			        valueField: 'first_kind_id',
		        	textField: 'first_kind_name',
		        	url: 'findFirstKind.action',
		        	onSelect: function(rec){
			            var url = 'findSecondKindByFirstKindId.action?first_kind_id='+rec.first_kind_id;
			            $('#cc2').combobox('reload', url);
		        }" />
			</td>
			<td></td>
		</tr>
		<tr>
			<td class="t1">请选择员工所在II级机构</td>
			<td>
				<input name="second_kind_id" style="width: 100%" id="cc2" class="easyui-combobox"
					data-options="
					valueField:'second_kind_id',
					textField:'second_kind_name',
		        	onSelect: function(rec){
			            var url = 'findThirdKindBySecondKindId.action?second_kind_id='+rec.second_kind_id;   
			            $('#cc3').combobox('reload', url);
				}" />
			</td>
			<td></td>
		</tr>
		<tr>
			<td class="t1">请选择员工所在III级机构</td>
			<td>
				<input  name="third_kind_id" style="width: 100%" id="cc3" class="easyui-combobox" data-options="valueField:'third_kind_id',textField:'third_kind_name'" />
			</td>
			<td></td>
		</tr>
		<tr>
			<td class="t1">请选择职位分类</td>
			<td>
				<input name="human_major_kind_id" style="width: 100%" id="cc4" class="easyui-combobox"
					data-options="   
			        valueField: 'human_major_kind_id',
		        	textField: 'human_major_kind_name',
		        	url: 'findMajorKind.action',
		        	onSelect: function(rec){
			            var url = 'findMajorByKindId.action?human_major_kind_id='+rec.human_major_kind_id;
			            $('#cc5').combobox('reload', url);
		        }" />
	        </td>
			<td></td>
		</tr>
		<tr>
			<td class="t1">请选择职位名称</td>
			<td>
				<input  name="human_major_id" style="width: 100%" id="cc5" class="easyui-combobox" data-options="valueField:'major_id',textField:'major_name'" />
			</td>
			<td></td>
		</tr>
		<tr>
			<td class="t1">请输入建档时间</td>
			<td><input name="minTime" id="minTime" type="text" class="easyui-datebox"
				style="width: 42%"/> 至 <input  name="maxTime" id="maxTime" type="text"
				class="easyui-datebox" style="width: 42%"/></td>
			<td>(YYYY-MM-DD)</td>
		</tr>
	</table>
</body>
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
function find(){
	var first_kind_id=$('input[name="first_kind_id"]').val();
	var second_kind_id=$('input[name="second_kind_id"]').val();
	var third_kind_id=$('input[name="third_kind_id"]').val();
	var major_kind_id=$('input[name="human_major_kind_id"]').val();
	var major_id=$('input[name="human_major_id"]').val();
	var minTime=$('input[name="minTime"]').val();
	var maxTime=$('input[name="maxTime"]').val();
	$.post('toHumanFileChangeList.action',{
		first_kind_id:first_kind_id,
		second_kind_id:second_kind_id,
		third_kind_id:third_kind_id,
		major_kind_id:major_kind_id,
		major_id:major_id,
		minTime:minTime,
		maxTime:maxTime
	},function(data){
		array = data.split(",");  
		var href=array[0]+"?first_kind_id="+first_kind_id+"&second_kind_id="+second_kind_id
		+"&third_kind_id="+third_kind_id+"&major_kind_id="+major_kind_id+"&major_id="+major_id
		+"&minTime="+minTime+"&maxTime="+maxTime+"&size="+array[1];
		window.location.href=href;
	},'text');
}
</script>
</html>