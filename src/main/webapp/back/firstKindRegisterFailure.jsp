<%@ page contentType="text/html; charset=gb2312" language="java" isELIgnored="false"%>
<html>
<head>
<meta>
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
    <font color="#0000CC">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--I级机构设置 </font></td>
  </tr>
  <tr>
    <td width="49%"> 录入失败，一级机构 <label>${firstKindName}</label> 已经存在，请返回。</td>
    <td width="51%" align="right">
    <input type="button" value="返回" class="BUTTON_STYLE1" onclick="back();"></td></tr>
  </table>

</form>
</body>
</html>
<iframe  width=0 height=0></iframe>
