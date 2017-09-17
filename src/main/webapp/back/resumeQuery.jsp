<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<link type="text/css" rel="stylesheet" href="back/css/icon.css" />
<link type="text/css" rel="stylesheet" href="back/css/easyui.css" />
<style>
p{
	margin-left:180px;
	color:#36F;
}
select{
	width:100%;
	height:50px;
	border:none;
}
td input{
	width:100%;
	border:none;
}
.t1{
	background-color:#9BBDF2;
}
.t2{
	width:360px;
}
</style>
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
function find(){
	var human_major_kind_id=$('#human_major_kind_id').val();
	var human_major_id=$('#human_major_id').val();
	var key=$('input[name="key"]').val();
	var minTime=$('input[name="minTime"]').val();
	var maxTime=$('input[name="maxTime"]').val();
	$.post('toResumeQueryList.action',{
		human_major_kind_id:human_major_kind_id,
		human_major_id:human_major_id,
		key:key,
		minTime:minTime,
		maxTime:maxTime
	},function(data){
		array = data.split(",");  
		var href=array[0]+"?human_major_kind_id="+human_major_kind_id
				+"&human_major_id="+human_major_id+"&key="+key
		+"&minTime="+minTime+"&maxTime="+maxTime+"&size="+array[1];
		window.location.href=href;
	},'text');
}
</script>
</head>

<body>
	<p>您正在做的业务是：人力资源--招聘管理--简历管理--简历筛选</p>
    <form>
    <div style="position:relative; left:900px;">
        <input type="button" onclick="find();" value="查询"/>
    </div>
    <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
        <tr>
            <td class="t1">请选择职位分类</td>
            <td><input id="human_major_kind_id" name="human_major_kind_id"
					class="easyui-combobox" style="width: 47%"
					data-options="   
			        valueField: 'major_kind_id',
		        	textField: 'major_kind_name',
		        	url: 'findMajorKind.action',
		        	onSelect: function(rec){
		        		$('#human_major_kind_id').val(rec.major_kind_id);
			            var url = 'findMajorByKindId.action?major_kind_id='+rec.major_kind_id;
			            $('#human_major_id').combobox('reload', url);
		        	}" />
		        	<input id="human_major_id" name="human_major_id" 
					class="easyui-combobox"  style="width: 49%"
					data-options="valueField:'major_id',textField:'major_name',onSelect: function(rec){
		        	$('#human_major_id').val(rec.major_id);
		        }" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td class="t1">请输入关键字</td>
            <td><input type="text" name="key" id="key"/></td>
            <td></td>
        </tr>
        <tr>
            <td class="t1">请输入登记时间</td>
            <td><input name="minTime" id="minTime" type="text" class="easyui-datebox"
				style="width: 42%"/> 至 <input  name="maxTime" id="maxTime" type="text"
				class="easyui-datebox" style="width: 42%"/></td>
			<td>(YYYY-MM-DD)</td> 
        </tr>
    </table>
    </form>
</body>
</html>
