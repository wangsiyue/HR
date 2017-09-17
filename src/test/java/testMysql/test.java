package testMysql;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.yc.bean.ConfigFileFirstKind;
import com.yc.bean.ConfigFileThirdKind;
import com.yc.bean.ConfigMajor;
import com.yc.bean.ConfigMajorKind;
import com.yc.bean.ConfigPublicChar;
import com.yc.bean.HumanFile;
import com.yc.bean.Users;
import com.yc.biz.ConfigFileFirstKindBiz;
import com.yc.biz.ConfigFileSecondKindBiz;
import com.yc.biz.ConfigFileThirdKindBiz;
import com.yc.biz.ConfigMajorBiz;
import com.yc.biz.ConfigMajorKindBiz;
import com.yc.biz.ConfigPublicCharBiz;
import com.yc.biz.HumanFileBiz;
import com.yc.biz.UsersBiz;

public class test {
	

	@Test
	public void test2() throws SQLException{
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		DataSource ds=(DataSource) ac.getBean("dataSource");
		Connection con =ds.getConnection();
		System.out.println( con );   
	}
	
	@Test
	public void UsersInserttest(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		UsersBiz ds=(UsersBiz) ac.getBean("usersBizImpl");
		Users users =new Users();
		users.setU_name("lx");
		users.setU_true_name("李鑫");
		users.setU_password("a");
		ds.add(users);
		System.out.println(users);
	}
	@Test
	public void findUserstest(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("Bean.xml");
		UsersBiz ds=(UsersBiz) ac.getBean("usersBizImpl");
		//System.out.println(ds);
		Users users =new Users();
		List<Users> list=ds.findUsers(users);
		for(Users t:list){
			System.out.println(t);
		}
	}
}