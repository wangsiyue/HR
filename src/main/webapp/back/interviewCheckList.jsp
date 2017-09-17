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
<p>您正在做的业务是：人力资源--招聘管理--面试管理--面试筛选</p>
 <table id="dg"></table> 
</body>
<script type="text/javascript">
	$('#dg').datagrid({
		url:'showInterviewCheckList.action',
		pagination:true,
		pageSize:2,
		pageList:[2,3,4,5,6],
		columns:[[
				{field:'human_name',align:'center',title:'姓名',width:140},
		        {field:'human_major_kind_name',title:'职位类别 ',width:150},
		        {field:'human_major_name',title:'职位名称',width:150},
		        {field:'interview_amount',title:'面试次数',width:150},
		        {field:'registe_time',title:'面试时间',width:150},
		        {field:'multi_quality_degree',title:'综合素质',width:140},
     	  		{field:'cz',title:'操作',width:140,formatter:function(value,row,index){
					return '<a href="toInterviewCheck.action?ein_id='+row.ein_id+'">筛选</a>';
				}}
		]]
	});
</script>
</body>
</html>
