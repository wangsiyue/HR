package testMysql;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.yc.bean.ConfigFileThirdKind;
import com.yc.bean.ConfigPublicChar;
import com.yc.bean.SalaryStandard;
import com.yc.bean.SalaryStandardDetails;
import com.yc.biz.ConfigFileThirdKindBiz;
import com.yc.biz.ConfigPublicCharBiz;
import com.yc.biz.SalaryStandardBiz;

public class ConfigTest {
	@Test
	public void Test(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		ConfigFileThirdKindBiz hf=(ConfigFileThirdKindBiz) ac.getBean("configFileThirdKindBizImpl");
		ConfigFileThirdKind configFileThirdKind=new ConfigFileThirdKind();
		configFileThirdKind.setFtk_id(2);
		int i=hf.changeConfigFileThirdkind(hf.findByFtkId(configFileThirdKind));
		System.out.println(i);
	}
}