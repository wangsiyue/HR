package com.yc.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.bean.Users;
import com.yc.biz.UsersBiz;
@Controller
public class UserController{
	private UsersBiz userBiz;
	@Resource(name = "usersBizImpl")
	public void setUser(UsersBiz userBiz) {
		this.userBiz = userBiz;
	}
	@RequestMapping(value = "/adminLogin")
	public @ResponseBody void adminLogin(@RequestParam(required = false) String user_name,
			@RequestParam(required = false) String user_password,HttpSession session,
			HttpServletResponse response) throws IOException {
		System.out.println("login");
		Users user =new Users();
		user.setU_name(user_name);
		user.setU_password(user_password);
		List<Users> users =userBiz.login(user);
		PrintWriter out =response.getWriter();
		if(users.size()>0){
			session.setAttribute("user",users.get(0));
			out.print(1);//修改成功
		}else{
			out.print(0);//修改失败
		}
	}
	
	@RequestMapping(value = "/changePassword.action")
	public @ResponseBody void changePassword(HttpServletResponse response,@RequestParam(required = false) String user_name,
			@RequestParam(required = false) String u_true_name,
			@RequestParam(required = false) String user_password,
			@RequestParam(required = false) String user_password1
			) throws IOException{
			PrintWriter out =response.getWriter();
			String a =user_password;
			String b=user_password1;
			if(a.equals("")||b.equals("")||!a.equals(b)){
					out.print(0);//两者的值不相等，为空时，打印0
			}else{
				Users users =new Users();
				users.setU_name(user_name);
				users.setU_true_name(u_true_name);
				users.setU_password(user_password);
				int i=userBiz.update(users);
				if(i>0){
					out.print(1);//修改成功
				}else{
					out.print(0);//修改失败
				}
			}
	}
	
	//
	@RequestMapping(value = "/toUserRegister.action")
	public @ResponseBody String toUserRegister(HttpServletResponse response){
		return "back/userRegister.jsp";
	}
	
	@RequestMapping(value="/userRegister.action")
	public @ResponseBody void userRegister(@RequestParam(required = false) String user_name,
			@RequestParam(required = false) String user_password,@RequestParam(required = false) String u_true_name,
			@RequestParam(required = false) String role,HttpServletResponse response) throws IOException{
		Users user =new Users();
		user.setU_name(user_name);
		user.setU_true_name(u_true_name);
		user.setU_password(user_password);
		user.setRole(role);
		user=this.userBiz.add(user);
		PrintWriter out=response.getWriter();
		if(user!=null){
			out.print(1);//注册成功
		}else{
			out.print(0);//注册失败
		}
	}
	
	//退出系统 loginout
	@RequestMapping(value="/loginout.action")
	public @ResponseBody void loginout(HttpServletRequest request,HttpServletResponse response) throws IOException{
		System.out.println("loginout...................");
		HttpSession session = request.getSession(false);//防止创建Session  
        if(session == null){  
            response.sendRedirect("back/login.jsp");  
            return;  
        }  
        session.removeAttribute("user");  
        response.sendRedirect("back/login.jsp");  
	}
}