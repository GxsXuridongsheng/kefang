package com.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.ComBean;
import com.util.Constant;
import com.util.SmartFile;
import com.util.SmartUpload;

public class UpServlet extends HttpServlet {

	private ServletConfig config;

	public UpServlet() {
		super();
	}

	final public void init(ServletConfig config) throws ServletException
    {
        this.config = config;  
    }

    final public ServletConfig getServletConfig()
    {
        return config;
    }

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	public void windowsDump(String dir, String ip, String username,String password, String databasename) throws Exception {
		File file = new File(dir);
		if (!file.exists()) {
			file.mkdir();
		}
		String sqlname = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(new Date());
		File datafile = new File(file + File.separator + sqlname + ".sql");
		if (datafile.exists()) {
			System.out.println(sqlname + "文件名已存在，请更换");
			return;
		}
		String smtp = "mysqldump -h"+ip+
				"  -u"+username+"  -p"+password+" "+databasename+"  >  " + datafile;
		System.out.println(smtp);
		String[] comment = {"cmd","/c",smtp};
		Process exec = Runtime.getRuntime().exec(comment);
		if (exec.waitFor() == 0) {
			System.out.println("数据库备份成功,备份路径为：" + datafile);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		response.setContentType(Constant.CONTENTTYPE);
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = "";;
		 ComBean cb = new ComBean(); 
		 SmartUpload mySmartUpload = new SmartUpload();//init
		 int count = 0;
		 try {
			 mySmartUpload.initialize(config, request, response);
			 mySmartUpload.upload();
			 method = mySmartUpload.getRequest().getParameter("method").trim();
			 if (method.equals("addpro")) {//增加
				 String rid = mySmartUpload.getRequest().getParameter("rid");
				 String price = mySmartUpload.getRequest().getParameter("price");
				 String detail = mySmartUpload.getRequest().getParameter("detail");
				 String type = mySmartUpload.getRequest().getParameter("type");
				 SmartFile file = mySmartUpload.getFiles().getFile(0);
				 String fileExt = file.getFileExt();
				 String path = "upfile";
				 count = mySmartUpload.save(path);
				 String str = cb.getString("select rid from room where rid='" + rid + "'");
				 if (str == null) {
					 int ff = cb.comUp("insert into room(rid,price,pic,detail,type)" +
							 " values('" + rid + "','" + price + "','" + path + "/" + file.getFileName() + "','" + detail + "','" + type + "')");
					 if (ff == Constant.SUCCESS) {
						 request.setAttribute("message", "操作成功！");
						 request.getRequestDispatcher("admin/pro/index.jsp").forward(request, response);
					 } else {
						 request.setAttribute("message", "系统维护中，请稍后再试！");
						 request.getRequestDispatcher("admin/pro/index.jsp").forward(request, response);
					 }
				 } else {
					 request.setAttribute("message", "信息重复！");
					 request.getRequestDispatcher("admin/pro/index.jsp").forward(request, response);
				 }

			 } else if (method.equals("backup")) {//备份
				 windowsDump("backup", "192.168.43.204", "root", "jsyzhjf0", "hotel");

			 } else if(method.equals("uppro")){//修改
//        	   String id = mySmartUpload.getRequest().getParameter("id");
           		String rid = mySmartUpload.getRequest().getParameter("rid");
				String price = mySmartUpload.getRequest().getParameter("price");
				String detail = mySmartUpload.getRequest().getParameter("detail");
				String type = mySmartUpload.getRequest().getParameter("type");
					SmartFile file = mySmartUpload.getFiles().getFile(0);
	            	String fileExt=file.getFileExt();	            
	            	String path="upfile";
                   count = mySmartUpload.save(path);
                   if(count==0){
                		int ff = cb.comUp("update room set price='"+price+"', detail='"+detail+"' , type='"+type+"'  where rid='"+rid+"' ");
    						if(ff == Constant.SUCCESS){
    							request.setAttribute("message", "操作成功！");
    							request.getRequestDispatcher("admin/pro/index.jsp").forward(request, response);
    						}
    						else{
    							request.setAttribute("message", "系统维护中，请稍后再试！");
    							request.getRequestDispatcher("admin/pro/index.jsp").forward(request, response);
    						}
                       
                   }
                   else{
                		int ff = cb.comUp("update room set price='"+price+"',pic='"+path+"/"+file.getFileName()+"'," +
                       			"detail='"+detail+"' where rid='"+rid+"' ");
    						if(ff == Constant.SUCCESS){
    							request.setAttribute("message", "操作成功！");
    							request.getRequestDispatcher("admin/pro/index.jsp").forward(request, response);
    						}
    						else{
    							request.setAttribute("message", "系统维护中，请稍后再试！");
    							request.getRequestDispatcher("admin/pro/index.jsp").forward(request, response);
    						}
                       }
                   }
                   
		 }catch(Exception e){
				e.printStackTrace();
				request.getRequestDispatcher("error.jsp").forward(request, response);
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
