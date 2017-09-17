<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script type="text/javascript">
function back(){
	window.location.href='javascript:history.go(-1)';
}
</script>
</head>
<body>
<form method="post" action="configfilefirstkind.do">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案恢复管理--人力资源档案恢复 </font></td>
  </tr>
  <tr>
    <td width="49%"> 恢复成功，请返回。</td>
    <td width="51%" align="right">        
    <input type="button" value="返回" class="BUTTON_STYLE1" onclick="back();"></td></tr>
  </table>

</form>
</body>
</html>
