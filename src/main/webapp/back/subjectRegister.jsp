<%@page import="com.yc.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	margin-left:180px;
}
td select{
	width:100%;
}
</style>
</head>

<body>
<p>您正在做的业务是：人力资源--招聘管理--招聘考试题库管理--试题登记</p>
    <form>
    	<div style="position:relative; left:1040px;">
            <input type="submit" value="提交"/>
            <input type="button" value="返回"/>
        </div>
        <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
        	<tr>
            	<td class="t1">试题I级分类</td>
                <td><select><option></option></select></td>
                <td class="t1">试题II级分类</td>
                <td><select><option></option></select></td>
                <td class="t1">登记人</td>
                <td><input type="text" value="<% 
					Users user=(Users)session.getAttribute("user");
					out.print(user.getU_true_name()); 
				%>"/></td>
                <td class="t1">登记时间</td>
                <td><input type="text" value="2017"/></td>
            </tr>
            <tr style="height:50px;">
            	<td class="t1">题干</td>
                <td colspan="7"><input type="text"/></td>
            </tr>
            <tr style="height:50px;">
            	<td class="t1">答案a</td>
                <td colspan="7"><input type="text"/></td>
            </tr>
            <tr style="height:50px;">
            	<td class="t1">答案B</td>
                <td colspan="7"><input type="text"/></td>
            </tr>
            <tr style="height:50px;">
            	<td class="t1">答案C</td>
                <td colspan="7"><input type="text"/></td>
            </tr>
            <tr style="height:50px;">
            	<td class="t1">答案d</td>
                <td colspan="7"><input type="text"/></td>
            </tr>
            <tr style="height:50px;">
            	<td class="t1">答案e</td>
                <td colspan="7"><input type="text"/></td>
            </tr>
            <tr>
            	<td class="t1">正确答案</td>
                <td><input type="text"/></td>
                <td class="t1">试题出处</td>
                <td><input type="text"/></td>
                <td class="t1"></td>
                <td><input type="text"/></td>
                <td class="t1"></td>
                <td><input type="text"/></td>
            </tr>
        </table>
    </form>
</body>
</html>
