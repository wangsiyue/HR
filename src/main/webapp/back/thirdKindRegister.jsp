<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<form>
		<p class="p1">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--I级机构设置</p>
		<div style="position: relative; left: 1030px;">
			<input type="button" value="提交" onclick="add();">
		</div>
		<table border="1" width="1000" align="center" bgcolor="#E0ECFF">
			<tr>
				<td width="19%" class="t1">I级机构编号/名称</td>
				<td width="81%" >
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
			</tr>
			<tr>
				<td width="19%" class="t1">II级机构编号/名称</td>
				<td width="81%" >
					<input name="second_kind_id" style="width: 100%" id="cc2" class="easyui-combobox"
					data-options="
					valueField:'second_kind_id',
					textField:'second_kind_name'" />
				</td>
			</tr>
			<tr>
				<td class="t1">III级机构名称</td>
				<td ><input type="text" id="third_kind_name"/> </td>
			</tr>
			<tr>
			    <td class="t1">是否为零售店</td>
			    <td>
				    <select id="third_kind_is_retail">
				      <option value="是" selected>是</option>
				      <option value="否">否</option>
				    </select>
			    </td>
			</tr>
			<tr>
				<td class="t1">销售责任人编号（多个编号之间请用"半角逗号"加"一个空格"隔开，如", "）</td>
				<td ><textarea id="third_kind_sale_id" rows="4"></textarea></td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
function add(){
	var first_kind_id=$('input[name="first_kind_id"]').val();
	var first_kind_name=$('input[name="first_kind_id"] option:selected').text();
	var second_kind_id=$('input[name="second_kind_id"]').val();
	var second_kind_name=$('input[name="second_kind_id"] option:selected').text();
	var third_kind_name=$('#third_kind_name').val();
	var third_kind_is_retail=$('#third_kind_is_retail').val();
	var third_kind_sale_id=$('#third_kind_sale_id').val();
	alert(first_kind_name);
	alert(second_kind_name);
	$.post('addConfigFileThirdkind.action',{
		first_kind_id:first_kind_id,
		first_kind_name:first_kind_name,
		second_kind_id:second_kind_id,
		second_kind_name:second_kind_name,
		third_kind_name:third_kind_name,
		third_kind_is_retail:third_kind_is_retail,
		third_kind_sale_id:third_kind_sale_id
	},function(data){
		window.location.href=data;
	},'text');
}
</script>
</html>