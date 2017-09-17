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
    function add(){
    	var answers=document.getElementsByName("answer");
		var correct_keys=document.getElementsByName("correct_key");
		var sub_ids=document.getElementsByName("sub_id");
		var answer='';
		var correct='';
		var subId='';
		for(var i=0;i<answers.length;i++){
			if(answers[i].checked){
				answer+=answers[i].value+',';
			}
		}
		for(var i=0;i<correct_keys.length;i++){
			correct+=correct_keys[i].value+",";
			subId+=sub_ids[i].value+",";
		}
		
		var exam_number=$('#exam_number').val(); 
		var human_name=$('#human_name').val(); 
		var human_idcard=$('#human_idcard').val(); 
		var major_kind_id=$('#major_kind_id').val(); 
		var major_kind_name=$('#major_kind_name').val(); 
		var major_id=$('#major_id').val();                                         
		var major_name=$('#major_name').val(); 
		var test_time=$('#test_time').val(); 
		var use_time=$('#use_time').val(); 
		var resume_id=$('#resume_id').val(); 
		var interview_id=$('#interview_id').val();
		
		$.post('addEngageAnswer.action',{
			answer:answer,
			correct:correct,
			subId:subId,
			exam_number:exam_number,
			human_name:human_name,
			human_idcard:human_idcard,
			major_kind_id:major_kind_id,
			major_kind_name:major_kind_name,
			major_id:major_id,
			major_name:major_name,
			test_time:test_time,
			use_time:use_time,
			resume_id:resume_id,
			interview_id:interview_id
		},function(data){
			window.location.href=data;
		},'text');
    }
</script>
</head>

<body>
<p class="p1">您正在做的业务是：人力资源--招聘管理--招聘考试管理--考试答题</p>
<p class="p2">答题限定时间：<label>${limit_time}</label>分钟  答题已用时间</p>
<input class="p2" type="text" id="use_time" size="40" value="0:0:55"/>
    <form>
    	<div style="position:relative; left:820px;">
            <!-- <input type="checkbox"/>我要交卷
            <input type="checkbox"/>再检查一遍 -->
            <input type="button" value="交卷" onclick="add();"/>
        </div>
        <input type="hidden" id="major_kind_id" value="${engageResume.human_major_kind_id }"/>
        <input type="hidden" id="major_kind_name" value="${engageResume.human_major_kind_name }"/>
        <input type="hidden" id="major_id" value="${engageResume.human_major_id }"/>
        <input type="hidden" id="major_name" value="${engageResume.human_major_name}"/>
        <input type="hidden" id="resume_id" value="${engageResume.res_id}"/>
        <input type="hidden" id="interview_id" value="${engageInterview.ein_id}"/>
        <input type="hidden" id="test_time" value="${limit_time}"/>
        <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
        	<tr>
            	<td class="t1">试卷编号</td>
                <td colspan="3"><input id="exam_number" value="${exam_number }"/></td>
                <td class="t1">试题数量</td>
                <td colspan="3"><input value="${question_amount }"/></td>  
            </tr>
            <tr>
            	<td class="t1">姓名</td>
                <td colspan="3"><input id="human_name" value="${engageResume.human_name }"/></td>
                <td class="t1">省份证号码</td>
                <td colspan="3"><input id="human_idcard" value="${engageResume.human_idcard }"/></td>    
            </tr>
            <c:forEach items="${detailsList }" var="list" varStatus="v">
            	<tr>
	            	<td class="t1" colspan="7">${list.first_kind_name }</td>  
	            </tr>
	            <c:forEach items="${list.subjectsList }" var="l" varStatus="var">
	            	<tr>
		            	<td colspan="7">${v.index+1} . ${l.content}</td> 
		            </tr>
	            	<tr>
		            	<td colspan="7"><input name="answer" style="width:20px;" type="checkbox"  value="a"/>A.${l.key_a }</td>    
		            </tr>
		            <tr>
		            	<td colspan="7"><input name="answer" style="width:20px;" type="checkbox" value="b"/>B.${l.key_b }</td>    
		            </tr>
		            <tr>
		            	<td colspan="7"><input name="answer" style="width:20px;" type="checkbox" value="c"/>C.${l.key_c }</td>    
		            </tr>
		            <tr>
		            	<td colspan="7"><input name="answer" style="width:20px;" type="checkbox" value="d"/>D.${l.key_d }</td>    
		            </tr>
		            <tr>
		            	<td colspan="7"><input name="answer" style="width:20px;" type="checkbox" value="e"/>E.${l.key_e }</td>    
		            </tr>
		            <input type="hidden" name="correct_key" value="${l.correct_key }"/> 
		            <input type="hidden" name="sub_id" value="${l.sub_id }"/> 
	            </c:forEach>
            </c:forEach>
        </table>
    </form>
</body>
</html>
