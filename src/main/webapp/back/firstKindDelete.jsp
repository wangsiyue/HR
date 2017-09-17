<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<link type="text/css" rel="stylesheet" href="back/css/icon.css" />
<link type="text/css" rel="stylesheet" href="back/css/easyui.css" />

</head>

<body>
	<table width="100%">
		<tr>
			<td colspan="2"><font color="#0000CC">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--I级机构设置
			</font></td>
		</tr>
		<tr>
			<td width="49%">您确认删除 <label>${configFileFirstKind.first_kind_id }</label>
				/ <label>${configFileFirstKind.first_kind_name }</label> 这条记录吗?
			</td>
			<td width="51%" align="right"><input type="button" value="删除"
				class="BUTTON_STYLE1"
				onclick="del('${configFileFirstKind.first_kind_id }');"> <input
				type="button" value="返回" class="BUTTON_STYLE1"
				onclick="history.back();"></td>
		</tr>
	</table>
</body>
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	function del(id) {
		$.post('DelFirstKind.action', {
			first_kind_id : id
		}, function(data) {
			window.location.href = data;
		}, 'text');
	}
</script>
</html>