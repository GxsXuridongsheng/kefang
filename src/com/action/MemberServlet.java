package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class MemberServlet extends HttpServlet {

	public MemberServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		if(method.equals("mreg")){ //用户注册
			String username = request.getParameter("username"); 
			String password = request.getParameter("password"); 
			String realname = request.getParameter("realname");
			String idcard = request.getParameter("idcard");
			String sex = request.getParameter("sex"); 
			String age = request.getParameter("age"); 
			String address = request.getParameter("address"); 
			String phone = request.getParameter("phone");
			String str=cBean.getString("select cid from client where username='"+username+"'");
			if(str==null){
				int flag=cBean.comUp("insert into client(username,password,realname,idcard,sex,age,address,phone,regtime) " +
						"values('"+username+"','"+password+"','"+realname+"','"+idcard+"','"+sex+"','"+age+"','"+address+"','"+phone+"','"+date+"')");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "注册成功请登录！");
					request.getRequestDispatcher("login.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("reg.jsp").forward(request, response); 
				}
			}
			else{
				request.setAttribute("message", "该用户名已存在！");
				request.getRequestDispatcher("reg.jsp").forward(request, response); 
			} 
		}
		else if(method.equals("mupreg")){ //用户修改注册资料
			String member=(String)session.getAttribute("member"); 
			String realname = request.getParameter("realname");
			String idcard = request.getParameter("idcard");
			String sex = request.getParameter("sex"); 
			String age = request.getParameter("age"); 
			String address = request.getParameter("address"); 
			String phone = request.getParameter("phone"); 
			int flag=cBean.comUp("update client set realname='"+realname+"',idcard='"+idcard+"',sex='"+sex+"',age='"+age+"'," +
					"address='"+address+"',phone='"+phone+"' where username='"+member+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("member/info/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("member/info/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("mlogin")){//会员登录
			String username = request.getParameter("username"); 
			String password = request.getParameter("password"); 
			String str=cBean.getString("select cid from client where username='"+username+"' and  password='"+password+"' ");
			if(str==null){
				request.setAttribute("message", "登录信息错误！");
				request.getRequestDispatcher("login.jsp").forward(request, response); 
			}
			else{
				session.setAttribute("member", username);
				request.getRequestDispatcher("member/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("lost")){ //丢失密码
			request.setAttribute("message", "新密码已经发到注册邮箱！");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else if(method.equals("memberexit")){ //退出登录
			session.removeAttribute("member");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else if(method.equals("muppwd")){//会员修改密码
			String member=(String)session.getAttribute("member"); 
			String oldpwd = request.getParameter("oldpwd"); 
			String newpwd = request.getParameter("newpwd"); 
			String str=cBean.getString("select cid from client where username='"+member+"' and  password='"+oldpwd+"'");
			if(str==null){
				request.setAttribute("message", "原始密码信息错误！");
				request.getRequestDispatcher("member/info/editpwd.jsp").forward(request, response); 
			}
			else{
				int flag=cBean.comUp("update client set password='"+newpwd+"' where username='"+member+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("member/info/editpwd.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("member/info/editpwd.jsp").forward(request, response); 
				}
			}
		}
		/////////////////////////////管理员操作
		else if(method.equals("delm")){//删除会员
			String cid = request.getParameter("cid");
			int flag=cBean.comUp("delete from client where cid='"+cid+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("ifusem")){//停用/在用 会员
			String id = request.getParameter("id");  
			String sql="";
			String str=cBean.getString("select ifuse from client where id='"+id+"'");
			if(str.equals("在用")){
				sql="update client set ifuse='停用' where id='"+id+"'";
			}
			else{
				sql="update client set ifuse='在用' where id='"+id+"'";
			}
			int flag=cBean.comUp(sql);
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			}
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
