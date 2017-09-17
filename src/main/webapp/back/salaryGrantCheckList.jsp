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
	<p class="p1">您正在做的业务是：人力资源--薪酬发放管理--薪酬发放登记复核</p>
    <p>当前等待复核的薪酬发放总数：<%=((java.util.List) request.getAttribute("totalList")).size()%>
	例</p>
 <table id="find_salaryGrant"></table>
<script>

$('#find_salaryGrant').datagrid({
		url:'findCheckSalaryGrantListByPage.action',
		pagination:true,
		pageSize:2,
		pageList:[2,3,4,5,6],
		columns:[[
					{field:'human_id',title:'档案编号',width:185},
					{field:'bouns_sum',title:'奖励金额',width:185,editor:{type:'text'},formatter:function(value,row,index){
						return '<input name="bouns_sum" value="'+row.bouns_sum+'" onchange="change(this);"/>';
					}},
					{field:'sale_sum',title:'销售绩效金额',width:185,editor:{type:'text'},formatter:function(value,row,index){
						return '<input name="sale_sum" value="'+row.sale_sum+'"/>';
					}},
					{field:'deduct_sum',title:'应扣金额',width:185,editor:{type:'text'},formatter:function(value,row,index){
						return '<input name="deduct_sum" value="'+row.deduct_sum+'"/>';
					}},
					{field:'cz',title:'复核',width:155,formatter:function(value,row,index){
						return '<a href="checkSalaryGrant.action?salary_grant_id='+row.salary_grant_id
								+'&bouns_sum='+row.bouns_sum+'&human_id='+row.human_id+
								'&sale_sum='+row.sale_sum+'&deduct_sum='+row.deduct_sum+'">复核</a>';
				}}
		]]
});
function change(a){
	alert(a.value);
	//获取值
	var val=a.value;
	//获取第几行第几个格赋值
	
}

</script>
</body>
</html>