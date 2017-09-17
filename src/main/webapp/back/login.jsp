<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<% 
	String path=request.getContextPath();

	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
    
<!DOCTYPE html>
<html>
<style type="text/css">
	div{
		height:400px;
		width:500px;
		border:#666 3px solid;
		margin:100px auto;
	}
	form{
		padding:60px 100px;
	}
	ul li{
		list-style:none;
	}
	.l1{
		position:relative;
		left:40px;
	}
	h2{
		padding-left:200px;
	}
</style>
<head>
<meta charset="UTF-8">
<title>人力资源管理登录</title>
<base href="<%=basePath%>"/>
<link type="text/css" rel="stylesheet" href="back/css/icon.css" />
<link type="text/css" rel="stylesheet" href="back/css/easyui.css" />
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="back/js/jquery.form.js"></script>
<script type="text/javascript">
$(function() {
	$(".submit").click(function() {
		$("#login").ajaxSubmit({
			success : function(data) {
				if (data == 1) {
					window.location.href="back/Main.jsp";
				} else if(data==0){
					alert('用户名或密码错误');
					window.location.href="back/login.jsp";
				}
				else{
					alert('用户名或密码错误');
					window.location.href="back/login.jsp";
				}
			},
			url : 'adminLogin.action',// 设置post提交到的页面
			type : "post", //设置表单以post方法提交
			dataType : "text" //设置返回值类型为文本
		});
	});
}); 
function show(){
	window.location.href='javascript:history.go(-1)';
}
</script>
</head>
<body>
	<div>
	<h2>登录</h2>
	<form id="login">
    	<fieldset>
	    	<ul>
	        	<li>用户名: 
	        		<input type="text" name="user_name" id="user_name"/>
	            </li>
	        </ul>
	        <ul>
	        	<li>密码 &nbsp;&nbsp;&nbsp;&nbsp;:<input type="password" name="user_password" id="user_password"/>
	        </ul>
	        <ul>
	        	<li>
	        		<a href="back/changePassword.jsp">忘记密码？修改密码</a>
	        	</li>
	        </ul>
	        <ul>
	        	<li class="l1">
	        		<input class="easyui submit" type="button" value="登录"/>
	        		<input type="button" value="注册" onclick="userRegister();"/>
	        	</li>
	        </ul>
        </fieldset>
    </form>
	</div>
</body>
<script type="text/javascript">
function userRegister(){
	$.post('toUserRegister.action',{
	},function(data){
		window.location.href=data;
	},'text');
}
</script>
</html>