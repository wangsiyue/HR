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
.p1{
	color:#36F;
	margin-left:180px;
}
p{
	margin-left:180px;
}
td select{
	width:100%;
	height:50px;
}
</style>
</head>

<body>
    <p class="p1">您正在做的业务是：人力资源--招聘管理--招聘考试题库管理--试题查询</p>
    <p>符合条件的试题总数：<label>1</label>例</p>
    <div style="position:relative; left:1120px;">
          <input type="submit" value="查询"/>
    </div>
        <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
        	<tr>
            	<td>题干</td>
                <td>试题I级分类</td>
                <td>试题II级分类</td>
                <td>登记人</td>
                <td>登记日期</td>
                <td>出处</td>
                <td>正确答案</td>
            </tr>
            <tr>
            	<td>2</td>
                <td>市场类</td>
                <td>客户经理</td>
                <td>admin</td>
                <td>2017</td>
                <td></td>
                <td>c</td>
            </tr>
            <tr>
            	<td>3</td>
                <td>市场类</td>
                <td>客户经理</td>
                <td>aa</td>
                <td>2017</td>
                <td></td>
                <td>a</td>
            </tr>
        </table>
        <p>总数：<label>2</label>例  当前第<label>1</label>页   共<label>1</label> 页   跳到第<input type="text" size="1"/>页    <a href="#">GO</a></p>
</body>
</html>
