<%@page import="com.yc.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="com.yc.bean.ConfigMajor"%>
<%@page import="com.yc.bean.ConfigFileThirdKind"%>
<%@page import="com.yc.bean.ConfigFileSecondKind"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html> 
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>

<link type="text/css" rel="stylesheet" href="back/css/icon.css" />
<link type="text/css" rel="stylesheet" href="back/css/easyui.css" />
<style>
.t1 {
	background-color: #9BBDF2;
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
						window.location.href='back/humanFileRegisterSuccess.jsp';
					} else {
						window.location.href='back/humanFileRegisterFailure.jsp';
					}
				},
				error : function(error) {
					window.location.href='back/humanFileRegisterFailure.jsp';
				},
				url : 'checkHumanFile.action',// 设置post提交到的页面
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
	<p style="color: #36F;">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案复核</p>
	<form id="form" method="post" >
		<div style="position: relative; left: 1000px;">
            <input class="easyui submit" type="button" value="提交"/>
    		<input class="easyui" type="reset" value="清除"/>
		</div>
		<input name="second_kind_name" id="second_kind_name" type="hidden" value="${humanFile.second_kind_name}"/>
		<input name="third_kind_name" id="third_kind_name" type="hidden" value="${humanFile.third_kind_name}" />
		<input name="hunma_major_name" id="human_major_name" type="hidden" value="${humanFile.hunma_major_name}" />
		<input name="human_major_kind_name" id="human_major_kind_name" type="hidden" value="${humanFile.human_major_kind_name}" /> 
		<input name="first_kind_name" id="first_kind_name" type="hidden" value="${humanFile.first_kind_name}" /> 
		<table border="1" width="1000" align="center" bgcolor="#E0ECFF">
			<tr>
            	<td class="t1">档案编号</td>
                <td colspan="6"><input type="text" readonly name="human_id" id="human_id" value="${humanFile.human_id}"/></td>
                <td rowspan="6" >
                	<input type="file" name="picData" id="human_picture" 
					onchange="chgPic(this)" required="required" value="${humanFile.human_picture}"/>
					<img id="pic"  width="200px" height="200px" src="${humanFile.human_picture}">
                </td>
            </tr>
			<tr>
				<td class="t1">I级机构</td>
				<td>
					<input id="first_kind_id" readonly name="first_kind_id" value="${humanFile.first_kind_name}" />
				</td>
				<td class="t1">II 级机构</td>
				<td>
					<input id="second_kind_id" readonly name="second_kind_id" value="${humanFile.second_kind_name}"/>
				</td>
				<td class="t1">III级机构</td>
				<td colspan="2">
					<input id="third_kind_id" readonly name="third_kind_id" value="${humanFile.third_kind_name}" />
				</td>
			</tr>
			<tr>
				<td class="t1">职位分类</td>
				<td>
					<input id="human_major_kind_id" readonly name="human_major_kind_id" value="${humanFile.human_major_kind_name}" />
				</td>
				<td class="t1">职位名称</td>
				<td>
					<input id="human_major_id" readonly name="human_major_id" value="${humanFile.hunma_major_name}" />
				</td>
				<td class="t1">职称</td>
				<td colspan="2">
					<select id="human_pro_designation"
						name="human_pro_designation" value="${humanFile.human_pro_designation}">
							<c:forEach items="${configPublicCharList }" var="cpc">
								<c:if test="${cpc.attribute_kind=='职称'}">
									<option value="${cpc.attribute_name}">${cpc.attribute_name }</option>
								</c:if>
							</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td class="t1">姓名</td>
				<td><input name="human_name" id="human_name" value="${humanFile.human_name}"/></td>
				<td class="t1">性别</td>
				<td>
					<select id="human_sex" name="human_sex" value="${humanFile.human_sex}">
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</td>
				<td class="t1">EMAIL</td>
				<td colspan="2">
					<input name="human_email" id="human_email" value="${humanFile.human_email}"/>
				</td>
			</tr>
			<tr>
				<td class="t1">电话</td>
				<td>
					<input  name="human_telephone" id="human_telephone" value="${humanFile.human_telephone}"/>
				</td>
				<td class="t1">QQ</td>
				<td><input name="human_qq" id="human_qq" value="${humanFile.human_qq}"/></td>
				<td class="t1">手机</td>
				<td colspan="2"><input
					name="human_mobilephone" id="human_mobilephone" value="${humanFile.human_mobilephone}"/></td>
			</tr>
			<tr>
				<td class="t1">住址</td>
				<td colspan="3"><input
					name="human_address" id="human_address" value="${humanFile.human_address}"/></td>
				<td class="t1">邮编</td>
				<td colspan="2"><input
					name="human_postcode" id="human_postcode" value="${humanFile.human_postcode}"/></td>
			</tr>
			<tr>
				<td class="t1">国籍</td>
				<td><select id="human_nationality"
					name="human_nationality" value="${humanFile.human_nationality}">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='国籍'}">
								<option value="${cpc.attribute_name}">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="t1">出生地</td>
				<td><input name="human_birthplace" id="human_birthplace" value="${humanFile.human_birthplace}"/></td>
				<td class="t1">生日</td>
				<td><input id="human_birthday" name="human_birthday" value="${humanFile.human_birthday}"
					class="easyui-datebox" /></td>
				<td class="t1">民族</td>
				<td><select id="human_race"
					name="human_race" value="${humanFile.human_race}">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='民族'}">
								<option value="${cpc.attribute_name}">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td class="t1">宗教信仰</td>
				<td><select id="human_religion"
					name="human_religion" value="${humanFile.human_religion}">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='宗教信仰'}">
								<option value="${cpc.attribute_name}">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="t1">政治面貌</td>
				<td><select id="human_party"
					name="human_party" value="${humanFile.human_party}">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='政治面貌'}">
								<option value="${cpc.attribute_name}">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="t1">省份证号码</td>
				<td><input name="human_id_card" id="human_id_card" value="${humanFile.human_id_card}"/></td>
				<td class="t1">社会保障号码</td>
				<td><input 
					name="human_society_security_id" id="human_society_security_id" value="${humanFile.human_society_security_id}"/></td>
			</tr>
			<tr>
				<td class="t1">年龄</td>
				<td><input name="human_age" id="human_age" value="${humanFile.human_age}"/></td>
				<td class="t1">学历</td>
				<td><select id="human_educated_degree"
					name="human_educated_degree" value="${humanFile.human_educated_degree}">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='学历'}">
								<option value="${cpc.attribute_name }">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="t1">教育年限</td>
				<td><select id="human_educated_years"
					name="human_educated_years" value="${humanFile.human_educated_years}">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='教育年限'}">
								<option value="${cpc.attribute_name }">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="t1">学历专业</td>
				<td><select id="human_educated_major"
					name="human_educated_major" value="${humanFile.human_educated_major}">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='专业'}">
								<option value="${cpc.attribute_kind }">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td class="t1">薪酬标准</td> <%-- value="${humanFile.salary_standard_name}" --%>
				<td>
				<select id="salary_standard_name" name="salary_standard_name" value="${humanFile.salary_standard_name}">
					<c:forEach items="${salaryStandardList}" var="list" >
						<option value="${list.standard_id}/${list.standard_name}">${list.standard_id}/${list.standard_name}</option>
					</c:forEach>
				</select>
				</td>
				<td class="t1">开户行</td>
				<td><input class="easyui-validatebox" name="human_bank" id="human_bank" value="${humanFile.human_bank}"/></td>
				<td class="t1">账号</td>
				<td><input class="easyui-validatebox" name="human_account" id="human_account" value="${humanFile.human_name}"/></td>
				<td class="t1">复核人</td>
				<td><input class="easyui-validatebox" name="checker" id="checker"
					value="<% 
					Users user=(Users)session.getAttribute("user");
					out.print(user.getU_true_name()); 
				%>" /></td>
			</tr>
			<tr>
				<td class="t1">特长</td>
				<td><select id="human_speciality"
					name="human_speciality" value="${humanFile.human_speciality}">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='特长'}">
								<option value="${cpc.attribute_name}">${cpc.attribute_name}</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="t1">爱好</td>
				<td><select id="human_hobby"
					name="human_hobby" value="${humanFile.human_hobby}">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='爱好'}">
								<option value="${cpc.attribute_name }">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
			</tr>
			<tr style="height: 35px;">
				<td style="text-align: center" class="t1">个人履历</td>
				<td colspan="7"><input id="human_histroy_records"
					name="human_histroy_records" data-options="multiline:true"
					style="height: 100px; width: 930px" value="${humanFile.human_histroy_records}"></td>

			</tr>
			<tr style="height: 35px;">
				<td style="text-align: center" class="t1">家庭关系信息</td>
				<td colspan="7"><input
					id="human_family_membership"
					name="human_family_membership" data-options="multiline:true"
					style="height: 100px; width: 930px" value="${humanFile.human_family_membership}"></td>

			</tr>
			<tr style="height: 35px;">
				<td style="text-align: center" class="t1">备注</td>
				<td colspan="7"><input id="remark" name="remark"
					 style="height:100px; width:930px" value="${humanFile.remark}">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
