package com.yc.web.controller;

import java.util.List;
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

import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.ConfigFileSecondKind;
import com.yc.bean.ConfigFileThirdKind;
import com.yc.bean.ConfigMajor;
import com.yc.bean.ConfigMajorKind;
import com.yc.bean.ConfigPublicChar;
import com.yc.bean.ConfigQuestionFirstKind;
import com.yc.bean.ConfigQuestionSecondKind;
import com.yc.biz.ConfigFileFirstKindBiz;
import com.yc.biz.ConfigFileSecondKindBiz;
import com.yc.biz.ConfigFileThirdKindBiz;
import com.yc.biz.ConfigMajorBiz;
import com.yc.biz.ConfigMajorKindBiz;
import com.yc.biz.ConfigPublicCharBiz;
import com.yc.biz.ConfigQuestionFirstKindBiz;
import com.yc.biz.ConfigQuestionSecondKindBiz;

@Controller
public class ConfigController {
	private static final Log logger = LogFactory.getLog(ConfigController.class);

	private ConfigFileFirstKindBiz configFileFirstKindBiz;
	private ConfigFileSecondKindBiz configFileSecondKindBiz;
	private ConfigFileThirdKindBiz configFileThirdKindBiz;
	private ConfigMajorKindBiz configMajorKindBiz;
	private ConfigMajorBiz ConfigMajorBiz;
	private ConfigPublicCharBiz configPublicCharBiz;
	private ConfigQuestionFirstKindBiz configQuestionFirstKindBiz;
	private ConfigQuestionSecondKindBiz configQuestionSecondKindBiz;

	@Resource(name = "configQuestionFirstKindBizImpl")
	public void setConfigQuestionFirstKindBiz(ConfigQuestionFirstKindBiz configQuestionFirstKindBiz) {
		this.configQuestionFirstKindBiz = configQuestionFirstKindBiz;
	}

	@Resource(name = "configQuestionSecondKindBizImpl")
	public void setConfigQuestionSecondKindBiz(ConfigQuestionSecondKindBiz configQuestionSecondKindBiz) {
		this.configQuestionSecondKindBiz = configQuestionSecondKindBiz;
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

	@Resource(name = "configPublicCharBizImpl")
	public void setConfigPublicChar(ConfigPublicCharBiz configPublicCharBiz) {
		this.configPublicCharBiz = configPublicCharBiz;
	}

	// 试题一级分类设置------------------------------------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/showQuestionFirstKind")
	public String showQuestionFirstKind(Model model, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		List<ConfigQuestionFirstKind> list = this.configQuestionFirstKindBiz.findAll(new ConfigQuestionFirstKind());
		model.addAttribute("list", list);
		return "../../back/questionFirstKind";
	}

	// 跳转添加页面
	@RequestMapping(value = "/toQuestionFirstKindRegister")
	public String toQuestionFirstKindRegister(Model model) throws Exception {
		ConfigQuestionFirstKind configQuestionFirstKind = new ConfigQuestionFirstKind();
		model.addAttribute("configQuestionFirstKind", configQuestionFirstKind);
		model.addAttribute("first_kind_id", Integer.parseInt(this.configQuestionFirstKindBiz.getMaxFirstKindId().getFirst_kind_id())+1);
		return "../../back/questionFirstKindRegister";
	}

	// 添加
	@RequestMapping(value = "/addQuestionFirstKindRegister")
	public String addQuestionFirstKindRegister(Model model, @ModelAttribute ConfigQuestionFirstKind configQuestionFirstKind,
			HttpServletRequest request) {
		List<ConfigQuestionFirstKind> list = this.configQuestionFirstKindBiz.findAll(new ConfigQuestionFirstKind());
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getFirst_kind_name().equals(configQuestionFirstKind.getFirst_kind_name())) {
				model.addAttribute("firstKindName", configQuestionFirstKind.getFirst_kind_name());
				return "../../back/firstKindRegisterFailure";
			}
		}
		this.configQuestionFirstKindBiz.add(configQuestionFirstKind);
		return "../../back/questionFirstKindRegisterSuccess";
	}

	// 跳转到更改页面
	@RequestMapping(value = "/tochangeQuestionFirstKind")
	public String tochangeQuestionFirstKind(Model model, @RequestParam int qfk_id) {
		ConfigQuestionFirstKind configQuestionFirstKind=new ConfigQuestionFirstKind();
		configQuestionFirstKind.setQfk_id(qfk_id);
		configQuestionFirstKind=this.configQuestionFirstKindBiz.findByID(configQuestionFirstKind);
		model.addAttribute("configQuestionFirstKind", configQuestionFirstKind);
		return "../../back/questionFirstKindChange";
	}

	// 更改
	@RequestMapping(value = "/changeConfigQuestionFirstKind")
	public String changeConfigQuestionFirstKind(Model model, @ModelAttribute ConfigQuestionFirstKind configQuestionFirstKind,
			HttpServletRequest request) {
		int i = this.configQuestionFirstKindBiz.changeConfigQuestionfirstkind(configQuestionFirstKind);
		if (i > 0) {
			return "../../back/questionFirstKindChangeSuccess";
		} else {
			return null;
		}
	}

	// 跳转到删除页面
	@RequestMapping(value = "/showQuestionFirstKindDelete")
	public String showQuestionFirstKindDelete(Model model, @RequestParam int qfk_id) {
		ConfigQuestionFirstKind configQuestionFirstKind=new ConfigQuestionFirstKind();
		configQuestionFirstKind.setQfk_id(qfk_id);
		configQuestionFirstKind=this.configQuestionFirstKindBiz.findByID(configQuestionFirstKind);
		model.addAttribute("configQuestionFirstKind", configQuestionFirstKind);
		return "../../back/questionFirstKindDelete";
	}

	// 删除
	@RequestMapping(value = "/DelQuestionFirstKind")
	public @ResponseBody String DelQuestionFirstKind(Model model, @RequestParam String first_kind_id) {
		ConfigQuestionFirstKind configQuestionFirstKind=new ConfigQuestionFirstKind();
		configQuestionFirstKind.setFirst_kind_id(first_kind_id);
		int i=this.configQuestionFirstKindBiz.delete(configQuestionFirstKind);
		if (i > 0) {
			return "back/questionFirstKindDeleteSuccess.jsp";
		} else {
			return null;
		}
	}

// 试题二级分类设置------------------------------------------------------------------------------------------------------------------------------------------------------------

	@RequestMapping(value = "/showQuestionSecondKind")
	public String showQuestionSecondKind(Model model, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		List<ConfigQuestionSecondKind> list = this.configQuestionSecondKindBiz.find(new ConfigQuestionSecondKind());
		model.addAttribute("list", list);
		return "../../back/questionSecondKind";
	}
	
	// 跳转二级机构添加页面
	@RequestMapping(value = "/toQuestionSecondKindRegister")
	public String toQuestionSecondKindRegister(Model model) throws Exception {
		List<ConfigQuestionSecondKind> list = this.configQuestionSecondKindBiz.find(new ConfigQuestionSecondKind());
		model.addAttribute("list", list);
		model.addAttribute("configQuestionSecondKind", new ConfigQuestionSecondKind());
		return "../../back/questionSecondKindRegister";
	}

	// 添加
	@RequestMapping(value = "/addQuestionSecondKindRegister")
	public String addQuestionSecondKindRegister(Model model, @ModelAttribute ConfigQuestionSecondKind configQuestionSecondKind,
			HttpServletRequest request) {
		String second_kind_id = String
				.valueOf(Integer.parseInt(this.configQuestionSecondKindBiz.getMaxSecondKindId().getSecond_kind_id()) + 1);
		configQuestionSecondKind.setSecond_kind_id(second_kind_id);
		String firstKindIdAndName = configQuestionSecondKind.getFirst_kind_id();
		String[] arr = firstKindIdAndName.split("/");
		configQuestionSecondKind.setFirst_kind_id(arr[0]);
		configQuestionSecondKind.setFirst_kind_name(arr[1]);

		this.configQuestionSecondKindBiz.add(configQuestionSecondKind);
		return "../../back/questionSecondKindRegisterSuccess";
	}

	// 跳转到更改页面
	@RequestMapping(value = "/tochangeQuestionSecondKind")
	public String tochangeQuestionSecondKind(Model model, @RequestParam int qsk_id) {
		ConfigQuestionSecondKind configQuestionSecondKind = new ConfigQuestionSecondKind();
		configQuestionSecondKind.setQsk_id(qsk_id);
		configQuestionSecondKind = this.configQuestionSecondKindBiz.findByID(configQuestionSecondKind);
		model.addAttribute("configQuestionSecondKind", configQuestionSecondKind);
		return "../../back/questionSecondKindChange";
	}

	// 更改
	@RequestMapping(value = "/changeQuestionSecondkind")
	public String changeQuestionSecondkind(Model model, @ModelAttribute ConfigQuestionSecondKind configQuestionSecondKind,
			HttpServletRequest request) {
		int i = this.configQuestionSecondKindBiz.changeConfigQuestionSecondkind(configQuestionSecondKind);
		if (i > 0) {
			List<ConfigQuestionSecondKind> list = this.configQuestionSecondKindBiz.find(new ConfigQuestionSecondKind());
			model.addAttribute("list", list);
			return "../../back/questionSecondKind";
		} else {
			return null;
		}
	}

	// 删除
	@RequestMapping(value = "/DelQuestionSecondKind")
	public String DelQuestionSecondKind(Model model, @RequestParam int qsk_id) {
		ConfigQuestionSecondKind configQuestionSecondKind = new ConfigQuestionSecondKind();
		configQuestionSecondKind.setQsk_id(qsk_id);
		int i = this.configQuestionSecondKindBiz.delete(configQuestionSecondKind);
		if (i > 0) {
			List<ConfigQuestionSecondKind> list = this.configQuestionSecondKindBiz.find(new ConfigQuestionSecondKind());
			model.addAttribute("list", list);
			return "../../back/questionSecondKind";
		} else {
			return null;
		}
	}

// 一级机构-----------------------------------------------------------------------------------------------------------
	// 跳转并显示所有一级机构
	@RequestMapping(value = "/showFirstKind")
	public String showFirstKind(Model model, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		List<ConfigFileFirstKind> list = this.configFileFirstKindBiz.find();
		model.addAttribute("list", list);
		return "../../back/firstKind";
	}

	// 跳转一级机构添加页面
	@RequestMapping(value = "/toFirstKindRegister")
	public String toFirstKindRegister(Model model) throws Exception {
		ConfigFileFirstKind cffk = new ConfigFileFirstKind();
		String first_kind_id = String
				.valueOf(Integer.parseInt(this.configFileFirstKindBiz.getMaxFirstKindId().getFirst_kind_id()) + 1);
		cffk.setFirst_kind_id(first_kind_id);
		model.addAttribute("configFileFirstKind", cffk);
		return "../../back/firstKindRegister";
	}

	// 添加一级机构
	@RequestMapping(value = "/addConfigfilefirstkind")
	public String addConfigfilefirstkind(Model model, @ModelAttribute ConfigFileFirstKind configFileFirstKind,
			HttpServletRequest request) {
		List<ConfigFileFirstKind> list = this.configFileFirstKindBiz.find();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getFirst_kind_name().equals(configFileFirstKind.getFirst_kind_name())) {
				model.addAttribute("firstKindName", configFileFirstKind.getFirst_kind_name());
				return "../../back/firstKindRegisterFailure";
			}
		}
		this.configFileFirstKindBiz.add(configFileFirstKind);
		return "../../back/firstKindRegisterSuccess";
	}

	// 跳转到更改一级机构页面
	@RequestMapping(value = "/tochangeFirstKind")
	public String toUpdFirstKind(Model model, @RequestParam String first_kind_id) {
		ConfigFileFirstKind configFileFirstKind = new ConfigFileFirstKind();
		configFileFirstKind.setFirst_kind_id(first_kind_id);
		configFileFirstKind = this.configFileFirstKindBiz.findByFirstKindId(configFileFirstKind);
		model.addAttribute("configFileFirstKind", configFileFirstKind);
		return "../../back/firstKindChange";
	}

	// 更改一级机构
	@RequestMapping(value = "/changeConfigfilefirstkind")
	public String changeConfigfilefirstkind(Model model, @ModelAttribute ConfigFileFirstKind configFileFirstKind,
			HttpServletRequest request) {
		System.out.println("getFirst_kind_salary_id:" + configFileFirstKind.getFirst_kind_salary_id());
		int i = this.configFileFirstKindBiz.changeConfigfilefirstkind(configFileFirstKind);
		if (i > 0) {
			return "../../back/firstKindChangeSuccess";
		} else {
			return null;
		}
	}

	// 跳转到一级机构删除页面
	@RequestMapping(value = "/showFirstKindDelete")
	public String showFirstKindDelete(Model model, @RequestParam String first_kind_id) {
		ConfigFileFirstKind configFileFirstKind = new ConfigFileFirstKind();
		configFileFirstKind.setFirst_kind_id(first_kind_id);
		configFileFirstKind = this.configFileFirstKindBiz.findByFirstKindId(configFileFirstKind);
		model.addAttribute("configFileFirstKind", configFileFirstKind);
		return "../../back/firstKindDelete";
	}

	// 删除一级机构
	@RequestMapping(value = "/DelFirstKind")
	public @ResponseBody String DelFirstKind(Model model, @RequestParam String first_kind_id) {
		ConfigFileFirstKind configFileFirstKind = new ConfigFileFirstKind();
		configFileFirstKind.setFirst_kind_id(first_kind_id);
		int i = this.configFileFirstKindBiz.delete(configFileFirstKind);
		if (i > 0) {
			return "back/firstKindDeleteSuccess.jsp";
		} else {
			return "back/firstKindDeleteFailure.jsp";
		}
	}

	// 二级机构-------------------------------------------------------------------------------------------------------------
	// 跳转并显示所有二级机构
	@RequestMapping(value = "/showSecondKind")
	public String showSecondKind(Model model, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		List<ConfigFileFirstKind> list = this.configFileSecondKindBiz.find();
		model.addAttribute("list", list);
		return "../../back/secondKind";
	}

	// 跳转二级机构添加页面
	@RequestMapping(value = "/toSecondKindRegister")
	public String toSecondKindRegister(Model model) throws Exception {
		List<ConfigFileFirstKind> list = this.configFileFirstKindBiz.find();
		model.addAttribute("list", list);
		model.addAttribute("configFileSecondKind", new ConfigFileSecondKind());
		return "../../back/secondKindRegister";
	}

	// 添加二级机构
	@RequestMapping(value = "/addConfigFileSecondkind")
	public String addConfigFileSecondkind(Model model, @ModelAttribute ConfigFileSecondKind configFileSecondKind,
			HttpServletRequest request) {
		String second_kind_id = String
				.valueOf(Integer.parseInt(this.configFileSecondKindBiz.getMaxSecondKindId().getSecond_kind_id()) + 1);
		configFileSecondKind.setSecond_kind_id(second_kind_id);
		String firstKindIdAndName = configFileSecondKind.getFirst_kind_id();
		String[] arr = firstKindIdAndName.split("/");
		configFileSecondKind.setFirst_kind_id(arr[0]);
		configFileSecondKind.setFirst_kind_name(arr[1]);

		int i = this.configFileSecondKindBiz.add(configFileSecondKind);
		if (i > 0) {
			return "../../back/secondKindRegisterSuccess";
		} else {
			return null;
		}
	}

	// 跳转到更改二级机构页面
	@RequestMapping(value = "/tochangeSecondKind")
	public String tochangeSecondKind(Model model, @RequestParam int fsk_id) {
		ConfigFileSecondKind configFileSecondKind = new ConfigFileSecondKind();
		configFileSecondKind.setFsk_id(fsk_id);
		configFileSecondKind = this.configFileSecondKindBiz.findBySecondKindId(configFileSecondKind);
		model.addAttribute("configFileSecondKind", configFileSecondKind);
		return "../../back/secondKindChange";
	}

	// 更改二级机构
	@RequestMapping(value = "/changeConfigFileSecondkind")
	public String changeConfigFileSecondkind(Model model, @ModelAttribute ConfigFileSecondKind configFileSecondKind,
			HttpServletRequest request) {
		int i = this.configFileSecondKindBiz.changeConfigFileSecondkind(configFileSecondKind);
		if (i > 0) {
			List<ConfigFileFirstKind> list = this.configFileSecondKindBiz.find();
			model.addAttribute("list", list);
			return "../../back/secondKind";
		} else {
			return null;
		}
	}

	// 删除二级机构
	@RequestMapping(value = "/DelSecondKind")
	public String DelSecondKind(Model model, @RequestParam int fsk_id) {
		ConfigFileSecondKind configFileSecondKind = new ConfigFileSecondKind();
		configFileSecondKind.setFsk_id(fsk_id);
		int i = this.configFileSecondKindBiz.del(configFileSecondKind);
		if (i > 0) {
			List<ConfigFileFirstKind> list = this.configFileSecondKindBiz.find();
			model.addAttribute("list", list);
			return "../../back/secondKind";
		} else {
			return null;
		}
	}

	// 三级机构-----------------------------------------------------------------------------------------------------------
	// 跳转并显示所有三级机构
	@RequestMapping(value = "/showThirdKind")
	public String showThirdKind(Model model, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		List<ConfigFileFirstKind> list = this.configFileThirdKindBiz.find();
		model.addAttribute("list", list);
		return "../../back/thirdKind";
	}

	// 跳转三级机构添加页面
	@RequestMapping(value = "/toThirdKindRegister")
	public String toThirdKindRegister(Model model) throws Exception {
		return "../../back/thirdKindRegister";
	}

	// 添加三级机构
	@RequestMapping(value = "/addConfigFileThirdkind")
	public @ResponseBody String addConfigFileThirdkind(Model model, @RequestParam String first_kind_id,
			@RequestParam String first_kind_name, @RequestParam String second_kind_id,
			@RequestParam String second_kind_name, @RequestParam String third_kind_name,
			@RequestParam String third_kind_sale_id, @RequestParam String third_kind_is_retail,
			HttpServletRequest request) {
		ConfigFileThirdKind configFileThirdKind = new ConfigFileThirdKind();
		configFileThirdKind.setFirst_kind_id(first_kind_id);
		configFileThirdKind.setFirst_kind_name(first_kind_name);
		configFileThirdKind.setSecond_kind_id(second_kind_id);
		configFileThirdKind.setSecond_kind_name(second_kind_name);
		configFileThirdKind.setThird_kind_name(third_kind_name);
		configFileThirdKind.setThird_kind_is_retail(third_kind_is_retail);
		configFileThirdKind.setThird_kind_sale_id(third_kind_sale_id);

		String third_kind_id = String.valueOf(Integer.parseInt(
				this.configFileThirdKindBiz.getMaxThirdKindIdBySecondId(configFileThirdKind).getThird_kind_id()) + 1);
		configFileThirdKind.setThird_kind_id(third_kind_id);

		int i = this.configFileThirdKindBiz.add(configFileThirdKind);
		if (i > 0) {
			return "thirdKindRegisterSuccess.jsp";
		} else {
			return null;
		}
	}

	// 跳转到更改三级机构页面
	@RequestMapping(value = "/tochangeThirdKind")
	public String tochangeThirdKind(Model model, @RequestParam Integer ftk_id) {
		ConfigFileThirdKind configFileThirdKind = new ConfigFileThirdKind();
		configFileThirdKind.setFtk_id(ftk_id);
		configFileThirdKind = this.configFileThirdKindBiz.findByFtkId(configFileThirdKind);
		model.addAttribute("configFileThirdKind", configFileThirdKind);
		return "../../back/thirdKindChange";
	}

	// 更改三级机构
	@RequestMapping(value = "/changeConfigFileThirdkind")
	public String changeConfigFileThirdkind(Model model, @ModelAttribute ConfigFileThirdKind configFileThirdKind,
			HttpServletRequest request) {
		int i = this.configFileThirdKindBiz.changeConfigFileThirdkind(configFileThirdKind);
		if (i > 0) {
			List<ConfigFileThirdKind> list = this.configFileThirdKindBiz.find();
			model.addAttribute("list", list);
			return "../../back/thirdKind";
		} else {
			return null;
		}
	}

	// 删除三级机构
	@RequestMapping(value = "/DelThirdKind")
	public String DelThirdKind(Model model, @RequestParam int ftk_id) {
		ConfigFileThirdKind configFileThirdKind = new ConfigFileThirdKind();
		configFileThirdKind.setFtk_id(ftk_id);
		int i = this.configFileThirdKindBiz.delByFtkId(configFileThirdKind);
		if (i > 0) {
			List<ConfigFileThirdKind> list = this.configFileThirdKindBiz.find();
			model.addAttribute("list", list);
			return "../../back/thirdKind";
		} else {
			return null;
		}
	}

	// 职位设置-----------------------------------------------------------------------------------------------------------
	// 跳转并显示所有职位
	@RequestMapping(value = "/showMajor")
	public String showMajor(Model model, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		List<ConfigFileFirstKind> list = this.ConfigMajorBiz.find();
		model.addAttribute("list", list);
		return "../../back/major";
	}

	// 跳转职位添加页面
	@RequestMapping(value = "/toMajorRegister")
	public String toMajorRegister(Model model) throws Exception {
		List<ConfigMajor> list = this.ConfigMajorBiz.find();
		model.addAttribute("list", list);
		model.addAttribute("configMajor", new ConfigMajor());
		return "../../back/majorRegister";
	}

	// 添加职位
	@RequestMapping(value = "/addMajor")
	public String addMajor(Model model, @ModelAttribute ConfigMajor configMajor, HttpServletRequest request) {
		String majorKindIdAndName = configMajor.getMajor_kind_id();
		String[] arr = majorKindIdAndName.split("/");
		configMajor.setMajor_kind_id(arr[0]);
		configMajor.setMajor_kind_name(arr[1]);
		ConfigMajor cm = this.ConfigMajorBiz.findMaxMajorId(configMajor);
		configMajor.setMajor_id(String.valueOf(Integer.parseInt(cm.getMajor_id()) + 1));
		int i = this.ConfigMajorBiz.add(configMajor);
		if (i > 0) {
			List<ConfigFileFirstKind> list = this.ConfigMajorBiz.find();
			model.addAttribute("list", list);
			return "../../back/major";
		} else {
			return null;
		}
	}

	// 删除职位
	@RequestMapping(value = "/delMajor")
	public String delMajor(Model model, @RequestParam int mak_id) {
		ConfigMajor configMajor = new ConfigMajor();
		configMajor.setMak_id(mak_id);
		int i = this.ConfigMajorBiz.del(configMajor);
		if (i > 0) {
			List<ConfigFileFirstKind> list = this.ConfigMajorBiz.find();
			model.addAttribute("list", list);
			return "../../back/major";
		} else {
			return null;
		}
	}

	// 职位分类设置---------------------------------------------------------------------------------------------------------
	// 跳转并显示所有职位分类
	@RequestMapping(value = "/showMajorKind")
	public String showMajorKind(Model model, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		List<ConfigFileFirstKind> list = this.configMajorKindBiz.find();
		model.addAttribute("list", list);
		return "../../back/majorKind";
	}

	// 跳转到职位分类添加页面
	@RequestMapping(value = "/toMajorKindRegister")
	public String toMajorKindRegister(Model model) throws Exception {
		ConfigMajorKind configMajorKind = this.configMajorKindBiz.findMaxKindId();
		String id = String.valueOf(Integer.parseInt(configMajorKind.getMajor_kind_id()) + 1);
		model.addAttribute("majorKindId", id);
		model.addAttribute("configMajorKind", new ConfigMajorKind());
		return "../../back/majorKindRegister";
	}

	// 添加职位分类
	@RequestMapping(value = "/addMajorKind")
	public String addMajorKind(Model model, @ModelAttribute ConfigMajorKind configMajorKind,
			HttpServletRequest request) {
		List<ConfigMajorKind> list = this.configMajorKindBiz.find();
		for (int i = 0; i > list.size(); i++) {
			if (list.get(i).getMajor_kind_name().equals(configMajorKind.getMajor_kind_name())) {
				model.addAttribute("majorKindName", configMajorKind.getMajor_kind_name());
				return "../../back/majorKindRegisterFailure";
			}
		}
		int i = this.configMajorKindBiz.add(configMajorKind);
		if (i > 0) {
			return "../../back/majorKindRegisterSuccess";
		} else {
			return null;
		}
	}

	// 跳转到一级机构删除页面
	@RequestMapping(value = "/showMajorDelete")
	public String showMajorDelete(Model model, @RequestParam int mfk_id) {
		ConfigMajorKind configMajorKind = new ConfigMajorKind();
		configMajorKind.setMfk_id(mfk_id);
		configMajorKind = this.configMajorKindBiz.findByMfkId(configMajorKind);
		model.addAttribute("configMajorKind", configMajorKind);
		return "../../back/majorKindDelete";
	}

	// 删除职位分类
	@RequestMapping(value = "/delMajorKind")
	public @ResponseBody String delMajorKind(Model model, @RequestParam int mfk_id) {
		ConfigMajorKind configMajorKind = new ConfigMajorKind();
		configMajorKind.setMfk_id(mfk_id);
		int i = this.configMajorKindBiz.del(configMajorKind);
		if (i > 0) {
			return "back/majorKindDeleteSuccess.jsp";
		} else {
			return "back/majorKindDeleteFailure.jsp";
		}
	}

	// 公共字段------------------------------------------------------------------------------------------------------------
	// 跳转并显示所有公共字段
	@RequestMapping(value = "/showPublicChar")
	public String showPublicChar(Model model, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		List<ConfigFileFirstKind> list = this.configPublicCharBiz.find();
		model.addAttribute("list", list);
		return "../../back/publicChar";
	}

	// 跳转到添加公共字段页面
	@RequestMapping(value = "/showPublicCharRegester")
	public String showPublicCharAdd(Model model, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		model.addAttribute("configPublicChar", new ConfigPublicChar());
		return "../../back/publicCharRegister";
	}

	// 添加公共字段
	@RequestMapping(value = "/addConfigPublicChar")
	public String addConfigPublicChar(Model model, @ModelAttribute ConfigPublicChar configPublicChar,
			HttpServletRequest request) {
		int i = this.configPublicCharBiz.addConfigPublicChar(configPublicChar);
		if (i > 0) {
			List<ConfigFileFirstKind> list = this.configPublicCharBiz.find();
			model.addAttribute("list", list);
			return "../../back/publicChar";
		} else {
			return null;
		}
	}

	// 删除公共字段
	@RequestMapping(value = "/delPublicChar")
	public String delPublicChar(Model model, @RequestParam int pbc_id) {
		ConfigPublicChar configPublicChar = new ConfigPublicChar();
		configPublicChar.setPbc_id(pbc_id);
		int i = this.configPublicCharBiz.delSalaryProjectById(configPublicChar);
		if (i > 0) {
			List<ConfigFileFirstKind> list = this.configPublicCharBiz.find();
			model.addAttribute("list", list);
			return "../../back/publicChar";
		} else {
			return null;
		}
	}

	// 职称设置----------------------------------------------------------------------------------------------------------
	// 跳转并显示所有职称
	@RequestMapping(value = "/showProfession")
	public String showProfession(Model model, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		List<ConfigPublicChar> list = this.configPublicCharBiz.findAllProfession();
		model.addAttribute("list", list);
		return "../../back/profession";
	}

	// 跳转到添加职称页面
	@RequestMapping(value = "/showProfessionRegester")
	public String showProfessionRegester(Model model, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		model.addAttribute("configPublicChar", new ConfigPublicChar());
		return "../../back/professionRegister";
	}

	// 添加职称
	@RequestMapping(value = "/addProfession")
	public String addProfession(Model model, @ModelAttribute ConfigPublicChar configPublicChar,
			HttpServletRequest request) {
		int i = this.configPublicCharBiz.addConfigPublicChar(configPublicChar);
		if (i > 0) {
			List<ConfigPublicChar> list = this.configPublicCharBiz.findAllProfession();
			model.addAttribute("list", list);
			return "../../back/profession";
		} else {
			return null;
		}
	}

	// 删除公共字段
	@RequestMapping(value = "/delProfession")
	public String delProfession(Model model, @RequestParam int pbc_id) {
		ConfigPublicChar configPublicChar = new ConfigPublicChar();
		configPublicChar.setPbc_id(pbc_id);
		int i = this.configPublicCharBiz.delSalaryProjectById(configPublicChar);
		if (i > 0) {
			List<ConfigPublicChar> list = this.configPublicCharBiz.findAllProfession();
			model.addAttribute("list", list);
			return "../../back/profession";
		} else {
			return null;
		}
	}
}