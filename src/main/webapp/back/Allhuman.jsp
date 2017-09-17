<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>调动登记</title>
</head>
 <% String path=request.getContextPath();
  String basePath=request.getScheme()+ "://"
  +request.getServerName()+":"+request.getServerPort()+path+"/";
  
  %>
  <base href="<%=basePath%>">
<body>
	<p class="p1">您正在做的业务是：人力资源--人力资源档案管理--人力资源调动查询</p>
	
	
 <table id="find_humanFile"> </table>




<link href="js/themes/default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="back/js/themes/easyui.css" />
<link rel="stylesheet" type="text/css" href="back/js/themes/icon.css" />

<script type="text/javascript" src="back/js/themes/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="back/js/themes/jquery.easyui.min-1.2.0.js"></script>
<script type="text/javascript">

//分页查看所有人正常状态的员工
$('#find_humanFile').datagrid({	
		 pagination:true,
		 pageNumber:1,
		pageSize:2,
		pageList:[2,3,4,5,6],
		url:'FindAllhuman.action',
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

function All(){
	$('#find_humanFile').datagrid({	
		 pagination:true,
		 pageNumber:1,
		pageSize:2,
		pageList:[2,3,4,5,6],
		url:'FindAllhuman.action',
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
//分页查看所有人正常状态的员工按照性别查看
function BySex(){
	var name=$('#bysex').val();
	$('#find_humanFile').datagrid({	
		 pagination:true,
		 pageNumber:1,
		pageSize:2,
		pageList:[2,3,4,5,6],
		url:'FindAllhumanBysex.action',
		  queryParams:{human_sex:name},
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
//分页查看所有人正常状态的员工按照名字查看

function ByName(){
	var name=$('#byname').val();
	$('#find_humanFile').datagrid({	
		 pagination:true,
		 pageNumber:1,
		pageSize:2,
		pageList:[2,3,4,5,6],
		url:'FindAllhumanByName.action',
		  queryParams:{human_name:name},
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
 <input class="easyui"  type="button" id="sex" vaule="性别查询" onClick="BySex()"/>
<input class="easyui"  type="text" id="bysex" name="human_sex" placeholder="请输入性别"/>

<input class="easyui"  type="button" id="name" vaule="姓名查询" onClick="ByName()"/>
<input class="easyui"  type="text" id="byname" name="human_name" placeholder="请输入名字"/> 

所有：<input class="easyui"  type="button" id="all" vaule="查询所有" onClick="All()"/>

</body>
</html>