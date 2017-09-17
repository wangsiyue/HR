<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="back/js/themes/easyui.css" />
<link rel="stylesheet" type="text/css" href="back/js/themes/icon.css" />

<style>
.p1{
	color:#36F;
}
</style>
</head>
<script type="text/javascript" src="back/js/themes/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="back/js/themes/jquery.easyui.min-1.2.0.js"></script>
<body>
<p>您正在做的业务是：人力资源--招聘管理--招聘考试管理--考试出题</p>
 <table id="dg"></table> 
</body>
<script type="text/javascript">
	$('#dg').datagrid({
		url:'showEngageExamRegisterList.action',
		pagination:true,
		pageSize:2,
		pageList:[2,3,4,5,6],
		columns:[[
				{field:'major_kind_id',align:'center',title:'职位分类编号',width:180},
				{field:'major_kind_name',align:'center',title:'职位分类名称',width:180},
				{field:'major_id',align:'center',title:'职位编号',width:180},
		        {field:'major_name',align:'center',title:'职位名称',width:180},
		        {field:'test_amount',title:'套题数量',width:180},
     	  		{field:'cz1',title:'操作',width:155,formatter:function(value,row,index){
					return '<a href="toEngageExamRegister.action?mak_id='+row.mak_id+'">出题</a>';
				}}
		]]
	});
</script>
</body>
</html>
