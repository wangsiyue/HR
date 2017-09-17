package com.yc.web.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.yc.bean.ConfigMajor;
import com.yc.bean.ConfigPublicChar;
import com.yc.bean.ConfigQuestionFirstKind;
import com.yc.bean.ConfigQuestionSecondKind;
import com.yc.bean.EngageAnswer;
import com.yc.bean.EngageAnswerDetails;
import com.yc.bean.EngageExam;
import com.yc.bean.EngageExamDetails;
import com.yc.bean.EngageInterview;
import com.yc.bean.EngageMajorRelease;
import com.yc.bean.EngageResume;
import com.yc.bean.EngageSubjects;
import com.yc.bean.HumanFile;
import com.yc.bean.SalaryGrant;
import com.yc.bean.SalaryGrantDetails;
import com.yc.bean.SalaryStandard;
import com.yc.bean.SalaryStandardDetails;
import com.yc.bean.Users;
import com.yc.biz.ConfigMajorBiz;
import com.yc.biz.ConfigPublicCharBiz;
import com.yc.biz.ConfigQuestionFirstKindBiz;
import com.yc.biz.ConfigQuestionSecondKindBiz;
import com.yc.biz.EngageAnswerBiz;
import com.yc.biz.EngageAnswerDetailsBiz;
import com.yc.biz.EngageExamBiz;
import com.yc.biz.EngageExamDetailsBiz;
import com.yc.biz.EngageInterviewBiz;
import com.yc.biz.EngageMajorReleaseBiz;
import com.yc.biz.EngageResumeBiz;
import com.yc.biz.EngageSubjectsBiz;
import com.yc.biz.HumanFileBiz;
import com.yc.biz.UsersBiz;
import com.yc.web.util.DateUtil;
import com.yc.web.util.ResponseData;
import com.yc.web.util.ServletUtil;
import com.yc.web.util.UUIDUtil;

@Controller
public class EngageMajorController {
	private static final Log logger = LogFactory.getLog(EngageMajorController.class);

	private ConfigPublicCharBiz configPublicCharBiz;
	private EngageMajorReleaseBiz engageMajorReleaseBiz;
	private ConfigQuestionSecondKindBiz configQuestionSecondKindBiz;
	private ConfigQuestionFirstKindBiz configQuestionFirstKindBiz;
	private EngageSubjectsBiz engageSubjectsBiz;
	private EngageResumeBiz engageResumeBiz;

	private EngageInterviewBiz engageInterviewBiz;

	private HumanFileBiz humanFileBiz;
	private ConfigMajorBiz ConfigMajorBiz;

	private EngageExamBiz engageExamBiz;
	private EngageExamDetailsBiz engageExamDetailsBiz;
	
	private EngageAnswerDetailsBiz engageAnswerDetailsBiz;
	
	private UsersBiz usersBiz;
	@Resource(name = "usersBizImpl")
	public void setUsersBizBiz(UsersBiz usersBiz) {
		this.usersBiz = usersBiz;
	}
	
	@Resource(name = "engageAnswerDetailsBizImpl")
	public void setEngageAnswerDetailsBiz(EngageAnswerDetailsBiz engageAnswerDetailsBiz) {
		this.engageAnswerDetailsBiz = engageAnswerDetailsBiz;
	}
	
	
	private EngageAnswerBiz engageAnswerBiz;
	
	@Resource(name = "engageAnswerBizImpl")
	public void setEngageAnswerBiz(EngageAnswerBiz engageAnswerBiz) {
		this.engageAnswerBiz = engageAnswerBiz;
	}
	
	@Resource(name = "engageExamDetailsBizImpl")
	public void setEngageExamDetailsBiz(EngageExamDetailsBiz engageExamDetailsBiz) {
		this.engageExamDetailsBiz = engageExamDetailsBiz;
	}

	@Resource(name = "engageExamBizImpl")
	public void setEngageExamBiz(EngageExamBiz engageExamBiz) {
		this.engageExamBiz = engageExamBiz;
	}

	@Resource(name = "configMajorBizImpl")
	public void setConfigMajorBiz(ConfigMajorBiz configMajorBiz) {
		ConfigMajorBiz = configMajorBiz;
	}

	@Resource(name = "humanFileBizImpl")
	public void setBookBiz(HumanFileBiz humanFileBiz) {
		this.humanFileBiz = humanFileBiz;
	}

	@Resource(name = "engageInterviewBizImpl")
	public void setengageInterviewBiz(EngageInterviewBiz engageInterviewBiz) {
		this.engageInterviewBiz = engageInterviewBiz;
	}

	String date = DateUtil.formatTime(new Date());

	@Resource(name = "engageSubjectsBizImpl")
	public void setengageSubjectsBiz(EngageSubjectsBiz engageSubjectsBiz) {
		this.engageSubjectsBiz = engageSubjectsBiz;
	}

	@Resource(name = "engageResumeBizImpl")
	public void setengageResumeBiz(EngageResumeBiz engageResumeBiz) {
		this.engageResumeBiz = engageResumeBiz;
	}

	@Resource(name = "configQuestionFirstKindBizImpl")
	public void setconfigQuestionFirstKindBiz(ConfigQuestionFirstKindBiz configQuestionFirstKindBiz) {
		this.configQuestionFirstKindBiz = configQuestionFirstKindBiz;
	}

	@Resource(name = "configQuestionSecondKindBizImpl")
	public void setconfigQuestionSecondKindBiz(ConfigQuestionSecondKindBiz configQuestionSecondKindBiz) {
		this.configQuestionSecondKindBiz = configQuestionSecondKindBiz;
	}

	@Resource(name = "engageMajorReleaseBizImpl")
	public void setEngageMajorRelease(EngageMajorReleaseBiz engageMajorReleaseBiz) {
		this.engageMajorReleaseBiz = engageMajorReleaseBiz;
	}

	@Resource(name = "configPublicCharBizImpl")
	public void setConfigPublicChar(ConfigPublicCharBiz configPublicCharBiz) {
		this.configPublicCharBiz = configPublicCharBiz;
	}

	// 职位发布--------------------------------------------------------------------------------------------------------
	// 跳转到职位发布登记页面
	@RequestMapping(value = "/toEngageMajorReleaseRegister")
	public String toEngageMajorRelease(Model model) {
		model.addAttribute("date", date);
		model.addAttribute("engageMajorRelease", new EngageMajorRelease());
		return "../../back/engageMajorReleaseRegister";
	}

	// 添加招聘发布信息
	@RequestMapping(value = "/addEngageMajorRelease")
	public @ResponseBody String addEngageMajorRelease(@RequestParam String first_kind_id,
			@RequestParam String first_kind_name, @RequestParam String second_kind_id,
			@RequestParam String second_kind_name, @RequestParam String third_kind_id,
			@RequestParam String third_kind_name, @RequestParam String major_kind_id,
			@RequestParam String major_kind_name, @RequestParam String major_id, @RequestParam String major_name,
			@RequestParam int human_amount, @RequestParam String engage_type, @RequestParam String deadline,
			@RequestParam String register, @RequestParam String regist_time, @RequestParam String major_describe,
			@RequestParam String engage_required, HttpServletRequest request) throws Exception {
		EngageMajorRelease engageMajorRelease = new EngageMajorRelease();
		engageMajorRelease.setFirst_kind_id(first_kind_id);
		engageMajorRelease.setFirst_kind_name(first_kind_name);
		engageMajorRelease.setSecond_kind_id(second_kind_id);
		engageMajorRelease.setSecond_kind_name(second_kind_name);
		engageMajorRelease.setThird_kind_id(third_kind_id);
		engageMajorRelease.setThird_kind_name(third_kind_name);
		engageMajorRelease.setMajor_kind_id(major_kind_id);
		engageMajorRelease.setMajor_kind_name(major_kind_name);
		engageMajorRelease.setMajor_id(major_id);
		engageMajorRelease.setMajor_name(major_name);
		engageMajorRelease.setHuman_amount(human_amount);
		engageMajorRelease.setEngage_type(engage_type);
		engageMajorRelease.setDeadline(deadline);
		engageMajorRelease.setRegister(register);
		engageMajorRelease.setRegist_time(regist_time);
		engageMajorRelease.setMajor_describe(major_describe);
		engageMajorRelease.setEngage_required(engage_required);
		EngageMajorRelease a = engageMajorReleaseBiz.add(engageMajorRelease);
		return "back/engageMajorReleaseSuccess.jsp";
	}

	// 跳到更新招聘发布信息
	@RequestMapping(value = "/toupdateEngageMajorRelease")
	public String toupdateEngageMajorRelease() {
		return "../../back/engageMajorReleaseChangeList";
	}

	@RequestMapping(value = "/showEngageMajorReleaseList")
	public String showEngageMajorReleaseList(HttpServletResponse response) throws IOException {
		logger.info("职位更新操作");
		response.setContentType("application/json; charset=utf-8");

		EngageMajorRelease engageMajorRelease = new EngageMajorRelease();
		List<EngageMajorRelease> list = engageMajorReleaseBiz.findEngageMajorRelease(engageMajorRelease);
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		String json = gson.toJson(map);
		out.println(json);
		out.close();
		return "../../back/engageMajorReleaseChangeList";
	}

	// 跳到对应id职位发布页面
	@RequestMapping(value = "/toEngageMajorReleaseDetails")
	public String toEngageMajorReleaseDetails(Model model, @RequestParam int mre_id) {
		EngageMajorRelease engageMajorRelease = new EngageMajorRelease();
		engageMajorRelease.setMre_id(mre_id);
		engageMajorRelease = this.engageMajorReleaseBiz.findDetailByMreId(engageMajorRelease).get(0);
		model.addAttribute("engageMajorRelease", engageMajorRelease);
		model.addAttribute("date", date);
		return "../../back/engageMajorReleaseChange";
	}

	@RequestMapping(value = "/updateEngageMajorRelease")
	public @ResponseBody String updateEngageMajorRelease(@RequestParam int mre_id, @RequestParam int human_amount,
			@RequestParam String engage_type, @RequestParam String deadline, @RequestParam String changer,
			@RequestParam String change_time, @RequestParam String major_describe, @RequestParam String engage_required,
			HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=utf-8");
		EngageMajorRelease engageMajorRelease = new EngageMajorRelease();
		engageMajorRelease.setHuman_amount(human_amount);
		engageMajorRelease.setEngage_type(engage_type);
		engageMajorRelease.setDeadline(deadline);
		engageMajorRelease.setChange_time(change_time);
		engageMajorRelease.setChanger(changer);
		engageMajorRelease.setMre_id(mre_id);
		engageMajorRelease.setMajor_describe(major_describe);
		engageMajorRelease.setEngage_required(engage_required);
		int i = this.engageMajorReleaseBiz.update(engageMajorRelease);
		if (i > 0) {
			return "back/engageMajorReleaseChangeSuccess.jsp";
		} else {
			return null;
		}
	}

	@RequestMapping(value = "/deleteEngageMajorRelease")
	public String deleteEngageMajorRelease(HttpServletRequest request, @RequestParam int mre_id) {
		logger.info("职位删除操作");
		EngageMajorRelease engageMajorRelease = new EngageMajorRelease();
		engageMajorRelease.setMre_id(mre_id);
		engageMajorReleaseBiz.delete(engageMajorRelease);
		return "../../back/engageMajorReleaseChangeSuccess";
	}

	// 跳到职位发布查询页面
	@RequestMapping(value = "/toEngageMajorReleaseQuery")
	public String toEngageMajorReleaseQuery(Model model) {
		EngageMajorRelease engageMajorRelease = new EngageMajorRelease();
		List<EngageMajorRelease> list = engageMajorReleaseBiz.findEngageMajorRelease(engageMajorRelease);
		model.addAttribute("size", list.size());
		return "../../back/engageMajorReleaseQuery";
	}

	// 简历管理---------------------------------------------------------------------------------------------------------
	// 申请职位时跳转到简历添加页面
	@RequestMapping(value = "/toResumeRegister")
	public String toResumeRegister(Model model, @RequestParam int mre_id) {
		EngageMajorRelease engageMajorRelease = new EngageMajorRelease();
		engageMajorRelease.setMre_id(mre_id);
		engageMajorRelease = this.engageMajorReleaseBiz.findDetailByMreId(engageMajorRelease).get(0);
		model.addAttribute("engageMajorRelease", engageMajorRelease);
		List<ConfigPublicChar> configPublicCharList = this.configPublicCharBiz.find();
		model.addAttribute("configPublicCharList", configPublicCharList);
		return "../../back/resumeRegister";
	}

	// 应聘者通过应聘某职位而跳转到简历登记页面 简历添加
	@RequestMapping(value = "/addResume")
	public @ResponseBody void addResume(HttpServletResponse response, HttpServletRequest request,
			@ModelAttribute EngageResume engageResume,
			@RequestParam(name = "picData", required = false) MultipartFile picData) throws Exception {
		response.setCharacterEncoding("utf-8");
		if (picData != null && !picData.isEmpty()) {
			picData.transferTo(new File(ServletUtil.UPLOAD_DIR, picData.getOriginalFilename())); // 上传文件
			engageResume.setHuman_picture(("/" + ServletUtil.UPLOAD_DIR_NAME + "/" + picData.getOriginalFilename()));
		}
		// 设置登记人
		engageResume.setRegister("resumer");
		engageResume.setRegist_time(DateUtil.formatDate(new Date()));
		System.out.println(engageResume);
		int i = this.engageResumeBiz.add(engageResume);
		//简历添加时添加user表信息
		Users u=new Users();
		u.setRole("应聘者");
		u.setU_name(engageResume.getHuman_name());
		u.setU_true_name(engageResume.getHuman_name());
		u.setU_password(engageResume.getHuman_idcard());
		u=this.usersBiz.add(u);
		PrintWriter out = response.getWriter();
		if (i > 0) {
			out.print(1);
		} else {
			out.print(0);
		}
	}

	// 应聘者直接使用简历登记功能点填写简历
	@RequestMapping(value = "/toResumeRegister2")
	public String toResumeRegister2(Model model) {
		EngageMajorRelease engageMajorRelease = new EngageMajorRelease();
		List<ConfigPublicChar> configPublicCharList = this.configPublicCharBiz.find();
		model.addAttribute("configPublicCharList", configPublicCharList);
		return "../../back/resumeRegister2";
	}

	// 跳转到有效简历查询
	@RequestMapping(value = "/toResumeQuery")
	public String toResumeQuery(Model model) {
		return "../../back/resumeQuery";
	}

	// 跳转到查询list页面
	@RequestMapping(value = "/toResumeQueryList")
	public @ResponseBody String toResumeQueryList(String human_major_kind_id, String human_major_id, String key,
			String minTime, String maxTime) throws Exception {
		EngageResume engageResume = new EngageResume();
		engageResume.setHuman_major_kind_id(human_major_kind_id);
		engageResume.setHuman_major_id(human_major_id);
		engageResume.setKey("%" + key + "%");
		engageResume.setMinTime(minTime);
		engageResume.setMaxTime(maxTime);
		List<EngageResume> totalList = this.engageResumeBiz.findBy(engageResume);
		int size = totalList.size();
		return "back/resumeQueryList.jsp," + size;
	}

	// 按条件查询并分页显示所有简历
	@RequestMapping(value = "/findResumeByConditionAndPage")
	public @ResponseBody void findResumeByConditionAndPage(@RequestParam String human_major_kind_id,
			@RequestParam String human_major_id, @RequestParam String key, @RequestParam String minTime,
			@RequestParam String maxTime, @RequestParam int page, @RequestParam int rows, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		EngageResume engageResume = new EngageResume();
		engageResume.setHuman_major_kind_id(human_major_kind_id);
		engageResume.setHuman_major_id(human_major_id);
		engageResume.setKey("%" + key + "%");
		engageResume.setMinTime(minTime);
		engageResume.setMaxTime(maxTime);
		List<EngageResume> list = this.engageResumeBiz.findResumeByConditionAndPage(engageResume, page, rows);

		// 获取所有符合条件薪酬标准
		int size = this.engageResumeBiz.findBy(engageResume).size();
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		rd.setRows(list);
		rd.setTotal("" + size);
		out.print(gson.toJson(rd));
	}

	// 跳转
	@RequestMapping(value = "/toResumeChoose")
	public String toResumeChoose(Model model, @RequestParam int res_id) throws Exception {
		EngageResume engageResume = new EngageResume();
		engageResume.setRes_id(res_id);
		engageResume = (EngageResume) this.engageResumeBiz.findEngageResume(engageResume).get(0);
		model.addAttribute("engageResume", engageResume);
		List<ConfigPublicChar> configPublicCharList = this.configPublicCharBiz.find();
		model.addAttribute("configPublicCharList", configPublicCharList);
		model.addAttribute("date", date);
		return "../../back/resumeChoose";
	}

	// 简历筛选 可以修改
	@RequestMapping(value = "/chooseResume")
	public @ResponseBody void chooseResume(HttpServletResponse response, HttpServletRequest request,
			@ModelAttribute EngageResume engageResume,
			@RequestParam(name = "picData", required = false) MultipartFile picData) throws Exception {
		response.setCharacterEncoding("utf-8");
		if (picData != null && !picData.isEmpty()) {
			picData.transferTo(new File(ServletUtil.UPLOAD_DIR, picData.getOriginalFilename())); // 上传文件
			engageResume.setHuman_picture(("/" + ServletUtil.UPLOAD_DIR_NAME + "/" + picData.getOriginalFilename()));
		}
		int i = this.engageResumeBiz.chooseResume(engageResume);
		PrintWriter out = response.getWriter();
		if (i > 0) {
			out.print(1);
		} else {
			out.print(0);
		}
	}

	// 面试管理--------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/toInterviewRegisterList")
	public String toInterviewRegisterList(Model model) throws Exception {
		return "../../back/interviewRegisterList";
	}

	// 跳转到查询面试list页面
	@RequestMapping(value = "/showInterviewRegistList")
	public String showInterviewRegistList(HttpServletResponse response) throws Exception {
		// 查询简历表中面试状态为0的简历
		response.setContentType("application/json; charset=utf-8");
		List<EngageResume> list = this.engageResumeBiz.findInterview();
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		String json = gson.toJson(map);
		out.println(json);
		out.close();
		return "../../back/interviewRegisterList";
	}

	// 跳转到登记面试页面
	@RequestMapping(value = "/toInterviewRegister")
	public String toInterviewRegister(Model model, int res_id, HttpSession session) throws Exception {
		EngageResume engageResume = new EngageResume();
		engageResume.setRes_id(res_id);
		engageResume = (EngageResume) this.engageResumeBiz.findEngageResume(engageResume).get(0);
		model.addAttribute("engageResume", engageResume);
		// 查询面试表中是否存在该res_id,有则获取该interview_amount : 面试次数并加1 没有则默认为1
		EngageInterview engageInterview = new EngageInterview();
		engageInterview.setResume_id(res_id);
		List<EngageInterview> list = this.engageInterviewBiz.findResumeExit(engageInterview);
		// engage_interview interview_amount 面试表中面试次数
		if (list.size() > 0) {
			model.addAttribute("interview_amount", list.get(0).getInterview_amount());
		} else {
			model.addAttribute("interview_amount", 1);
		}
		Users user = (Users) session.getAttribute("user");
		model.addAttribute("user", user.getU_true_name());
		model.addAttribute("engageInterview", new EngageInterview());
		return "../../back/interviewRegister";
	}

	// 面试登记
	@RequestMapping(value = "/addInterview")
	public String addInterview(Model model, @ModelAttribute EngageInterview engageInterview,
			HttpServletRequest request) {
		System.out.println("amount:::" + engageInterview.getInterview_amount());
		// 添加面试的同时修改简历里面的面试状态
		EngageResume engageResume = new EngageResume();
		engageResume.setRes_id(engageInterview.getResume_id());
		engageResume.setInterview_status(1);
		int j = this.engageResumeBiz.updInterview(engageResume);
		int i = 0;
		// 如果获取的
		if (engageInterview.getInterview_amount() > 1) {
			// 执行更改面试表信息的操作
			// 获取ein_id
			EngageInterview ei = new EngageInterview();
			ei.setResume_id(engageInterview.getResume_id());
			ei = this.engageInterviewBiz.find(ei).get(0);
			engageInterview.setEin_id(ei.getEin_id());
			i = this.engageInterviewBiz.updateInterview(engageInterview);
		} else {
			// 执行添加操作
			i = this.engageInterviewBiz.addInterview(engageInterview);
		}
		if (i > 0 && j > 0) {
			return "../../back/interviewRegisterSuccess";
		}
		return "../../back/interviewRegisterFailure";
	}

	// 跳转到面试筛选list页面
	@RequestMapping(value = "/toInterviewCheckList")
	public String toInterviewList(Model model) throws Exception {
		return "../../back/interviewCheckList";
	}

	// 显示面试筛选list
	@RequestMapping(value = "/showInterviewCheckList")
	public String showInterviewCheckList(HttpServletResponse response) throws Exception {
		response.setContentType("application/json; charset=utf-8");
		EngageInterview engageInterview = new EngageInterview();
		engageInterview.setCheck_status(0);
		List<EngageInterview> list = this.engageInterviewBiz.find(engageInterview);
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		String json = gson.toJson(map);
		out.println(json);
		out.close();
		return "../../back/interviewCheckList";
	}

	// 跳转到筛选面试页面
	@RequestMapping(value = "/toInterviewCheck")
	public String toInterviewCheck(Model model, int ein_id) throws Exception {
		EngageInterview engageInterview = new EngageInterview();
		engageInterview.setEin_id(ein_id);
		engageInterview = this.engageInterviewBiz.find(engageInterview).get(0);
		EngageResume engageResume = new EngageResume();
		engageResume.setRes_id(engageInterview.getResume_id());
		engageResume = this.engageResumeBiz.findEngageResume(engageResume).get(0);
		model.addAttribute("engageInterview", engageInterview);
		model.addAttribute("engageResume", engageResume);
		model.addAttribute("date", date);
		return "../../back/interviewCheck";
	}

	// 筛选面试
	@RequestMapping(value = "/interviewCheck")
	public @ResponseBody String interviewCheck(Model model, @RequestParam String result, @RequestParam int res_id,
			@RequestParam int ein_id, @RequestParam String checker, @RequestParam String check_time,
			@RequestParam String check_comment) throws Exception {
		int j = 0;
		if ("删除简历".equals(result)) {
			return "back/interviewDeleteConfirm.jsp?res_id=" + res_id + "&ein_id=" + ein_id;
		} else if ("建议录用".equals(result)) {
			// 修改简历中通过登记人姓名和通过登记时间 并修改面试表的信息 面试次数不需要+1
			EngageResume engageResume = new EngageResume();
			engageResume.setRes_id(res_id);
			engageResume.setPass_register(checker);
			engageResume.setPass_regist_time(check_time);
			j = this.engageResumeBiz.updInterview(engageResume);
		}
		EngageInterview engageInterview = new EngageInterview();
		engageInterview.setEin_id(ein_id);
		engageInterview = this.engageInterviewBiz.find(engageInterview).get(0);
		engageInterview.setEin_id(ein_id);
		engageInterview.setChecker(checker);
		engageInterview.setCheck_time(check_time);
		engageInterview.setCheck_comment(check_comment);
		engageInterview.setResult(result);
		engageInterview.setResume_id(res_id);
		int i = this.engageInterviewBiz.checkInterview(engageInterview);
		if (i > 0) {
			return "back/interviewCheckSuccess.jsp";
		} else {
			return null;
		}
	}

	// 删除简历和面试信息
	@RequestMapping(value = "/deleteResume")
	public @ResponseBody String deleteResume(Model model, int res_id, int ein_id) throws Exception {
		EngageResume engageResume = new EngageResume();
		engageResume.setRes_id(res_id);
		;
		int i = this.engageResumeBiz.deleteResume(engageResume);
		EngageInterview engageInterview = new EngageInterview();
		engageInterview.setEin_id(ein_id);
		int j = this.engageInterviewBiz.deleteInterview(engageInterview);
		if (i > 0 && j > 0) {
			return "interviewCheckSuccess.jsp";
		}
		return null;
	}

	// 试题管理----------------------------------------------------------------------------------------------------------
	// 试题类型级联1
	@RequestMapping(value = "/findQuestionFirstKind")
	public @ResponseBody void findFirstfindQuestionFirstKindKind(HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		List<ConfigQuestionFirstKind> list = this.configQuestionFirstKindBiz.findAll(new ConfigQuestionFirstKind());
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		out.print(gson.toJson(list));
	}

	// 试题类型级联2
	@RequestMapping(value = "/findQuestionSecondKindByFirstKindId")
	public @ResponseBody void findQuestionSecondKindByFirstKindId(HttpServletRequest request,
			HttpServletResponse response, String first_kind_id) throws Exception {
		response.setCharacterEncoding("utf-8");
		ConfigQuestionSecondKind configQuestionSecondKind = new ConfigQuestionSecondKind();
		configQuestionSecondKind.setFirst_kind_id(first_kind_id);
		List<ConfigQuestionSecondKind> list = this.configQuestionSecondKindBiz.findByFirstId(configQuestionSecondKind);
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		out.print(gson.toJson(list));
	}

	// 跳转到试题添加页面
	@RequestMapping(value = "/toEngageSubjectsRegister")
	public String toEngageSubjectsRegister(Model model, HttpSession session) throws Exception {
		model.addAttribute("engageSubjects", new EngageSubjects());
		model.addAttribute("date", date);
		Users user = (Users) session.getAttribute("user");
		model.addAttribute("user", user.getU_true_name());
		return "../../back/engageSubjectsRegister";
	}

	// 添加试题 addEngageSubjects
	@RequestMapping(value = "/addEngageSubjects")
	public String addEngageSubjects(Model model, @ModelAttribute EngageSubjects engageSubjects) throws Exception {
		int i = this.engageSubjectsBiz.add(engageSubjects);
		if (i > 0) {
			return "../../back/engageSubjectsRegisterSuccess";
		}
		return null;
	}

	@RequestMapping(value = "/toEngageSubjectsQuery")
	public String toEngageSubjectsQuery(Model model) throws Exception {
		List<ConfigQuestionFirstKind> list = this.configQuestionFirstKindBiz.findAll(new ConfigQuestionFirstKind());
		model.addAttribute("list", list);
		return "../../back/engageSubjectsQuery";
	}

	// 跳转到查询list页面
	@RequestMapping(value = "/toengageSubjectsQueryList")
	public @ResponseBody String toengageSubjectsQueryList(String first_kind_name, String key, String minTime,
			String maxTime) throws Exception {
		EngageSubjects engageSubjects = new EngageSubjects();
		engageSubjects.setFirst_kind_name("%" + first_kind_name + "%");
		engageSubjects.setKey("%" + key + "%");
		engageSubjects.setMinTime(minTime);
		engageSubjects.setMaxTime(maxTime);
		List<EngageSubjects> totalList = this.engageSubjectsBiz.findBy(engageSubjects);
		int size = totalList.size();
		return "back/engageSubjectsQueryList.jsp," + size;
	}

	// 按条件查询并分页显示所有试题
	@RequestMapping(value = "/findEngageSubjectByConditionAndPage")
	public @ResponseBody void findEngageSubjectByConditionAndPage(@RequestParam String first_kind_name,
			@RequestParam String key, @RequestParam String minTime, @RequestParam String maxTime,
			@RequestParam int page, @RequestParam int rows, HttpServletResponse response, HttpServletRequest request)
					throws Exception {
		response.setCharacterEncoding("utf-8");
		EngageSubjects engageSubjects = new EngageSubjects();
		engageSubjects.setFirst_kind_name("%" + first_kind_name + "%");
		engageSubjects.setKey("%" + key + "%");
		engageSubjects.setMinTime(minTime);
		engageSubjects.setMaxTime(maxTime);
		List<EngageSubjects> list = this.engageSubjectsBiz.findEngageSubjectByConditionAndPage(engageSubjects, page,
				rows);
		// 获取所有符合条件
		int size = this.engageSubjectsBiz.findBy(engageSubjects).size();
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		PrintWriter out = response.getWriter();
		rd.setRows(list);
		rd.setTotal("" + size);
		out.print(gson.toJson(rd));
	}

	// 跳转到变更试题页面"toChangeEngageSubjects.action?sub_id
	@RequestMapping(value = "/toChangeEngageSubjects")
	public String toChangeEngageSubjects(HttpSession session, Model model, HttpServletRequest request,
			HttpServletResponse response, int sub_id) throws Exception {
		System.out.println("id::" + sub_id);
		EngageSubjects engageSubjects = new EngageSubjects();
		engageSubjects.setSub_id(sub_id);
		engageSubjects = (EngageSubjects) this.engageSubjectsBiz.findEngageSubjects(engageSubjects).get(0);
		model.addAttribute("engageSubjects", engageSubjects);
		model.addAttribute("date", date);
		Users user = (Users) session.getAttribute("user");
		model.addAttribute("user", user.getU_true_name());
		return "../../back/engageSubjectsChange";
	}

	// 更改试题changeEngageSubjects
	@RequestMapping(value = "/changeEngageSubjects")
	public String changeEngageSubjects(@ModelAttribute EngageSubjects engageSubjects, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int i = this.engageSubjectsBiz.changeEngageSubjects(engageSubjects);
		if (i > 0) {
			return "../../back/engageSubjectsChangeSuccess";
		} else {
			return null;
		}
	}

	@RequestMapping(value = "/toDeleteEngageSubjects")
	public @ResponseBody String toDeleteEngageSubjects(Model model, @RequestParam int sub_id) throws Exception {
		return "back/engageSubjectsDeleteConfirm.jsp?sub_id=" + sub_id;
	}

	// 删除
	@RequestMapping(value = "/deleteEngageSubjects")
	public @ResponseBody String deleteEngageSubjects(Model model, @RequestParam int sub_id) throws Exception {
		EngageSubjects engageSubjects = new EngageSubjects();
		engageSubjects.setSub_id(sub_id);
		int i = this.engageSubjectsBiz.deleteEngageSubjects(engageSubjects);
		if (i > 0) {
			return "engageSubjectsDeleteSuccess.jsp";
		} else {
			return null;
		}
	}

	// 录用--------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/toPassRegisterList")
	public String toPassRegisterList(Model model) throws Exception {
		return "../../back/passRegisterList";
	}

	// 跳转到录用申请list页面
	@RequestMapping(value = "/showPassRegisterList")
	public String showPassRegisterList(HttpServletResponse response) throws Exception {
		// 查询简历表中面试状态为0的简历
		response.setContentType("application/json; charset=utf-8");
		List<EngageResume> list = this.engageResumeBiz.findPassRegisterList();
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		String json = gson.toJson(map);
		out.println(json);
		out.close();
		return "../../back/passRegisterList";
	}

	@RequestMapping(value = "/toPassRegister")
	public String toPassRegister(Model model, @RequestParam int res_id, HttpServletResponse response)
			throws IOException {
		response.setContentType("application/json; charset=utf-8");
		EngageResume engageResume = new EngageResume();
		engageResume.setRes_id(res_id);
		engageResume = (EngageResume) this.engageResumeBiz.findEngageResume(engageResume).get(0);
		EngageInterview engageInterview = new EngageInterview();
		engageInterview.setResume_id(res_id);
		engageInterview = (EngageInterview) this.engageInterviewBiz.find(engageInterview).get(0);
		model.addAttribute("engageResume", engageResume);
		model.addAttribute("engageInterview", engageInterview);
		return "../../back/passRegister";
	}

	// 录用申请
	@RequestMapping(value = "/passRegister")
	public @ResponseBody String passRegister(@RequestParam String result, @RequestParam int ein_id,
			@RequestParam int res_id, @RequestParam String pass_checkComment, HttpSession session,
			HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=utf-8");
		if ("释放简历".equals(result)) {
			return "back/interviewDeleteConfirm.jsp?res_id=" + res_id + "&ein_id=" + ein_id;
		}
		// 申请录用
		EngageResume engageResume = new EngageResume();
		engageResume.setRes_id(res_id);
		engageResume.setPass_checkComment(pass_checkComment);
		Users user = (Users) session.getAttribute("user");
		engageResume.setPass_checker(user.getU_name());
		engageResume.setPass_check_time(date);
		int i = this.engageResumeBiz.passRegister(engageResume);
		if (i > 0) {
			return "back/passCheckSuccess.jsp";
		} else {
			return null;
		}
	}

	// 人事经理审批
	@RequestMapping(value = "/toPassPassList")
	public String toPassPassList(Model model) throws Exception {
		return "../../back/passPassList";
	}

	@RequestMapping(value = "/showPassPassList")
	public String showPassPassList(HttpServletResponse response) throws Exception {
		response.setContentType("application/json; charset=utf-8");
		List<EngageResume> list = this.engageResumeBiz.findPassPassList();
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		String json = gson.toJson(map);
		out.println(json);
		out.close();
		return "../../back/passPassList";
	}

	@RequestMapping(value = "/toPassPass")
	public String toPassPass(Model model, @RequestParam int res_id, HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=utf-8");
		EngageResume engageResume = new EngageResume();
		engageResume.setRes_id(res_id);
		engageResume = (EngageResume) this.engageResumeBiz.findEngageResume(engageResume).get(0);
		EngageInterview engageInterview = new EngageInterview();
		engageInterview.setResume_id(res_id);
		engageInterview = (EngageInterview) this.engageInterviewBiz.find(engageInterview).get(0);
		model.addAttribute("engageResume", engageResume);
		model.addAttribute("engageInterview", engageInterview);
		return "../../back/passPass";
	}

	@RequestMapping(value = "/passPass")
	public @ResponseBody String passPass(HttpSession session, @RequestParam int ein_id, @RequestParam int res_id,
			@RequestParam String pass_passComment, HttpServletResponse response) throws Exception {
		response.setContentType("application/json; charset=utf-8");
		if ("不通过".equals(pass_passComment)) {
			return "back/interviewDeleteConfirm.jsp?res_id=" + res_id + "&ein_id=" + ein_id;
		}
		EngageResume engageResume = new EngageResume();
		engageResume.setRes_id(res_id);
		engageResume.setPass_passComment(pass_passComment);
		int i = this.engageResumeBiz.passPass(engageResume);

		// 修改职位发布信息 并且添加对应档案信息（机构和职位信息空缺）
		// 根据对应简历表中的职位编号human_major_id更改对应职位发布表major_id中的信息 human_amount-1
		engageResume = this.engageResumeBiz.findEngageResume(engageResume).get(0);
		String major_id = engageResume.getHuman_major_id();
		EngageMajorRelease engageMajorRelease = new EngageMajorRelease();
		engageMajorRelease.setMajor_id(major_id);
		engageMajorRelease = this.engageMajorReleaseBiz.findEngageMajorRelease(engageMajorRelease).get(0);
		int amount = engageMajorRelease.getHuman_amount();

		engageMajorRelease.setHuman_amount(amount - 1);
		int j = this.engageMajorReleaseBiz.updateHumanAmount(engageMajorRelease);
		if (amount == 1) {
			// 减去1之后amount为0 执行删除对应职位发布信息
			engageMajorRelease = this.engageMajorReleaseBiz.delete(engageMajorRelease);
		}
		// 添加档案
		HumanFile humanFile = new HumanFile();
		humanFile.setRegist_time(DateUtil.formatDateTime(new Date()));
		Users user = (Users) session.getAttribute("user");
		humanFile.setRegister(user.getU_true_name());
		humanFile.setHuman_id(UUIDUtil.getASIC());
		humanFile.setHuman_address(engageResume.getHuman_address());
		humanFile.setHuman_age(engageResume.getHuman_age());
		humanFile.setHuman_birthday(engageResume.getHuman_birthday());
		humanFile.setHuman_birthplace(engageResume.getHuman_birthplace());
		humanFile.setHuman_educated_degree(engageResume.getHuman_educated_degree());
		humanFile.setHuman_educated_major(engageResume.getHuman_educated_major());
		humanFile.setHuman_educated_years(engageResume.getHuman_educated_years());
		humanFile.setHuman_email(engageResume.getHuman_email());
		humanFile.setHuman_histroy_records(engageResume.getHuman_history_records());
		humanFile.setHuman_hobby(engageResume.getHuman_hobby());
		humanFile.setHuman_id_card(engageResume.getHuman_idcard());
		humanFile.setHuman_major_id(engageResume.getHuman_major_id());
		humanFile.setHuman_major_kind_id(engageResume.getHuman_major_kind_id());
		humanFile.setHuman_major_kind_name(engageResume.getHuman_major_kind_name());
		humanFile.setHunma_major_name(engageResume.getHuman_major_name());
		humanFile.setHuman_mobilephone(engageResume.getHuman_mobilephone());
		humanFile.setHuman_name(engageResume.getHuman_name());
		humanFile.setHuman_nationality(engageResume.getHuman_nationality());
		humanFile.setHuman_party(engageResume.getHuman_party());
		humanFile.setHuman_picture(engageResume.getHuman_picture());
		humanFile.setHuman_postcode(engageResume.getHuman_postcode());
		humanFile.setHuman_race(engageResume.getHuman_race());
		humanFile.setHuman_religion(engageResume.getHuman_religion());
		humanFile.setHuman_sex(engageResume.getHuman_sex());
		humanFile.setHuman_speciality(engageResume.getHuman_specility());
		humanFile.setHuman_telephone(engageResume.getHuman_telephone());
		int a = this.humanFileBiz.add(humanFile);
		if (i > 0 && a > 0) {
			return "back/passCheckSuccess.jsp";
		} else {
			return null;
		}
	}

	// 录用查询list
	@RequestMapping(value = "/toPassFindList")
	public String toPassFindList(Model model) throws Exception {
		return "../../back/passFindList";
	}

	@RequestMapping(value = "/showPassFindList")
	public String showPassFindList(HttpServletResponse response) throws Exception {
		response.setContentType("application/json; charset=utf-8");
		List<EngageResume> list = this.engageResumeBiz.findPassList();
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		String json = gson.toJson(map);
		out.println(json);
		out.close();
		return "../../back/passFindList";
	}
	
	
// 考试出题-------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/toEngageExamRegisterList")
	public String toEngageExamRegisterList(Model model) throws Exception {
		return "../../back/engageExamRegisterList";
	}

	@RequestMapping(value = "/showEngageExamRegisterList")
	public String showEngageExamRegisterList(HttpServletResponse response) throws Exception {
		// 查询简历表中面试状态为0的简历
		response.setContentType("application/json; charset=utf-8");
		List<ConfigMajor> list = this.ConfigMajorBiz.find();
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		String json = gson.toJson(map);
		out.println(json);
		out.close();
		return "../../back/engageExamRegisterList";
	}

	@RequestMapping(value = "/toEngageExamRegister")
	public String toEngageExamRegister(HttpSession session, Model model, @RequestParam int mak_id,
			HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=utf-8");
		ConfigMajor cm = new ConfigMajor();
		cm.setMak_id(mak_id);
		cm = (ConfigMajor) this.ConfigMajorBiz.findByMajorKindID(cm).get(0);
		model.addAttribute("date", date);
		Users user = (Users) session.getAttribute("user");
		model.addAttribute("user", user.getU_true_name());
		// 系统将自动列出系统中存在的试题分类及已有试题数目
		List<EngageSubjects> list = this.engageSubjectsBiz.find();
		model.addAttribute("EngageSubjectslist", list);
		model.addAttribute("configMajor", cm);
		return "../../back/engageExamRegister";
	}

	// 添加考卷
	@RequestMapping(value = "/engageExamRegister")
	public @ResponseBody String engageExamRegister(@RequestParam int mak_id,@RequestParam String major_kind_id, @RequestParam String major_id,
			@RequestParam String major_kind_name, @RequestParam String major_name, @RequestParam String register,
			@RequestParam String regist_time, @RequestParam int limite_time, @RequestParam String first_kind_id,
			@RequestParam String first_kind_name, @RequestParam String second_kind_id,
			@RequestParam String second_kind_name, @RequestParam String question_amount,
			HttpServletResponse response) throws IOException {
		// 添加试卷详细表 engage_exam和试卷详细信息 engage_exam_details 事务处理
		EngageExam engageExam = new EngageExam();
		engageExam.setMajor_kind_id(major_kind_id);
		engageExam.setMajor_id(major_id);
		engageExam.setMajor_kind_name(major_kind_name);
		engageExam.setMajor_name(major_name);
		engageExam.setRegist_time(regist_time);
		engageExam.setRegister(register);
		engageExam.setLimite_time(limite_time);
		engageExam.setExam_number(UUIDUtil.getASIC());
		
		String[] firstKindId = first_kind_id.split(",");
		String[] firstKindName = first_kind_name.split(",");
		String[] secondKindId = second_kind_id.split(",");
		String[] secondKindName = second_kind_name.split(",");
		String[] questionAmount = question_amount.split(",");
		List<EngageExamDetails> list = new ArrayList<EngageExamDetails>();
		for (int i = 0; i < firstKindId.length; i++) {
			EngageExamDetails engageExamDetails=new EngageExamDetails();
			engageExamDetails.setFirst_kind_id(firstKindId[i]);
			engageExamDetails.setFirst_kind_name(firstKindName[i]);
			engageExamDetails.setSecond_kind_id(secondKindId[i]);
			engageExamDetails.setSecond_kind_name(secondKindName[i]);
			engageExamDetails.setExam_number(engageExam.getExam_number());
			engageExamDetails.setQuestion_amount(Integer.parseInt(questionAmount[i]));
			
			list.add(engageExamDetails);
		}
		ConfigMajor configMajor=new ConfigMajor();
		configMajor.setMak_id(mak_id);
		configMajor=(ConfigMajor) this.ConfigMajorBiz.findByMajorKindID(configMajor).get(0);
		configMajor.setTest_amount(configMajor.getTest_amount()-1);
		//题套数量-1
		int c=this.ConfigMajorBiz.subAmount(configMajor);
		int a = this.engageExamBiz.add(engageExam,list);
		if(a>0&&c>0){
			return "back/engageExamRegisterSuccess.jsp"; 
		}else{ 
			return null;
		}
	}
// 考试答题-------------------------------------------------------------------------------------------------------------
	//李四   430923199612011234
	@RequestMapping(value = "/toEngageAnswerRegisterQuery")
	public String toEngageAnswerRegisterQuery(Model model) throws Exception {
		model.addAttribute("engageResume", new EngageResume());
		return "../../back/engageAnswerRegisterQuery";
	}
	
	
	@RequestMapping(value = "/find")
	public String find(HttpSession session, Model model,@ModelAttribute EngageResume engageResume,HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=utf-8");
		//如果姓名和身份证号码与系统中存在的简历匹配，考试结果将和简历简历关联。还需要选择考试的职位分类和职位名称，这和将进行考试的试卷有关。
		//随机产生试卷
		List<EngageResume> list= this.engageResumeBiz.findEngageResume(engageResume);
		if(list.size()>0){
			engageResume=list.get(0);
			EngageInterview engageInterview=new EngageInterview();
			engageInterview.setResume_id(engageResume.getRes_id());
			engageInterview=(EngageInterview) this.engageInterviewBiz.find(engageInterview).get(0);
			//面试信息
			model.addAttribute("engageInterview", engageInterview);
			//简历信息
			model.addAttribute("engageResume", engageResume);
			
			EngageExam engageExam=new EngageExam();
			engageExam.setMajor_kind_id(engageResume.getHuman_major_kind_id());
			engageExam.setMajor_id(engageResume.getHuman_major_id());
			//根据职位id随机选择已有的相应一个提套
			engageExam=this.engageExamBiz.getRandomExam(engageExam);
			int limit_time=engageExam.getLimite_time();
			String exam_number=engageExam.getExam_number();
			model.addAttribute("limit_time", limit_time);
			//试卷编号
			model.addAttribute("exam_number", exam_number);
			String number=engageExam.getExam_number();
			EngageExamDetails engageExamDetails=new EngageExamDetails();
			engageExamDetails.setExam_number(number);
			//查询details表对应exam_number的list信息
			List<EngageExamDetails> detailsList=this.engageExamDetailsBiz.find(engageExamDetails);
			
			//根据details表中first_kind_id和second_kind_id查找对应subjects表中的信息，并更具details表中的数量随机选择对应数量的题目
			int question_amount=0;
			for(int z=0;z<detailsList.size();z++){
				question_amount+=detailsList.get(z).getQuestion_amount();
				String firstId=detailsList.get(z).getFirst_kind_id();
				String secondId=detailsList.get(z).getSecond_kind_id();
				int limit=detailsList.get(z).getQuestion_amount();
				EngageSubjects engageSubjects=new EngageSubjects();
				engageSubjects.setFirst_kind_id(firstId);
				engageSubjects.setSecond_kind_id(secondId);
				engageSubjects.setLimit(limit);
				//随机产生试题
				List<EngageSubjects> subjectsList=this.engageSubjectsBiz.getRandomSubject(engageSubjects);
				detailsList.get(z).setSubjectsList(subjectsList);
			}
			//该套题试题数量
			model.addAttribute("question_amount", question_amount);
			//随机产生的试卷详情
			model.addAttribute("detailsList", detailsList);
			return "../../back/engageAnswerRegister";
		}else{
			//简历表中不存在应聘者
			return null;
		}
	}
	
	//添加
	@RequestMapping(value = "/addEngageAnswer")
	public @ResponseBody String addEngageAnswer(Model model, @RequestParam String answer,
			@RequestParam String correct, @RequestParam String exam_number,
			@RequestParam String human_name,
			@RequestParam String human_idcard, @RequestParam String major_kind_id, 
			@RequestParam String major_kind_name,@RequestParam String major_id, 
			@RequestParam String major_name,
			@RequestParam String test_time, @RequestParam String use_time,
			@RequestParam String resume_id, @RequestParam String interview_id,
			@RequestParam String subId,
			HttpServletRequest request) {
		EngageAnswer engageAnswer=new EngageAnswer();
		engageAnswer.setAnswer_number(UUIDUtil.getASIC());
		engageAnswer.setExam_number(exam_number);
		engageAnswer.setHuman_idcard(human_idcard);
		engageAnswer.setHuman_name(human_name);
		engageAnswer.setMajor_kind_id(major_kind_id);
		engageAnswer.setMajor_kind_name(major_kind_name);
		engageAnswer.setMajor_id(major_id);
		engageAnswer.setMajor_name(major_name);
		
		/*1）给出的分钟除以一天的24*60 取整等于天数
		2）上面得到的余数 除以 60 的到取整的是小时
		3）上面的到的余数就是分钟,*/
		//int day=Integer.parseInt(test_time)/(24*60);
		int h=(Integer.parseInt(test_time)%(24*60))/60;
		int m=(Integer.parseInt(test_time)%(24*60))%60;
		int s=((Integer.parseInt(test_time)%(24*60))%60)/60;
		String hour=String.valueOf(h);
		String minute=String.valueOf(m);
		String second=String.valueOf(s);
		if(h<10){
			hour="0"+String.valueOf(h);
		}
		if(m<10){
			minute="0"+String.valueOf(m);
		}
		if(s<10){
			second="0"+String.valueOf(s);
		}
		String str = "00000000"+hour+minute+second;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = null;
		try {
			date = sdf.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
			System.out.println("格式化日期失败");
		}
		engageAnswer.setTest_time(date);
		engageAnswer.setUse_time(use_time);
		engageAnswer.setResume_id(Integer.parseInt(resume_id));
		engageAnswer.setInterview_id(Integer.parseInt(interview_id));
		
		String[] as = answer.split(",");
		String[] co = correct.split(",");
		int total=0;
		for (int i = 0; i <as.length; i++) {
			if(as[i].equalsIgnoreCase(co[i])){
				total=total+1;
			}
		}
		engageAnswer.setTotal_point(total);
		
		// details添加------------------------------------------------------------------------------------------------
		List<EngageAnswerDetails> list=new ArrayList<EngageAnswerDetails>();
		String[] sub_id=subId.split(",");
		for(int j=0;j<sub_id.length;j++){
			EngageAnswerDetails engageAnswerDetails=new EngageAnswerDetails();
			engageAnswerDetails.setAnswer_number(engageAnswer.getAnswer_number());
			engageAnswerDetails.setSubject_id(Integer.parseInt(sub_id[j]));
			engageAnswerDetails.setAnswer(as[j]);
			list.add(engageAnswerDetails);
		}
		int a=this.engageAnswerBiz.add(engageAnswer,list);
		//修改对应简历信息
		/* 	test_amount : 考试次数                                                                      */
		/* 	total_points : 总分                                                                       */
		EngageResume er=new EngageResume();
		er.setRes_id(Integer.parseInt(resume_id));
		er=(EngageResume) this.engageResumeBiz.findEngageResume(er).get(0);
		EngageResume re=new EngageResume();
		re.setRes_id(Integer.parseInt(resume_id));
		re.setTest_amount(er.getTest_amount());
		re.setTest_amount(re.getTest_amount()+1);
		re.setTotal_points(total);
		
		int i=this.engageResumeBiz.updResume(re);
		if(a>0&&i>0){
			return "back/engageAnswerRegisterSuccess.jsp";
		}
		return null;
	}
//----------------------------------------------------------------------------------------------
	@RequestMapping(value = "/toEngageExamGradeQuery")
	public String toEngageExamGradeQuery(Model model) throws Exception {
		return "../../back/engageExamGradeQuery";
	}
	
	@RequestMapping(value = "/toEngageExamGradeList")
	public @ResponseBody String tosalaryStandardQueryList(String human_idCard, String key,Model model) throws Exception {
		EngageAnswer engageAnswer=new EngageAnswer();
		engageAnswer.setHuman_idcard(human_idCard);
		engageAnswer.setKey("%" +key+ "%" );
		List<EngageAnswer> list = this.engageAnswerBiz.find(engageAnswer);
		for(int i=0;i<list.size();i++){
			EngageResume engageResume=new EngageResume();
			engageResume.setRes_id(list.get(i).getResume_id());
			engageResume =(EngageResume) this.engageResumeBiz.findEngageResume(engageResume).get(0);
			if(engageResume.getPass_check_status()==1){
				list.remove(i);
			}
		}
		int size = list.size();
		return "back/engageExamGradeList.jsp," + size;
	}

	// 按条件查询并分页显示
	@RequestMapping(value = "/findGradeByConditionAndPage")
	public @ResponseBody void findSalaryStandardByConditionAndPage(String human_idCard, String key,Model model,
			@RequestParam int page, @RequestParam int rows, HttpServletResponse response, HttpServletRequest request)
					throws Exception {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		EngageAnswer engageAnswer=new EngageAnswer();
		engageAnswer.setHuman_idcard(human_idCard);
		engageAnswer.setKey("%" +key+ "%" );
		List<EngageAnswer> list = this.engageAnswerBiz.findEngageExamGradeByConditionAndPage(engageAnswer, page, rows);
		for(int i=0;i<list.size();i++){
			EngageResume engageResume=new EngageResume();
			engageResume.setRes_id(list.get(i).getResume_id());
			engageResume =(EngageResume) this.engageResumeBiz.findEngageResume(engageResume).get(0);
			if(engageResume.getPass_check_status()==1){
				list.remove(i);
			}
		}
		// 获取所有
		List<EngageAnswer> l  = this.engageAnswerBiz.find(engageAnswer);
		for(int i=0;i<l.size();i++){
			EngageResume engageResume=new EngageResume();
			engageResume.setRes_id(l.get(i).getResume_id());
			engageResume =(EngageResume) this.engageResumeBiz.findEngageResume(engageResume).get(0);
			if(engageResume.getPass_check_status()==1){
				l.remove(i);
			}
		}
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		rd.setRows(list);
		rd.setTotal("" + l.size());
		out.print(gson.toJson(rd));
	}
	
	//查看成绩详情  
	@RequestMapping(value = "/toGrandeDetail")
	public String toGrandeDetail(Model model,@RequestParam int ans_id, HttpServletResponse response, HttpServletRequest request)
					throws Exception {
		EngageAnswer engageAnswer=new EngageAnswer();
		engageAnswer.setAns_id(ans_id);
		engageAnswer=this.engageAnswerBiz.find(engageAnswer).get(0);
		EngageAnswerDetails engageAnswerDetails=new EngageAnswerDetails();
		engageAnswerDetails.setAnswer_number(engageAnswer.getAnswer_number());
		List<EngageAnswerDetails> detailList=this.engageAnswerDetailsBiz.find(engageAnswerDetails);
		model.addAttribute("engageAnswer", engageAnswer);
		List<EngageSubjects> subList=new ArrayList<EngageSubjects>();
		for(int a=0;a<detailList.size();a++){
			int sub_id=detailList.get(a).getSubject_id();
			EngageSubjects es=new EngageSubjects();
			es.setSub_id(sub_id);
			es=(EngageSubjects) this.engageSubjectsBiz.findEngageSubjects(es).get(0);
			es.setUserAnswer(detailList.get(a).getAnswer());
			subList.add(es);
		}
		model.addAttribute("subList", subList);
		return "../../back/engageExamGradeDetail";
	}

	//笔试结果筛选
	@RequestMapping(value = "/toEngageExamCheck")
	public String toEngageExamCheck(HttpSession session,Model model,int interview_id) throws Exception {
		
		System.out.println("interviewid::"+interview_id);
		EngageInterview engageInterview = new EngageInterview();
		engageInterview.setEin_id(interview_id);
		engageInterview = this.engageInterviewBiz.find(engageInterview).get(0);
		
		EngageResume engageResume = new EngageResume();
		engageResume.setRes_id(engageInterview.getResume_id());
		engageResume = this.engageResumeBiz.findEngageResume(engageResume).get(0);
		
		//点击筛选笔试修改resume表中的pass_register和time
		EngageResume engageResume2 = new EngageResume();
		engageResume2.setRes_id(engageInterview.getResume_id());
		Users u=(Users) session.getAttribute("user");
		engageResume2.setPass_register(u.getU_true_name());
		engageResume2.setPass_regist_time(date);
		engageResume2.setTest_checker(date);
		engageResume2.setTest_checker(u.getU_true_name());
		this.engageResumeBiz.updResume2(engageResume2);
		
		model.addAttribute("engageInterview", engageInterview);
		model.addAttribute("engageResume", engageResume);
		model.addAttribute("date", date);
		return "../../back/engageExamCheck";
	}

	// 笔试筛选复核
	@RequestMapping(value = "/engageExamCheck")
	public @ResponseBody String engageExamCheck(Model model, @RequestParam String result, @RequestParam int res_id,
			@RequestParam int ein_id, @RequestParam String test_checker, @RequestParam String test_check_time,
			@RequestParam String pass_checkComment,HttpSession session) throws Exception {
		int j = 0;
		if ("删除简历".equals(result)) {
			return "back/interviewDeleteConfirm.jsp?res_id=" + res_id + "&ein_id=" + ein_id;
		} else if ("建议录用".equals(result)) {
			//修改resume表中的pass_checker和time和pass_checkComment和pass_check_status=1
			EngageResume engageResume = new EngageResume();
			engageResume.setRes_id(res_id);
			Users u=(Users) session.getAttribute("user");
			engageResume.setPass_check_time(test_check_time);
			engageResume.setPass_checker(test_checker);
			engageResume.setPass_checkComment(pass_checkComment);
			engageResume.setPass_check_status(1);
			engageResume.setRecomandation(result);
			j=this.engageResumeBiz.updResume2(engageResume);
		}else if("建议笔试".equals(result)){
			//test_amount+1  
			EngageResume er=new EngageResume();
			er.setRes_id(res_id);
			er=(EngageResume) this.engageResumeBiz.findBy(er).get(0);
			er.setTest_amount(er.getTest_amount()+1);
			er.setRecomandation(result);
			j=this.engageResumeBiz.updResume2(er);
		}else if("建议面试".equals(result)){
			//设置interview_status=0
			EngageResume er=new EngageResume();
			er.setRes_id(res_id);
			er.setInterview_status(0);
			er.setRecomandation(result);
			j=this.engageResumeBiz.updInterview(er);
		}
		if(j>0){
			return "back/engageExamCheckSuccess.jsp";
		}
		return null;
	}
	
}