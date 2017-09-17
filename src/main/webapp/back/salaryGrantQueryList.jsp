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
	<p class="p1">您正在做的业务是:人力资源管理--薪酬标准管理--薪酬发放查询</p>
    <p>符合条件的薪酬发放总数:<label id="totalList"></label>
	例</p>
	<input type="hidden" name="salary_grant_id"/>
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
		var salary_grant_id=strs[0].split("=")[1];
		var key=strs[1].split("=")[1];
		var minTime=strs[2].split("=")[1];
		var maxTime=strs[3].split("=")[1];
		var size=strs[4].split("=")[1];
		document.getElementById("totalList").innerHTML=size;
		$('input[name="salary_grant_id"]').val(salary_grant_id);
		$('input[name="key"]').val(key);
		$('input[name="minTime"]').val(minTime);
		$('input[name="maxTime"]').val(maxTime);
	}
	var salary_grant_id=$('input[name="salary_grant_id"]').val();
	var key=$('input[name="key"]').val();
	var minTime=$('input[name="minTime"]').val();
	var maxTime=$('input[name="maxTime"]').val();
	//分页查看商品信息  
	$('#find_salaryStandard').datagrid({
		url:'../findSalaryGrantByConditionAndPage.action',
		queryParams:{
			salary_grant_id:salary_grant_id,
			key:key,
			minTime:minTime,
			maxTime:maxTime
		},
		pagination:true,
		pageSize:2,
		pageList:[2,3,4,5,6],
		columns:[[
		          
				{field:'first_kind_name',title:'I级机构',width:185},
				{field:'second_kind_name',title:'II级机构',width:185},
				{field:'human_amount',title:'总人数',width:185},
				{field:'salary_paid_sum',title:'实发总金额',width:185},
				{field:'regist_time',title:'登记时间',width:185},
				{field:'cz',title:'查看详情',width:185,formatter:function(value,row,index){
					return '<a href="../toshowfindSalaryGrantDetsilsBySalaryGrantId.action?salary_grant_id='+row.salary_grant_id+'">查看发放记录</a>';
				}}
			]]
	});
}
</script>
</body>
</html>