<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="back/js/themes/easyui.css" />
<link rel="stylesheet" type="text/css" href="back/js/themes/icon.css" />

<script type="text/javascript" src="back/js/themes/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="back/js/themes/jquery.easyui.min-1.2.0.js"></script>
<style>
.p1{
	color:#36F;
}
</style>
</head>

<body>
	<p class="p1">您正在做的业务是:人力资源管理--薪酬标准管理--薪酬发放详情</p>
    <p>符合条件的薪酬发放总数:<label>${size}</label>
	例</p>
	<input type="hidden" name="salary_grant_id" value="${ salary_grant_id }"/>
 <div id="find_salaryStandard"></div>
<script>
//获取路径中的值
window.onload = get;

function get(){
	var salary_grant_id=$('input[name="salary_grant_id"]').val();
	//分页查看商品信息  
	$('#find_salaryStandard').datagrid({
		url:'findSalaryGrantDetsilsBySalaryGrantId.action',
		queryParams:{
			salary_grant_id:salary_grant_id
		},
		pagination:true,
		pageSize:2,
		pageList:[2,3,4,5,6],
		columns:[[
				{field:'human_id',title:'档案编号',width:155},
				{field:'human_name',title:'姓名',width:155},
				{field:'bouns_sum',title:'奖励金额',width:155,editor:{type:'text'},formatter:function(value,row,index){
					return row.bouns_sum; 
				}},
				{field:'sale_sum',title:'销售绩效金额',width:155,editor:{type:'text'},formatter:function(value,row,index){
					return row.sale_sum;
				}},
				{field:'deduct_sum',title:'应扣金额',width:155,editor:{type:'text'},formatter:function(value,row,index){
					return row.deduct_sum;
				}},
				{field:'salary_standard_sum',title:'标准薪酬总额',width:170},
				{field:'salary_paid_sum',title:'实发薪酬总额',width:170},
			]]
	});
}
</script>
</body>
</html>