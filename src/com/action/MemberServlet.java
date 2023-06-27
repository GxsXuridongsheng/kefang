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
		if(method.equals("mreg")){ //�û�ע��
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
					request.setAttribute("message", "ע��ɹ����¼��");
					request.getRequestDispatcher("login.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("reg.jsp").forward(request, response); 
				}
			}
			else{
				request.setAttribute("message", "���û����Ѵ��ڣ�");
				request.getRequestDispatcher("reg.jsp").forward(request, response); 
			} 
		}
		else if(method.equals("mupreg")){ //�û��޸�ע������
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
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("member/info/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("member/info/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("mlogin")){//��Ա��¼
			String username = request.getParameter("username"); 
			String password = request.getParameter("password"); 
			String str=cBean.getString("select cid from client where username='"+username+"' and  password='"+password+"' ");
			if(str==null){
				request.setAttribute("message", "��¼��Ϣ����");
				request.getRequestDispatcher("login.jsp").forward(request, response); 
			}
			else{
				session.setAttribute("member", username);
				request.getRequestDispatcher("member/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("lost")){ //��ʧ����
			request.setAttribute("message", "�������Ѿ�����ע�����䣡");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else if(method.equals("memberexit")){ //�˳���¼
			session.removeAttribute("member");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else if(method.equals("muppwd")){//��Ա�޸�����
			String member=(String)session.getAttribute("member"); 
			String oldpwd = request.getParameter("oldpwd"); 
			String newpwd = request.getParameter("newpwd"); 
			String str=cBean.getString("select cid from client where username='"+member+"' and  password='"+oldpwd+"'");
			if(str==null){
				request.setAttribute("message", "ԭʼ������Ϣ����");
				request.getRequestDispatcher("member/info/editpwd.jsp").forward(request, response); 
			}
			else{
				int flag=cBean.comUp("update client set password='"+newpwd+"' where username='"+member+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("member/info/editpwd.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("member/info/editpwd.jsp").forward(request, response); 
				}
			}
		}
		/////////////////////////////����Ա����
		else if(method.equals("delm")){//ɾ����Ա
			String cid = request.getParameter("cid");
			int flag=cBean.comUp("delete from client where cid='"+cid+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("ifusem")){//ͣ��/���� ��Ա
			String id = request.getParameter("id");  
			String sql="";
			String str=cBean.getString("select ifuse from client where id='"+id+"'");
			if(str.equals("����")){
				sql="update client set ifuse='ͣ��' where id='"+id+"'";
			}
			else{
				sql="update client set ifuse='����' where id='"+id+"'";
			}
			int flag=cBean.comUp(sql);
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
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
