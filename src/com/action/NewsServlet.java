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

public class NewsServlet extends HttpServlet {

	public NewsServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		 if(method.equals("pl")){//评论
			String nid = request.getParameter("nid");  
			String content = request.getParameter("content");  
			String member = request.getParameter("member");  
			if(member!=null){
				int flag=cBean.comUp("insert into pl(nid,content,member,addtime) " +
						"values('"+nid+"','"+content+"','"+member+"','"+date+"')");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("nid", nid);
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("proinfo.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("nid", nid);
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("proinfo.jsp").forward(request, response); 
				}
			}
			else{
				request.setAttribute("nid", nid);
				request.setAttribute("message", "请先登录！");
				request.getRequestDispatcher("proinfo.jsp").forward(request, response); 
			}
			
		}
		else if(method.equals("delpl")){//删除评论
			String id = request.getParameter("id");  
			int flag=cBean.comUp("delete from pl where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/pro/pl.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/pro/pl.jsp").forward(request, response); 
			}
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
