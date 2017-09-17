<%@page import="com.yc.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<link type="text/css" rel="stylesheet" href="back/css/icon.css" />
<link type="text/css" rel="stylesheet" href="back/css/easyui.css" />
<style>
td input{
	width:100%;
	border:none;
	background-color:#E0ECFF;
}
.t1{
	background-color:#9BBDF2;
	width:100px;
}
p{
	color:#36F;
	margin-left:150px;
}
</style>
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	//动态获取薪酬总额
    function getTotalSalary(){
    	var salarys=document.getElementsByName("salary");
    	var total=0;
		for(var i=0;i<salarys.length;i++){
			var a=salarys[i].value;
			total+=a*1;
		}
		$('input[name="salary_sum"]').val(total);
    }
    function back(){
    	window.location.href='javascript:history.go(-1)';
    }
    
    function add(){
    	var standard_id=$('input[name="standard_id"]').val();
    	var standard_name=$('input[name="standard_name"]').val();
    	var salary_sum=$('input[name="salary_sum"]').val();
    	var designer=$('input[name="designer"]').val(); 
    	var register=$('input[name="register"]').val();
    	
    	var item_ids=document.getElementsByName("item_id");
		var item_names=document.getElementsByName("item_name");
		var salarys=document.getElementsByName("salary");
		var item_id='';
		var item_name='';
		var salary='';
		for(var i=0;i<salarys.length;i++){
			item_id+=item_ids[i].innerHTML+",";
			item_name+=item_names[i].innerHTML+",";
			salary+=salarys[i].value+",";
		}
		$.post('addSalaryStandard.action',{
			standard_id:standard_id,
			standard_name:standard_name,
			salary_sum:salary_sum,
			designer:designer,
			register:register,
			item_id:item_id,
			item_name:item_name,
			salary:salary
		},function(data){
			window.location.href=data;
		},'text');
    }
</script>
</head>

<body>
<p>您正在做的业务是：人力资源--薪酬标准管理--薪酬标准登记</p>
    <form>
    	<div style="position:relative; left:950px;">
            <input type="button" value="提交" onclick="add();"/>
            <input type="button" value="返回" onclick="back();"/>
        </div>
        <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
        	<tr>
            	<td class="t1">薪酬标准编号</td>
                <td><input type="text" name="standard_id" value="${salaryStandard.standard_id }"/></td>
                <td class="t1">薪酬标准名称</td>
                <td><input type="text" name="standard_name"/></td>
                <td class="t1">薪酬总额</td>
                <td><input type="text" name="salary_sum" value="0.0" /></td>
                <td class="t1"></td>
                <td style="width:100px;"></td>
            </tr>
            <tr>
            	<td class="t1">制定人</td>
                <td><input name="designer" type="text"/></td>
                <td class="t1">登记人</td>
                <td><input name="register" type="text" value="<% 
					Users user=(Users)session.getAttribute("user");
					out.print(user.getU_true_name()); 
				%>"/></td>
                <td class="t1"></td>
                <td></td>
                <td class="t1"></td>
                <td></td>
            </tr>
            <tr>
            	<td class="t1">序号</td>
                <td colspan="3" class="t1">薪酬项目名称</td>
                <td class="t1" colspan="4">金额</td>
            </tr>
            <c:forEach items="${configPublicCharList}" var="list">
				<c:if test="${list.attribute_kind=='薪酬设置'}">
					<tr>
		            	<td name="item_id">${list.pbc_id}</td>
		                <td colspan="3" name="item_name">${list.attribute_name}</td>
		                <td><input name="salary" value="0.0" onchange="getTotalSalary();"/></td>
		                <td colspan="3"></td>
		            </tr>
				</c:if>
			</c:forEach>
        </table>
    </form>
</body>
</html>
