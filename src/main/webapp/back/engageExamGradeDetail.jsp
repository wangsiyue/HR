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
}
.p2{
	margin-left:800px;
}
</style>
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
    function back(){
    	window.location.href='javascript:history.go(-1)';
    }
</script>
</head>

<body>
<p class="p1">您正在做的业务是：人力资源--招聘管理--招聘考试管理--考试查询筛选</p>
    <form>
    	<div style="position:relative; left:1000px;">
            <a href="toEngageExamCheck.action?interview_id=${engageAnswer.interview_id }">筛选</a>
        </div>
        <input type="hidden" id="interview_id" value="${engageAnswer.interview_id }"/>
        <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
            <tr>
            	<td class="t1">姓名</td>
                <td colspan="3"><input id="human_name" value="${engageAnswer.human_name }"/></td>
                <td class="t1">省份证号码</td>
                <td colspan="3"><input id="human_idcard" value="${engageAnswer.human_idcard }"/></td>    
            </tr>
            <tr>
            	<td class="t1">试卷编号</td>
                <td colspan="3"><input id="exam_number" value="${engageAnswer.exam_number }"/></td>
                <td class="t1">答题用时</td>
                <td colspan="3"><input id="use_time" value="${engageAnswer.use_time }"/></td>    
            </tr>
            <c:forEach items="${subList }" var="l" varStatus="v">
            	<tr>
	            	<td class="t1" colspan="7">${l.first_kind_name }</td>  
	            </tr>
            	<tr>
	            	<td colspan="7">${v.index+1} . ${l.content} A.${l.key_a }&nbsp;&nbsp;&nbsp;&nbsp;B.${l.key_b }
	            	&nbsp;&nbsp;&nbsp;&nbsp;C.${l.key_c }&nbsp;&nbsp;&nbsp;&nbsp;D.${l.key_d }
	            	&nbsp;&nbsp;&nbsp;&nbsp;E.${l.key_e }&nbsp;&nbsp;&nbsp;&nbsp;正确答案:${l.correct_key }
	            	&nbsp;&nbsp;&nbsp;&nbsp;<label style="color: red;">应试者答案：${l.userAnswer }</label></td>    
	            </tr>
            </c:forEach>
        </table>
    </form>
</body>
</html>
