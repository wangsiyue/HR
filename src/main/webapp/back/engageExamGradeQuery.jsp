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
p{
	margin-left:150px;
	color:#36F;
}
td input{
	width:100%;
	border:none;
	background-color:#E0ECFF;
}
.t1 {
	background-color: #9BBDF2;
	width: 200px;
}
</style>
</head>

<body>
	<p>您正在做的业务是：人力资源--招聘管理--招聘考试管理--成绩查询筛选</p>
    <div style="position:relative; left:1000px;">
        <input type="submit" value="查询" onclick="find();"/>
    </div>
    <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
        <tr>
            <td class="t1">请输入应试人身份证号码</td>
            <td><input type="text" name="human_idCard"/></td>
            <td style="width: 200px;"></td>
        </tr>
        <tr>
            <td class="t1">请输入关键字</td>
            <td><input type="text" name="key"/></td>
            <td></td>  
        </tr>
    </table>
</body>
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
function find(){
	var human_idCard=$('input[name="human_idCard"]').val();
	var key=$('input[name="key"]').val();
	$.post('toEngageExamGradeList.action',{
		human_idCard:human_idCard,
		key:key
	},function(data){
		array = data.split(",");  
		var href=array[0]+"?human_idCard="+human_idCard+"&key="+key
		+"&size="+array[1];
		window.location.href=href;
	},'text');
}
</script>
</html>
