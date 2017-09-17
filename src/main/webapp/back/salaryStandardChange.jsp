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
<script type="text/javascript">
function back(){
	window.location.href='javascript:history.go(-1)';
}
</script>
</head>

<body>
<p>您正在做的业务是:人力资源管理--薪酬标准管理--薪酬标准登记变更</p>
    <form:form commandName="salaryStandard" action="changeSalaryStandard.action" method="post">
    <form:hidden path="standard_id" value="${salaryStandard.standard_id }"/>
    <form:hidden path="checker" value="checker1"/>
    	<div style="position:relative; left:950px;">
            <input type="submit" value="重新提交"/>
            <input type="button" value="返回" onclick="back();"/>
        </div>
        <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
        	<tr>
            	<td class="t1">薪酬标准编号</td>
                <td>${salaryStandard.standard_id }</td>
                <td class="t1">薪酬标准名称</td>
                <td><form:input path="standard_id" value="${salaryStandard.standard_name }"/></td>
                <td class="t1">薪酬总额</td>
                <td><form:input path="salary_sum" value="${salaryStandard.salary_sum }"/></td>
                <td class="t1"></td>
                <td style="width: 100px;"></td>
            </tr>
            <tr>
            	<td class="t1">制定人</td>
                <td>${salaryStandard.designer }</td>
                <td class="t1">变更人</td>
                <td><form:input path="changer" value="${user }"/></td>
                <%-- <td class="t1">变更时间</td>
                <td>${changer_time}</td> --%>
                <td class="t1"></td>
                <td ></td>
                <td class="t1"></td>
                <td></td>
            </tr>
            <tr style="height:60px;">
            	<td class="t1">审核意见</td>
                <td colspan="7">${salaryStandard.check_comment }</td>
            </tr>
            <tr>
            	<td class="t1">序号</td>
                <td class="t1" colspan="3">薪酬项目名称</td>
                <td class="t1" colspan="7" colspan="4">金额</td>
            </tr>
            <c:forEach items="${ssdList}" var="list">
				<tr>
	            	<td>${list.item_id}</td>
	                <td colspan="3">${list.item_name}</td>
	                <td><form:input path="salary" value="${list.salary}"/></td>
	                <td colspan="3"></td>
	            </tr>
			</c:forEach>
        </table>
    </form:form>
</body>
</html>
