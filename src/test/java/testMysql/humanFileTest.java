package testMysql;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.ConfigFileSecondKind;
import com.yc.bean.ConfigFileThirdKind;
import com.yc.bean.ConfigMajor;
import com.yc.bean.ConfigMajorKind;
import com.yc.bean.ConfigPublicChar;
import com.yc.bean.HumanFile;
import com.yc.biz.ConfigFileFirstKindBiz;
import com.yc.biz.ConfigFileSecondKindBiz;
import com.yc.biz.ConfigFileThirdKindBiz;
import com.yc.biz.ConfigMajorBiz;
import com.yc.biz.ConfigMajorKindBiz;
import com.yc.biz.ConfigPublicCharBiz;
import com.yc.biz.HumanFileBiz;
import com.yc.biz.UsersBiz;

public class humanFileTest {
	@Test
	public void testFindHumanFile() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		HumanFileBiz hf=(HumanFileBiz) ac.getBean("humanFileBizImpl");
		HumanFile humanFile=new HumanFile();
		humanFile.setThird_kind_name("外包组");
		List<HumanFile> list=hf.findById(humanFile);
		System.out.println(list.get(0));
	}
	
	@Test
	public void testUpdateHumanFile() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		HumanFileBiz hf=(HumanFileBiz) ac.getBean("humanFileBizImpl");
		HumanFile humanFile=new HumanFile();
	}
	
	@Test
	public void testFindCFFK() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		ConfigFileFirstKindBiz hf=(ConfigFileFirstKindBiz) ac.getBean("configFileFirstKindBizImpl");
		List<ConfigFileFirstKind> list=hf.find();
		System.out.println(list.size());
	}
	
	@Test
	public void testFindCFSK() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		ConfigFileSecondKindBiz hf=(ConfigFileSecondKindBiz) ac.getBean("configFileSecondKindBizImpl");
		List<ConfigFileFirstKind> list=hf.find();
		System.out.println(list.size());
	}
	
	@Test
	public void testFindCFTK() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		ConfigFileThirdKindBiz hf=(ConfigFileThirdKindBiz) ac.getBean("configFileThirdKindBizImpl");
		List<ConfigFileThirdKind> list=hf.find();
		System.out.println(list.size());
	}
	
	@Test
	public void testFindMajorKind() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		ConfigMajorKindBiz hf=(ConfigMajorKindBiz) ac.getBean("configMajorKindBizImpl");
		List<ConfigMajorKind> list=hf.find();
		System.out.println(list.size());
	}
	
	@Test
	public void testFindMajor() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		ConfigMajorBiz hf=(ConfigMajorBiz) ac.getBean("configMajorBizImpl");
		List<ConfigMajor> list=hf.find();
		System.out.println(list.size());
	}
	
	@Test
	public void testFindPublicChar() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		ConfigPublicCharBiz hf=(ConfigPublicCharBiz) ac.getBean("configPublicCharBizImpl");
		List<ConfigPublicChar> list=hf.find();
		System.out.println(list.size());
	}
	
	@Test
	public void testFindFuhe() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		HumanFileBiz hf=(HumanFileBiz) ac.getBean("humanFileBizImpl");
		List<HumanFile> list=hf.findCheckFile();
		System.out.println(list.size());
	}
	
	@Test
	public void testFindByPage() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		HumanFileBiz hf=(HumanFileBiz) ac.getBean("humanFileBizImpl");
		List<HumanFile> list=hf.findByPage(new HumanFile(), 1, 1);
		System.out.println(list.size());
	}
	
	@Test
	public void testFindByHuman_id() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		HumanFileBiz hf=(HumanFileBiz) ac.getBean("humanFileBizImpl");
		HumanFile humanFile=new HumanFile();
		humanFile.setHuman_id("bt0101010002");
		System.out.println(hf.findById(humanFile).get(0).getHuman_birthday());
	}
	
	//测试机构级联
	@Test
	public void testFindBy() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		ConfigFileSecondKindBiz hf=(ConfigFileSecondKindBiz) ac.getBean("configFileSecondKindBizImpl");
		ConfigFileSecondKind f=new ConfigFileSecondKind();
		f.setFirst_kind_id("01");
		List<ConfigFileFirstKind> list=hf.findByFirstKind(f);
		System.out.println(list.size());
	}
	@Test
	public void testFindBy2() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		ConfigFileThirdKindBiz hf=(ConfigFileThirdKindBiz) ac.getBean("configFileThirdKindBizImpl");
		ConfigFileThirdKind f=new ConfigFileThirdKind();
		f.setSecond_kind_id("01");
		List<ConfigFileThirdKind> list=hf.findBySecondKind(f);
		System.out.println(list.size());
	}
	
	@Test
	public void testFindBy3() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		ConfigMajorBiz hf=(ConfigMajorBiz) ac.getBean("configMajorBizImpl");
		ConfigMajor f=new ConfigMajor();
		f.setMajor_kind_id("01");
		List<ConfigMajor> list=hf.findByMajorKindID(f);
		System.out.println(list.size());
	}
	
	@Test
	public void testFindByConditionAndPage() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		HumanFileBiz hf=(HumanFileBiz) ac.getBean("humanFileBizImpl");
		HumanFile humanFile=new HumanFile();
		humanFile.setFirst_kind_id("01");
		List<HumanFile> list=hf.findAllMatchConditionFile(humanFile);
		System.out.println(list.size());
	}
	
	@Test
	public void testFindPublicChar2() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		ConfigPublicCharBiz hf=(ConfigPublicCharBiz) ac.getBean("configPublicCharBizImpl");
		List<ConfigPublicChar> list=hf.findAllProfession();
		System.out.println(list);
	}
	
	
	@Test
	public void test() throws Exception{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		HumanFileBiz hf=(HumanFileBiz) ac.getBean("humanFileBizImpl");
		List<HumanFile> list=hf.findSalaryGrantBySecondKind();
		System.out.println(list.size());
	}
}