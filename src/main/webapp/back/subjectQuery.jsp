<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<style>
p{
	margin-left:180px;
	color:#36F;
}
select{
	width:100%;
	height:50px;
	border:none;
}
td input{
	width:100%;
	border:none;
}
.t1{
	background-color:#9BBDF2;
}
.t2{
	width:360px;
}
</style>
</head>

<body>
	<p>您正在做的业务是：人力资源--招聘管理--招聘考试题库管理--试题查询</p>
    <form>
    <div style="position:relative; left:1120px;">
        <input type="submit" value="查询"/>
    </div>
    <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
        <tr>
            <td class="t1">请选择试题分类</td>
            <td><select><option>市场类</option>
            	<option>综合类</option>
            </select>
            </td>
            <td></td>
        </tr>
        <tr>
            <td class="t1">请输入关键字</td>
            <td><input type="text"/></td>
            <td></td>  
        </tr>
        <tr>
            <td class="t1">请输入登记时间</td>
            <td><input class="t2"/>至<input class="t2"/></td>
            <td>(YYYY-MM-DD)</td>  
        </tr>
    </table>
    </form>
</body>
</html>
