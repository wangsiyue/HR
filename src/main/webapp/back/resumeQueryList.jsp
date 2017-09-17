<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="js/themes/easyui.css" />
<link rel="stylesheet" type="text/css" href="js/themes/icon.css" />

<style>
.p1{
	color:#36F;
}
</style>
</head>
<script type="text/javascript" src="js/themes/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/themes/jquery.easyui.min-1.2.0.js"></script>
<body>
<p>您正在做的业务是：人力资源--招聘管理--简历管理--简历筛选</p>
<input type="hidden" name="human_major_kind_id"/>
<input type="hidden" name="human_major_id"/>
	<input type="hidden" name="key"/>
	<input type="hidden" name="minTime"/>
	<input type="hidden" name="maxTime"/>
 <div id="find_salaryStandard"></div>
<script>
//获取路径中的值
window.onload = get;

function get(){
	var url = location.search; //获取url中"?"符后的字串
			
	var theRequest = new Object();
	if (url.indexOf("?") != -1) { 
		var str = url.substr(1); 
		var strs = str.split("&");
		var human_major_kind_id=strs[0].split("=")[1];
		var human_major_id=strs[1].split("=")[1];
		var key=strs[2].split("=")[1];
		var minTime=strs[3].split("=")[1];
		var maxTime=strs[4].split("=")[1];
		$('input[name="human_major_kind_id"]').val(human_major_kind_id);
		$('input[name="human_major_id"]').val(human_major_id);
		$('input[name="key"]').val(key);
		$('input[name="minTime"]').val(minTime);
		$('input[name="maxTime"]').val(maxTime);
	}
	var human_major_kind_id=$('input[name="human_major_kind_id"]').val();
	var human_major_id=$('input[name="human_major_id"]').val();
	var key=$('input[name="key"]').val();
	var minTime=$('input[name="minTime"]').val();
	var maxTime=$('input[name="maxTime"]').val();
	//分页查看商品信息  
	$('#find_salaryStandard').datagrid({
		url:'../findResumeByConditionAndPage.action',
		queryParams:{
			human_major_kind_id:human_major_kind_id,
			human_major_id:human_major_id,
			key:key,
			minTime:minTime,
			maxTime:maxTime
		},
		pagination:true,
		pageSize:2,
		pageList:[2,3,4,5,6],
		columns:[[
					{field:'human_name',title:'姓名',width:130},
					{field:'human_sex',title:'性别',width:130},
					{field:'human_age',title:'年龄',width:130},
					{field:'human_major_kind_name',title:'职位类别',width:130},
					{field:'human_major_name',title:'职位名称',width:130},
					{field:'human_college',title:'毕业院校',width:130},
					{field:'human_educated_major',title:'学历专业',width:130},
					{field:'cz',title:'操作',width:125,formatter:function(value,row,index){
						return '<a href="../toResumeChoose.action?res_id='+row.res_id+'">筛选</a>';
					}}
		]]
	});
}
</script>
</body>
</html>
