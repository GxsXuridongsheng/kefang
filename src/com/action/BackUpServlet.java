package com.action;

import com.bean.ComBean;
import com.util.Constant;
import com.util.SmartFile;
import com.util.SmartUpload;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class BackUpServlet extends HttpServlet {

	private ServletConfig config;

	public BackUpServlet() {
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
			System.out.println(sqlname + "�ļ����Ѵ��ڣ������");
			return;
		}
		String smtp = "mysqldump -h"+ip+
				"  -u"+username+"  -p"+password+" "+databasename+"  >  " + datafile;
		System.out.println(smtp);
		String[] comment = {"cmd","/c",smtp};
		Process exec = Runtime.getRuntime().exec(comment);
		if (exec.waitFor() == 0) {
			System.out.println("���ݿⱸ�ݳɹ�,����·��Ϊ��" + datafile);
		}
	}

	public void windowsRevive(String dir, String ip, String username,String password, String databasename, String sqlfile) throws Exception {
		//mysql -u �û��� -p ���� ���ݿ��� < �ļ���.sql
		String smtp = "mysql -u"+username+"  -p"+password+" "+databasename+"  <  " + sqlfile;
		System.out.println(smtp);
		String[] comment = {"cmd","/c",smtp};
		Process exec = Runtime.getRuntime().exec(comment);
		if (exec.waitFor() == 0) {
			System.out.println("���ݿ⻹ԭ�ɹ���");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			windowsDump("backup", "localhost", "root", "jsyzhjf0", "hotel");
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
