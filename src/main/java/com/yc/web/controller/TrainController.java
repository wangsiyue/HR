package com.yc.web.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.ConfigFileSecondKind;
import com.yc.bean.ConfigFileThirdKind;
import com.yc.bean.ConfigMajor;
import com.yc.bean.ConfigMajorKind;
import com.yc.bean.ConfigPublicChar;
import com.yc.bean.HumanFile;
import com.yc.bean.MajorChange;
import com.yc.bean.SalaryGrant;
import com.yc.bean.SalaryStandardDetails;
import com.yc.bean.Training;
import com.yc.bean.Users;
import com.yc.biz.ConfigFileFirstKindBiz;
import com.yc.biz.ConfigFileSecondKindBiz;
import com.yc.biz.ConfigFileThirdKindBiz;
import com.yc.biz.ConfigMajorKindBiz;
import com.yc.biz.ConfigPublicCharBiz;
import com.yc.biz.ConfigMajorBiz;
import com.yc.biz.HumanFileBiz;
import com.yc.biz.MoveMajorBiz;
import com.yc.biz.SalaryStandardDetailsBiz;
import com.yc.biz.TrainingBiz;
import com.yc.web.util.DateUtil;
import com.yc.web.util.ResponseData;

@Controller
public class TrainController {
	private static final Log logger = LogFactory.getLog(TrainController.class);
	private MoveMajorBiz movemajorBiz;
	private ConfigPublicCharBiz configPublicCharBiz;

	@Resource(name = "configPublicCharBizImpl")
	public void setConfigPublicChar(ConfigPublicCharBiz configPublicCharBiz) {
		this.configPublicCharBiz = configPublicCharBiz;
	}

	private SalaryStandardDetailsBiz salaryStandardDetailBiz;
	private HumanFileBiz humanFileBiz;

	@Resource(name = "salaryStandardDetailsBizImpl")
	public void setSalaryStandardDetailBiz(SalaryStandardDetailsBiz salaryStandardDetailBiz) {
		this.salaryStandardDetailBiz = salaryStandardDetailBiz;
	}

	private TrainingBiz trainingBiz;

	@Resource(name = "trainingBizImpl")
	public void setTrainingBiz(TrainingBiz trainingBiz) {
		this.trainingBiz = trainingBiz;
	}

	@Resource(name = "moveMajorBizImpl")
	public void setMovemajorBiz(MoveMajorBiz movemajorBiz) {
		this.movemajorBiz = movemajorBiz;
	}

	@Resource(name = "humanFileBizImpl")
	public void setHumanFileBiz(HumanFileBiz humanFileBiz) {
		this.humanFileBiz = humanFileBiz;
	}

	// ********************************调动管理*******************************

	// 查找所有status 为0的人 状态正常
	@RequestMapping(value = "/FindAllhuman.action")
	public @ResponseBody void FindAllhuman(@RequestParam int page, @RequestParam int rows, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		logger.info("FindAllhuman......................................");
		HumanFile hf = new HumanFile();
		hf.setPage(rows * (page - 1));
		hf.setRows(rows);
		PrintWriter out = response.getWriter();
		List<HumanFile> list = this.humanFileBiz.AllfindByPage(hf);
		hf.setPage(0);
		hf.setRows(3000);
		// 获取所有需要复核的档案个数
		int size = this.humanFileBiz.AllfindByPage(hf).size();
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		rd.setRows(list);
		rd.setTotal("" + size);
		out.print(gson.toJson(rd));
	}

	// 按name查
	@RequestMapping(value = "/FindAllhumanByName.action")
	public @ResponseBody void FindAllhumanByName(@RequestParam int page, @RequestParam int rows,
			@RequestParam String human_name, HttpServletResponse response, HttpServletRequest request)
					throws Exception {
		logger.info("FindAllhumanByName......................................");
		HumanFile hf = new HumanFile();
		hf.setHuman_name(human_name);
		hf.setPage(rows * (page - 1));
		hf.setRows(rows);
		PrintWriter out = response.getWriter();
		List<HumanFile> list = this.humanFileBiz.findByName(hf);
		hf.setPage(0);
		hf.setRows(3000);
		// 获取所有需要复核的档案个数
		int size = this.humanFileBiz.findByName(hf).size();
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		rd.setRows(list);
		rd.setTotal("" + size);
		out.print(gson.toJson(rd));
	}

	// 按性别查
	@RequestMapping(value = "/FindAllhumanBysex.action")
	public @ResponseBody void FindAllhumanBysex(@RequestParam int page, @RequestParam int rows,
			@RequestParam String human_sex, HttpServletResponse response, HttpServletRequest request) throws Exception {
		logger.info("FindAllhumanBysex....................................");
		HumanFile hf = new HumanFile();
		hf.setHuman_sex(human_sex);
		hf.setPage(rows * (page - 1));
		hf.setRows(rows);
		PrintWriter out = response.getWriter();
		List<HumanFile> list = this.humanFileBiz.findBysex(hf);
		hf.setPage(0);
		hf.setRows(3000);
		// 获取所有需要复核的档案个数
		int size = this.humanFileBiz.findBysex(hf).size();
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		rd.setRows(list);
		rd.setTotal("" + size);
		out.print(gson.toJson(rd));
	}

	// 薪酬标准Humanlist
	@RequestMapping(value = "/findSalary")
	public @ResponseBody void findSalary(HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		logger.info("findSalary....................................");
		SalaryGrant sg = new SalaryGrant();
		List<SalaryStandardDetails> list = this.salaryStandardDetailBiz.findAll();
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		out.print(gson.toJson(list));
	}

	// 按照 huf_id 查找一个人 的信息
	@RequestMapping(value = "/RemoveFindOne/{huf_id}")
	public String MoveHuman2(HttpSession session,Model model, @PathVariable String huf_id) throws Exception {
		logger.info("RemoveFindOne....................................");
		HumanFile hf = new HumanFile();

		List<HumanFile> humanFile = humanFileBiz.selectOne(Integer.parseInt(huf_id));
		model.addAttribute("humanFile", humanFile.get(0));
		Users u=(Users) session.getAttribute("user");
		String name=u.getU_true_name();
		model.addAttribute("name", name);
		model.addAttribute("date", DateUtil.formatTime(new Date()));
		return "../../back/Remove";
	}

	// 添加一个人的信息到调动表
	@RequestMapping(value = "/addOneMajorChange")
	public String add1(MajorChange mc) throws Exception {
		logger.info("addOneMajorChange..........................");
		HumanFile hf = new HumanFile();
		hf.setHuman_id(mc.getHuman_id());
		List<HumanFile> list = this.humanFileBiz.select1(mc.getHuman_id());
		mc.setFirst_kind_id(list.get(0).getFirst_kind_id());
		mc.setSecond_kind_id(list.get(0).getSecond_kind_id());
		mc.setThird_kind_id(list.get(0).getThird_kind_id());
		mc.setMajor_kind_id(list.get(0).getHuman_major_kind_id());
		mc.setMajor_id(list.get(0).getHuman_major_id());
		this.movemajorBiz.add(mc);
		this.humanFileBiz.updatestatus0(hf);
		return "../../back/Allhuman";
	}

	// 复核 查找所有登记调动的人
	@RequestMapping(value = "/findAllMc.action")
	public @ResponseBody void findAllMc(@RequestParam int page, @RequestParam int rows, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		logger.info("findAllMc..................................................");
		MajorChange mc = new MajorChange();
		mc.setPage(rows * (page - 1));
		mc.setRows(rows);
		List<MajorChange> list1 = movemajorBiz.FindAllBypage(mc);
		PrintWriter out = response.getWriter();
		mc.setPage(0);
		mc.setRows(3000);
		// 获取所有需要复核的档案个数
		int size = this.movemajorBiz.FindAllBypage(mc).size();
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		rd.setRows(list1);
		rd.setTotal("" + size);
		out.print(gson.toJson(rd));
	}

	// 复核
	@RequestMapping(value = "/ReCheckMove/{mch_id}")
	public String Recheckmove(Model model, @PathVariable String mch_id) throws Exception {
		logger.info("ReCheckMove..............................................");
		MajorChange hf = new MajorChange();
		hf.setMch_id(Integer.parseInt(mch_id));

		MajorChange list1 = movemajorBiz.FindOne(Integer.parseInt(mch_id));
		model.addAttribute("list1", list1);
		return "../../back/RemoveCheck";
	}

	// 复核 success
	@RequestMapping(value = "/Mobilize1.action")
	public String Mobilize(HumanFile humanfile, MajorChange mc) throws Exception {
		logger.info("Mobilize1.........................");

		this.movemajorBiz.UpAdd(mc);
		this.humanFileBiz.updatestatus1(humanfile);
		this.movemajorBiz.UpCheck_status1(mc);
		return "../../back/AllMajorchange";
	}

	// *********************************培训*************************************************

	@RequestMapping(value = "/Humanlist")
	public @ResponseBody void Humanlist(@RequestParam int page, @RequestParam int rows, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		logger.info("Humanlist..............................................");
		HumanFile hf = new HumanFile();
		hf.setPage(rows * (page - 1));
		hf.setRows(rows);
		PrintWriter out = response.getWriter();
		List<HumanFile> list = this.humanFileBiz.AllfindByPage(hf);
		hf.setPage(0);
		hf.setRows(3000);
		// 获取所有需要复核的档案个数
		int size = this.humanFileBiz.AllfindByPage(hf).size();
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		rd.setRows(list);
		rd.setTotal("" + size);
		out.print(gson.toJson(rd));
	}

	// 所you培训项目
	@RequestMapping(value = "/findTrainItem")
	public @ResponseBody void findTrainItem(HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		List<ConfigPublicChar> list = this.configPublicCharBiz.findAllByattribute_kind();
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		out.print(gson.toJson(list));
	}

	// 所you等级
	@RequestMapping(value = "/findTraindegree")
	public @ResponseBody void findTraindegree(HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		List<ConfigPublicChar> list = this.configPublicCharBiz.findAllGrade();
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		out.print(gson.toJson(list));
	}

	// 登记所有培训的人
	@RequestMapping(value = "/TrainRegister/{huf_id}")
	public String TrainRegister(HttpSession session,HumanFile humanfile, Model model, @PathVariable String huf_id) throws Exception {
		logger.info("TrainRegister...............................");
		List<HumanFile> humanFile = humanFileBiz.selectOne(Integer.parseInt(huf_id));
		model.addAttribute("humanFile", humanFile.get(0));
		model.addAttribute("humanFile", humanFile.get(0));
		Users u=(Users) session.getAttribute("user");
		String name=u.getU_true_name();
		model.addAttribute("name", name);
		model.addAttribute("date", DateUtil.formatTime(new Date()));
		return "../../back/TrainRegister";
	}

	@RequestMapping(value = "/sureRegister")
	public String sureRegister(Training training) throws Exception {
		logger.info("sureRegister...................................");
		HumanFile f = new HumanFile();
		f.setHuman_id(training.getHuman_id());
		this.trainingBiz.add(training);
		//this.humanFileBiz.updatestatus0(f);
		return "../../back/TrainManList";
	}

	// 复核培训的所有人
	@RequestMapping(value = "/TrainingList")
	public @ResponseBody void TrainingList(@RequestParam int page, @RequestParam int rows, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		logger.info("TrainingList..");
		Training t = new Training();
		t.setPage(rows * (page - 1));
		t.setRows(rows);
		PrintWriter out = response.getWriter();
		List<Training> list = this.trainingBiz.findByPage(t);
		t.setPage(0);
		t.setRows(3000);
		// 获取所有需要复核的档案个数
		int size = this.trainingBiz.findByPage(t).size();
		// 将list转为json格式
		Gson gson = new Gson();
		ResponseData rd = new ResponseData();
		rd.setRows(list);
		rd.setTotal("" + size);
		out.print(gson.toJson(rd));
	}

	@RequestMapping(value = "/ReTraining/{human_id}")
	public String ReTraining(HttpSession session,Training training, Model model, @PathVariable String human_id) throws Exception {
		logger.info("ReTraining..........................................");
		training.setHuman_id(human_id);
		List<Training> list1 = this.trainingBiz.find1(training);
		model.addAttribute("list1", list1.get(0));
		Users u=(Users) session.getAttribute("user");
		String name=u.getU_true_name();
		model.addAttribute("name", name);
		model.addAttribute("date", DateUtil.formatTime(new Date()));
		return "../../back/CheckTrain";
	}

	@RequestMapping(value = "/checkTraningOK/{human_id}")
	public String checkTraningOK(Training training, Model model, @PathVariable String human_id) throws Exception {
		logger.info("checkTraningOK.........................................");
		HumanFile f = new HumanFile();
		training.setHuman_id(human_id);
		this.trainingBiz.update(training);
		f.setHuman_id(training.getHuman_id());
		//this.humanFileBiz.updatestatus1(f);
		return "../../back/checkTraningOK";
	}

	//页面跳转
	@RequestMapping(value = "/showTrainManList")
	public String showTrainManList() {
		return "../../back/TrainManList";
	}
	@RequestMapping(value = "/showCheckTrainingList")
	public String showCheckTrainingList() {
		return "../../back/CheckTrainingList";
	}
	@RequestMapping(value = "/showAllhuman")
	public String showAllhuman() {
		return "../../back/Allhuman";
	}
	@RequestMapping(value = "/showAllMajorchange")
	public String showAllMajorchange() {
		return "../../back/AllMajorchange";
	}
}