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
	<p class="p1">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案登记复核</p>
    <p>当前等待复核的人力资源档案总数：<%=((java.util.List) request.getAttribute("totalList")).size()%>
	例</p>
 <table id="find_humanFile"></table>
<script>

//分页查看商品信息 
$('#find_humanFile').datagrid({
		url:'findCheckListByPage.action',
		pagination:true,
		pageSize:2,
		pageList:[2,3,4,5,6],
		columns:[[
					{field:'human_id',title:'档案编号',width:135},
					{field:'human_name',title:'姓名',width:135},
					{field:'human_sex',title:'性别',width:135},
					{field:'first_kind_name',title:'I级机构',width:135},
					{field:'second_kind_name',title:'II级机构',width:135},
					{field:'third_kind_name',title:'III级机构',width:135},
					{field:'human_pro_designation',title:'职称',width:135},
					{field:'cz',title:'复核',width:115,formatter:function(value,row,index){
						return '<a href="checkFileDetail.action?human_id='+row.human_id+'">复核</a>';
				}}
		]]
});
</script>
</body>
</html>