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
p{
	color:#36F;
}
td input{
	width:100%;
	border:none;
	background-color:#E0ECFF;
}
.t1 {
	background-color: #9BBDF2;
	width: 200px;
}
</style>
</head>

<body>
	<p>您正在做的业务是：人力资源--招聘管理--招聘考试管理--考试答题</p>
    <form:form action="find.action" commandName="engageResume">
	    <div style="position:relative; left:960px;">
	        <input type="submit" value="提交" />
	        <input type="reset" value="清除"/>
	    </div>
	    	<input type="hidden" id="hunma_major_name"/>
			<input type="hidden" id="human_major_kind_name"/> 
	    <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
	        <tr>
	            <td class="t1">姓名</td>
	            <td><form:input path="human_name" type="text"/></td>
	            <td class="t1">省份证号码</td>
	            <td><form:input path="human_idcard" type="text"/></td>
	        </tr>
	        <tr>
	            <td class="t1">职位分类</td>
					<td>
						<form:input path="human_major_kind_id" id="human_major_kind_id" name="human_major_kind_id" style="width: 100%" 
						class="easyui-combobox"
						data-options="   
				        valueField: 'major_kind_id',
			        	textField: 'major_kind_name',
			        	url: 'findMajorKind.action',
			        	onSelect: function(rec){
			        		$('#human_major_kind_name').val(rec.major_kind_name);
				            var url = 'findMajorByKindId.action?major_kind_id='+rec.major_kind_id;
				            $('#human_major_id').combobox('reload', url);
			        	}" />
					</td>
					<td class="t1">职位名称</td>
					<td>
						<form:input path="human_major_id" id="human_major_id" name="human_major_id" style="width: 100%" 
						class="easyui-combobox"
						data-options="valueField:'major_id',textField:'major_name',onSelect: function(rec){
			        	$('#human_major_name').val(rec.major_name);
			        }" /></td>
	        </tr>
	    </table>
    </form:form>
</body>
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
/* function find(){
	var name=$('#name').val();
	var idcard=$('#idcard').val();
	var human_major_kind_id=$('input[name="human_major_kind_id"]').val();
	var human_major_id=$('input[name="human_major_id"]').val();
	$.post('find.action',{
		name:name,
		idcard:idcard,
		human_major_kind_id:human_major_kind_id,
		human_major_id:human_major_id
	},function(data){
		array = data.split(",");  
		var href=array[0]+"?name="+first_kind_id+"&second_kind_id="+second_kind_id
		+"&third_kind_id="+third_kind_id+"&major_kind_id="+major_kind_id+"&major_id="+major_id
		+"&minTime="+minTime+"&maxTime="+maxTime+"&size="+array[1];
		window.location.href=href;
	},'text');
} */
</script>
</html>
