<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<link type="text/css" rel="stylesheet" href="back/css/icon.css" />
<link type="text/css" rel="stylesheet" href="back/css/easyui.css" />
<style>
.t1{
	background-color:#9BBDF2;
}

td textarea{
	width:100%;
	border:none;
	height:80px;
}
</style>
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="back/js/jquery.form.js"></script>
<script type="text/javascript">
function add(){
	var major_kind_id=$('#major_kind_id').val();
	var major_id=$('#major_id').val();  
	var major_kind_name=$('#major_kind_name').val();
	var major_name=$('#major_name').val();
	var register=$('#register').val();
	var regist_time=$('#regist_time').val();
	var limite_time=$('#limite_time').val();
	var mak_id=$('#mak_id').val();
	
	var first_kind_ids=document.getElementsByName("first_kind_id");
	var first_kind_names=document.getElementsByName("first_kind_name");
	var second_kind_ids=document.getElementsByName("second_kind_id");
	var second_kind_names=document.getElementsByName("second_kind_name");
	var question_amounts=document.getElementsByName("question_amount");

	var first_kind_id='';
	var first_kind_name='';
	var second_kind_id='';
	var second_kind_name='';
	var question_amount='';
	for(var i=0;i<first_kind_ids.length;i++){
		first_kind_id+=first_kind_ids[i].value+",";
		first_kind_name+=first_kind_names[i].innerHTML+",";
		second_kind_id+=second_kind_ids[i].value+",";
		second_kind_name+=second_kind_names[i].innerHTML+",";
		question_amount+=question_amounts[i].value+",";
	}
	
	$.post('engageExamRegister.action',{
		mak_id:mak_id,
		major_kind_id:major_kind_id,
		major_id:major_id,
		major_kind_name:major_kind_name,
		major_name:major_name,
		register:register,
		regist_time:regist_time,
		limite_time:limite_time,
		
		first_kind_id:first_kind_id,
		first_kind_name:first_kind_name,
		second_kind_id:second_kind_id,
		second_kind_name:second_kind_name,
		question_amount:question_amount
	},function(data){
		window.location.href=data;
	},'text');
}
</script>
</head>

<body>
<p>您正在做的业务是：人力资源--招聘管理--招聘考试管理--考试出题</p>
    <form id="form" method="post" >
		<div style="position: relative; left: 750px;">
			<input type="button" value="确认" onclick="add();"/>
    		<input type="button" value="返回"/>
		</div>
		<input type="hidden" id="major_kind_id" value="${configMajor.major_kind_id }"/>
		<input type="hidden" id="major_kind_name" value="${configMajor.major_kind_name }"/>
		<input type="hidden" id="major_id" value="${configMajor.major_id }"/>
		<input type="hidden" id="major_name" value="${configMajor.major_name }"/>
		<input type="hidden" id="register" value="${user }"/>
		<input type="hidden" id="regist_time" value="${date }"/>
		
		<input type="hidden" id="mak_id" value="${configMajor.mak_id }"/>
        <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
           <tr>
            	<td class="t1">职位分类</td>
                <td>${configMajor.major_kind_id }/${configMajor.major_kind_name }</td>
                <td colspan="6"></td>  
            </tr>
            <tr>
            	<td class="t1">职位名称</td>
                <td>${configMajor.major_id }/${configMajor.major_name }</td>
                <td class="t1">登记人</td>
                <td>${user}</td>
                <td class="t1">登记时间</td>
                <td>${date}</td> 
                <td class="t1">答题限时(分钟)</td>
                <td><input id="limite_time" type="text"/></td>     
            </tr>
            <tr>
            	<td class="t1">试题I级分类名称</td>
                <td colspan="3" class="t1">试题II级分类名称</td>
                <td colspan="2" class="t1">可用试题数量</td>
                <td colspan="2" class="t1">出题数量</td>        
            </tr>
            <c:forEach items="${EngageSubjectslist}" var="list">
            	<tr>
	            	<td name="first_kind_name">${list.first_kind_name }</td>
	                <td name="second_kind_name" colspan="3">${list.second_kind_name }</td>
	                <td colspan="2">${list.count }</td>
	                <td colspan="2"><input type="text" name="question_amount" value="0"/></td> 
	                <input type="hidden" name="first_kind_id" value="${list.first_kind_id }"/> 
	                <input type="hidden" name="second_kind_id" value="${list.second_kind_id }"/>
            	</tr>
            </c:forEach>
        </table>
    </form>
</body>
</html>
