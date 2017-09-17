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
<p>您正在做的业务是：人力资源--招聘管理--录用管理--录用申请</p>
 <table id="dg"></table> 
</body>
<script type="text/javascript">
	$('#dg').datagrid({
		url:'showPassRegisterList.action',
		pagination:true,
		pageSize:2,
		pageList:[2,3,4,5,6],
		columns:[[
				{field:'human_name',align:'center',title:'姓名',width:110},
		        {field:'human_sex',align:'center',title:'性别',width:110},
		        {field:'human_age',title:'年龄 ',width:110},
		        {field:'human_major_kind_id',title:'职位类别 ',width:110},
		        {field:'human_major_name',title:'职位名称 ',width:110},
		        {field:'human_college',title:'毕业院校',width:110},
		        {field:'human_educated_major',title:'学历专业',width:110},
     	  		{field:'cz',title:'操作',width:115,formatter:function(value,row,index){
					return '<a href="toPassRegister.action?res_id='+row.res_id+'">申请</a>';
				}}
		]]
	});
</script>
</body>
</html>
