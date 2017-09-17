<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="back/js/themes/easyui.css" />
<link rel="stylesheet" type="text/css" href="back/js/themes/icon.css" />
<style>
.t1{
	background-color:#9BBDF2;
}
.p1{
	color:#36F;
}
</style>
<script type="text/javascript" src="back/js/themes/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="back/js/themes/jquery.easyui.min-1.2.0.js"></script>
</head>

<body>
	<p class="p1">您正在做的业务是：人力资源--招聘管理--职位发布管理--职位发布查询</p>
    <p>当前等待复核的人力资源档案总数：<label>${size }</label>例</p>
    <table id="dg" border="1" width="1000" align="center" bgcolor="#E0ECFF"></table> 
</body>
<script type="text/javascript">
	$('#dg').datagrid({
		url:'showEngageMajorReleaseList.action',
		pagination:true,
		pageSize:2,
		pageList:[2,3,4,5,6],
		columns:[[
		        {field:'major_name',align:'center',title:'职位名称',width:150,	
						editor:{type:'validatebox',options:{required:true}}},
		        {field:'second_kind_name',title:'机构名称 ',width:150,
		        		editor:{type:'validatebox',options:{required:true}}},
		        {field:'human_amount',title:'招聘人数 ',width:150,	
		     	  		editor:{type:'validatebox',options:{required:true}}},
		        {field:'regist_time',title:'发布时间 ',width:150,
		        		editor:{type:'datebox',options:{required:true}}},
		        {field:'deadline',title:'截止时间',width:150,
		     	  		editor:{type:'datebox',options:{required:true}}},
     	  		{field:'cz',title:'操作',width:145,formatter:function(value,row,index){
					return '<a href="toResumeRegister.action?mre_id='+row.mre_id+'">申请该职位</a>';
				}}
		]]
	});
</script>
</html>
