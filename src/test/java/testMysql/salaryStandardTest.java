package testMysql;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.yc.bean.ConfigPublicChar;
import com.yc.bean.SalaryStandard;
import com.yc.bean.SalaryStandardDetails;
import com.yc.biz.ConfigPublicCharBiz;
import com.yc.biz.SalaryStandardBiz;

public class salaryStandardTest {
	@Test
	public void TestaddProject(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		ConfigPublicCharBiz hf=(ConfigPublicCharBiz) ac.getBean("configPublicCharBizImpl");
		ConfigPublicChar cpc=new ConfigPublicChar();
		cpc.setAttribute_name("aa");
		int i=hf.addSalaryProject(cpc);
		System.out.println(i);
	}
	
	@Test
	public void TestdelProject(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		ConfigPublicCharBiz hf=(ConfigPublicCharBiz) ac.getBean("configPublicCharBizImpl");
		ConfigPublicChar cpc=new ConfigPublicChar();
		cpc.setPbc_id(39);
		int i=hf.delSalaryProjectById(cpc);
		System.out.println(i);
	}
	
	@Test
	public void TestaddSalaryStandard(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		SalaryStandardBiz ss=(SalaryStandardBiz) ac.getBean("salaryStandardBizImpl");
		SalaryStandard salaryStandard=new SalaryStandard();
		salaryStandard.setStandard_id("1000000003");
		salaryStandard.setStandard_name("name3");
		salaryStandard.setSalary_sum(1000);
		salaryStandard.setDesigner("zhangsan");
		salaryStandard.setRegister("admin");
		List<SalaryStandardDetails> list=new ArrayList<SalaryStandardDetails>();
		SalaryStandardDetails s=new SalaryStandardDetails();
		s.setStandard_id("1000000003");
		s.setStandard_name("name3");
		s.setItem_id(36);
		s.setItem_name("基本工资");
		s.setSalary(1000);
		list.add(s);
		int i=ss.add(salaryStandard,list);
		System.out.println(i);
	}
	
	@Test
	public void TestGetSalaryId(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		SalaryStandardBiz ss=(SalaryStandardBiz) ac.getBean("salaryStandardBizImpl");
		System.out.println(ss.getStandardId());
	}
	
	@Test
	public void TestFindBy() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		SalaryStandardBiz ssb=(SalaryStandardBiz) ac.getBean("salaryStandardBizImpl");
		SalaryStandard ss=new SalaryStandard();
		ss.setStandard_id("%2%");
		ss.setKey("%S%");
		List<SalaryStandard> list=ssb.findBy(ss);
		System.out.println(list.size());
	}
	
	@Test
	public void TestFindSalaryStandardByConditionAndPage() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		SalaryStandardBiz ssb=(SalaryStandardBiz) ac.getBean("salaryStandardBizImpl");
		SalaryStandard ss=new SalaryStandard();
		ss.setStandard_id("%2%");
		ss.setKey("%name%");
		List<SalaryStandard> list=ssb.findSalaryStandardByConditionAndPage(ss,1, 3);
		System.out.println(list.size());
	}
}