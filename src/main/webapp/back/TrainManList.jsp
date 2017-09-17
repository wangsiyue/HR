<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><html>
<head>
 <% String path=request.getContextPath();
  String basePath=request.getScheme()+ "://"
  +request.getServerName()+":"+request.getServerPort()+path+"/";
  
  %>
  <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
.t1 {
	background-color: #9BBDF2;
}

.p1 {
	color: #36F;
}

p {
	margin-left: 180px;
}
</style>
</head>
<body>
	<p class="p1">您正在做的业务是：人力资源--人力资源档案管理--培训</p>
 <table id="find_humanFile">
 
 
 </table>
</body>
</body>

<link href="js/themes/default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="back/js/themes/easyui.css" />
<link rel="stylesheet" type="text/css" href="back/js/themes/icon.css" />

<script type="text/javascript" src="back/js/themes/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="back/js/themes/jquery.easyui.min-1.2.0.js"></script>


<script type="text/javascript">

//分页查看所有人
$('#find_humanFile').datagrid({	
		 pagination:true,
		 pageNumber:1,
		pageSize:2,
		pageList:[2,3,4,5,6],
		url:'Humanlist.action',
		columns:[[
					{field:'human_id',title:'档案编号',width:135},
					{field:'human_name',title:'姓名',width:135},
					{field:'human_sex',title:'性别',width:135},
					{field:'first_kind_name',title:'I级机构',width:135},
					{field:'second_kind_name',title:'II级机构',width:135},
					{field:'third_kind_name',title:'III级机构',width:135},
					{field:'move',title:'培训',width:115,formatter:function(value,row,index){
						return '<a href="TrainRegister/'+row.huf_id+'">培训</a>';
				}}
		]]
});



function All(){
	$('#find_humanFile').datagrid({	
		 pagination:true,
		 pageNumber:1,
		pageSize:2,
		pageList:[2,3,4,5,6],
		url:'Humanlist.action',
		columns:[[
					{field:'human_id',title:'档案编号',width:135},
					{field:'human_name',title:'姓名',width:135},
					{field:'human_sex',title:'性别',width:135},
					{field:'first_kind_name',title:'I级机构',width:135},
					{field:'second_kind_name',title:'II级机构',width:135},
					{field:'third_kind_name',title:'III级机构',width:135},
					{field:'move',title:'培训',width:115,formatter:function(value,row,index){
						return '<a href="TrainRegister/'+row.huf_id+'">培训</a>';
				}}
		]]
});
	
}
function Sure(){
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
					{field:'move',title:'培训',width:115,formatter:function(value,row,index){
						return '<a href="TrainRegister/'+row.huf_id+'">培训</a>';
				}}
		]]
});
}


function ByName(){
	var name=$('#byname').val();
	$('#find_humanFile').datagrid({	
		 pagination:true,
		 pageNumber:1,
		pageSize:2,
		pageList:[2,3,4,5,6],
		url:'/Hr/FindAllhumanByName.action',
		  queryParams:{human_name:name},
		columns:[[
					{field:'human_id',title:'档案编号',width:135},
					{field:'human_name',title:'姓名',width:135},
					{field:'human_sex',title:'性别',width:135},
					{field:'first_kind_name',title:'I级机构',width:135},
					{field:'second_kind_name',title:'II级机构',width:135},
					{field:'third_kind_name',title:'III级机构',width:135},
					{field:'human_pro_designation',title:'职称',width:135},
					{field:'move',title:'培训',width:115,formatter:function(value,row,index){
						return '<a href="TrainRegister/'+row.huf_id+'">培训</a>';
				}}
		]]
});
}
</script>
<input class="easyui"  type="button" id="sex" vaule="查询" onClick="Sure()"/>
<input class="easyui"  type="text" id="bysex" name="human_sex"  placeholder="请输入性别"/>

<input class="easyui"  type="button" id="name" vaule="姓名查询" onClick="ByName()"/>
<input class="easyui"  type="text" id="byname" name="human_name" placeholder="请输入名字"/>

所有：<input class="easyui"  type="button" id="all" vaule="查询所有" onClick="All()"/>
</html>