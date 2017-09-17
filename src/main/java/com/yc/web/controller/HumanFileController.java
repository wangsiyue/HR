package com.yc.web.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.ConfigFileSecondKind;
import com.yc.bean.ConfigFileThirdKind;
import com.yc.bean.ConfigMajor;
import com.yc.bean.ConfigMajorKind;
import com.yc.bean.ConfigPublicChar;
import com.yc.bean.HumanFile;
import com.yc.bean.MajorChange;
import com.yc.bean.SalaryStandard;
import com.yc.bean.Training;
import com.yc.biz.ConfigFileFirstKindBiz;
import com.yc.biz.ConfigFileSecondKindBiz;
import com.yc.biz.ConfigFileThirdKindBiz;
import com.yc.biz.ConfigMajorKindBiz;
import com.yc.biz.ConfigPublicCharBiz;
import com.yc.biz.ConfigMajorBiz;
import com.yc.biz.HumanFileBiz;
import com.yc.biz.SalaryStandardBiz;
import com.yc.web.util.DateUtil;
import com.yc.web.util.ResponseData;
import com.yc.web.util.ServletUtil;
import com.yc.web.util.UUIDUtil;
import com.yc.web.util.UploadFileUtil;
import com.yc.web.util.UploadFileUtil.UploadFile;

@Controller
public class HumanFileController {
	private static final Log logger = LogFactory.getLog(HumanFileController.class);

	private HumanFileBiz humanFileBiz;
	private ConfigFileFirstKindBiz configFileFirstKindBiz;
	private ConfigFileSecondKindBiz configFileSecondKindBiz;
	private ConfigFileThirdKindBiz configFileThirdKindBiz;
	private ConfigMajorKindBiz configMajorKindBiz;
	private ConfigMajorBiz ConfigMajorBiz;
	private ConfigPublicCharBiz configPublicCharBiz;
	private SalaryStandardBiz salaryStandardBiz;
	
	
	
	@Resource(name = "salaryStandardBizImpl")
	public void setSalaryStandardBiz(SalaryStandardBiz salaryStandardBiz) {
		this.salaryStandardBiz = salaryStandardBiz;
	}

	@Resource(name = "configFileFirstKindBizImpl")
	public void setConfigFileFirstKindBiz(ConfigFileFirstKindBiz configFileFirstKindBiz) {
		this.configFileFirstKindBiz = configFileFirstKindBiz;
	}

	@Resource(name = "configFileSecondKindBizImpl")
	public void setConfigFileSecondKindBiz(ConfigFileSecondKindBiz configFileSecondKindBiz) {
		this.configFileSecondKindBiz = configFileSecondKindBiz;
	}

	@Resource(name = "configFileThirdKindBizImpl")
	public void setConfigFileThirdKindBiz(ConfigFileThirdKindBiz configFileThirdKindBiz) {
		this.configFileThirdKindBiz = configFileThirdKindBiz;
	}

	@Resource(name = "configMajorKindBizImpl")
	public void setConfigMajorKindBiz(ConfigMajorKindBiz configMajorKindBiz) {
		this.configMajorKindBiz = configMajorKindBiz;
	}

	@Resource(name = "configMajorBizImpl")
	public void setConfigMajorBiz(ConfigMajorBiz configMajorBiz) {
		ConfigMajorBiz = configMajorBiz;
	}

	@Resource(name = "humanFileBizImpl")
	public void setBookBiz(HumanFileBiz humanFileBiz) {
		this.humanFileBiz = humanFileBiz;
	}

	@Resource(name = "configPublicCharBizImpl")
	public void setConfigPublicChar(ConfigPublicCharBiz configPublicCharBiz) {
		this.configPublicCharBiz = configPublicCharBiz;
	}

// 级联-----------------------------------------------------------------------------------------------
	// 机构级联1
	@RequestMapping(value = "/findFirstKind")
	public @ResponseBody void findFirstKind(HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		List<ConfigFileFirstKind> list = this.configFileFirstKindBiz.find();
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		out.print(gson.toJson(list));
	}

	// 机构级联2
	@RequestMapping(value = "/findSecondKindByFirstKindId")
	public @ResponseBody void findSecondKindByFirstKindId(HttpServletRequest request, HttpServletResponse response,
			String first_kind_id) throws Exception {
		response.setCharacterEncoding("utf-8");
		ConfigFileSecondKind cfsk = new ConfigFileSecondKind();
		cfsk.setFirst_kind_id(first_kind_id);
		List<ConfigFileFirstKind> list = this.configFileSecondKindBiz.findByFirstKind(cfsk);
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		out.print(gson.toJson(list));
	}

	// 机构级联3
	@RequestMapping(value = "/findThirdKindBySecondKindId")
	public @ResponseBody void findThirdKindBySecondKindId(HttpServletRequest request, HttpServletResponse response,
			String second_kind_id) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		ConfigFileThirdKind cftk = new ConfigFileThirdKind();
		cftk.setSecond_kind_id(second_kind_id);
		List<ConfigFileFirstKind> list = this.configFileThirdKindBiz.findBySecondKind(cftk);
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		out.print(gson.toJson(list));
	}

	// 职位级联1
	@RequestMapping(value = "/findMajorKind")
	public @ResponseBody void findMajorKind(HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		List<ConfigMajorKind> list = configMajorKindBiz.find();
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		out.print(gson.toJson(list));
	}

	// 职位级联2
	@RequestMapping(value = "/findMajorByKindId")
	public @ResponseBody void findMajorByKindId(HttpServletRequest request, HttpServletResponse response,
			String major_kind_id) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		ConfigMajor cm = new ConfigMajor();
		cm.setMajor_kind_id(major_kind_id);
		List<ConfigMajor> list = this.ConfigMajorBiz.findByMajorKindID(cm);
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		out.print(gson.toJson(list));
	}

// 添加---------------------------------------------------------------------------------------------------
	// 跳转到添加档案页面
	@RequestMapping(value = "/showHumanFileRegister")
	public String toAddHumanFileForm(Model model) {
		List<ConfigPublicChar> configPublicCharList = configPublicCharBiz.find();
		List<SalaryStandard> salaryStandardList=this.salaryStandardBiz.find();
		model.addAttribute("salaryStandardList", salaryStandardList);
		model.addAttribute("configPublicCharList", configPublicCharList);
		model.addAttribute("configPublicChar", new ConfigPublicChar());
		model.addAttribute("humanFile", new HumanFile());
		return "../../back/humanFileRegister";
	}
	
	//档案添加
	@RequestMapping(value="/saveHumanFile")
	public @ResponseBody void saveHumanFile(HttpServletResponse response,HttpServletRequest request,@ModelAttribute HumanFile humanFile,@RequestParam(name="picData",required=false) MultipartFile picData) throws Exception{
		response.setCharacterEncoding("utf-8");
		if (picData != null  && !picData.isEmpty()) {
				picData.transferTo(new File(ServletUtil.UPLOAD_DIR,picData.getOriginalFilename()) );		//上传文件
				humanFile.setHuman_picture(("/"+ServletUtil.UPLOAD_DIR_NAME+"/"+picData.getOriginalFilename()));
		}
		humanFile.setSalary_standard_id(humanFile.getSalary_standard_name().split("/")[0]);;
		humanFile.setSalary_standard_name(humanFile.getSalary_standard_name().split("/")[1]);;
		humanFile.setRegist_time(DateUtil.formatDate(new Date()));
		humanFile.setHuman_id(UUIDUtil.getASIC());
		int i=humanFileBiz.add(humanFile);
			PrintWriter out = response.getWriter();
			if(i>0){
				out.print(1);
			}else{
				out.print(0);
			}
	}

// 复核----------------------------------------------------------------------------------------------------
	// 跳转到复核页面
	@RequestMapping(value = "/showHumanFileCheckList")
	public String showHumanFileCheckList(Model model) throws Exception {
		List<HumanFile> totalList = this.humanFileBiz.findCheckFile();
		model.addAttribute("totalList", totalList);
		return "../../back/humanFileCheckList";
	}

	// 按条件查询并分页显示所有需要复核的档案
	@RequestMapping(value = "/findByConditionAndPage")
	public @ResponseBody void findByConditionAndPage(@RequestParam String first_kind_id,
			@RequestParam String second_kind_id, @RequestParam String third_kind_id, @RequestParam String major_kind_id,
			@RequestParam String major_id, @RequestParam String minTime, @RequestParam String maxTime,
			@RequestParam int page, @RequestParam int rows, HttpServletResponse response, HttpServletRequest request)
					throws Exception {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HumanFile humanFile = new HumanFile();
		humanFile.setFirst_kind_id(first_kind_id);
		humanFile.setSecond_kind_id(second_kind_id);
		humanFile.setThird_kind_id(third_kind_id);
		humanFile.setHuman_major_kind_id(major_kind_id);
		humanFile.setHuman_major_id(major_id);
		humanFile.setMinTime(minTime);
		humanFile.setMaxTime(maxTime);
		List<HumanFile> list = this.humanFileBiz.findByConditionAndPage(humanFile, page, rows);

		// 获取所有符合条件档案个数
		int size = this.humanFileBiz.findAllMatchConditionFile(humanFile).size();
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		rd.setRows(list);
		rd.setTotal("" + size);
		out.print(gson.toJson(rd));
	}

	// 分页显示所有需要复核的档案
	@RequestMapping(value = "/findCheckListByPage")
	public @ResponseBody void findCheckListByPage(int page, int rows, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		List<HumanFile> list = this.humanFileBiz.findByPage(new HumanFile(), page, rows);

		// 获取所有需要复核的档案个数
		int size = this.humanFileBiz.findCheckFile().size();
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		rd.setRows(list);
		rd.setTotal("" + size);
		out.print(gson.toJson(rd));
	}

	// 单个复核档案详情
	@RequestMapping(value = "/checkFileDetail")
	public String checkFileDetail(String human_id, Model model) throws Exception {
		HumanFile humanFile = new HumanFile();
		humanFile.setHuman_id(human_id);
		List<HumanFile> list = this.humanFileBiz.findById(humanFile);

		List<ConfigPublicChar> configPublicCharList = configPublicCharBiz.find();
		model.addAttribute("configPublicCharList", configPublicCharList);

		model.addAttribute("configPublicChar", new ConfigPublicChar());

		humanFile = list.get(0);

		model.addAttribute("humanFile", humanFile);
		
		List<SalaryStandard> salaryStandardList=this.salaryStandardBiz.find();
		model.addAttribute("salaryStandardList", salaryStandardList);
		model.addAttribute("configPublicChar", new ConfigPublicChar());
		return "../../back/humanFileCheck";
	}

	// 档案复核操作
	@RequestMapping(value = "/checkHumanFile")
	public @ResponseBody void checkHumanFile(HttpServletResponse response,HttpServletRequest request,@ModelAttribute HumanFile humanFile,@RequestParam(name="picData",required=false) MultipartFile picData) throws Exception {
		if (picData != null  && !picData.isEmpty()) {
			picData.transferTo(new File(ServletUtil.UPLOAD_DIR,picData.getOriginalFilename()) );		//上传文件
			humanFile.setHuman_picture(("/"+ServletUtil.UPLOAD_DIR_NAME+"/"+picData.getOriginalFilename()));
		}
		humanFile.setSalary_standard_id(humanFile.getSalary_standard_name().split("/")[0]);
		humanFile.setSalary_standard_name(humanFile.getSalary_standard_name().split("/")[1]);
		humanFile.setCheck_time(DateUtil.formatDate(new Date()));
		int i=humanFileBiz.checkHumanFile(humanFile);
		PrintWriter out = response.getWriter();
		if(i>0){
			out.print(1);
		}else{
			out.print(0);
		}
	}

//查询------------------------------------------------------------------------------------------------
		// 跳转到查询页面
		@RequestMapping(value = "/showHumanFileQuery")
		public String showHumanFileQueryList(Model model) throws Exception {
			HumanFile humanFile = new HumanFile();
			model.addAttribute("humanFile", humanFile);
			return "../../back/humanFileQuery";
		}

		// 跳转到查询list页面
		@RequestMapping(value = "/toHumanFileQueryList")
		public @ResponseBody String toHumanFileQueryList(String first_kind_id, String second_kind_id, String third_kind_id,
				String major_kind_id, String major_id, String minTime, String maxTime) throws Exception {
			HumanFile humanFile = new HumanFile();
			humanFile.setFirst_kind_id(first_kind_id);
			humanFile.setSecond_kind_id(second_kind_id);
			humanFile.setThird_kind_id(third_kind_id);
			humanFile.setHuman_major_kind_id(major_kind_id);
			humanFile.setHuman_major_id(major_id);
			humanFile.setMinTime(minTime);
			humanFile.setMaxTime(maxTime);
			List<HumanFile> totalList = this.humanFileBiz.findAllMatchConditionFile(humanFile);
			int size = totalList.size();
			return "back/humanFileQueryList.jsp," + size;
		}

// 更改---------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/showHumanFileChangeQuery")
	public String showHumanFileChangeQuery() throws Exception {
		return "../../back/humanFileChangeQuery";
	}
	
	// 跳转到变更list页面
	@RequestMapping(value = "/toHumanFileChangeList")
	public @ResponseBody String toHumanFileChangeList(String first_kind_id, String second_kind_id, String third_kind_id,
			String major_kind_id, String major_id, String minTime, String maxTime, HttpServletRequest request)
					throws Exception {
		HumanFile humanFile = new HumanFile();
		humanFile.setFirst_kind_id(first_kind_id);
		humanFile.setSecond_kind_id(second_kind_id);
		humanFile.setThird_kind_id(third_kind_id);
		humanFile.setHuman_major_kind_id(major_kind_id);
		humanFile.setHuman_major_id(major_id);
		humanFile.setMinTime(minTime);
		humanFile.setMaxTime(maxTime);
		List<HumanFile> totalList = this.humanFileBiz.findAllMatchConditionFile(humanFile);
		int size = totalList.size();
		return "back/humanFileChangeList.jsp," + size;
	}

	// 分页显示所有需要更改的档案
	@RequestMapping(value = "/findChangeListByPage")
	public @ResponseBody void findChangeListByPage(@RequestParam String first_kind_id,
			@RequestParam String second_kind_id, @RequestParam String third_kind_id, @RequestParam String major_kind_id,
			@RequestParam String major_id, @RequestParam String minTime, @RequestParam String maxTime,
			@RequestParam int page, @RequestParam int rows, HttpServletResponse response, HttpServletRequest request)
					throws Exception {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HumanFile humanFile = new HumanFile();
		humanFile.setFirst_kind_id(first_kind_id);
		humanFile.setSecond_kind_id(second_kind_id);
		humanFile.setThird_kind_id(third_kind_id);
		humanFile.setHuman_major_kind_id(major_kind_id);
		humanFile.setHuman_major_id(major_id);
		humanFile.setMinTime(minTime);
		humanFile.setMaxTime(maxTime);
		List<HumanFile> list = this.humanFileBiz.findByConditionAndPage(humanFile, page, rows);

		// 获取所有符合条件档案个数
		int size = this.humanFileBiz.findAllMatchConditionFile(humanFile).size();
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		rd.setRows(list);
		rd.setTotal("" + size);
		out.print(gson.toJson(rd));
	}

	// 单个更改档案详情
	@RequestMapping(value = "/changeFileDetail")
	public String changeFileDetail(String human_id, Model model) throws Exception {
		HumanFile humanFile = new HumanFile();
		humanFile.setHuman_id(human_id);
		List<HumanFile> list = this.humanFileBiz.findById(humanFile);

		List<ConfigPublicChar> configPublicCharList = configPublicCharBiz.find();
		model.addAttribute("configPublicCharList", configPublicCharList);

		model.addAttribute("configPublicChar", new ConfigPublicChar());

		humanFile = list.get(0);

		model.addAttribute("humanFile", humanFile);
		
		List<SalaryStandard> salaryStandardList=this.salaryStandardBiz.find();
		model.addAttribute("salaryStandardList", salaryStandardList);
		model.addAttribute("configPublicChar", new ConfigPublicChar());
		return "../../back/humanFileChange";
	}
	//
	@RequestMapping(value = "/changeHumanFile")
	public @ResponseBody void changeHumanFile(HttpServletResponse response,HttpServletRequest request,@ModelAttribute HumanFile humanFile,@RequestParam(name="picData",required=false) MultipartFile picData) throws Exception {
		if (picData != null  && !picData.isEmpty()) {
			picData.transferTo(new File(ServletUtil.UPLOAD_DIR,picData.getOriginalFilename()) );		//上传文件
			humanFile.setHuman_picture(("/"+ServletUtil.UPLOAD_DIR_NAME+"/"+picData.getOriginalFilename()));
		}
		humanFile.setSalary_standard_id(humanFile.getSalary_standard_name().split("/")[0]);
		humanFile.setSalary_standard_name(humanFile.getSalary_standard_name().split("/")[1]);
		humanFile.setChange_time(DateUtil.formatDate(new Date()));
		humanFile.setLastly_change_time(DateUtil.formatDate(new Date()));
		humanFile.setFile_chang_amount(humanFile.getFile_chang_amount()+1);
		
		int i=humanFileBiz.update(humanFile);
		PrintWriter out = response.getWriter();
		if(i>0){
			out.print(1);
		}else{
			out.print(0);
		}
	}
	
//删除操作----------------------------------------------------------------------------------------------------
	// 跳转到查询页面
	@RequestMapping(value = "/showHumanFileDeleteQuery")
	public String showHumanFileDeleteQuery(Model model) throws Exception {
		HumanFile humanFile = new HumanFile();
		model.addAttribute("humanFile", humanFile);
		return "../../back/humanFileDeleteQuery";
	}

	// 跳转到查询list页面
	@RequestMapping(value = "/toHumanFileDeleteQueryList")
	public @ResponseBody String toHumanFileDeleteQueryList(String first_kind_id, String second_kind_id,
			String third_kind_id, String major_kind_id, String major_id, String minTime, String maxTime)
					throws Exception {
		HumanFile humanFile = new HumanFile();
		humanFile.setFirst_kind_id(first_kind_id);
		humanFile.setSecond_kind_id(second_kind_id);
		humanFile.setThird_kind_id(third_kind_id);
		humanFile.setHuman_major_kind_id(major_kind_id);
		humanFile.setHuman_major_id(major_id);
		humanFile.setCheck_status(1);
		humanFile.setHuman_file_status(false);
		humanFile.setMinTime(minTime);
		humanFile.setMaxTime(maxTime);
		List<HumanFile> totalList = this.humanFileBiz.findAllMatchConditionFile(humanFile);
		int size = totalList.size();
		return "back/humanFileDeleteQueryList.jsp," + size;
	}

	// 删除档案
	@RequestMapping(value = "/delHumanFile")
	public String delHumanFile(Model model, @RequestParam String human_id) throws Exception {
		HumanFile humanFile = new HumanFile();
		humanFile.setHuman_id(human_id);
		Date date = new Date();
		humanFile.setDelete_time(DateUtil.formatDate(date));
		int i = this.humanFileBiz.delete(humanFile);
		if (i > 0) {
			return "../../back/humanFileDeleteSuccess";
		} else {
			return null;
		}

	}

	// 按条件查询并分页显示所有可以删除的档案
	@RequestMapping(value = "/findDelByConditionAndPage")
	public @ResponseBody void findDelByConditionAndPage(@RequestParam String first_kind_id,
			@RequestParam String second_kind_id, @RequestParam String third_kind_id, @RequestParam String major_kind_id,
			@RequestParam String major_id, @RequestParam String minTime, @RequestParam String maxTime,
			@RequestParam int page, @RequestParam int rows, HttpServletResponse response, HttpServletRequest request)
					throws Exception {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HumanFile humanFile = new HumanFile();
		humanFile.setFirst_kind_id(first_kind_id);
		humanFile.setSecond_kind_id(second_kind_id);
		humanFile.setThird_kind_id(third_kind_id);
		humanFile.setHuman_major_kind_id(major_kind_id);
		humanFile.setHuman_major_id(major_id);
		humanFile.setCheck_status(1);
		humanFile.setHuman_file_status(false);//false 删除状态
		humanFile.setMinTime(minTime);
		humanFile.setMaxTime(maxTime);
		List<HumanFile> list = this.humanFileBiz.findByConditionAndPage(humanFile, page, rows);

		// 获取所有符合条件档案个数
		int size = this.humanFileBiz.findAllMatchConditionFile(humanFile).size();
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		rd.setRows(list);
		rd.setTotal("" + size);
		out.print(gson.toJson(rd));
	}

// 档案恢复----------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/showHumanFileRecoveryQuery")
	public String showHumanFileRecoveryQuery(Model model) throws Exception {
		HumanFile humanFile = new HumanFile();
		model.addAttribute("humanFile", humanFile);
		return "../../back/humanFileRecoveryQuery";
	}
	
	// 跳转到查询list页面
	@RequestMapping(value = "/toHumanFileRecoveryQueryList")
	public @ResponseBody String toHumanFileRecoveryQueryList(String first_kind_id, String second_kind_id,
			String third_kind_id, String major_kind_id, String major_id, String minTime, String maxTime)
					throws Exception {
		HumanFile humanFile = new HumanFile();
		humanFile.setFirst_kind_id(first_kind_id);
		humanFile.setSecond_kind_id(second_kind_id);
		humanFile.setThird_kind_id(third_kind_id);
		humanFile.setHuman_major_kind_id(major_kind_id);
		humanFile.setHuman_major_id(major_id);
		humanFile.setHuman_file_status(false);
		humanFile.setMinTime(minTime);
		humanFile.setMaxTime(maxTime);
		List<HumanFile> totalList = this.humanFileBiz.findAllMatchConditionFile(humanFile);
		int size = totalList.size();
		return "back/humanFileRecoveryQueryList.jsp," + size;
	}

	// 按条件查询并分页显示所有可以复核的档案
	@RequestMapping(value = "/findRecoveryByConditionAndPage")
	public @ResponseBody void findRecoveryByConditionAndPage(@RequestParam String first_kind_id,
			@RequestParam String second_kind_id, @RequestParam String third_kind_id, @RequestParam String major_kind_id,
			@RequestParam String major_id, @RequestParam String minTime, @RequestParam String maxTime,
			@RequestParam int page, @RequestParam int rows, HttpServletResponse response, HttpServletRequest request)
					throws Exception {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HumanFile humanFile = new HumanFile();
		humanFile.setFirst_kind_id(first_kind_id);
		humanFile.setSecond_kind_id(second_kind_id);
		humanFile.setThird_kind_id(third_kind_id);
		humanFile.setHuman_major_kind_id(major_kind_id);
		humanFile.setHuman_major_id(major_id);
		humanFile.setHuman_file_status(true);
		humanFile.setMinTime(minTime);
		humanFile.setMaxTime(maxTime);
		List<HumanFile> list = this.humanFileBiz.findByConditionAndPage(humanFile, page, rows);

		// 获取所有符合条件档案个数
		int size = this.humanFileBiz.findAllMatchConditionFile(humanFile).size();
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		rd.setRows(list);
		rd.setTotal("" + size);
		out.print(gson.toJson(rd));
	}

	// 复核档案
	@RequestMapping(value = "/recoveryHumanFile")
	public String recoveryHumanFile(Model model, @RequestParam String human_id) throws Exception {
		HumanFile humanFile = new HumanFile();
		humanFile.setHuman_id(human_id);
		/*
		 * delete_time : 档案删除时间 human_file_status : 档案状态
		 */
		Date date = new Date();
		humanFile.setDelete_time(DateUtil.formatDate(date));
		int i = this.humanFileBiz.recoveryHumanFile(humanFile);
		if (i > 0) {
			return "../../back/humanFileRecoverySuccess";
		} else {
			return null;
		}
	}
	
	
//调动管理-------------------------------------------------------------------------------
		/*@RequestMapping(value = "/showMajorChangeQuery")
		public String showMajorChangeQuery(Model model) throws Exception {
			HumanFile humanFile = new HumanFile();
			model.addAttribute("humanFile", humanFile);
			return "../../back/majorChangeQuery";
		}

		@RequestMapping(value = "/toMajorChangeList")
		public @ResponseBody String toMajorChangeList(String first_kind_id, String second_kind_id, 
				String third_kind_id,String minTime, String maxTime) throws Exception {
			HumanFile humanFile = new HumanFile();
			humanFile.setFirst_kind_id(first_kind_id);
			humanFile.setSecond_kind_id(second_kind_id);
			humanFile.setThird_kind_id(third_kind_id);
			humanFile.setMinTime(minTime);
			humanFile.setMaxTime(maxTime);
			List<HumanFile> totalList = this.humanFileBiz.findAllMatchConditionFile(humanFile);
			int size = totalList.size();
			return "back/majorChangeList.jsp," + size;
		}
		@RequestMapping(value = "/findHumanfileMajorMove")
		public @ResponseBody void findHumanfileMajorMove(@RequestParam String first_kind_id,
				@RequestParam String second_kind_id, @RequestParam String third_kind_id, @RequestParam String minTime,
				@RequestParam String maxTime,@RequestParam int page, @RequestParam int rows,
				HttpServletResponse response, HttpServletRequest request)
						throws Exception {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			HumanFile humanFile = new HumanFile();
			humanFile.setFirst_kind_id(first_kind_id);
			humanFile.setSecond_kind_id(second_kind_id);
			humanFile.setThird_kind_id(third_kind_id);
			humanFile.setMinTime(minTime);
			humanFile.setMaxTime(maxTime);
			humanFile.setHuman_file_status(true); 
			List<HumanFile> list = this.humanFileBiz.findByConditionAndPage(humanFile, page, rows);

			// 获取所有符合条件档案个数
			int size = this.humanFileBiz.findAllMatchConditionFile(humanFile).size();
			// 将list转为json格式
			Gson gson = new Gson();
			ResponseData rd = new ResponseData();
			rd.setRows(list);
			rd.setTotal("" + size);
			out.print(gson.toJson(rd));
		}*/
}