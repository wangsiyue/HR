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
<script>
</script>
</head>

<body>
<p>您正在做的业务是：人力资源--招聘管理--面试管理--面试结果登记</p>
    <form:form commandName="engageInterview" action="addInterview.action" method="post">
		<div style="position: relative; left: 1000px;">
			<input type="submit" value="确认"/>
    		<input type="button" value="返回"/>
		</div>
		<form:input path="human_major_id" name="human_major_id" id="human_major_id" type="hidden" value="${engageResume.human_major_id}"/>
		<form:input path="human_major_kind_id" name="human_major_kind_id" id="human_major_kind_id" type="hidden" value="${engageResume.human_major_kind_id}" /> 
        <form:input path="resume_id" name="resume_id" type="hidden" value="${engageResume.res_id }"/>
		<table border="1" width="1000" align="center" bgcolor="#E0ECFF">
            <tr>
            	<td class="t1">职位分类</td>
                <td><form:input path="human_major_kind_name" type="text" name="human_major_kind_name" value="${engageResume.human_major_kind_name}"/></td>
                <td class="t1">职位名称</td>
                <td><form:input path="human_major_name" type="text" name="human_major_name" value="${engageResume.human_major_name }"/></td>
                <td class="t1">招聘类型</td>
                <td colspan="2"><input type="text" value="${engageResume.engage_type }"/></td>
                <td rowspan="6">
					<img id="pic"  width="200px" height="200px" src="${engageResume.human_picture}">
				</td>
            </tr>
            <tr>
            	<td class="t1">姓名</td>
                <td><form:input path="human_name" type="text" name="human_name" value="${engageResume.human_name}"/></td>
                <td class="t1">性别</td>
                <td>
				<input value="${engageResume.human_sex}"/>
				</td>
                <td class="t1">EMAIL</td>
                <td colspan="2"><input value="${engageResume.human_email}"/></td>     
            </tr>
            <tr>
            	<td class="t1">电话</td>
                <td><input value="${engageResume.human_telephone}"/></td>
                <td class="t1">家庭电话</td>
                <td><input value="${engageResume.human_homephone}"/></td>
                <td class="t1">手机</td>
                <td colspan="2"><input value="${engageResume.human_mobilephone}"/></td>        
            </tr>
            <tr>
            	<td class="t1">住址</td>
                <td colspan="3"><input value="${engageResume.human_address}"/></td>
                <td class="t1">邮编</td>
                <td colspan="2"><input value="${engageResume.human_postcode}"/></td>
            </tr>
            <tr>
            	<td class="t1">国籍</td>
                <td>
				<input value="${engageResume.human_nationality}"/>
				</td>
                <td class="t1">出生地</td>
				<td><input value="${engageResume.human_birthplace}"/></td>
				<td class="t1">生日</td>
				<td colspan="2"><input value="${engageResume.human_birthday}"
				/></td>              
            </tr>
            <tr>
            	<td class="t1">民族</td>
                <td>
				<input value="${engageResume.human_race}"/>
				</td>
            	<td class="t1">宗教信仰</td>
				<td>
				<input value="${engageResume.human_religion}"/>
				</td>
				<td class="t1">政治面貌</td>
				<td colspan="2">
				<input value="${engageResume.human_party}"/>
				</td>
            </tr>
            <tr>
           		<td class="t1">省份证号码</td>
                <td><input value="${engageResume.human_idcard}"/></td>
            	<td class="t1">年龄</td>
                <td><input value="${engageResume.human_age}"/></td>
                <td class="t1">毕业院校</td>
                <td><input value="${engageResume.human_college}"/></td>
                <td class="t1">学历</td>
                <td>
                <input value="${engageResume.human_educated_degree}"/>
                </td>
            </tr>
            <tr>
            	<td class="t1">教育年限</td>
				<td>
				<input value="${engageResume.human_educated_years}"/>
				</td>
				<td class="t1">学历专业</td>
				<td>
				<input value="${engageResume.human_educated_major}"/>
				</td>
            	<td class="t1">薪酬要求</td>
                <td><input value="${engageResume.demand_salary_standard}"/></td>
               	<td class="t1">注册时间</td>
                <td><input value="${engageResume.regist_time}"/></td>
            </tr>
            <tr>
            	<td class="t1">特长</td>
				<td>
				<input value="${engageResume.human_specility}"/>
				</td>
				<td class="t1">爱好</td>
				<td>
				<input value="${engageResume.human_hobby}"/>
				</td>
                <td class="t1">推荐人 </td>
				<td><input value="${engageResume.checker}"/> </td>
				<td class="t1">推荐时间</td>
				<td><input value="${engageResume.check_time}"/></td> 
            </tr>
             <tr style="height: 35px;">
				<td style="text-align: center" class="t1">个人履历</td>
				<td colspan="7"><input data-options="multiline:true"
					style="height: 100px; width: 930px" value="${engageResume.human_history_records}"></td>

			</tr>
			<tr style="height: 35px;">
				<td style="text-align: center" class="t1">备注</td>
				<td colspan="7"><input style="height:100px; width:930px" value="${engageResume.remark}">
				</td>
			</tr>
			<tr>
				<td class="t1"> 筛选推荐意见 </td>
				<td colspan="7"><input  style="height:100px; width:930px" value="${engageResume.recomandation}">
				</td>
			</tr>
			<tr>
            	<td class="t1">面试次数</td>
                <td>第<form:input path="interview_amount" name="interview_amount" value="${interview_amount}"/>次</td>
                <td class="t1">形象评价</td>
                <td><form:select path="image_degree" name="image_degree">
	                <option value="A">A</option>
	                <option value="B">B</option>
	                <option value="C">C</option>
                </form:select></td>
                <td class="t1">口才评价</td>
                <td><form:select path="native_language_degree" name="native_language_degree">
	                <option value="A">A</option>
	                <option value="B">B</option>
	                <option value="C">C</option>
                </form:select></td>
                <td class="t1">外语口语能力</td>
                <td><form:select path="foreign_language_degree" name="foreign_language_degree">
	                <option value="A">A</option>
	                <option value="B">B</option>
	                <option value="C">C</option>
                </form:select></td>
            </tr>
            <tr>
            	<td class="t1">应变能力</td>
                <td><form:select path="response_speed_degree" name="response_speed_degree">
	                <option value="A">A</option>
	                <option value="B">B</option>
	                <option value="C">C</option>
                </form:select></td>
                <td class="t1">EQ</td>
                <td><form:select path="EQ_degree" name="EQ_degree">
	                <option value="A">A</option>
	                <option value="B">B</option>
	                <option value="C">C</option>
                </form:select></td>
                <td class="t1">IQ</td>
                <td><form:select path="IQ_degree" name="IQ_degree">
	                <option value="A">A</option>
	                <option value="B">B</option>
	                <option value="C">C</option>
                </form:select></td>
                <td class="t1">综合素质</td>
                <td><form:select path="multi_quality_degree" name="multi_quality_degree">
	                <option value="A">A</option>
	                <option value="B">B</option>
	                <option value="C">C</option>
                </form:select></td>
            </tr>
            <tr>  
            	<td class="t1">面试人</td>
                <td><form:input type="text" path="register" name="register" value="${user }"/></td>
                <td class="t1">面试时间</td>
                <td><form:input id="registe_time" path="registe_time" name="registe_time" class="easyui-datebox" /></td>
                <td class="t1"></td>
                <td></td>
                <td class="t1"></td>
                <td></td>
            </tr>
             <tr>
            	<td class="t1">面试评价</td>
                <td colspan="7"><form:textarea path="interview_comment" name="interview_comment"></form:textarea></td>
            </tr>
        </table>
	</form:form>
</body>
</html>
