package com.yc.web.controller;

import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.ConfigPublicChar;
import com.yc.bean.HumanFile;
import com.yc.bean.SalaryGrant;
import com.yc.bean.SalaryGrantDetails;
import com.yc.bean.SalaryStandard;
import com.yc.bean.SalaryStandardDetails;
import com.yc.bean.Users;
import com.yc.biz.ConfigPublicCharBiz;
import com.yc.biz.HumanFileBiz;
import com.yc.biz.SalaryGrantBiz;
import com.yc.biz.SalaryGrantDetailsBiz;
import com.yc.biz.SalaryStandardBiz;
import com.yc.biz.SalaryStandardDetailsBiz;
import com.yc.web.util.DateUtil;
import com.yc.web.util.ResponseData;

@Controller
public class SalaryStandardController {
	private static final Log logger = LogFactory.getLog(SalaryStandardController.class);

	private ConfigPublicCharBiz configPublicCharBiz;
	private SalaryStandardBiz salaryStandardBiz;
	private SalaryStandardDetailsBiz salaryStandardDetailsBiz;
	private HumanFileBiz humanFileBiz;

	private SalaryGrantBiz salaryGrantBiz;
	private SalaryGrantDetailsBiz salaryGrantDetailsBiz;

	@Resource(name = "salaryGrantDetailsBizImpl")
	public void setSalaryGrantDetails(SalaryGrantDetailsBiz salaryGrantDetailsBiz) {
		this.salaryGrantDetailsBiz = salaryGrantDetailsBiz;
	}

	@Resource(name = "salaryGrantBizImpl")
	public void setSalaryGrant(SalaryGrantBiz salaryGrantBiz) {
		this.salaryGrantBiz = salaryGrantBiz;
	}

	@Resource(name = "humanFileBizImpl")
	public void setHumanFile(HumanFileBiz humanFileBiz) {
		this.humanFileBiz = humanFileBiz;
	}

	@Resource(name = "configPublicCharBizImpl")
	public void setConfigPublicChar(ConfigPublicCharBiz configPublicCharBiz) {
		this.configPublicCharBiz = configPublicCharBiz;
	}

	@Resource(name = "salaryStandardBizImpl")
	public void setSalaryStandard(SalaryStandardBiz salaryStandardBiz) {
		this.salaryStandardBiz = salaryStandardBiz;
	}

	@Resource(name = "salaryStandardDetailsBizImpl")
	public void setSalaryStandardDetails(SalaryStandardDetailsBiz salaryStandardDetailsBiz) {
		this.salaryStandardDetailsBiz = salaryStandardDetailsBiz;
	}

	// 薪酬项目设置------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/showSalaryProjectManage")
	public String showSalaryProjectManage(Model model) {
		List<ConfigPublicChar> configPublicCharList = configPublicCharBiz.find();
		model.addAttribute("configPublicCharList", configPublicCharList);
		model.addAttribute("configPublicChar", new ConfigPublicChar());
		return "../../back/salaryProjectManage";
	}

	@RequestMapping(value = "/addSalaryProject")
	public String addSalaryProject(Model model, @ModelAttribute ConfigPublicChar configPublicChar,
			HttpServletRequest request) throws Exception {
		int i = this.configPublicCharBiz.addSalaryProject(configPublicChar);
		List<ConfigPublicChar> configPublicCharList = configPublicCharBiz.find();
		model.addAttribute("configPublicCharList", configPublicCharList);
		model.addAttribute("configPublicChar", new ConfigPublicChar());
		if (i > 0) {
			return "../../back/salaryProjectManage";
		} else {
			return null;
		}
	}

	@RequestMapping(value = "/updSalaryProject")
	public String updSalaryProject(Model model, ConfigPublicChar configPublicChar) throws Exception {
		int i = this.configPublicCharBiz.updSalaryProjectById(configPublicChar);
		List<ConfigPublicChar> configPublicCharList = configPublicCharBiz.find();
		model.addAttribute("configPublicCharList", configPublicCharList);
		model.addAttribute("configPublicChar", new ConfigPublicChar());
		if (i > 0) {
			return "../../back/salaryProjectManage";
		} else {
			return null;
		}
	}

	@RequestMapping(value = "/delSalaryProject")
	public String delSalaryProject(Model model, ConfigPublicChar configPublicChar) throws Exception {
		int i = this.configPublicCharBiz.delSalaryProjectById(configPublicChar);
		List<ConfigPublicChar> configPublicCharList = configPublicCharBiz.find();
		model.addAttribute("configPublicCharList", configPublicCharList);
		model.addAttribute("configPublicChar", new ConfigPublicChar());
		if (i > 0) {
			return "../../back/salaryProjectManage";
		} else {
			return null;
		}
	}

	// 薪酬添加------------------------------------------------------------------------------------------------------
	// 跳转到薪酬添加页面
	@RequestMapping(value = "/showSalaryStandardRegister")
	public String showSalaryStandardRegister(Model model) {
		List<ConfigPublicChar> configPublicCharList = configPublicCharBiz.find();
		model.addAttribute("configPublicCharList", configPublicCharList);
		model.addAttribute("configPublicChar", new ConfigPublicChar());
		model.addAttribute("salaryStandardDetails", new SalaryStandardDetails());
		SalaryStandard ss = new SalaryStandard();
		ss.setStandard_id(
				String.valueOf(Integer.parseInt(this.salaryStandardBiz.getStandardId().getStandard_id()) + 1));
		model.addAttribute("salaryStandard", ss);
		return "../../back/salaryStandardRegister";
	}

	// 添加薪酬标准
	@RequestMapping(value = "/addSalaryStandard")
	public @ResponseBody String addSalaryStandard(@RequestParam String standard_id, @RequestParam String standard_name,
			@RequestParam double salary_sum, @RequestParam String designer, @RequestParam String register,
			@RequestParam String item_id, @RequestParam String item_name, @RequestParam String salary, Model model) {
		SalaryStandard salaryStandard = new SalaryStandard();

		salaryStandard.setStandard_id(standard_id);
		salaryStandard.setStandard_name(standard_name);
		salaryStandard.setSalary_sum(salary_sum);
		salaryStandard.setRegister(register);
		salaryStandard.setDesigner(designer);
		salaryStandard.setRegist_time(DateUtil.formatDate(new Date()));

		String[] itemId = item_id.split(",");
		String[] itemName = item_name.split(",");
		String[] s = salary.split(",");
		List<SalaryStandardDetails> list = new ArrayList<SalaryStandardDetails>();
		for (int i = 0; i < itemId.length; i++) {
			SalaryStandardDetails salaryStandardDetails = new SalaryStandardDetails();
			salaryStandardDetails.setStandard_id(standard_id);
			salaryStandardDetails.setStandard_name(standard_name);
			if (!itemId[i].equals("")) {
				salaryStandardDetails.setItem_id(Integer.parseInt(itemId[i]));
			}
			salaryStandardDetails.setItem_name(itemName[i]);
			if (!s[i].equals("")) {
				salaryStandardDetails.setSalary(Double.parseDouble(s[i]));
			}
			list.add(salaryStandardDetails);
		}
		int i = this.salaryStandardBiz.add(salaryStandard, list);

		List<ConfigPublicChar> configPublicCharList = configPublicCharBiz.find();
		model.addAttribute("configPublicCharList", configPublicCharList);
		model.addAttribute("configPublicChar", new ConfigPublicChar());
		if (i > 0) {
			return "back/salaryStandardRegisterSuccess.jsp";
		} else {
			return null;
		}
	}

	// 薪酬登记复核-------------------------------------------------------------------------------
	// 跳转到薪酬登记复核页面
	@RequestMapping(value = "/showSalaryStandardCheckList")
	public String showHumanFileCheckList(Model model) throws Exception {
		List<SalaryStandard> totalList = this.salaryStandardBiz.findCheckFile();
		model.addAttribute("totalList", totalList);
		return "../../back/salaryStandardCheckList";
	}

	// 分页显示所有需要复核的薪酬标准
	@RequestMapping(value = "/findSalaryCheckListByPage")
	public @ResponseBody void findSalaryCheckListByPage(int page, int rows, HttpServletResponse response)
			throws Exception {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		List<SalaryStandard> list = this.salaryStandardBiz.findByPage(new SalaryStandard(), page, rows);
		// 获取所有需要复核的档案个数
		int size = this.salaryStandardBiz.findCheckFile().size();
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		rd.setRows(list);
		rd.setTotal("" + size);
		out.print(gson.toJson(rd));
	}

	// 单个薪酬标准详情
	@RequestMapping(value = "/checkSalaryDetail")
	public String checkSalaryDetail(int ssd_id, Model model, String standard_id) throws Exception {
		SalaryStandard salaryStandard = new SalaryStandard();
		salaryStandard.setSsd_id(ssd_id);
		List<SalaryStandard> list = this.salaryStandardBiz.findById(salaryStandard);

		salaryStandard = list.get(0);

		// 获取薪酬标准对应的项目list
		SalaryStandardDetails ssd = new SalaryStandardDetails();
		ssd.setStandard_id(standard_id);
		List<SalaryStandardDetails> ssdList = this.salaryStandardDetailsBiz.findSalaryStandardDetailsByStandardId(ssd);

		String reg_time = salaryStandard.getRegist_time();
		model.addAttribute("ssdList", ssdList);
		model.addAttribute("salaryStandard", salaryStandard);
		model.addAttribute("reg_time", reg_time);
		return "../../back/salaryStandardCheck";
	}

	// 薪酬标准复核
	// 根据standard_id 更改复核意见 check_comment 复核时间check_time 复核人checker(系统登录者姓名)
	// 是否符合check_status
	/*
	 * update salary_standard set
	 * check_comment=#{check_comment},check_time=NOW(),checker=#{checker},
	 * check_status=1 where standard_id=#{standard_id}
	 */
	@RequestMapping(value = "/checkSalaryStandard")
	public String checkSalaryStandard(String check_comment, String checker, String standard_id, Model model)
			throws Exception {
		SalaryStandard salaryStandard = new SalaryStandard();
		salaryStandard.setCheck_comment(check_comment);
		salaryStandard.setChecker(checker);
		salaryStandard.setStandard_id(standard_id);
		int i = this.salaryStandardBiz.checkSalaryStandard(salaryStandard);
		if (i > 0) {
			return "../../back/salaryStandardCheckSuccess";
		} else {
			return null;
		}
	}

	// 薪酬标准变更-------------------------------------------------------------------------------------------------------------------------------
	// 跳转到薪酬更改页面
	@RequestMapping(value = "/showSalaryStandardChange")
	public String showSalaryStandardChange(HttpSession session,Model model, @RequestParam int ssd_id, @RequestParam String standard_id)
			throws Exception {
		System.out.println("ssd_id:" + ssd_id);
		SalaryStandard ss = new SalaryStandard();
		ss = this.salaryStandardBiz.findById(ss).get(0);

		// 获取薪酬标准对应的项目list
		SalaryStandardDetails ssd = new SalaryStandardDetails();
		ssd.setStandard_id(standard_id);
		List<SalaryStandardDetails> ssdList = this.salaryStandardDetailsBiz.findSalaryStandardDetailsByStandardId(ssd);

		String changer_time = ss.getChange_time();

		model.addAttribute("ssdList", ssdList);
		model.addAttribute("changer_time", changer_time);
		model.addAttribute("salaryStandard", ss);
		
		Users user=(Users) session.getAttribute("user");
		model.addAttribute("user", user.getU_true_name());

		return "../../back/salaryStandardChange";
	}

	@RequestMapping(value = "/changeSalaryStandard")
	public String changeSalaryStandard(String check_comment, String checker, String standard_id, Model model)
			throws Exception {
		SalaryStandard salaryStandard = new SalaryStandard();
		salaryStandard.setCheck_comment(check_comment);
		salaryStandard.setChecker(checker);
		salaryStandard.setStandard_id(standard_id);

		int i = this.salaryStandardBiz.changeSalaryStandard(salaryStandard);
		if (i > 0) {
			return "../../back/salaryStandardChangeSuccess";
		} else {
			return null;
		}
	}

	// 薪酬标准查询---------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/showSalaryStandardQuery")
	public String showSalaryStandardQuery() throws Exception {
		return "../../back/salaryStandardQuery";
	}

	// 跳转到查询list页面
	@RequestMapping(value = "/tosalaryStandardQueryList")
	public @ResponseBody String tosalaryStandardQueryList(String standard_id, String key, String minTime,
			String maxTime) throws Exception {

		SalaryStandard ss = new SalaryStandard();
		ss.setStandard_id("%" + standard_id + "%");
		ss.setKey("%" + key + "%");
		ss.setMinTime(minTime);
		ss.setMaxTime(maxTime);
		List<SalaryStandard> totalList = this.salaryStandardBiz.findBy(ss);
		int size = totalList.size();
		return "back/salaryStandardQueryList.jsp," + size;
	}

	// 按条件查询并分页显示所有薪酬标准
	@RequestMapping(value = "/findSalaryStandardByConditionAndPage")
	public @ResponseBody void findSalaryStandardByConditionAndPage(@RequestParam String standard_id,
			@RequestParam String key, @RequestParam String minTime, @RequestParam String maxTime,
			@RequestParam int page, @RequestParam int rows, HttpServletResponse response, HttpServletRequest request)
					throws Exception {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		SalaryStandard ss = new SalaryStandard();
		ss.setStandard_id("%" + standard_id + "%");
		ss.setKey("%" + key + "%");
		ss.setMinTime(minTime);
		ss.setMaxTime(maxTime);
		List<SalaryStandard> list = this.salaryStandardBiz.findSalaryStandardByConditionAndPage(ss, page, rows);

		// 获取所有符合条件薪酬标准
		int size = this.salaryStandardBiz.findBy(ss).size();
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		rd.setRows(list);
		rd.setTotal("" + size);
		out.print(gson.toJson(rd));
	}

	// 薪酬发放管理----------------------------------------------------------------------------------------------------------
	// 跳转到薪酬发放页面
	@RequestMapping(value = "/showSalaryGrant")
	public String showSalaryGrant(Model model) throws Exception {
		List<HumanFile> hfBySecondKindList = this.humanFileBiz.findSalaryGrantBySecondKind();
		List<HumanFile> hfByFirstKindList = this.humanFileBiz.findSalaryGrantByFirstKind();
		List<HumanFile> list = new ArrayList<HumanFile>();
		for (int i = 0; i < hfBySecondKindList.size(); i++) {
			list.add(hfBySecondKindList.get(i));
		}
		for (int i = 0; i < hfByFirstKindList.size(); i++) {
			hfByFirstKindList.get(i).setSecond_kind_name("");
			list.add(hfByFirstKindList.get(i));
		}
		model.addAttribute("list", list);
		System.out.println("list::"+list);
		return "../../back/salaryGrant";
	}

	// 跳转到添加薪酬发放页面
	@RequestMapping(value = "/toAddSalaryGrant")
	public String toAddSalaryGrant(Model model, @RequestParam int index, HttpServletRequest request) {
		List<ConfigPublicChar> configPublicCharList = this.configPublicCharBiz.find();

		List<HumanFile> hfBySecondKind = this.humanFileBiz.findSalaryGrantBySecondKind();
		List<HumanFile> hfByFirstKind = this.humanFileBiz.findSalaryGrantByFirstKind();
		List<HumanFile> list = new ArrayList<HumanFile>();
		for (int i = 0; i < hfBySecondKind.size(); i++) {
			list.add(hfBySecondKind.get(i));
		}
		for (int i = 0; i < hfByFirstKind.size(); i++) {
			hfByFirstKind.get(i).setSecond_kind_name("");
			list.add(hfByFirstKind.get(i));
		}
		HumanFile humanFile = list.get(index);
		List<HumanFile> humanFileList = this.humanFileBiz.findByFirstOrSecondId(humanFile);

		List<HumanFile> showList = new ArrayList<HumanFile>();
		HumanFile hf = null;
		for (int i = 0; i < humanFileList.size(); i++) {
			hf = new HumanFile();
			hf.setSalary_standard_id(humanFileList.get(i).getSalary_standard_id());
			hf.setHuman_id(humanFileList.get(i).getHuman_id());
			hf.setHuman_name(humanFileList.get(i).getHuman_name());
			hf.setSalary_sum(humanFileList.get(i).getSalary_sum());
			SalaryStandardDetails ssd = new SalaryStandardDetails();
			ssd.setStandard_id(humanFileList.get(i).getSalary_standard_id());
			List<SalaryStandardDetails> ssdList = this.salaryStandardDetailsBiz
					.findSalaryStandardDetailsByStandardId(ssd);
			hf.setSalaryStandardDetailslist(ssdList);
			showList.add(hf);
		}
		model.addAttribute("configPublicCharList", configPublicCharList);
		model.addAttribute("humanFileList", showList);

// ---------------------------------------------------------------------------------------------------------
		// 获取当前时间
		Date d = new Date();
		String date = DateUtil.formatTime(d);
		model.addAttribute("date", date);
		// 对应总人数
		int size = humanFileList.size();
		model.addAttribute("size", size);
		model.addAttribute("humanFile", humanFile);

		model.addAttribute("salaryGrant", new SalaryGrant());

		return "../../back/salaryGrantRegister";
	}

// 添加薪酬发放
	@RequestMapping(value = "/addSalaryGrant")
	public @ResponseBody String addSalaryGrant(Model model, @RequestParam String salary_standard_id,
			@RequestParam String first_kind_id, @RequestParam String first_kind_name,
			@RequestParam String second_kind_id, @RequestParam String second_kind_name, @RequestParam int human_amount,
			@RequestParam String salary_standard_sum1, @RequestParam String salary_paid_sum1,
			@RequestParam String register, @RequestParam String human_id, @RequestParam String human_name,
			@RequestParam String bouns_sum, @RequestParam String sale_sum, @RequestParam String deduct_sum,
			@RequestParam String salary_standard_sums, @RequestParam String salary_paid_sums,
			HttpServletRequest request) {
		// grant添加----------------------------------------------------------------------------------------------------------
		SalaryGrant salaryGrant = new SalaryGrant();
		salaryGrant.setSalary_standard_id(salary_standard_id);
		salaryGrant.setFirst_kind_id(first_kind_id);
		salaryGrant.setFirst_kind_name(first_kind_name);
		salaryGrant.setSecond_kind_id(second_kind_id);
		salaryGrant.setSecond_kind_name(second_kind_name);
		salaryGrant.setHuman_amount(human_amount);
		salaryGrant.setSalary_standard_sum(Double.valueOf(salary_standard_sum1));
		salaryGrant.setSalary_paid_sum(Double.valueOf(salary_paid_sum1));
		salaryGrant.setRegister(register);
		salaryGrant.setRegist_time(DateUtil.formatDate(new Date()));
		SalaryGrant sg = this.salaryGrantBiz.findMaxSGID();
		String salary_grant_id ="";
		if(sg!=null){
			 salary_grant_id = String.valueOf(Integer.parseInt(sg.getSalary_grant_id()) + 1);
		}else{
			salary_grant_id="1000";
		}
		salaryGrant.setSalary_grant_id(salary_grant_id);

		// details添加------------------------------------------------------------------------------------------------
		List<HumanFile> hfBySecondKind = this.humanFileBiz.findSalaryGrantBySecondKind();
		List<HumanFile> hfByFirstKind = this.humanFileBiz.findSalaryGrantByFirstKind();
		List<HumanFile> list = new ArrayList<HumanFile>();
		for (int z = 0; z < hfBySecondKind.size(); z++) {
			list.add(hfBySecondKind.get(z));
		}
		for (int x = 0; x < hfByFirstKind.size(); x++) {
			hfByFirstKind.get(x).setSecond_kind_name("");
			list.add(hfByFirstKind.get(x));
		}
		
		String[] bs = bouns_sum.split(",");
		String[] ss = sale_sum.split(",");
		String[] ds = deduct_sum.split(",");
		String[] hi = human_id.split(",");
		String[] hn = human_name.split(",");
		String[] sss = salary_standard_sums.split(",");
		String[] sps = salary_paid_sums.split(",");

		List<SalaryGrantDetails> sgdList=new ArrayList<SalaryGrantDetails>();
		for (int i = 0; i < bs.length; i++) {
			SalaryGrantDetails sgd = new SalaryGrantDetails();
			sgd.setSalary_grant_id(salary_grant_id);
			sgd.setHuman_id(hi[i]);
			sgd.setHuman_name(hn[i]);
			sgd.setBouns_sum(Double.valueOf(bs[i]));
			sgd.setSale_sum(Double.valueOf(ss[i]));
			sgd.setDeduct_sum(Double.valueOf(ds[i]));
			sgd.setSalary_standard_sum(Double.valueOf(sss[i]));
			sgd.setSalary_paid_sum(Double.valueOf(sps[i]));
			sgdList.add(sgd);
		}
		int i = this.salaryGrantBiz.addSalaryGrant(salaryGrant, sgdList);
		if (i > 0) {
			return "back/salaryGrantRegisterSuccess.jsp";
		} else {
			return null;
		}
	}

// 复核薪酬发放单---------------------------------------------------------------------------------------------------------
	// 跳转到复核页面
	@RequestMapping(value = "/showSalaryGrantCheckList")
	public String showSalaryGrantCheckList(Model model) throws Exception {
		List<SalaryGrantDetails> totalList = this.salaryGrantBiz.findCheckSalaryGrant();
		model.addAttribute("totalList", totalList);
		return "../../back/salaryGrantCheckList";
	}

	// 分页查看所有需要复核薪酬发放单
	@RequestMapping(value = "/findCheckSalaryGrantListByPage")
	public @ResponseBody void findCheckSalaryGrantListByPage(int page, int rows, HttpServletResponse response)
			throws Exception {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		List<SalaryGrantDetails> list = this.salaryGrantBiz.findByPage(new SalaryGrant(), page, rows);

		// 获取所有需要复核的档案个数
		int size = this.salaryGrantBiz.findCheckSalaryGrant().size();
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		rd.setRows(list);
		rd.setTotal("" + size);
		out.print(gson.toJson(rd));
	}

	// 复核薪酬发放单
	@RequestMapping(value = "/checkSalaryGrant")
	public String checkSalaryGrant(@RequestParam String salary_grant_id,@RequestParam String human_id,
			@RequestParam String bouns_sum,@RequestParam String sale_sum, @RequestParam String deduct_sum,
			Model model,HttpSession session)
			throws Exception {
		SalaryGrant salaryGrant=new SalaryGrant();
		salaryGrant.setSalary_grant_id(salary_grant_id);
		SalaryGrantDetails salaryGrantDetails=new SalaryGrantDetails();
		salaryGrantDetails.setHuman_id(human_id);
		salaryGrantDetails=this.salaryGrantDetailsBiz.findByHumanId(salaryGrantDetails).get(0);
		
		double bs=Double.valueOf(bouns_sum);
		double ss=Double.valueOf(sale_sum);
		double ds=Double.valueOf(deduct_sum);
		
		double bounsSum=salaryGrantDetails.getBouns_sum();
		double salaSum=salaryGrantDetails.getSale_sum();
		double deductSum=salaryGrantDetails.getDeduct_sum();
		
		System.out.println("bs:"+bs+"bounsSum:"+bounsSum);
		System.out.println("ss:"+ss+"salaSum:"+salaSum);
		System.out.println("ds:"+ds+"deductSum:"+deductSum);
		//bs=100;
		int j=0;
		if(bs!=bounsSum||ss!=salaSum||ds!=deductSum){
			System.out.println("不同");
			//在details表中更具human_id获取salary_grant_id
			SalaryGrantDetails sgd=new SalaryGrantDetails();
			sgd.setHuman_id(human_id);
			sgd.setSalary_grant_id(salary_grant_id);
			List<SalaryGrantDetails> l=this.salaryGrantDetailsBiz.findByHumanId(sgd);
			
			//在sgd表修改对应bouns_sum sala_sum deduct_sum salary_paid_sum
			sgd=l.get(0);
			sgd.setBouns_sum(bs);
			sgd.setSale_sum(ss);
			sgd.setDeduct_sum(ds);
			double sps=sgd.getSalary_standard_sum();
			sps=sps+bs+ss+ds;
			sgd.setSalary_paid_sum(sps);
			//在salaryGrant中修改对应salary_grant_id的salary_paid_sum
			List<SalaryGrantDetails> ls=this.salaryGrantDetailsBiz.findBySalaryGrantId(sgd);
			double ps=0;
			for(int i=0;i<ls.size();i++){
				ps+=ls.get(i).getSalary_paid_sum();
			}
			salaryGrant.setSalary_paid_sum(ps);
			salaryGrant.setChecker(null);
			salaryGrant.setCheck_time(null);
			//先修改
			j=this.salaryGrantDetailsBiz.changeSalaryGrantDetails(sgd);
		}else{
			salaryGrant.setCheck_status(1);
			salaryGrant.setSalary_paid_sum(salaryGrant.getSalary_paid_sum());
			
			Users user=(Users) session.getAttribute("user");
			salaryGrant.setChecker(user.getU_true_name());
			
			salaryGrant.setCheck_time(DateUtil.formatDate(new Date()));
		}
		//复核
		int i = this.salaryGrantBiz.checkSalaryGrant(salaryGrant);
		if(i>0){
			return "../../back/salaryGrantCheckSuccess";
		}else{
			return null;
		}
	}

// 薪酬发放查询--------------------------------------------------------------------------------------------------
	
	@RequestMapping(value = "/showSalaryGrantQuery")
	public String showSalaryGrantQuery() throws Exception {
		return "../../back/salaryGrantQuery";
	}

	// 跳转到查询list页面
	@RequestMapping(value = "/tosalaryGrantQueryList")
	public @ResponseBody String tosalaryGrantQueryList(String salary_grant_id, String key, String minTime,
			String maxTime) throws Exception {

		SalaryGrant sg = new SalaryGrant();
		sg.setSalary_grant_id("%" + salary_grant_id + "%");
		sg.setKey("%" + key + "%");
		sg.setMinTime(minTime);
		sg.setMaxTime(maxTime);
		List<SalaryGrant> totalList = this.salaryGrantBiz.findBy(sg);
		System.out.println("size::"+totalList.size());
		int size = totalList.size();
		return "back/salaryGrantQueryList.jsp," + size;
	}

	// 按条件查询并分页显示所有薪酬标准
	@RequestMapping(value = "/findSalaryGrantByConditionAndPage")
	public @ResponseBody void findSalaryGrantByConditionAndPage(@RequestParam String salary_grant_id,
			@RequestParam String key, @RequestParam String minTime, @RequestParam String maxTime,
			@RequestParam int page, @RequestParam int rows, HttpServletResponse response, HttpServletRequest request)
					throws Exception {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		SalaryGrant sg = new SalaryGrant();
		sg.setSalary_grant_id("%" + salary_grant_id + "%");
		sg.setKey("%" + key + "%");
		sg.setMinTime(minTime);
		sg.setMaxTime(maxTime);
		List<SalaryGrant> list = this.salaryGrantBiz.findSalaryGrantByConditionAndPage(sg, page, rows);

		// 获取所有符合条件薪酬标准
		int size = this.salaryGrantBiz.findBy(sg).size();
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		rd.setRows(list);
		rd.setTotal("" + size);
		out.print(gson.toJson(rd));
	}
	
	//跳转到对应salary_grant_id的details分页显示页面
	@RequestMapping(value = "/toshowfindSalaryGrantDetsilsBySalaryGrantId")
	public String toshowfindSalaryGrantDetsilsBySalaryGrantId(@RequestParam String salary_grant_id,Model model) throws Exception {
		SalaryGrantDetails salaryGrantDetails = new SalaryGrantDetails();
		salaryGrantDetails.setSalary_grant_id(salary_grant_id);
		List<SalaryGrantDetails> list = this.salaryGrantDetailsBiz.findBySalaryGrantId(salaryGrantDetails);
		int size = this.salaryGrantDetailsBiz.findBySalaryGrantId(salaryGrantDetails).size();
		model.addAttribute("size", size);
		model.addAttribute("salary_grant_id", salary_grant_id);
		return "../../back/salaryGrantDetailsListBySalaryGrantId";
	}
	
	// 按条件查询并分页显示所有薪酬分发详情
	@RequestMapping(value = "/findSalaryGrantDetsilsBySalaryGrantId")
	public @ResponseBody void findSalaryGrantDetsilsBySalaryGrantId(@RequestParam String salary_grant_id,
			HttpServletResponse response,@RequestParam int page, @RequestParam int rows, HttpServletRequest request)
					throws Exception {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		SalaryGrantDetails salaryGrantDetails = new SalaryGrantDetails();
		salaryGrantDetails.setSalary_grant_id(salary_grant_id);

		List<SalaryGrantDetails> list = this.salaryGrantDetailsBiz.findSalaryGrantDeatilsBySalaryGrantIdAndPage(salaryGrantDetails, page, rows);
		// 获取所有符合条件薪酬标准
		int size = this.salaryGrantDetailsBiz.findBySalaryGrantId(salaryGrantDetails).size();
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		rd.setRows(list);
		rd.setTotal("" + size);
		out.print(gson.toJson(rd));
	}
}