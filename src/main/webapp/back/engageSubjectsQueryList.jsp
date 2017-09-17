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
	<p class="p1">您正在做的业务是：人力资源--招聘管理--招聘考试题库管理--试题查询</p>
    <p>符合条件的试题总数：<label id="totalList"></label>
	例</p>
	<input type="hidden" name="first_kind_name"/>
	<input type="hidden" name="key"/>
	<input type="hidden" name="minTime"/>
	<input type="hidden" name="maxTime"/>
 <div id="findEngageSubjects"></div>
<script>
//获取路径中的值
window.onload = get;

function get(){
	var url = location.search; //获取url中"?"符后的字串
			
	var theRequest = new Object();
	if (url.indexOf("?") != -1) { 
		var str = url.substr(1); 
		var strs = str.split("&");
		var first_kind_name=strs[0].split("=")[1];
		var key=strs[1].split("=")[1];
		var minTime=strs[2].split("=")[1];
		var maxTime=strs[3].split("=")[1];
		var size=strs[4].split("=")[1];
		document.getElementById("totalList").innerHTML=size;
		$('input[name="first_kind_name"]').val(first_kind_name);
		$('input[name="key"]').val(key);
		$('input[name="minTime"]').val(minTime);
		$('input[name="maxTime"]').val(maxTime);
	}
	var first_kind_name=$('input[name="first_kind_name"]').val();
	var key=$('input[name="key"]').val();
	var minTime=$('input[name="minTime"]').val();
	var maxTime=$('input[name="maxTime"]').val();
	//分页查看商品信息  
	$('#findEngageSubjects').datagrid({
		url:'../findEngageSubjectByConditionAndPage.action',
		queryParams:{
			first_kind_name:first_kind_name,
			key:key,
			minTime:minTime,
			maxTime:maxTime
		},
		pagination:true,
		pageSize:2,
		pageList:[2,3,4,5,6],
		columns:[[
					{field:'content',title:'题干',width:130},
					{field:'first_kind_name',title:'试题I级分类',width:130},
					{field:'second_kind_name',title:'试题II级分类',width:130},
					{field:'register',title:'登记人',width:130},
					{field:'regist_time',title:'登记日期',width:130},
					{field:'derivation',title:'出处',width:130},
					{field:'correct_key',title:'正确答案',width:130},
					{field:'cz',title:'操作',width:115,formatter:function(value,row,index){
						return '<a href="../toChangeEngageSubjects.action?sub_id='+row.sub_id+'">变更</a>';
					}},
					
		]]
	});
}
</script>
</body>
</html>