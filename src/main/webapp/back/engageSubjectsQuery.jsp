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
	<p class="p1">您正在做的业务是：人力资源--招聘管理--招聘考试题库管理--试题查询 </p>
	<div style="position: relative; left: 850px;">
		<input type="button" value="EXCEL列表" onclick="javascript:doExport('excel');"/> 
		<input type="submit" value="查询" onclick="find();"/>
		<input type="button" value="搜索" onclick="search();"/>
	</div>
	<table border="1" width="1000" align="center" bgcolor="#E0ECFF">
		<tr>
			<td class="t1">请选择试题分类</td>
			<td><select id="first_kind_name">
				<option></option>
				<c:forEach items="${list}" var="list">
					<option value="${list.first_kind_name }">${list.first_kind_name}</option>
				</c:forEach>
			</select></td>
            <td></td>
		</tr>
		<tr>
            <td class="t1">请输入关键字</td>
            <td><input type="text" name="key"/></td>
            <td></td>  
        </tr>
        <tr>
            <td class="t1">请输入发放时间</td>
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
	var first_kind_name=$('#first_kind_name').val();
	var key=$('input[name="key"]').val();
	var minTime=$('input[name="minTime"]').val();
	var maxTime=$('input[name="maxTime"]').val();
	$.post('toengageSubjectsQueryList.action',{
		first_kind_name:first_kind_name,
		key:key,
		minTime:minTime,
		maxTime:maxTime
	},function(data){
		array = data.split(",");  
		var href=array[0]+"?first_kind_name="+first_kind_name+"&key="+key
		+"&minTime="+minTime+"&maxTime="+maxTime+"&size="+array[1];
		window.location.href=href;
	},'text');
}
</script>
</html>