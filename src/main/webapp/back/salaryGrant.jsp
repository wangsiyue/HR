<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<style>
.t1{
	background-color:#9BBDF2;
}
.p1{
	color:#36F;
}
p{
	padding-left: 100px;
}
</style>
</head>

<body>
	<p class="p1">您正在做的业务是：人力资源--薪酬发放管理--薪酬发放登记（责任人负责）</p>
    <!-- <p>薪酬单编号：<label>HS1000000000</label></p>
    <p>薪酬次数：<label>3</label>
    总人数：<label>3</label>
    基本薪酬总额：<label>4100</label>
    实发总额：<label></label>
    上次发薪时间：<label>2007-04-18  00:00:00</label>
    </p> -->
    <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
        <tr class="t1">
            <td>序号</td>
            <td>I级机构名称</td>
            <td>II级机构名称</td>
            <td>人数</td>
            <td>基本薪酬总额（元）</td>
            <td>登记</td>
        </tr>
        <c:forEach items="${list}" varStatus="idx" var="list">
			<tr>
				<td>${idx.index+1}</td>
				<td>${list.first_kind_name}</td>
				<td>${list.second_kind_name}</td>
				<td>${list.count}</td>
				<td>${list.salary_sum}</td>
				<td align="center"><a href="toAddSalaryGrant.action?index=${idx.index}">登记</a></td>
			</tr>
		</c:forEach>
    </table>
</body>
</html>
