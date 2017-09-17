package com.yc.web.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.biz.EngageExamBiz;
import com.yc.biz.EngageResumeBiz;
import com.yc.biz.EngageSubjectsBiz;

@Controller
public class ExamController {
	private EngageResumeBiz engageResumeBiz;
	private EngageExamBiz engageExamBiz;
	@Resource(name = "engageExamBizImpl")
	public void setengageExamBiz(EngageExamBiz engageExamBiz) {
		this.engageExamBiz=engageExamBiz;
	}
	@Resource(name = "engageResumeBizImpl")
	public void setengageResumeBiz(EngageResumeBiz engageResumeBiz) {
		this.engageResumeBiz=engageResumeBiz;
	}
	@RequestMapping(value = "/toEngageExam.action")
	public String toupdateEngageMajorRelease(){
		return "../../back/ExamOnline";
	}
	@RequestMapping(value = "/findMessage.action")
	public String findMessage(){
		
		return "../../back/ExamOnline";
	}
	
	
}
