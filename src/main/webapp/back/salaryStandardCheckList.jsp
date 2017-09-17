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
	<p class="p1">您正在做的业务是:人力资源管理--薪酬标准管理--薪酬标准登记复核</p>
    <p>当前等待复核的人力资源档案总数：<%=((java.util.List) request.getAttribute("totalList")).size()%>
	例</p>
 <table id="find_salaryStandard"></table>
<script>
//分页查看商品信息 
$('#find_salaryStandard').datagrid({
		url:'findSalaryCheckListByPage.action',
		pagination:true,
		pageSize:2,
		pageList:[2,3,4,5,6],
		columns:[[
					{field:'standard_id',title:'薪酬标准编号',width:180},
					{field:'standard_name',title:'薪酬标准名称',width:180},
					{field:'designer',title:'制定人',width:180},
					{field:'regist_time',title:'登记时间',width:180},
					{field:'salary_sum',title:'薪酬总额',width:180},
					{field:'cz',title:'复核',width:185,formatter:function(value,row,index){
						return '<a href="checkSalaryDetail.action?ssd_id='+row.ssd_id+'&standard_id='+row.standard_id+'">复核</a>';
				}}
		]]
});
</script>
</body>
</html>