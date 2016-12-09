package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
@WebServlet("/User")
public class User extends HttpServlet
{

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String requestType = request.getParameter("Type");
		String requestJsonString = request.getParameter("json");
		JSONObject requestJson = new JSONObject(requestJsonString);
		String staffName,staffPwd,staffJob,staffPhone;
		int staffId,staffPower,departmentId;
		switch(requestType)
		{
		case "Insert":
			staffId=Integer.parseInt(requestJson.getString("staffId"));
			staffPhone=requestJson.getString("stafPhone");
			staffPower=Integer.parseInt(requestJson.getString("staffPhone"));
			staffPwd=requestJson.getString("staffPwd");
			departmentId=Integer.parseInt(requestJson.getString("departmentId"));
			staffName=requestJson.getString("staffName");
			staffJob=requestJson.getString("staffJob");
			if(DB_act.Staff_insert(staffJob, staffPwd, staffName, staffPhone, departmentId, staffId, staffPower))
				System.out.println("添加人员成功");
			else
				System.out.println("添加人员失败");
			break;
		case "Update":
			break;
		}
	}

}
