<%@page import="com.yc.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
td textarea{
	width:100%;
	border:none;
	height:80px;
}
</style>
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="back/js/jquery.form.js"></script>
<script type="text/javascript">
function check(){
	var result=$("input[name='result']:checked").val();
	var ein_id=$('#ein_id').val();
	var test_checker=$('#test_checker').val();
	var test_check_time=$('#test_check_time').val();
	var pass_checkComment=$('#pass_checkComment').val();
	var res_id=$('#res_id').val();
	$.post('engageExamCheck.action',{
		result:result,
		ein_id:ein_id,
		test_checker:test_checker,
		test_check_time:test_check_time,
		pass_checkComment:pass_checkComment,
		res_id:res_id
	},function(data){
		window.location.href=data;
	},'text');
}
</script>
</head>

<body>
<p>您正在做的业务是：人力资源--招聘管理--招聘考试管理--考试查询筛选</p>
    <form>
    	<div style="position:relative; left:500px;">
        	<input name="result" type="radio" value="建议面试" />建议面试  
            <input name="result" type="radio" value="建议笔试" />建议笔试  
            <input name="result" type="radio" value="建议录用" />建议录用  
            <input name="result" type="radio" value="删除简历" />删除简历
            
            <input type="button" value="确认" onclick="check();"/>
            <input type="button" value="返回"/>
            
            <input type="hidden" id="ein_id" value="${engageInterview.ein_id }"/>
            <input type="hidden" id="res_id" value="${engageResume.res_id }"/>
        </div>
        <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
        	<tr>
            	<td class="t1">职位分类</td>
                <td>${engageResume.human_major_kind_name}</td>
                <td class="t1">职位名称</td>
                <td>${engageResume.human_major_name }</td>
                <td class="t1">招聘类型</td>
                <td colspan="2">${engageResume.engage_type }</td>
                <td rowspan="6">
					<img id="pic"  width="200px" height="200px" src="${engageResume.human_picture}">
				</td>
            </tr>
            <tr>
            	<td class="t1">姓名</td>
                <td>${engageResume.human_name}</td>
                <td class="t1">性别</td>
                <td>${engageResume.human_sex}
				</td>
                <td class="t1">EMAIL</td>
                <td colspan="2">${engageResume.human_email}</td>     
            </tr>
            <tr>
            	<td class="t1">电话</td>
                <td>${engageResume.human_telephone}</td>
                <td class="t1">家庭电话</td>
                <td>${engageResume.human_homephone}</td>
                <td class="t1">手机</td>
                <td colspan="2">${engageResume.human_mobilephone}</td>        
            </tr>
            <tr>
            	<td class="t1">住址</td>
                <td colspan="3">${engageResume.human_address}</td>
                <td class="t1">邮编</td>
                <td colspan="2">${engageResume.human_postcode}</td>
            </tr>
            <tr>
            	<td class="t1">国籍</td>
                <td>${engageResume.human_nationality}</td>
                <td class="t1">出生地</td>
				<td>${engageResume.human_birthplace}</td>
				<td class="t1">生日</td>
				<td colspan="2">${engageResume.human_birthday}</td>              
            </tr>
            <tr>
            	<td class="t1">民族</td>
                <td>${engageResume.human_race}</td>
            	<td class="t1">宗教信仰</td>
				<td>${engageResume.human_religion}</td>
				<td class="t1">政治面貌</td>
				<td colspan="2">${engageResume.human_party}</td>
            </tr>
            <tr>
           		<td class="t1">省份证号码</td>
                <td>${engageResume.human_idcard}</td>
            	<td class="t1">年龄</td>
                <td>${engageResume.human_age}</td>
                <td class="t1">毕业院校</td>
                <td>${engageResume.human_college}</td>
                <td class="t1">学历</td>
                <td>${engageResume.human_educated_degree}</td>
            </tr>
            <tr>
            	<td class="t1">教育年限</td>
				<td>${engageResume.human_educated_years}</td>
				<td class="t1">学历专业</td>
				<td>${engageResume.human_educated_major}</td>
            	<td class="t1">薪酬要求</td>
                <td>${engageResume.demand_salary_standard}</td>
               	<td class="t1">注册时间</td>
                <td>${engageResume.regist_time}</td>
            </tr>
            <tr>
            	<td class="t1">特长</td>
				<td>${engageResume.human_specility}</td>
				<td class="t1">爱好</td>
				<td>${engageResume.human_hobby}</td>
                <td class="t1">推荐人 </td>
				<td>${engageResume.checker}</td>
				<td class="t1">推荐时间</td>
				<td>${engageResume.check_time}</td> 
            </tr>
             <tr style="height: 35px;">
				<td style="text-align: center" class="t1">个人履历</td>
				<td colspan="7" data-options="multiline:true" style="height: 100px; width: 930px">${engageResume.human_history_records}</td>
			</tr>
			<tr style="height: 35px;">
				<td style="text-align: center" class="t1">备注</td>
				<td colspan="7"style="height:100px; width:930px">${engageResume.remark}
				</td>
			</tr>
			<tr>
				<td class="t1"> 筛选推荐意见 </td>
				<td colspan="7" style="height:100px; width:930px">${engageResume.recomandation}
				</td>
			</tr>
            <tr>  
            	<td class="t1">考试次数</td>
                <td>第${engageResume.test_amount}次</td>
                <td class="t1">成绩分数</td>
                <td>${engageResume.total_points}</td>
                <td class="t1">筛选人</td>
                <td><input id="test_checker" value="<% 
					Users user=(Users)session.getAttribute("user");
					out.print(user.getU_true_name()); 
				%>"/></td>
                <td class="t1">筛选时间</td>
                <td><input id="test_check_time" class="easyui-datebox" value="${date}"/></td>
            </tr>
            <tr>
				<td class="t1"> 录用申请审核意见 </td>
				<td colspan="7"><textarea id="pass_checkComment"></textarea></td>
			</tr>
        </table>
    </form>
</body>
</html>
