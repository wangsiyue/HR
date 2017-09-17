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
	<p class="p1">您正在做的业务是:人力资源管理--薪酬标准管理--薪酬标准登记查询</p>
    <p>符合条件的薪酬标准总数:<label id="totalList"></label>
	例</p>
	<input type="hidden" name="human_idCard"/>
	<input type="hidden" name="key"/>
 <div id="find_salaryStandard"></div>
<script>
//获取路径中的值
window.onload = get;

function get(){
	var url = location.search; //获取url中"?"符后的字串
			
	var theRequest = new Object();
	if (url.indexOf("?") != -1) { 
		var str = url.substr(1); 
		var strs = str.split("&");
		var human_idCard=strs[0].split("=")[1];
		var key=strs[1].split("=")[1];
		var size=strs[2].split("=")[1];
		document.getElementById("totalList").innerHTML=size;
		$('input[name="human_idCard"]').val(human_idCard);
		$('input[name="key"]').val(key);
	}
	var human_idCard=$('input[name="human_idCard"]').val();
	var key=$('input[name="key"]').val();
	//分页查看商品信息  
	$('#find_salaryStandard').datagrid({
		url:'../findGradeByConditionAndPage.action',
		queryParams:{
			human_idCard:human_idCard,
			key:key
		},
		pagination:true,
		pageSize:2,
		pageList:[2,3,4,5,6],
		columns:[[
					{field:'human_name',title:'姓名',width:200},
					{field:'human_idcard',title:'身份证号码',width:200},
					{field:'cz',title:'操作',width:165,formatter:function(value,row,index){
						return '<a href="../toGrandeDetail.action?ans_id='+row.ans_id+'">查看详情</a>';
					}}
		]]
	});
}
</script>
</body>
</html>