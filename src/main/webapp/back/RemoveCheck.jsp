<%@page import="com.yc.bean.ConfigMajor"%>
<%@page import="com.yc.bean.ConfigFileThirdKind"%>
<%@page import="com.yc.bean.ConfigFileSecondKind"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<style>
td input {
	width: 100%;
	border: none;
	background-color: #E0ECFF;
}

.t1 {
	background-color: #9BBDF2;
	width: 100px;
}

p {
	color: #36F;
	margin-left: 180px;
}

td select {
	width: 100%;
}

td textarea {
	width: 100%;
}


</style>
 <% String path=request.getContextPath();
  String basePath=request.getScheme()+ "://"
  +request.getServerName()+":"+request.getServerPort()+path+"/";
  
  %> 
<base href="<%=basePath%>"> 
</head>

<body>
	<p>您正在做的业务是：人力资源--调动管理--调动审核</p>
	<form method="post" id="myform" action="Mobilize1.action" >
		<div style="position: relative; left: 900px;">
			<input type="radio" name="choice" value="未通过" value="0" />未通过 
				<input type="radio" name="choice" value="通过" value="1" />通过 
				<input type="submit" value="确认"  onclick="Sure()" /> 
				<input type="button" value="返回"  onclick="history.go(-1)" /> 
		</div>
	<table border="1" width="1000" align="center" bgcolor="#E0ECFF">
			<tr>
				<td class="t1">档案编号</td>
				<td colspan="7"><input name="human_id"
					value="${list1.human_id }" /></td>
			</tr>
			<tr>
				<td class="t1">原I级机构</td>
				<td><input name="first_kind_name"
					value="${list1.first_kind_name }" /></td>
				<td class="t1">原II级机构</td>
				<td><input name="second_kind_name"
					value="${list1.second_kind_name }" /></td>
				<td class="t1">原III级机构</td>
				<td><input name="third_kind_name"
					value="${list1.third_kind_name }" /></td>
				<td class="t1">姓名</td>
				<td><input name="human_name" value="${list1.human_name}" /></td>
			</tr>
			<tr>
				<td class="t1">原职位分类</td>
				<td><input name="major_kind_name"
					value="${list1.major_kind_name}" /></td>
				<td class="t1">原职位名称</td>
				<td><input name="major_name" value="${list1.major_name }" /></td>
				<td class="t1">原薪酬标准</td>
				<td><input name="salary_standard_name"
					value="${list1.salary_standard_name}" /></td>
				<td class="t1"></td>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<td class="t1">新I级机构</td>
				<td><input name="first_kind_name"
					value="${list1.new_first_kind_name }" /></td>
				<td class="t1">新II级机构</td>
				<td><input name="second_kind_name"
					value="${list1.new_second_kind_name }" /></td>
				<td class="t1">新III级机构</td>
				<td><input name="third_kind_name"
					value="${list1.new_third_kind_name }" /></td>
				<td class="t1"></td>
				<td><input type="text" /></td>
			</tr>
			<tr>

				<td class="t1">新职位分类</td>
				<td><input name="human_major_kind_name"
					value="${list1.new_major_kind_name }" /></td>
				<td class="t1">新职位名称</td>
				<td><input name="hunma_major_name"
					value="${list1.new_major_name }" /></td>
				<td class="t1">新薪酬标准</td>
				<td><input name="salary_standard_name"
					value="${list1.new_salary_standard_name }" /></td>
				<td class="t1"></td>
				<td><input type="text" /></td>

			</tr>
			<tr>
				<td class="t1">登记人</td>
				<td><input name="register" value="${list1.register }" /></td>
				<td class="t1">登记时间</td>
				<td><input name="regist_time" value="${list1.regist_time }" /></td>

				<td class="t1">审核人</td>
				<td><input name="checker" type="text" /></td>
				<td class="t1">审核时间</td>
				<td><input name="check_time" class="easyui-datebox" style="width: 88%" value=" "/></td>
			</tr>
			<tr style="height: 50px;">
				<td class="t1">调动原因</td>
				<td colspan="7"><input name="change_reason"
					value="${list1.change_reason }" /></td>
			</tr>
			<tr style="height: 50px;">
				<td class="t1">审核意见</td>
				<td colspan="7"><textarea name="check_reason" value=""></textarea></td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">

  function Sure(){
	  
	  
	  alert('审核成功')
  }
</script>
</html>