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
<p>您正在做的业务是：人力资源--招聘管理--职位发布管理--职位发布变更</p>
 <table id="dg"></table> 
</body>
<script type="text/javascript">
	$('#dg').datagrid({
		url:'showEngageMajorReleaseList.action',
		pagination:true,
		pageSize:2,
		pageList:[2,3,4,5,6],
		columns:[[
				{field:'mre_id',align:'center',title:'编号',width:110},
		        {field:'major_name',align:'center',title:'职位名称',width:110,	
						editor:{type:'validatebox',options:{required:true}}},
		        {field:'second_kind_name',title:'机构名称 ',width:110,
		        		editor:{type:'validatebox',options:{required:true}}},
		        {field:'human_amount',title:'招聘人数 ',width:110,	
		     	  		editor:{type:'validatebox',options:{required:true}}},
		        {field:'regist_time',title:'发布时间 ',width:110,
		        		editor:{type:'datebox',options:{required:true}}},
		        {field:'deadline',title:'截止时间',width:110,
		     	  		editor:{type:'datebox',options:{required:true}}},
     	  		{field:'cz1',title:'操作',width:115,formatter:function(value,row,index){
					return '<a href="toEngageMajorReleaseDetails.action?mre_id='+row.mre_id+'">修改</a>';
				}},
     	  		{field:'cz2',title:'操作',width:115,formatter:function(value,row,index){
					return '<a href="deleteEngageMajorRelease.action?mre_id='+row.mre_id+'">删除</a>';
				}}
		]]
	});
</script>
</body>
</html>
