<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>  <% String path=request.getContextPath();
  String basePath=request.getScheme()+ "://"
  +request.getServerName()+":"+request.getServerPort()+path+"/";
  
  %> 
<base href="<%=basePath%>"> 

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../table.css" type="text/css"/>
<title>无标题文档</title>
</head>
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" >
function Submit(){
	alert("培训登记成功");
}

</script>
<link type="text/css" rel="stylesheet" href="back/css/icon.css" />
<link type="text/css" rel="stylesheet" href="back/css/easyui.css" />
<body>
<form name="form1" method="post" action="sureRegister">
 <table width="100%" >
    <tr>
      <td width="100%"><font color="#0000CC">您正在做的业务是:人力资源管理--培训管理--培训登记</font></td>
    </tr>
    <tr>
      <td><div align="right">
       <input type="submit" name="insert" value="提交"   onclick="Submit()"/>
		<input type="button" name="delete" value="返回"  onclick="history.go(-1)">
      </div></td>
    </tr>
  </table>
<table width="100%"  border="1" cellpadding=0 cellspacing=1 bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
  <tr>
    <td width="11%" class="TD_STYLE1" >档案编号</td>
    <td colspan="7" class="TD_STYLE2"><input  name="human_id" value="${humanFile.human_id }" /></td>
    </tr>
  <tr>
    <td class="TD_STYLE1">姓名</td>
    <td width="13%" class="TD_STYLE2" name="human_name"><input name="human_name" value="${humanFile.human_name }"/></td>
    <td width="15%" class="TD_STYLE1">职位分类</td>
   
    <td width="14%" class="TD_STYLE2" name="major_kind_name"><input name="major_kind_name" value="${humanFile.human_major_kind_name}"/></td>
    <td width="11%" class="TD_STYLE1">职位名称</td>
    <td width="11%" class="TD_STYLE2" name="major_name"><input name="major_name" value="${humanFile.hunma_major_name }"/></td>
    <td width="11%" class="TD_STYLE1">培训项目</td>
    <td width="14%" class="TD_STYLE2">
	 <input name="major_kind_id"  type="hidden" value="${humanFile.human_major_kind_id}"/>
     <input name="major_id"  type="hidden" value="${humanFile.human_major_id}"/>
	<input name="training_item" style="width: 100%" id="cc1" class="easyui-combobox"
					data-options="   
			        valueField: 'pbc_id',
		        	textField: 'attribute_name',
		        	url: 'findTrainItem.action'" />
	</td>
  </tr>
  <tr>
    <td height="20" class="TD_STYLE1" >培训课时</td>
    <td class="TD_STYLE2"><input name="training_hour"/></td>
    <td height="20" class="TD_STYLE1" >培训时间</td>
    <td class="TD_STYLE2"><input name="training_time"  class="easyui-datebox"
				style="width: 66%" value="" /></td>
    <td class="TD_STYLE1">培训成绩</td>
    <td class="TD_STYLE2">
    <input name="training_degree" style="width: 100%" id="cc1" class="easyui-combobox"
					data-options="   
			        valueField: 'pbc_id',
		        	textField: 'attribute_name',
		        	url: 'findTraindegree.action'" />
    
    </td>
    <td class="TD_STYLE1">登记人</td>
    <td class="TD_STYLE2"><input name="register" value="${name }" /></td>
    
  </tr>
  
  <tr>
  <td class="TD_STYLE1">登记时间</td>
    <td class="TD_STYLE2" ><input style="width:100%" name="regist_time" value="${date }"
				style="width: 66%" value=""  /></td>
  </tr>
  <tr>
    <td class="TD_STYLE1">备注</td>
    <td colspan="7" class="TD_STYLE2"><textarea  style="width:100%" name="remark" rows="5" class="TEXTAREA_STYLE1" ></textarea></td>
    </tr>
</table>
</form>
</body>
</html>
<iframe  width=0 height=0></iframe>
