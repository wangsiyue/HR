<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
<script type="text/javascript">
function back(){
	window.location.href='javascript:history.go(-1)';
}
</script>
<meta >
</head>
<body>
<form method="post" action="configmajorkind.do">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--职位分类设置 </font></td>
  </tr>
  <tr>
    <td width="49%"> 录入失败,职位分类名称<label>${majorKindName}</label> 已经存在，请返回。</td>
    <td width="51%" align="right">  <input type="button" value="继续录入" onclick="add();">
    <input type="button" value="返回" class="BUTTON_STYLE1" onclick="back();"></td></tr>
  </table>

</form>
</body>
</html>
<iframe  width=0 height=0></iframe>
