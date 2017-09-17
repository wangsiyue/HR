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
				url : 'saveHumanFile.action',// 设置post提交到的页面
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
	<p style="color: #36F;">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案登记</p>
	<form id="form" method="post" >
		<div style="position: relative; left: 1000px;">
			<input class="easyui submit" type="button" value="提交"/>
    		<input class="easyui" type="reset" value="清除"/>
		</div>
		<input name="first_kind_name" id="first_kind_name" type="hidden" /> 
		<input name="second_kind_name" id="second_kind_name" type="hidden" />
		<input name="third_kind_name" id="third_kind_name" type="hidden" />
		<input name="hunma_major_name" id="human_major_name" type="hidden" />
		<input name="human_major_kind_name" id="human_major_kind_name" type="hidden" /> 
		<table border="1" width="1000" align="center" bgcolor="#E0ECFF">
			<tr>
				<td class="t1">I级机构</td>
				<td><input id="first_kind_id" name="first_kind_id" style="width: 100%"
					class="easyui-combobox"
					data-options="   
			        valueField: 'first_kind_id',
		        	textField: 'first_kind_name',
		        	url: 'findFirstKind.action',
		        	onSelect: function(rec){
		        		$('#first_kind_name').val(rec.first_kind_name);
			            var url = 'findSecondKindByFirstKindId.action?first_kind_id='+rec.first_kind_id;
			            $('#second_kind_id').combobox('reload', url);
		        	}" />
				</td>
				</td>
				<td class="t1">II 级机构</td>
				<td>
				<input id="second_kind_id" name="second_kind_id" style="width: 110%"
					class="easyui-combobox"
					data-options="
					valueField:'second_kind_id',
					textField:'second_kind_name',
		        	onSelect: function(rec){
		        		$('#second_kind_name').val(rec.second_kind_name);
			            var url = 'findThirdKindBySecondKindId.action?second_kind_id='+rec.second_kind_id;   
			            $('#third_kind_id').combobox('reload', url);
					}" />
				</td>
				<td class="t1">III级机构</td>
				<td colspan="2"><input id="third_kind_id" name="third_kind_id" style="width: 110%"
					 class="easyui-combobox"
					data-options="valueField:'third_kind_id',textField:'third_kind_name',
				onSelect: function(rec){ 
 		        		$('#third_kind_name').val(rec.third_kind_name);
 				}" />

				</td>
				<td rowspan="5">
				<input type="file" name="picData" id="human_picture" 
				onchange="chgPic(this)" required="required"/>
				<img id="pic"  width="200px" height="200px">
				</td>
			</tr>
			<tr>
				<td class="t1">职位分类</td>
				<td>
					<input id="human_major_kind_id" name="human_major_kind_id" style="width: 100%" 
					class="easyui-combobox"
					data-options="   
			        valueField: 'major_kind_id',
		        	textField: 'major_kind_name',
		        	url: 'findMajorKind.action',
		        	onSelect: function(rec){
		        		$('#human_major_kind_name').val(rec.major_kind_name);
			            var url = 'findMajorByKindId.action?major_kind_id='+rec.major_kind_id;
			            $('#human_major_id').combobox('reload', url);
		        	}" />
				</td>
				<td class="t1">职位名称</td>
				<td>
					<input id="human_major_id" name="human_major_id" style="width: 100%" 
					class="easyui-combobox"
					data-options="valueField:'major_id',textField:'major_name',onSelect: function(rec){
		        	$('#human_major_name').val(rec.major_name);
		        }" /></td>
				<td class="t1">职称</td>
				<td colspan="2"><select id="human_pro_designation"
					name="human_pro_designation">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='职称'}">
								<option value="${cpc.attribute_name}">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td class="t1">姓名</td>
				<td><input name="human_name" id="human_name"/></td>
				<td class="t1">性别</td>
				<td><select id="human_sex" name="human_sex">
						<option value="男">男</option>
						<option value="女">女</option>
				</select></td>
				<td class="t1">EMAIL</td>
				<td colspan="2"><input
					name="human_email" id="human_email"/></td>
			</tr>
			<tr>
				<td class="t1">电话</td>
				<td><input  name="human_telephone" id="human_telephone"/></td>
				<td class="t1">QQ</td>
				<td><input name="human_qq" id="human_qq"/></td>
				<td class="t1">手机</td>
				<td colspan="2"><input
					name="human_mobilephone" id="human_mobilephone"/></td>
			</tr>
			<tr>
				<td class="t1">住址</td>
				<td colspan="3"><input
					name="human_address" id="human_address"/></td>
				<td class="t1">邮编</td>
				<td colspan="2"><input
					name="human_postcode" id="human_postcode"/></td>
			</tr>
			<tr>
				<td class="t1">国籍</td>
				<td><select id="human_nationality"
					name="human_nationality">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='国籍'}">
								<option value="${cpc.attribute_name}">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="t1">出生地</td>
				<td><input name="human_birthplace" id="human_birthplace"/></td>
				<td class="t1">生日</td>
				<td><input id="human_birthday" name="human_birthday"
					class="easyui-datebox" /></td>
				<td class="t1">民族</td>
				<td><select id="human_race"
					name="human_race">
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
					name="human_religion">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='宗教信仰'}">
								<option value="${cpc.attribute_name}">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="t1">政治面貌</td>
				<td><select id="human_party"
					name="human_party">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='政治面貌'}">
								<option value="${cpc.attribute_name}">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="t1">省份证号码</td>
				<td><input name="human_id_card" id="human_id_card"/></td>
				<td class="t1">社会保障号码</td>
				<td><input 
					name="human_society_security_id" id="human_society_security_id"/></td>
			</tr>
			<tr>
				<td class="t1">年龄</td>
				<td><input name="human_age" id="human_age"/></td>
				<td class="t1">学历</td>
				<td><select id="human_educated_degree"
					name="human_educated_degree">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='学历'}">
								<option value="${cpc.attribute_name }">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="t1">教育年限</td>
				<td><select id="human_educated_years"
					name="human_educated_years">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='教育年限'}">
								<option value="${cpc.attribute_name }">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="t1">学历专业</td>
				<td><select id="human_educated_major"
					name="human_educated_major">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='专业'}">
								<option value="${cpc.attribute_kind }">${cpc.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td class="t1">薪酬标准</td>
				<td>
				<select class="easyui-combobox" id="salary_standard_name" name="salary_standard_name">
					<c:forEach items="${salaryStandardList}" var="list" >
						<option value="${list.standard_id}/${list.standard_name}">${list.standard_id}/${list.standard_name}</option>
					</c:forEach>
				</select>
				</td>
				<td class="t1">开户行</td>
				<td><input class="easyui-validatebox" name="human_bank" id="human_bank"/></td>
				<td class="t1">账号</td>
				<td><input class="easyui-validatebox" name="human_account" id="human_account"/></td>
				<td class="t1">登记人</td>
				<td><input class="easyui-validatebox" name="register" id="register"
					value="<% 
					Users user=(Users)session.getAttribute("user");
					out.print(user.getU_true_name()); 
				%>" /></td>
			</tr>
			<tr>
				<td class="t1">特长</td>
				<td><select id="human_speciality"
					name="human_speciality">
						<c:forEach items="${configPublicCharList }" var="cpc">
							<c:if test="${cpc.attribute_kind=='特长'}">
								<option value="${cpc.attribute_name}">${cpc.attribute_name}</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="t1">爱好</td>
				<td><select id="human_hobby"
					name="human_hobby">
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
					style="height: 100px; width: 930px"></td>

			</tr>
			<tr style="height: 35px;">
				<td style="text-align: center" class="t1">家庭关系信息</td>
				<td colspan="7"><input
					id="human_family_membership"
					name="human_family_membership" data-options="multiline:true"
					style="height: 100px; width: 930px"></td>

			</tr>
			<tr style="height: 35px;">
				<td style="text-align: center" class="t1">备注</td>
				<td colspan="7"><input id="remark" name="remark"
					 style="height:100px; width:930px">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
