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
    <font color="#0000CC">����������ҵ���ǣ�������Դ--�ͻ�������--����������--����һ���������� </font></td>
  </tr>
  <tr>
    <td width="49%"> ¼��ʧ�ܣ�����һ���������� <label>${firstKindName}</label> �Ѿ����ڣ��뷵�ء�</td>
    <td width="51%" align="right">
    <input type="button" value="����" class="BUTTON_STYLE1" onclick="back();"></td></tr>
  </table>

</form>
</body>
</html>
<iframe  width=0 height=0></iframe>
