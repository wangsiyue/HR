<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jQuery-EasyUI 1.1 应用实例</title>
<link href="js/themes/default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="js/themes/easyui.css" />
<link rel="stylesheet" type="text/css" href="js/themes/icon.css" />

<script type="text/javascript" src="js/themes/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/themes/jquery.easyui.min-1.2.0.js"></script>
<script type="text/javascript" src='js/themes/outlook.js'>
	
</script><!-- findByPage.action?pageNo=1&pageSize=4 -->

<script type="text/javascript">
	var _menus = {
		basic : [{
			"menuname" : "人力资源档案管理",
			"menus" : [ {
				"menuname" : "人力资源档案登记",
				"url" : "../toAddHumanFileForm.action"
			}, {
				"menuname" : "人力资源档案登记复核",
				"url" : "../showHumanFileCheckList.action"
			}, {
				"menuname" : "人力资源档案查询",
				"url" : "4.html"
			}, {
				"menuname" : "人力资源档案登变更",
				"url" : "6.html"
			}, {
				"menuname" : "人力资源档案删除管理",
				"url" : "*"
			} ]
		}, {
			"menuname" : "薪酬管理",
			"menus" : [ {
				"menuname" : "薪酬标准登记",
				"url" : "12.html"
			}, {
				"menuname" : "薪酬发放登记复核",
				"url" : "12.html"
			}, {
				"menuname" : "薪酬标准查询",
				"url" : "12.html"
			} , {
				"menuname" : "薪酬发放管理",
				"url" : "12.html"
			}]
		}, {
			"menuname" : "调动管理",
			"menus" : [ {
				"menuname" : "调动登记",
				"url" : "Allhuman.jsp"
			}, {
				"menuname" : "调动审核",
				"url" : "AllMajorchange.jsp"
			} ]
		}, {
			"menuname" : "激励管理",
			"menus" : [ {
				"menuname" : "激励登记",
				"url" : "12.html"
			} ]
		}, {
			"menuname" : "培训管理",
			"menus" : [ {
				"menuname" : "培训登记",
				"url" : "TrainManList.jsp"
			} ,{
				
				"menuname" : "培训复核",
				"url" : "CheckTrainingList.jsp"
			}]
		}, {
			"menuname" : "招聘管理",
			"menus" : [ {
				"menuname" : "职位发布管理",
				"url" : "12.html"
			}, {
				"menuname" : "简历管理",
				"url" : "12.html"
			}, {
				"menuname" : "面试管理",
				"url" : "12.html"
			}, {
				"menuname" : "招聘考试题库管理",
				"url" : "12.html"
			}, {
				"menuname" : "招聘考试管理",
				"url" : "12.html"
			}, {
				"menuname" : "录用管理",
				"url" : "12.html"
			} ]
		} ],
	};
</script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
	<div region="north" split="true" border="false"
		style="overflow: hidden; height: 30px; background: url(../images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%; line-height: 20px; color: #fff; font-family: Verdana, 微软雅黑, 黑体">
		<span style="float: right; padding-right: 20px;"> 欢迎 <label>zhangsan</label>&nbsp;&nbsp;
			<a href="#" style="color: #fff;">修改密码</a> <a href="#"
			style="color: #fff;">安全退出</a>
		</span>
		<ul id="css3menu"
			style="padding: 0px; margin: 0px; list-type: none; float: left; margin-left: 40px;">
			<a class="active" name="basic"></a>
		</ul>

	</div>
	<div region="west" hide="true" split="true" title="导航菜单"
		style="width: 180px;" id="west">
		<div id='wnav' class="easyui-accordion" fit="true" border="false">
			<!--  导航内容 -->
		</div>
	</div>
	<div id="mainPanle" region="center"
		style="background: #eee; overflow-y: hidden">
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
			<div title="欢迎使用" style="padding: 20px; overflow: hidden;" id="home">
				<h1>Welcome to the hr management System!</h1>
			</div>
		</div>
	</div>
</body>
</html>