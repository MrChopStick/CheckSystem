package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
@WebServlet("/Staff")
public class Staff extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public Staff()
	{
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/x-www-form-urlencoded;charset=UTF-8");
		String type = request.getParameter("type");
		int id;
		switch (type)
		{
		case "getDepartment":
			getDepartment(response);
			break;
		case "getStaff":
			id = Integer.valueOf(request.getParameter("id"));
			getStaff(response, id);
			break;
		case "addStaff":
			addStaff(request,response);
			break;
		case "updateStaff":
			updateStaff(request,response);
			break;
		case "deleteStaff":
			deleteStaff(request,response);
			break;
		}
	}

	private void getStaff(HttpServletResponse response, int id)
	{
		Unit u = Unit.getUnit();
		DB_act.Staff_select("department_id=" + id, u);
		JSONArray json = new JSONArray();
		try
		{
			int i = 0;
			while (u.rs.next())
			{
				JSONObject o = new JSONObject();
				o.append("id", u.rs.getInt(1));
				o.append("text", u.rs.getString(2));
				json.put(i, o);
				i++;
			}
			response.getWriter().append(json.toString());
			response.flushBuffer();
		} catch (SQLException e)
		{
			e.printStackTrace();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		u.close();
	}

	private void getDepartment(HttpServletResponse response)
	{
		Unit u = Unit.getUnit();
		JSONArray json = new JSONArray();
		try
		{
			u.rs = u.st.executeQuery("select * from department");
			int i = 0;
			while (u.rs.next())
			{
				JSONObject o = new JSONObject();
				o.append("id", u.rs.getInt(1));
				o.append("text", u.rs.getString(2));
				json.put(i, o);
				i++;
			}
			response.getWriter().append(json.toString());
			response.flushBuffer();
		} catch (SQLException e)
		{
			e.printStackTrace();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		u.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{}

	private void addStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int id = Integer.parseInt(request.getParameter("id"));
		String name =request.getParameter("name");
		String job = request.getParameter("job");
		String phone = request.getParameter("phone");
		int power = Integer.parseInt(request.getParameter("power"));
		String pwd = request.getParameter("pwd");
		int departmentId = Integer.parseInt(request.getParameter("department"));
		JSONObject responseData = new JSONObject();
		if(DB_act.Staff_insert(job, pwd, name, phone, departmentId, id, power))
		{
			responseData.put("info", "添加成功");
		}
		else
		{
			responseData.put("info", "添加失败");
		}
		response.getWriter().append(responseData.toString());
		
	}
	private void updateStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int id = Integer.parseInt(request.getParameter("id"));
		String name =request.getParameter("name");
		String job = request.getParameter("job");
		String phone = request.getParameter("phone");
		int power = Integer.parseInt(request.getParameter("power"));
		String pwd = request.getParameter("pwd");
		int departmentId = Integer.parseInt(request.getParameter("department"));
		JSONObject responseData = new JSONObject();
		if(DB_act.Staff_update(job, pwd, name, phone, power, departmentId,id))
		{
			responseData.put("info", "修改成功");
		}
		else
		{
			responseData.put("info", "修改失败");
		}
		response.getWriter().append(responseData.toString());	
	}
	private void deleteStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{	int id = Integer.parseInt(request.getParameter("id"));
	
		JSONObject responseData = new JSONObject();
		if(DB_act.Staff_delete(id))
		{
			responseData.put("info", "删除成功");
		}
		else
		{
			responseData.put("info", "删除失败");
		}
		response.getWriter().append(responseData.toString());	
	}
}
