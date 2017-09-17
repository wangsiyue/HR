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
	<p class="p1">您正在做的业务是：人力资源--调动管理--调动记录</p>
    <p>总数:<label id="totalList"></label>
	例</p>
	<input type="hidden" name="first_kind_id"/>
	<input type="hidden" name="second_kind_id"/>
	<input type="hidden" name="third_kind_id"/>
	<input type="hidden" name="minTime"/>
	<input type="hidden" name="maxTime"/>
 <div id="find_majorChange"></div>
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
		var minTime=strs[3].split("=")[1];
		var maxTime=strs[4].split("=")[1];
		var size=strs[5].split("=")[1];
		document.getElementById("totalList").innerHTML=size;
		$('input[name="first_kind_id"]').val(first_kind_id);
		$('input[name="second_kind_id"]').val(second_kind_id);
		$('input[name="third_kind_id"]').val(third_kind_id);
		$('input[name="minTime"]').val(minTime);
		$('input[name="maxTime"]').val(maxTime);
	}
	var first_kind_id=$('input[name="first_kind_id"]').val();
	var second_kind_id=$('input[name="second_kind_id"]').val();
	var third_kind_id=$('input[name="third_kind_id"]').val();
	var minTime=$('input[name="minTime"]').val();
	var maxTime=$('input[name="maxTime"]').val();
	//分页查看商品信息  
	$('#find_humanFile').datagrid({ 
		url:'../findHumanfileMajorMove.action',
		queryParams:{
			first_kind_id:first_kind_id,
			second_kind_id:second_kind_id,
			third_kind_id:third_kind_id,
			minTime:minTime,
			maxTime:maxTime
		},
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
					{field:'move',title:'调动',width:115,formatter:function(value,row,index){
						return '<a href="RemoveFindOne/'+row.huf_id+'">调动</a>';
				}}
		]]
	});
}
</script>
</body>
</html>