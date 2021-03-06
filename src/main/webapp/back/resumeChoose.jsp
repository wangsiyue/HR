<%@page import="com.yc.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	 //图片上传  及数据保存  
	$(function() {
		$(".submit").click(function() {
			$("#form").ajaxSubmit({
				success : function(data) {
					if (data == 1) {
						window.location.href='back/resumeChooseSuccess.jsp';
					} else {
						alert('添加失败');
					}
				},
				error : function(error) {
					alert('添加失败');
				},
				url : 'chooseResume.action',// 设置post提交到的页面
				type : "post", //设置表单以post方法提交
				dataType : "text" //设置返回值类型为文本
			});
		});
	}); 
function chgPic(obj){
		$("#pic").attr("src",window.URL.createObjectURL(obj.files[0]));
	}
</script>
</head>

<body>
<p>您正在做的业务是：人力资源--招聘管理--简历管理--简历筛选</p>
    <form id="form" method="post" >
		<div style="position: relative; left: 1000px;">
			<input class="easyui submit" type="button" value="提交"/>
    		<input class="easyui" type="reset" value="清除"/>
		</div>
		<input name="human_major_id" id="human_major_id" type="hidden" value="${engageResume.human_major_id}"/>
		<input name="human_major_kind_id" id="human_major_kind_id" type="hidden" value="${engageResume.human_major_kind_id}" /> 
        <input type="hidden" name="res_id" value="${engageResume.res_id}"/>
        <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
            <tr>
            	<td class="t1">职位分类</td>
                <td><input type="text" name="human_major_kind_name" value="${engageResume.human_major_kind_name}"/></td>
                <td class="t1">职位名称</td>
                <td><input type="text" name="human_major_name" value="${engageResume.human_major_name }"/></td>
                <td class="t1">招聘类型</td>
                <td colspan="2"><input name="engage_type" type="text" value="${engageResume.engage_type }"/></td>
                <td rowspan="6">
				<input type="file" name="picData" id="human_picture" 
					onchange="chgPic(this)" required="required" value="${engageResume.human_picture}"/>
					<img id="pic"  width="200px" height="200px" src="${engageResume.human_picture}">
				</td>
            </tr>
            <tr>
            	<td class="t1">姓名</td>
                <td><input type="text" name="human_name" value="${engageResume.human_name}"/></td>
                <td class="t1">性别</td>
                <td><select id="human_sex" name="human_sex" value="${engageResume.human_sex}">
						<option value="男">男</option>
						<option value="女">女</option>
				</select></td>
                <td class="t1">EMAIL</td>
                <td colspan="2"><input
					name="human_email" id="human_email" value="${engageResume.human_email}"/></td>     
            </tr>
            <tr>
            	<td class="t1">电话</td>
                <td><input  name="human_telephone" id="human_telephone" value="${engageResume.human_telephone}"/></td>
                <td class="t1">家庭电话</td>
                <td><input  name="human_homephone" id="human_homephone" value="${engageResume.human_homephone}"/></td>
                <td class="t1">手机</td>
                <td colspan="2"><input  name="human_mobilephone" id="human_mobilephone" value="${engageResume.human_mobilephone}"/></td>        
            </tr>
            <tr>
            	<td class="t1">住址</td>
                <td colspan="3"><input
					name="human_address" id="human_address" value="${engageResume.human_address}"/></td>
                <td class="t1">邮编</td>
                <td colspan="2"><input
					name="human_postcode" id="human_postcode" value="${engageResume.human_postcode}"/></td>
            </tr>
            <tr>
            	<td class="t1">国籍</td>
                <td><select id="human_nationality"
					name="human_nationality" value="${engageResume.human_nationality}">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='国籍'}">
								<option value="${cpc.attribute_name}">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
                <td class="t1">出生地</td>
				<td><input name="human_birthplace" id="human_birthplace" value="${engageResume.human_birthplace}"/></td>
				<td class="t1">生日</td>
				<td colspan="2"><input id="human_birthday" name="human_birthday" value="${engageResume.human_birthday}"
					class="easyui-datebox" /></td>              
            </tr>
            <tr>
            	<td class="t1">民族</td>
                <td><select id="human_race"
					name="human_race" value="${engageResume.human_race}">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='民族'}">
								<option value="${cpc.attribute_name}">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
            	<td class="t1">宗教信仰</td>
				<td><select id="human_religion"
					name="human_religion" value="${engageResume.human_religion}">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='宗教信仰'}">
								<option value="${cpc.attribute_name}">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="t1">政治面貌</td>
				<td colspan="2"><select id="human_party"
					name="human_party" value="${engageResume.human_party}">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='政治面貌'}">
								<option value="${cpc.attribute_name}">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
            </tr>
            <tr>
           		<td class="t1">省份证号码</td>
                <td><input name="human_idcard" id="human_idcard" value="${engageResume.human_idcard}"/></td>
            	<td class="t1">年龄</td>
                <td><input name="human_age" id="human_age" value="${engageResume.human_age}"/></td>
                <td class="t1">毕业院校</td>
                <td><input name="human_college" id="human_college" value="${engageResume.human_college}"/></td>
                <td class="t1">学历</td>
                <td><select id="human_educated_degree"
					name="human_educated_degree" value="${engageResume.human_educated_degree}">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='学历'}">
								<option value="${cpc.attribute_name }">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
            </tr>
            <tr>
            	<td class="t1">教育年限</td>
				<td><select id="human_educated_years"
					name="human_educated_years" value="${engageResume.human_educated_years}">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='教育年限'}">
								<option value="${cpc.attribute_name }">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="t1">学历专业</td>
				<td><select id="human_educated_major"
					name="human_educated_major" value="${engageResume.human_educated_major}">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='专业'}">
								<option value="${cpc.attribute_kind }">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
            	<td class="t1">薪酬要求</td>
                <td><input type="text" name="demand_salary_standard" value="${engageResume.demand_salary_standard}"/></td>
                <%-- <td class="t1">注册时间</td>
                <td><input type="text" name="regist_time" value="${date}"/></td> --%>
                <td class="t1">特长</td>
				<td><select id="human_specility"
					name="human_specility" value="${engageResume.human_specility}">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='特长'}">
								<option value="${cpc.attribute_name}">${cpc.attribute_name}</option>
							</c:if>
						</c:forEach>
				</select></td>
            </tr>
            <tr>
				<td class="t1">爱好</td>
				<td><select id="human_hobby"
					name="human_hobby" value="${engageResume.human_hobby}">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='爱好'}">
								<option value="${cpc.attribute_name }">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
                <td class="t1">推荐人 </td>
				<td><input name="checker" value="<% 
					Users user=(Users)session.getAttribute("user");
					out.print(user.getU_true_name()); 
				%>"/> </td>
				<td class="t1">推荐时间</td>
				<td><input name="check_time" value="${date}"/></td> 
                <td class="t1"></td>
                <td></td>
            </tr>
             <tr style="height: 35px;">
				<td style="text-align: center" class="t1">个人履历</td>
				<td colspan="7"><input id="human_history_records"
					name="human_history_records" data-options="multiline:true"
					style="height: 100px; width: 930px" value="${engageResume.human_history_records}"></td>

			</tr>
			<tr style="height: 35px;">
				<td style="text-align: center" class="t1">备注</td>
				<td colspan="7"><input id="remark" name="remark"
					 style="height:100px; width:930px" value="${engageResume.remark}">
				</td>
			</tr>
			<tr>
				<td class="t1"> 筛选推荐意见 </td>
				<td colspan="7"><input id="recomandation" name="recomandation"
					 style="height:100px; width:930px" value="${engageResume.recomandation}">
				</td>
			</tr>
        </table>
    </form>
</body>
</html>
