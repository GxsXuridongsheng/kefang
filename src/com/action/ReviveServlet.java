package com.action;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ReviveServlet extends HttpServlet {

	private ServletConfig config;

	public ReviveServlet() {
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

	public void windowsRevive(String username,String password, String databasename, String sqlfile) throws Exception {
		//mysql -u 用户名 -p 密码 数据库名 < 文件名.sql
		String smtp = "mysql -u"+username+" -p"+password+" "+databasename+" < " + sqlfile;
		System.out.println(smtp);
		String[] comment = {"cmd","/c",smtp};
		Process exec = Runtime.getRuntime().exec(comment);
		if (exec.waitFor() == 0) {
			System.out.println("数据库还原成功！");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			windowsRevive("root", "jsyzhjf0", "hotel", "E:\\浏览器下载\\apache-tomcat-9.0.55\\bin\\backup\\2022-06-15-10-11-14.sql");
		} catch (Exception e) {
			e.printStackTrace();
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
