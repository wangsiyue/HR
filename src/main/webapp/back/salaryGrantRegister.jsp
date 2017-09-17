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
.p1{
	color:#36F;
}
td input{
	width:94%;
}
p{
	padding-left: 100px;
}
</style>
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
window.onload = get;
//页面加载获取基本薪酬总额 
function get(){
	var s=document.getElementsByName("s");
	var total=0;
	for(var i=0;i<s.length;i++){
		var a=s[i].value;
		total+=a*1;
	}
	document.getElementById("salary_standard_sum1").innerHTML=total;
}

//动态获取薪酬总额
function getTotalSalary(){
	var s=document.getElementsByName("s");  
	var bouns_sum=document.getElementsByName("bouns_sum");
	var sale_sum=document.getElementsByName("sale_sum");
	var deduct_sum=document.getElementsByName("deduct_sum");
	var total=0;
	for(var i=0;i<s.length;i++){
		var a=s[i].value;
		total+=a*1;
	}
	for(var j=0;j<bouns_sum.length;j++){
		var bs=bouns_sum[j].value;
		total+=bs*1;
		var ss=sale_sum[j].value;
		total+=ss*1;
		var ds=deduct_sum[j].value;
		total-=ds*1;
	}
	
	var salary_standard_sums=document.getElementsByName("salary_standard_sum2");
	var salary_paid_sums=document.getElementsByName("salary_paid_sum2");
	var total2=0;
	for(var a=0;a<salary_paid_sums.length;a++){
		total2+=salary_standard_sums[a].value*1;
		var bs=bouns_sum[a].value;
		total2+=bs*1;
		var ss=sale_sum[a].value;
		total2+=ss*1;
		var ds=deduct_sum[a].value;
		total2-=ds*1;
		salary_paid_sums[a].value=total2;
		total2=0;
	}
	document.getElementById("salary_paid_sum1").innerHTML=total;
}

function add(){
	var first_kind_id=$('#first_kind_id').val();
	var second_kind_id=$('#second_kind_id').val();
	var first_kind_name=$('#first_kind_name').text();
	var second_kind_name=$('#second_kind_name').text();
	var human_amount=$('#human_amount').text();
	var salary_standard_sum1=$('#salary_standard_sum1').text();
	var salary_paid_sum1=$('#salary_paid_sum1').text();
	var register=$('#register').text();
	var regist_time=$('#regist_time').val();
	var salary_standard_id=$('#salary_standard_id').val();
	
	var bouns_sums=document.getElementsByName("bouns_sum");
	var sale_sums=document.getElementsByName("sale_sum");
	var deduct_sums=document.getElementsByName("deduct_sum");
	var human_ids=document.getElementsByName("human_id");
	var human_names=document.getElementsByName("human_name");
	var salary_standard_sums=document.getElementsByName("salary_standard_sum2");
	var salary_paid_sums=document.getElementsByName("salary_paid_sum2");
	
	var bouns_sum='';
	var sale_sum='';
	var deduct_sum='';
	var human_id='';
	var human_name='';
	var salary_standard_sum2='';
	var salary_paid_sum2='';
	
	for(var i=0;i<human_amount;i++){
		bouns_sum+=bouns_sums[i].value+",";
	    sale_sum+=sale_sums[i].value+",";
	    deduct_sum+=deduct_sums[i].value+",";
	    human_id+=human_ids[i].value+",";
	    human_name+=human_names[i].value+",";
	    salary_standard_sum2+=salary_standard_sums[i].value+",";
	    salary_paid_sum2+=salary_paid_sums[i].value+",";
	}
	
	$.post('addSalaryGrant.action',{
		first_kind_id:first_kind_id,
		second_kind_id:second_kind_id,
		first_kind_name:first_kind_name,
		second_kind_name:second_kind_name,
		human_amount:human_amount,
		salary_standard_sum1:salary_standard_sum1,
		salary_paid_sum1:salary_paid_sum1,
		register:register,
		salary_standard_id:salary_standard_id,
		human_id:human_id,
		human_name:human_name,
		bouns_sum:bouns_sum,
		sale_sum:sale_sum,
		deduct_sum:deduct_sum,
		salary_standard_sums:salary_standard_sum2,
		salary_paid_sums:salary_paid_sum2
	},function(data){
		window.location.href=data;
	},'text');
}
</script>
</head>

<body>
	<p class="p1">您正在做的业务是：人力资源--薪酬发放管理--薪酬发放登记</p>
    <form>
	    <div style="position:relative; left:1060px;">
	    <td>
	    	<input type="button" value="提交" onclick="add();"/></td>
	        <input type="button" value="返回"/>
	   	</div>
	   	<input type="hidden" id="first_kind_id" value="${humanFile.first_kind_id }"/>
	   	<input type="hidden" id="second_kind_id" value="${humanFile.second_kind_id }"/>
	    <p>薪酬单编号：<label>HS1000000000</label></p>
	    <p>机构：<label id="first_kind_name">${humanFile.first_kind_name}</label>/
	    <label id="second_kind_name">${humanFile.second_kind_name}</label></p>
	    <p>本机构总人数：<label id="human_amount">${size }</label>
		    基本薪酬总额：<label id="salary_standard_sum1"></label>
		    实发总额：<label id="salary_paid_sum1"></label>
		    登记人:<input id="register" type="text" size="5" value="<% 
					Users user=(Users)session.getAttribute("user");
					out.print(user.getU_true_name()); 
				%>"/>
		    登记时间：<label>${date}</label>
	    </p>
	    <input type="hidden" id="regist_time" value="${date}"/>
	    <table border="1" width="1000" align="center" bgcolor="#E0ECFF">
	        <tr class="t1">
	            <td>序号</td>
	            <td>档案编号</td>
	            <td>姓名</td>
	          	<c:forEach items="${configPublicCharList}" var="list">
					<c:if test="${list.attribute_kind=='薪酬设置'}">
	           			 <td>${list.attribute_name}</td>
	          		</c:if>
				</c:forEach>
	            <td>奖励金额</td>
	            <td>销售绩效金额</td>
	            <td>应扣金额</td>
	        </tr>
	        <c:forEach items="${humanFileList}" varStatus="var" var="list">
	        	<input type="hidden" id="salary_standard_id" value="${list.salary_standard_id}"/>
	        	<input type="hidden" name="salary_standard_sum2" value="${list.salary_sum}"/>
	        	<input type="hidden" name="salary_paid_sum2"/>
				<tr>
					<td>${var.index+1}</td>
			        <td><input name="human_id" readonly="readonly" style="background-color: #E0ECFF" value="${list.human_id}"/></td>
			        <td><input name="human_name" readonly="readonly" style="background-color: #E0ECFF" value="${list.human_name}"/></td>
			        <c:forEach items="${list.salaryStandardDetailslist}" var="l">
						<td>
							<input name="s" readonly="readonly" style="background-color: #E0ECFF" value="${l.salary}"/>
						</td>
					</c:forEach>
			        <td><input id="bouns_sum" type="text" size="5" name="bouns_sum" onchange="getTotalSalary();"/></td>
			        <td><input id="sale_sum" type="text" size="5" value="0.0" name="sale_sum" onchange="getTotalSalary();"/></td>
			        <td><input id="deduct_sum" type="text" size="5" name="deduct_sum" onchange="getTotalSalary();"/></td>
				</tr>
			</c:forEach>
	    </table>
    </form>
</body>
</html>
