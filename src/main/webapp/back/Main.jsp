<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.yc.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<%
	String path=request.getContextPath();//douban
	String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%= basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="back/css/icon.css"/>
<link type="text/css" rel="stylesheet" href="back/css/easyui.css"/>
<script type="text/javascript" src="back/js/jquery.min.js"></script>
<script type="text/javascript" src="back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="back/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
function loginout(){
	$.post('loginout.action',function(data){
		if(data==1){
			window.location.href='back/login.jsp';
		}
	},'json');
}
</script>
<style>
ul,li{
	list-style:none;
	padding:0px;
}
a{
	text-decoration:none;
}
  #head_panel{
 	font-size:50px;
 	color: #FFF;
 	position:relative;
 	left:400px;
 	top:60px;
 	background:#9CF;
 	font-family:"华文行楷";
 } 
.t1{
	 background-image:url(back/image/layout-browser-hd-bg.gif);
	 height:25px;
}
</style>

</head>
<body class="easyui-layout" data-options="fit:true">
	<div data-options="region:'north'" split="true" border="false"
		style="overflow: hidden; height: 30px; background: url(back/images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%; 
		line-height: 20px; color: #fff; font-family: Verdana, 微软雅黑, 黑体">
		<span style="float: right; padding-right: 20px;"> 欢迎
		<%
		     Users user=(Users)session.getAttribute("user");
		     if(null==user){
		    	 response.sendRedirect(request.getContextPath()+"/back/login.jsp");  //返回重新登录界面  
		     }else{
		%>
		    <label>
		    	<% out.print(user.getRole()); %>--<% out.print(user.getU_true_name()); %>
		    </label>&nbsp;&nbsp;
		<% 
		     }
		%>
			<a style="color: #fff;" href="back/changePassword.jsp">修改密码</a> 
			<a  href="loginout.action" style="color: #fff;">安全退出</a>
		</span>
    	<div id="head_panel" class="easyui-panel" data-options="fit:true,border:false"></div>
    </div>
    <div data-options="region:'west',title:'目录'" style="width:200px;">
    		<div class="easyui-accordion" data-options="fit:true,border:false">
				 <%if(user.getRole().equals("系统管理员")){
				%>
					<div title="客户化设置" style="padding:10px;">
					<ur class="easyui-tree">
    					<li>
    						<span style="padding:10px;">薪酬管理设置</span>
    						<ul>
    							<li>
    							<span><a onclick="addTab('薪酬标准项目','showSalaryProjectManage.action')"  data-options="fit:true,plain:true">薪酬标准项目</a></span>
    							</li>
    						</ul>
    					</li>
    					<li>   
              				<span style="padding:10px;">人力资源档案管理设置</span>   
                			<ul>   
                    			<li>   
                        			<span><a onclick="addTab('一级机构的设置','showFirstKind.action')" data-options="fit:true,plain:true">一级机构的设置</a></span>   
                   			 	</li>   
                    			<li>   
                        			<span><a onclick="addTab('二级机构的设置','showSecondKind.action.action')" data-options="fit:true,plain:true">二级机构的设置</a></span>   
                    			</li>   
                    			<li>   
                        			<span><a onclick="addTab('三级机构的设置','showThirdKind.action')" data-options="fit:true,plain:true">三级机构的设置</a></span>   
                   				</li> 
                   				<li>
    							<span><a onclick="addTab('职位分类设置','showMajorKind.action')"  data-options="fit:true,plain:true">职位分类设置</a></span>
    							</li>
    							<li>
    							<span><a onclick="addTab('职位设置','showMajor.action')"  data-options="fit:true,plain:true">职位设置</a></span>
    							</li>
    							<li>
    							<span><a onclick="addTab('职称设置','showProfession.action')"  data-options="fit:true,plain:true">职称设置</a></span>
    							</li> 
    							<li>
    							<span><a onclick="addTab('公共属性设置','showPublicChar.action')"  data-options="fit:true,plain:true">公共属性设置</a></span>
           	 				</ul>   
            			</li>   
    					<li>
    						<span style="padding:10px;">题库管理设置</span>
    						<ul>
    							<li>   
                        			<span><a onclick="addTab('试题一级分类设置','showQuestionFirstKind.action')" data-options="fit:true,plain:true">试题一级分类设置</a></span>   
                   			 	</li>   
                    			<li>   
                        			<span><a onclick="addTab('试题二级分类设置','showQuestionSecondKind.action')" data-options="fit:true,plain:true">试题二级分类设置</a></span>   
                    			</li>
    						</ul>
    					</li>
    				</ur>
				</div>
				<%
				 } %>
				 <%if(user.getRole().equals("人事经理")||user.getRole().equals("人事专员")||user.getRole().equals("系统管理员")){
				%>
					<div title="人力资源档案管理" style="padding:10px">
						<ur>
						 <%if(user.getRole().equals("人事专员")){
						%>
							<li><a class="easyui-linkbutton"  onclick="addTab('人力资源档案登记','showHumanFileRegister.action')"  data-options="fit:true,plain:true">人力资源档案登记</a></li>
							<li><a class="easyui-linkbutton" onclick="addTab('人力资源档案查询','showHumanFileQuery.action')" data-options="fit:true,plain:true">人力资源档案查询</a></li>
	            			<li><a class="easyui-linkbutton" onclick="addTab('人力资源档案登变更','showHumanFileChangeQuery.action')" data-options="fit:true,plain:true">人力资源档案变更</a></li>
						<%
						 }
						%>
	    				 <%if(user.getRole().equals("人事专员")){
						%>
							<li><a class="easyui-linkbutton"  onclick="addTab('人力资源档案登记复核','showHumanFileCheckList.action')" data-options="fit:true,plain:true">人力资源档案登记复核</a></li>
	            			<li><a class="easyui-linkbutton" onclick="addTab('人力资源档案查询','showHumanFileQuery.action')" data-options="fit:true,plain:true">人力资源档案查询</a></li>
	            			<li><a class="easyui-linkbutton" onclick="addTab('人力资源档案登变更','showHumanFileChangeQuery.action')" data-options="fit:true,plain:true">人力资源档案变更</a></li>
							<li><a class="easyui-linkbutton" onclick="addTab('人力资源档案删除管理','showHumanFileDeleteQuery.action')" data-options="fit:true,plain:true">人力资源档案删除</a></li>
	            			<li><a class="easyui-linkbutton" onclick="addTab('人力资源档案恢复管理','showHumanFileRecoveryQuery.action')" data-options="fit:true,plain:true">人力资源档案恢复</a></li>
	    				
						<%
	    				 }
						%>	
						 <%if(user.getRole().equals("系统管理员")){
						%>
							<li><a class="easyui-linkbutton"  onclick="addTab('人力资源档案登记','showHumanFileRegister.action')"  data-options="fit:true,plain:true">人力资源档案登记</a></li>
							<li><a class="easyui-linkbutton"  onclick="addTab('人力资源档案登记复核','showHumanFileCheckList.action')" data-options="fit:true,plain:true">人力资源档案登记复核</a></li>
	            			<li><a class="easyui-linkbutton" onclick="addTab('人力资源档案查询','showHumanFileQuery.action')" data-options="fit:true,plain:true">人力资源档案查询</a></li>
	            			<li><a class="easyui-linkbutton" onclick="addTab('人力资源档案登变更','showHumanFileChangeQuery.action')" data-options="fit:true,plain:true">人力资源档案变更</a></li>
							<li><a class="easyui-linkbutton" onclick="addTab('人力资源档案删除管理','showHumanFileDeleteQuery.action')" data-options="fit:true,plain:true">人力资源档案删除</a></li>
	            			<li><a class="easyui-linkbutton" onclick="addTab('人力资源档案恢复管理','showHumanFileRecoveryQuery.action')" data-options="fit:true,plain:true">人力资源档案恢复</a></li>
	    				
						<%} %>
	            		</ur>
					</div>
				<%
				}
				%>
				
				<%if(user.getRole().equals("薪酬经理")||user.getRole().equals("薪酬专员")||user.getRole().equals("系统管理员")){
				%>
					<div title="薪酬管理" style="padding:10px">
					<ur>
					<%if(user.getRole().equals("系统管理员")){
						%>
    					<li><a class="easyui-linkbutton" onclick="addTab('薪酬标准登记','showSalaryStandardRegister.action')"  data-options="fit:true,plain:true">薪酬标准登记</a></li>
            			<li><a class="easyui-linkbutton"  onclick="addTab('薪酬标准登记复核','showSalaryStandardCheckList.action')" data-options="fit:true,plain:true">薪酬标准登记复核</a></li>
            			<li><a class="easyui-linkbutton"  onclick="addTab('薪酬标准查询','showSalaryStandardQuery.action')" data-options="fit:true,plain:true">薪酬标准查询</a></li>
            			<li><a class="easyui-linkbutton"  onclick="addTab('薪酬发放登记','showSalaryGrant.action')" data-options="fit:true,plain:true">薪酬发放登记</a></li>
            			<li><a class="easyui-linkbutton"  onclick="addTab('薪酬发放复核','showSalaryGrantCheckList.action')" data-options="fit:true,plain:true">薪酬发放复核</a></li>
            			<li><a class="easyui-linkbutton"  onclick="addTab('薪酬发放查询','showSalaryGrantQuery.action')" data-options="fit:true,plain:true">薪酬发放查询</a></li>
    				<%} %>
    				<%if(user.getRole().equals("薪酬专员")){
						%>
    					<li><a class="easyui-linkbutton" onclick="addTab('薪酬标准登记','showSalaryStandardRegister.action')"  data-options="fit:true,plain:true">薪酬标准登记</a></li>
            			<li><a class="easyui-linkbutton"  onclick="addTab('薪酬标准查询','showSalaryStandardQuery.action')" data-options="fit:true,plain:true">薪酬标准查询</a></li>
            			<li><a class="easyui-linkbutton"  onclick="addTab('薪酬发放管理','showSalaryGrant.action')" data-options="fit:true,plain:true">薪酬发放登记</a></li>
            			<li><a class="easyui-linkbutton"  onclick="addTab('薪酬发放查询','showSalaryGrantQuery.action')" data-options="fit:true,plain:true">薪酬发放查询</a></li>
    				<%} %>
    				<%if(user.getRole().equals("薪酬经理")){
						%>
    					<li><a class="easyui-linkbutton" onclick="addTab('薪酬标准登记','showSalaryStandardRegister.action')"  data-options="fit:true,plain:true">薪酬标准登记</a></li>
            			<li><a class="easyui-linkbutton"  onclick="addTab('薪酬标准登记复核','showSalaryStandardCheckList.action')" data-options="fit:true,plain:true">薪酬标准登记复核</a></li>
            			<li><a class="easyui-linkbutton"  onclick="addTab('薪酬标准查询','showSalaryStandardQuery.action')" data-options="fit:true,plain:true">薪酬标准查询</a></li>
            			<li><a class="easyui-linkbutton"  onclick="addTab('薪酬发放管理','showSalaryGrant.action')" data-options="fit:true,plain:true">薪酬发放登记</a></li>
            			<li><a class="easyui-linkbutton"  onclick="addTab('薪酬发放复核','showSalaryGrantCheckList.action')" data-options="fit:true,plain:true">薪酬发放复核</a></li>
            			<li><a class="easyui-linkbutton"  onclick="addTab('薪酬发放查询','showSalaryGrantQuery.action')" data-options="fit:true,plain:true">薪酬发放查询</a></li>
    				<%} %>
    				</ur>
				</div>
				<%} %>
				<%if(user.getRole().equals("人事经理")||user.getRole().equals("人事专员")||user.getRole().equals("系统管理员")){ %>
				<div title="调动管理" style="padding:10px">
					<ur>
    					<li><a class="easyui-linkbutton" onclick="addTab('调动登记','showAllhuman.action')"  data-options="fit:true,plain:true">调动登记</a></li>
            			<li><a class="easyui-linkbutton"  onclick="addTab('调动复核','showAllMajorchange.action')" data-options="fit:true,plain:true">调动复核</a></li>
    				</ur>
				</div>
				<!-- <div title="激励管理" style="padding:10px">
					<ur>
    					<li><a class="easyui-linkbutton" onclick="addTab('薪酬标准登记','showSalaryStandardRegister.action')"  data-options="fit:true,plain:true">薪酬标准登记</a></li>
            			<li><a class="easyui-linkbutton"  onclick="addTab('薪酬标准登记复核','showSalaryStandardCheckList.action')" data-options="fit:true,plain:true">薪酬标准登记复核</a></li>
    				</ur>
				</div> -->
				<div title="培训管理" style="padding:10px">
					<ur>
    					<li><a class="easyui-linkbutton" onclick="addTab('培训登记','showTrainManList.action')"  data-options="fit:true,plain:true">培训登记</a></li>
            			<li><a class="easyui-linkbutton"  onclick="addTab('培训复核','showCheckTrainingList.action')" data-options="fit:true,plain:true">培训复核</a></li>
    				</ur>
				</div>
				<%} %>
				<%if(user.getRole().equals("应聘者")||user.getRole().equals("人事专员")||user.getRole().equals("招聘经理")||user.getRole().equals("招聘专员")||user.getRole().equals("系统管理员")){
				%>
				 <div title="招聘管理" style="padding:10px;">
					<ur class="easyui-tree">
					<%if(user.getRole().equals("系统管理员")){
					%>
						<li>
    						<span style="padding:10px;">职位发布管理</span>
    						<ul>
    							<li>
    							<span><a onclick="addTab('职位发布','toEngageMajorReleaseRegister.action')"  data-options="fit:true,plain:true">职位发布</a></span>
    							</li>
    							<li>
    							<span><a onclick="addTab('职位更新','toupdateEngageMajorRelease.action')"  data-options="fit:true,plain:true">职位发布更新</a></span>
    							</li>
    							<li>
    							<span><a onclick="addTab('职位查询','toEngageMajorReleaseQuery.action')"  data-options="fit:true,plain:true">职位查询</a></span>
    							</li>
    						</ul>
    					</li>
    					<li>   
              				<span style="padding:10px;">简历管理</span>   
                			<ul>   
              					<li>
    								<span><a  onclick="addTab('简历添加','toResumeRegister2.action')"  data-options="fit:true,plain:true">简历添加</a></span>
    							</li>
    							<li>
    								<span><a  onclick="addTab('简历筛选查询','toResumeQuery.action')"  data-options="fit:true,plain:true">简历筛选查询</a></span>
    							</li>  	
           	 				</ul>   
            			</li>   
    					<li>
    						<span style="padding:10px;">面试管理</span>
    						<ul>
    							<li>
    								<span><a  onclick="addTab('面试添加','toInterviewRegisterList.action')"  data-options="fit:true,plain:true">面试添加</a></span>
    							</li>
    							<li>
    								<span><a  onclick="addTab('面试筛选','toInterviewCheckList.action')"  data-options="fit:true,plain:true">面试筛选</a></span>
    							</li>
    						</ul>
    					</li>
    					<li>
    						<span style="padding:10px;">招聘考试题库管理</span>
    						<ul>
    							<li>
    							<span><a  onclick="addTab('试题登记','toEngageSubjectsRegister.action')"  data-options="fit:true,plain:true">试题登记</a></span>
    							</li>
    							<li>
    							<span><a  onclick="addTab('试题查询','toEngageSubjectsQuery.action')"  data-options="fit:true,plain:true">试题查询</a></span>
    							</li>
    						</ul>
    					</li>
    					<li>
    						<span style="padding:10px;">招聘考试管理</span>
    						<ul>
    							<li>
    							<span><a  onclick="addTab('考试出题','toEngageExamRegisterList.action')"  data-options="fit:true,plain:true">考试出题</a></span>
    							</li>
    							<li>
    							<span><a  onclick="addTab('考试成绩筛选','toEngageExamGradeQuery.action')"  data-options="fit:true,plain:true">考试成绩筛选</a></span>
    							</li>
    						</ul>
    					</li>
    					<li>   
              				<span style="padding:10px;">录用管理</span>   
                			<ul> 
              					<li>
    								<span><a  onclick="addTab('录用申请','toPassRegisterList.action')"  data-options="fit:true,plain:true">录用申请</a></span>
    							</li>
    							<li>
    								<span><a  onclick="addTab('录用审批','toPassPassList.action')"  data-options="fit:true,plain:true">录用审批</a></span>
    							</li> 
    							<li>
    								<span><a  onclick="addTab('录用查询','toPassFindList.action')"  data-options="fit:true,plain:true">录用查询</a></span>
    							</li>
           	 				</ul>   
            			</li> 
    				</ur>
    				<%} %>
    				<%if(user.getRole().equals("应聘者")){ %>
						<li>
		    				<span style="padding:10px;">招聘考试管理</span>
		    				<ul>
								<li>
									<span><a  onclick="addTab('考试答题','toEngageAnswerRegisterQuery.action')"  data-options="fit:true,plain:true">考试答题</a></span>
								</li>
							</ul>
						</li>
					<%} %>
				</div>
				<%} %>
			</div>	
    </div>
    <div data-options="region:'center'"  >
    	<div id="tt" class="easyui-tabs" style="height:600px;fit:true;tabWidth:50px"></div>
    </div>
</body>
<script>
function addTab(title,url){
	if($('#tt').tabs('exists',title)){
		$('#tt').tabs('select',title);
	}else{
		var content='<iframe scrollling="auto" frameborder="0" src="'+url+'" style="width:100%;height:100%"></iframe>';
		$('#tt').tabs('add',{
			title:title,
			content:content,
			closable:true
		});
	}
}
</script>
</html>