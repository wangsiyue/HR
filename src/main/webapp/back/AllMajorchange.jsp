<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	<p class="p1">您正在做的业务是：人力资源--人力资源档案管理--查询已经登记调动的所有人</p>
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
		url:'findAllMc.action',
		columns:[[
					{field:'human_id',title:'档案编号',width:135},
					{field:'human_name',title:'姓名',width:135},
					{field:'change_reason',title:'调动原因',width:135},
					{field:'first_kind_name',title:'I级机构',width:135},
					{field:'second_kind_name',title:'II级机构',width:135},
					{field:'third_kind_name',title:'III级机构',width:135},
					{field:'move',title:'审核',width:115,formatter:function(value,row,index){
						return '<a href="ReCheckMove/'+row.mch_id+'">审核</a>';
				}}
		]]
});
</script>
</html>