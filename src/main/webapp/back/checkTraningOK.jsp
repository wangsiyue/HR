<%@page import="com.yc.bean.ConfigMajor"%>
<%@page import="com.yc.bean.ConfigFileThirdKind"%>
<%@page import="com.yc.bean.ConfigFileSecondKind"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<style>
td input {
	width: 100%;
	border: none;
	background-color: #E0ECFF;
}

.t1 {
	background-color: #9BBDF2;
	width: 100px;
}

p {
	color: #36F;
	margin-left: 180px;
}

td select {
	width: 100%;
}
</style>
</head>

<body>
	<p>您正在做的业务是：人力资源--调动管理--调动记录</p>
	<p>培训复核成功</p>
	<p>
		<a href="javascript:history.go(-2)">继续审核</a>
	</p>
</body>
</html>
