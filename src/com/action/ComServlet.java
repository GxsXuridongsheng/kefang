package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class ComServlet extends HttpServlet {

	public ComServlet() {
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
		System.out.println("Here!!"+method);
		 if(method.equals("delpro")){// ɾ������
			String rid = request.getParameter("rid");  
			int flag=cBean.comUp("delete from room where rid='"+rid+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/pro/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/pro/index.jsp").forward(request, response); 
			}
		}
		 else if(method.equals("zc")){//Ԥ��
			 String pid=request.getParameter("pid");
			 String member=(String)session.getAttribute("member");
			 if(member==null){
				 request.setAttribute("message", "���ȵ�¼��");
					request.getRequestDispatcher("login.jsp").forward(request, response); 
			 }
			 else{
				 request.setAttribute("pid", pid);
					request.getRequestDispatcher("zc.jsp").forward(request, response); 
			 }
		 }
		 else if(method.equals("zc2")){//Ԥ������
			 String pid = request.getParameter("pid");  
			 String member=(String)session.getAttribute("member");
			 String xm=request.getParameter("xm");
			 String type=request.getParameter("type");
			 String zsj=request.getParameter("zsj");
			 String rzsj=request.getParameter("rzsj");
			 String tfsj=request.getParameter("tfsj");
			 int flag=cBean.comUp("insert into zc(pid,xm,type,zsj,rzsj,tfsj,member,sj) values('"+pid+"','"+xm+"','"+type+"','"+zsj+"','"+rzsj+"','"+tfsj+"','"+member+"','"+date2+"')");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("pro.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("pro.jsp").forward(request, response); 
				}
		 }
		 else if(method.equals("upzc2")){//�޸�Ԥ��
			 String rid = request.getParameter("rid");   
			 String zsj=request.getParameter("zsj");
			 String tel=request.getParameter("tel");
			 int flag=cBean.comUp("update zc set zsj='"+zsj+"',tel='"+tel+"' where rid='"+rid+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("member/zc/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("member/zc/index.jsp").forward(request, response); 
				}
		 }
		 else if(method.equals("delzc")){//ɾ��Ԥ��
			 String oid = request.getParameter("id");
			 int flag=cBean.comUp("delete from orders where oid='"+oid+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("member/zc/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("member/zc/index.jsp").forward(request, response); 
				}
		 }
		 else if(method.equals("delzc2")){//����ԱɾԤ��
			 String oid = request.getParameter("id");
			 int flag=cBean.comUp("delete from orders where oid='"+oid+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/zc/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/zc/index.jsp").forward(request, response); 
				}
		 }
		 
		 
		 /////////////////////////////////////////////////////////////////////////////////////////
		 else if(method.equals("addrz")){// 
			 //String xm="";String sfz=""; String fj="";String ts="";String yj="";String rzsj="";
				String xm = request.getParameter("xm");
			 String cid = cBean.getString("select cid from client where realname='"+xm+"'");
			 String sfz = request.getParameter("sfz");
				String fj = request.getParameter("fj"); 
				String ts = request.getParameter("ts"); 
//				String yj = request.getParameter("yj");
				String rzsj = request.getParameter("rzsj"); 
				String fjjg = request.getParameter("fjjg"); 
				
//				String projg=cBean.getString("select price from room where rid='"+fj+"'");


			 SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 Date cur = new Date(System.currentTimeMillis());
			 String curtime = formatter.format(cur);
			 int flag=cBean.comUp("insert into orders(o_cid,o_rid,o_price,order_time,in_time, days,status) values('"+cid+"','"+fj+"','"+fjjg+"','"+curtime+"','"+rzsj+"','"+ts+"','δ��ס')");
				if(flag == Constant.SUCCESS){ 
//					cBean.comUp("update room set status='��ס��' where rid='"+fj+"'");
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response); 
				}
			} 
			 else if(method.equals("uprz")){	//��ס
				 SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				 Date curtime = new Date(System.currentTimeMillis());
				 String oid = request.getParameter("id");
				 String rzsj = formatter.format(curtime);
				 
				 String fj=cBean.getString("select rid from orders where oid='"+oid+"' and status = 'δ��ס'");
				 int flag=cBean.comUp("update orders set in_time='"+rzsj+"', status = '����ס'  where oid='"+oid+"' and status = 'δ��ס'");
					if(flag == Constant.SUCCESS){ 
						cBean.comUp("update room set status='����' where rid='"+fj+"'");
						request.setAttribute("message", "�����ɹ���");
						request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response); 
					}
			 }
		 else if(method.equals("uptf")){	//�˷�
			 SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 Date curtime = new Date(System.currentTimeMillis());
			 String oid = request.getParameter("id");
			 String tfsj = formatter.format(curtime);

			 String fj=cBean.getString("select rid from orders where oid='"+oid+"' and status = '����ס'");
			 int flag=cBean.comUp("update orders set out_time='"+tfsj+"', status = '���˷�'  where oid='"+oid+"' and status = '����ס'");
			 if(flag == Constant.SUCCESS){
				 cBean.comUp("update room set status='����' where rid='"+fj+"'");
				 request.setAttribute("message", "�����ɹ���");
				 request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response);
			 }
			 else {
				 request.setAttribute("message", "����ʧ�ܣ�");
				 request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response);
			 }
		 }
			 else if(method.equals("delrz")){
				 String oid = request.getParameter("id");
				 String fj=cBean.getString("select rid from orders where oid='"+oid+"'");
				 int flag=cBean.comUp("delete from orders where oid='"+oid+"'");
					if(flag == Constant.SUCCESS){ 
						cBean.comUp("update room set status='����' where rid='"+fj+"'");
						request.setAttribute("message", "�����ɹ���");
						request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response); 
					}
			 }
			 else if(method.equals("addlx")){//���ӷ���
				 String mc = request.getParameter("mc");   
				 int flag=cBean.comUp("insert into lx(mc) values('"+mc+"')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "�����ɹ���");
						request.getRequestDispatcher("admin/pro/lx.jsp").forward(request, response);
					}
					else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("admin/pro/lx.jsp").forward(request, response); 
					}
			 }
			 else if(method.equals("dellx")){//ɾ������
				 String rid = request.getParameter("rid");   
				 int flag=cBean.comUp("delete from type where rid='"+rid+"'");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "�����ɹ���");
						request.getRequestDispatcher("admin/pro/lx.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("admin/pro/lx.jsp").forward(request, response); 
					}
			 }
		 
		 
		 
			 else if(method.equals("addgg")){//������Ѷ
				 String rid = request.getParameter("rid");   
				 String detail = request.getParameter("content1");   
				 int flag=cBean.comUp("insert into gg(rid,detail,sj) values('"+rid+"','"+detail+"','"+date2+"')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "�����ɹ���");
						request.getRequestDispatcher("admin/gg/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("admin/gg/index.jsp").forward(request, response); 
					}
			 }
			 else if(method.equals("delgg")){//ɾ����Ѷ
				 String rid = request.getParameter("rid");   
				 int flag=cBean.comUp("delete from gg where rid='"+rid+"'");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "�����ɹ���");
						request.getRequestDispatcher("admin/gg/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("admin/gg/index.jsp").forward(request, response); 
					}
			 }
			 else if(method.equals("upgg")){//�޸���Ѷ
				 String rid = request.getParameter("rid");   
//				 String rid = request.getParameter("rid");
				 String detail = request.getParameter("content1");   
				 int flag=cBean.comUp("update gg set rid='"+rid+"',detail='"+detail+"' where rid='"+rid+"'");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "�����ɹ���");
						request.getRequestDispatcher("admin/gg/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("admin/gg/index.jsp").forward(request, response); 
					}
			 }
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
