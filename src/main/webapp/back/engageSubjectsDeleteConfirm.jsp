<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<link type="text/css" rel="stylesheet" href="css/icon.css" />
<link type="text/css" rel="stylesheet" href="css/easyui.css" />

</head>
<body>
<form>
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--招聘管理--招聘考试题库管理--试题变更 </font></td>
  </tr>
  <tr>
  	<input type="hidden" name="sub_id" id="sub_id"/>
    <td width="49%">您确认删除该试题吗？</td>
    <td align="right">
    <input type="button" value="确认" onclick="deletes();">
    <input type="button" value="返回" onclick="history.back()"></td>
</table>
</form>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
//获取路径中的值
window.onload = get;

function get(){
	var url = location.search; //获取url中"?"符后的字串
			
	var theRequest = new Object();
	if (url.indexOf("?") != -1) { 
		var str = url.substr(1); 
		var strs = str.split("&");
		var sub_id=strs[0].split("=")[1];
		$('#sub_id').val(sub_id);
	}
}

function deletes(){
	var sub_id=$('#sub_id').val();
	$.post('../deleteEngageSubjects.action',{
		sub_id:sub_id
	},function(data){
		window.location.href=data;
	},'text');
}
</script>
</html>