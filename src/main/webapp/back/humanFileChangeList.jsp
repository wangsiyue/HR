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
	<p class="p1">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案更改</p>
    <p>当前查询到的人力资源档案总数:<label id="totalList"></label>
	例</p>
	<input type="hidden" name="first_kind_id"/>
	<input type="hidden" name="second_kind_id"/>
	<input type="hidden" name="third_kind_id"/>
	<input type="hidden" name="major_kind_id"/>
	<input type="hidden" name="major_id"/>
	<input type="hidden" name="minTime"/>
	<input type="hidden" name="maxTime"/>
 <div id="find_humanFile"></div>
<script>
//获取路径中的值
window.onload = get;

function get(){
	var url = location.search; //获取url中"?"符后的字串
			
	var theRequest = new Object();
	if (url.indexOf("?") != -1) { 
		var str = url.substr(1); 
		var strs = str.split("&");
		var first_kind_id=strs[0].split("=")[1];
		var second_kind_id=strs[1].split("=")[1];
		var third_kind_id=strs[2].split("=")[1];
		var major_kind_id=strs[3].split("=")[1];
		var major_id=strs[4].split("=")[1];
		var minTime=strs[5].split("=")[1];
		var maxTime=strs[6].split("=")[1];
		var size=strs[7].split("=")[1];
		document.getElementById("totalList").innerHTML=size;
		$('input[name="first_kind_id"]').val(first_kind_id);
		$('input[name="second_kind_id"]').val(second_kind_id);
		$('input[name="third_kind_id"]').val(third_kind_id);
		$('input[name="major_kind_id"]').val(major_kind_id);
		$('input[name="major_id"]').val(major_id);
		$('input[name="minTime"]').val(minTime);
		$('input[name="maxTime"]').val(maxTime);
	}
	var first_kind_id=$('input[name="first_kind_id"]').val();
	var second_kind_id=$('input[name="second_kind_id"]').val();
	var third_kind_id=$('input[name="third_kind_id"]').val();
	var major_kind_id=$('input[name="major_kind_id"]').val();
	var major_id=$('input[name="major_id"]').val();
	var minTime=$('input[name="minTime"]').val();
	var maxTime=$('input[name="maxTime"]').val();
	//分页查看商品信息  
	$('#find_humanFile').datagrid({
		url:'../findChangeListByPage.action',
		queryParams:{
			first_kind_id:first_kind_id,
			second_kind_id:second_kind_id,
			third_kind_id:third_kind_id,
			major_kind_id:major_kind_id,
			major_id:major_id,
			minTime:minTime,
			maxTime:maxTime
		},
		pagination:true,
		pageSize:2,
		pageList:[2,3,4,5,6],
		columns:[[
					{field:'human_id',title:'档案编号',width:132},
					{field:'human_name',title:'姓名',width:132},
					{field:'human_sex',title:'性别',width:132},
					{field:'first_kind_name',title:'I级机构',width:132},
					{field:'second_kind_name',title:'II级机构',width:132},
					{field:'third_kind_name',title:'III级机构',width:132},
					{field:'human_major_kind_name',title:'职位分类',width:132},
					{field:'cz',title:'操作',width:115,formatter:function(value,row,index){
						return '<a href="../changeFileDetail.action?human_id='+row.human_id+'">更改</a>';
					}}
		]]
	});
}
</script>
</body>
</html>