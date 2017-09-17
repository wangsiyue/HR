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
		padding:30px 100px;
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
<title>修改密码</title>
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
		$("#change").ajaxSubmit({
			success : function(data) {
				alert(data);
				if (data == 1) {
					alert('修改成功');
					window.location.href="back/login.jsp";
				} else if(data==0){
					alert('密码为空或不一致，请重新输入...');
				}
				else{
					alert('登记失败 ...');
				}
			},
			url : 'changePassword.action',// 设置post提交到的页面
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
	<h2>修改密码</h2>
	<form id="change">
    	<fieldset>
	    	<ul>
	        	<li>用户名 &nbsp;&nbsp;&nbsp;:
	        		<input type="text" name="user_name" id="user_name"/>
	            </li>
	        </ul>
	        <ul>
	        	<li>真实姓名:&nbsp;
	        		<input type="text" name="u_true_name" id="u_true_name"/>
	            </li>
	        </ul>
	        <ul>
	        	<li>新密码 &nbsp;&nbsp;:&nbsp;
	        		<input type="password" name="user_password" id="user_password"/>
	            </li>
	        </ul>
	        <ul>
	        	<li>确认密码 :&nbsp;<input type="password" name="user_password1" id="user_password1"/>
	        </ul>
	        <ul>
	        	<li class="l1"><input class="easyui submit" type="button" value="确认"/>
	        	<input class="easyui" type="button" onclick="show()" value="返回登录"/>
	        	</li>
	        </ul>
        </fieldset>
    </form>
	</div>
</body>
</html>