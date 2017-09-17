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
}
td select{
	width:100%;
	border:none;
}

td textarea{
	width:100%;
	border:none;
	height:80px;
}
p{
	color:#36F;
}
</style>
</head>

<body>
<p>您正在做的业务是：人力资源--人力资源档案管理--人力资源档案变更</p>
    <form>
    	<div style="position:relative; left:1060px;">
            <input type="submit" value="提交"/>
            <input type="button" value="返回"/>
        </div>
        <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
        	<tr>
            	<td class="t1">档案编号</td>
                <td colspan="6"><input type="text" value="HF0101011001"/></td>
                <td rowspan="6" ></td>
            </tr>
        	<tr>
            	<td class="t1">I级机构</td>
                <td><input type="text" value="集团"/></td>
                <td class="t1">II级机构</td>
                <td><input type="text" value="公司"/></td>
                <td class="t1">III级机构</td>
                <td colspan="2"><input type="text" value="部门"/></td>
            </tr>
            <tr>
            	<td class="t1">职位分类</td>
                <td><input type="text" value="软件开发"/></td>
                <td class="t1">职位名称</td>
                <td><input type="text" value="软件开发工程师"/></td>
                <td class="t1">职称</td>
                <td colspan="2"><select><option>工程师</option></select></td>   
            </tr>
            <tr>
            	<td class="t1">姓名</td>
                <td><input type="text" value="张三"/></td>
                <td class="t1">性别</td>
                <td><select><option>男</option></select></td>
                <td class="t1">EMAIL</td>
                <td colspan="2"><input type="text"/></td>     
            </tr>
            <tr>
            	<td class="t1">电话</td>
                <td><input type="text" value="010"/></td>
                <td class="t1">QQ</td>
                <td><input type="text"/></td>
                <td class="t1">手机</td>
                <td colspan="2"><input type="text"/></td>        
            </tr>
            <tr>
            	<td class="t1">住址</td>
                <td colspan="3"><input type="text"/></td>
                <td class="t1">邮编</td>
                <td colspan="2"><input type="text"/></td>
            </tr>
            <tr>
            	<td class="t1">国籍</td>
                <td><select><option>中国</option></select></td>
                <td class="t1">出生地</td>
                <td><input type="text"/></td>
                <td class="t1">生日</td>
                <td><input type="text"/></td>
                <td class="t1">民族</td>
                <td><select><option>汉</option></select></td>
            </tr>
            <tr>
            	<td class="t1">宗教信仰</td>
                <td><select><option>无</option></select></td>
                <td class="t1">政治面貌</td>
                <td><select><option>无</option></select></td>
                <td class="t1">省份证号码</td>
                <td><input type="text"/></td>
                <td class="t1">社会保障号码</td>
                <td><input type="text"/></td>
            </tr>
            <tr>
            	<td class="t1">年龄</td>
                <td><input type="text"/></td>
                <td class="t1">学历</td>
                <td><select><option>本科</option></select></td>
                <td class="t1">教育年限</td>
                <td><select><option>16</option></select></td>
                <td class="t1">学历专业</td>
                <td><select><option>计算机</option></select></td>
            </tr>
            <tr>
            	<td class="t1">薪酬标准</td>
                <td><select><option>未定义/0</option></select></td>
                <td class="t1">开户行</td>
                <td><input type="text"/></td>
                <td class="t1">账号</td>
                <td><input type="text"/></td>
                <td class="t1">登记人</td>
                <td><input type="text" value="admin"/></td>
            </tr>
            <tr>
            	<td class="t1">复核时间</td>
                <td><input type="text" value="2017-04-17"/></td>
                <td class="t1">特长</td>
                <td><select><option>数据库</option></select></td>
                <td class="t1">爱好</td>
                <td><select><option>篮球</option></select></td>
                <td class="t1"></td>
                <td><input type="text"/></td>
            </tr>
            <tr>
            	<td class="t1">档案附件</td>
                <td colspan="6"><input type="text"/></td>
            </tr>
             <tr>
            	<td class="t1">个人履历</td>
                <td colspan="7"><textarea></textarea></td>
            </tr>
            <tr></tr>
             <tr>
            	<td class="t1" >家庭关系信息</td>
                <td colspan="7"><textarea></textarea></td>
            </tr>
             <tr>
            	<td class="t1">备注</td>
                <td colspan="7"><textarea></textarea></td>
            </tr>
        </table>
    </form>
</body>
</html>
