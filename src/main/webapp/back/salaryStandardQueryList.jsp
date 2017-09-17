<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="js/themes/easyui.css" />
<link rel="stylesheet" type="text/css" href="js/themes/icon.css" />

<script type="text/javascript" src="js/themes/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/themes/jquery.easyui.min-1.2.0.js"></script>

<style>
.p1{
	color:#36F;
}
</style>
</head>

<body>
	<p class="p1">您正在做的业务是:人力资源管理--薪酬标准管理--薪酬标准登记查询</p>
    <p>符合条件的薪酬标准总数:<label id="totalList"></label>
	例</p>
	<input type="hidden" name="standard_id"/>
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
		var standard_id=strs[0].split("=")[1];
		var key=strs[1].split("=")[1];
		var minTime=strs[2].split("=")[1];
		var maxTime=strs[3].split("=")[1];
		var size=strs[4].split("=")[1];
		document.getElementById("totalList").innerHTML=size;
		$('input[name="standard_id"]').val(standard_id);
		$('input[name="key"]').val(key);
		$('input[name="minTime"]').val(minTime);
		$('input[name="maxTime"]').val(maxTime);
	}
	var standard_id=$('input[name="standard_id"]').val();
	var key=$('input[name="key"]').val();
	var minTime=$('input[name="minTime"]').val();
	var maxTime=$('input[name="maxTime"]').val();
	//分页查看商品信息  
	$('#find_salaryStandard').datagrid({
		url:'../findSalaryStandardByConditionAndPage.action',
		queryParams:{
			standard_id:standard_id,
			key:key,
			minTime:minTime,
			maxTime:maxTime
		},
		pagination:true,
		pageSize:2,
		pageList:[2,3,4,5,6],
		columns:[[
					{field:'standard_id',title:'薪酬标准编号',width:200},
					{field:'standard_name',title:'薪酬标准名称',width:200},
					{field:'designer',title:'制定人',width:180},
					{field:'regist_time',title:'登记时间',width:200},
					{field:'salary_sum',title:'薪酬总额',width:165},
					{field:'cz',title:'操作',width:165,formatter:function(value,row,index){
						return '<a href="../showSalaryStandardChange.action?ssd_id='+row.ssd_id+'&standard_id='+row.standard_id+'">变更</a>';
					}}
		]]
	});
}
</script>
</body>
</html>