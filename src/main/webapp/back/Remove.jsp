
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
  <% String path=request.getContextPath();
  String basePath=request.getScheme()+ "://"
  +request.getServerName()+":"+request.getServerPort()+path+"/";
  
  %> 
<base href="<%=basePath%>"> 
<!doctype html>
<html>
<head>

<link type="text/css" rel="stylesheet" href="back/css/icon.css" />
<link type="text/css" rel="stylesheet" href="back/css/easyui.css" />
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
</style>
</head>

<body>
	<p>您正在做的业务是：人力资源--调动管理--调动记录</p>
	<form action="addOneMajorChange.action" method="post" id="myform">
		<div style="position: relative; left: 1040px;">
			<input id="submit" type="submit" value="提交"  onclick="Submit()"/> 
			 <input type="button" value="返回"  onclick="history.go(-1)" /> 
		</div>
		 <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
			<tr>
				<td class="t1">档案编号</td>
				<td colspan="7"><input name="human_id"
					value="${humanFile.human_id}" /></td>

			</tr>
			<tr>


				<td class="t1">原I级机构</td>
				<td><input name="first_kind_name"
					value="${humanFile.first_kind_name }" /></td>
				<td class="t1">原II级机构</td>
				<td><input name="second_kind_name"
					value="${humanFile.second_kind_name }" /></td>
				<td class="t1">原III级机构</td>
				<td><input name="third_kind_name"
					value="${humanFile.third_kind_name }" /></td>
				<td class="t1">姓名</td>
				<td><input name="human_name" value="${humanFile.human_name}" /></td>

			</tr>
			<tr>
				<td class="t1">原职位分类</td>
				<td><input name="major_kind_name"
					value="${humanFile.human_major_kind_name}" /></td>
				<td class="t1">原职位名称</td>
				
				<td><input name="major_name"
					value="${humanFile.hunma_major_name }" /></td>
					
					<input  type="hidden" name="salary_standard_id" class="salary_standard_id" value="${humanFile.salary_standard_id}"/>	
				<td class="t1">原薪酬标准</td>
				<td><input name="salary_standard_name"
					value="${humanFile.salary_standard_name}" /></td>
				<td class="t1"></td>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<td class="t1">新I级机构</td>
				<td >
				<input  type="hidden" name="new_first_kind_id" class="new_first_kind_id"/>
				<input name="new_first_kind_name" style="width: 100%" id="cc1" class="easyui-combobox"
					data-options="   
			        valueField: 'first_kind_id',
		        	textField: 'first_kind_name',
		        	url: 'findFirstKind.action',
		        	onSelect: function(rec){
		        		$('.new_first_kind_id').val(rec.first_kind_id);
			            var url = 'findSecondKindByFirstKindId.action?first_kind_id='+rec.first_kind_id;
			            $('#cc2').combobox('reload', url);
		        }" />
			</td>
				<td class="t1">新II级机构</td>
				<td>
				<input  type="hidden" name="new_second_kind_id" class="new_second_kind_id"/>
				<input name="new_second_kind_name" style="width: 100%" id="cc2" class="easyui-combobox"
					data-options="
					valueField:'second_kind_id',
					textField:'second_kind_name',
		        	onSelect: function(rec){
		        		$('.new_second_kind_id').val(rec.second_kind_id);
			            var url = 'findThirdKindBySecondKindId.action?second_kind_id='+rec.second_kind_id;   
			            $('#cc3').combobox('reload', url);
				}" />
			</td>

				<td class="t1">新III级机构</td>
				<td>
				 <input  type="hidden" name="new_third_kind_id" class="new_third_kind_id"/> 
				<input  name="new_third_kind_name" style="width: 100%" id="cc3" class="easyui-combobox" 
				data-options="valueField:'third_kind_id',textField:'third_kind_name',
				 onSelect: function(rec){
			$('.new_third_kind_id').val(rec.third_kind_id);
			
			} " />
			</td>
				<td class="t1"></td>
				<td><input type="text" /></td>

			</tr>
			<tr>
				<td class="t1">新职位分类</td>
				<td>
				<input  type="hidden" name="new_major_kind_id" class="new_major_kind_id"/>
				
				<input name="new_major_kind_name" style="width: 100%" id="cc4" class="easyui-combobox"
					data-options="   
			        valueField: 'major_kind_id',
		        	textField: 'major_kind_name',
		        	url: 'findMajorKind.action',
		        	onSelect: function(rec){
		        	$('.new_major_kind_id').val(rec.major_kind_id);
			            var url = 'findMajorByKindId.action?major_kind_id='+rec.major_kind_id;
			            $('#cc5').combobox('reload', url);
		        }" />
	        </td>
				<td class="t1">新职位名称</td>
				<td>
				<input  type="hidden" name="new_major_id" class="new_major_id"/>
				<input  name="new_major_name" style="width: 100%" id="cc5" class="easyui-combobox" data-options="valueField:'major_id',textField:'major_name',
				onSelect:function(rec){
				$('.new_major_id').val(rec.major_id);
				}
				" />
			</td>
			
				<td class="t1">新薪酬标准</td>
				<td>
				<input  type="hidden" name="new_salary_standard_id" class="new_salary_standard_id"/>
				<input name="new_salary_standard_name" style="width: 100%" id="cc4" class="easyui-combobox"
					data-options="   
			        valueField: 'standard_id',
		        	textField: 'standard_name',
		        	url: 'findSalary.action',
		        	onSelect:function(rec){
				$('.new_salary_standard_id').val(rec.standard_id);
				}
		        " />
		        
		
				<td class="t1"></td>
				<td><input type="text" /></td>

			</tr>
			<tr>
				<td class="t1">登记人</td>
				<td><input name="register" value="${name }" /></td>
				<td class="t1">登记时间</td>
				<td><input name="regist_time" 
				style="width: 88%" value="${date }" /></td>
				<td class="t1"></td>
				<td><input type="text" /></td>
				<td class="t1"></td>
				<td><input type="text" /></td>

			</tr>
			<tr style="height: 50px;">
				<td class="t1">调动原因</td>
				<td colspan="7"><input name="change_reason" /></td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
function  Submit(){
	alert("调动登记成功");
}

</script>
</html>
