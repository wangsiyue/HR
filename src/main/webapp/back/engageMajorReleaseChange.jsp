<%@page import="com.yc.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
td select{
	width:100%;
	border:none;
}
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
<script type="text/javascript">
function upd(){
	var engage_type=$('#engage_type').val();
	var human_amount=$('#human_amount').val();
	var deadline=$('#deadline').val();
	var changer=$('#changer').val();
	var major_describe=$('#major_describe').val();
	var change_time=$('#change_time').val();
	var engage_required=$('#engage_required').val();
	var mre_id=$('#mre_id').val();
	$.post('updateEngageMajorRelease.action',{
		engage_type:engage_type,
		human_amount:human_amount,
		deadline:deadline,
		changer:changer,
		change_time:change_time,
		major_describe:major_describe,
		engage_required:engage_required,
		mre_id:mre_id
	},function(data){
		window.location.href=data;
	},'text');
}

</script>

</head>

<body>
<p>您正在做的业务是：人力资源--招聘管理--职位发布管理--职位发布变更</p>
    <form>
    	<div style="position:relative; left:1060px;">
            <input type="button" value="重新提交" onclick="upd();"/>
            <input type="button" value="返回"/>
        </div>
        <input type="hidden" name="mre_id" id="mre_id" value="${engageMajorRelease.mre_id }"/>
        <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
           	<tr>
            	<td class="t1">I级机构</td>
                <td>${engageMajorRelease.first_kind_name }</td>
                <td class="t1">II级机构</td>
                <td>${engageMajorRelease.second_kind_name }</td>
                <td class="t1">III级机构</td>
                <td>${engageMajorRelease.third_kind_name }</td>
                <td class="t1">招聘类型</td>
                <td><select id="engage_type" name="engage_type" value="${engageMajorRelease.engage_type }">
                	<option value="校园招聘">校园招聘</option>
						<option value="社会招聘">社会招聘</option>
                </select></td>
            </tr>
            <tr>
            	<td class="t1">职位分类</td>
                <td>${engageMajorRelease.major_kind_name }</td>
                <td class="t1">职位名称</td>
                <td>${engageMajorRelease.major_name }</td>
                <td class="t1">招聘人数</td>
                <td><input id="human_amount" name="human_amount" type="text" value="${engageMajorRelease.human_amount }"/></td>
                <td class="t1">截止日期</td>
                <td><input id="deadline" name="deadline" class="easyui-datebox"  value="${engageMajorRelease.deadline }"/></td>
            </tr>
            <tr>
            	<td class="t1">变更人</td>
                <td>
                <input type="text" id="changer" name="changer" value="<% 
					Users user=(Users)session.getAttribute("user");
					out.print(user.getU_true_name()); 
				%>"/>
                </td>
                <td class="t1">变更时间</td>
                <td><input type="text" id="change_time" name="change_time" value="${date}"/></td>
                <td class="t1"></td>
                <td><input type="text"/></td>
                <td class="t1"></td>
                <td><input type="text"/></td>
            </tr>
             <tr>
            	<td class="t1">职位描述</td>
                <td colspan="7"><textarea name="major_describe"
						id="major_describe">${engageMajorRelease.major_describe }</textarea></td>
            </tr>
             <tr>
            	<td class="t1">招聘要求</td>
                <td colspan="7"><textarea name="engage_required"
						id="engage_required">${engageMajorRelease.engage_required }</textarea></td>
            </tr>
        </table>
    </form>
</body>
</html>
