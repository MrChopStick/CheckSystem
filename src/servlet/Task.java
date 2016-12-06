package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
@WebServlet("/Task")
public class Task extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public Task()
	{
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String search = new String();
		JSONObject json = new JSONObject(DB_act.get_request(request, response));
		Iterator<String> getKey = json.keys();
		String key = getKey.next().toString();
		if (key.equals("task_ALL"))
			search = "1=1";
		else
			search = key + "=" + "'" + json.getString(key) + "'";
		try
		{
			//response.getWriter().append(create_task_list(search));
			response.getWriter().append(create_plan_task_list(search));
		} catch (SQLException e1)
		{
			e1.printStackTrace();
			response.getWriter().append("Failed");
		}

	}

	String create_task_list(String search) throws SQLException
	{
		String result = new String();
		Unit unit = Unit.getUnit();
		if (DB_act.Check_task_select(search, unit))
		{
			JSONObject resultOfSQL = new JSONObject();
			JSONArray resultToApp = new JSONArray();
			ResultSetMetaData meteData = unit.rs.getMetaData();
			while (unit.rs.next())
			{
				resultOfSQL = new JSONObject();
				for (int i = 1; i < 6; i++)
				{
					String columnIndex = meteData.getColumnLabel(i);
					String value = unit.rs.getString(columnIndex);
					resultOfSQL.put(columnIndex, value);
				}
				resultToApp.put(resultOfSQL);
			}
			unit.close();
			JSONObject ToApp = new JSONObject();
			ToApp.put("resultList", resultToApp);
			return ToApp.toString();

		} else
		{
			result = "Failed";
			unit.close();
			return result;
		}
	}

	String create_plan_task_list(String search) throws SQLException
	{
		String result = new String();
		Unit unit = Unit.getUnit();
		if (DB_act.Check_task_select(search, unit))
		{

			JSONObject resultOfSQL = new JSONObject();
			JSONArray resultToApp = new JSONArray();
			JSONObject ToApp = new JSONObject();
			ResultSetMetaData meteData = unit.rs.getMetaData();
			while (unit.rs.next())
			{
				resultOfSQL = new JSONObject();
				for (int i = 1; i < 7; i++)
				{
					String columnIndex = meteData.getColumnLabel(i);
					String value = unit.rs.getString(columnIndex);
					resultOfSQL.put(columnIndex, value);
				}
				resultOfSQL.put("tasklist", getTaskList(unit.rs.getString("plan_id")));
				System.out.println("plan_idid:"+unit.rs.getString("plan_id"));
				resultToApp.put(resultOfSQL);
			}
			unit.close();
			//System.out.println(resultToApp.toString());

			ToApp.put("planList", resultToApp);
		    //System.out.println(ToApp.toString());
			return ToApp.toString();
		}
		
		return result.toString();
	}
	private JSONArray getTaskList(String plan_id) throws SQLException
	{
		JSONArray taskList = new JSONArray();
		Unit unit = Unit.getUnit();
		String search_check_plan_detail = "cd_plan_id=" +"'"+plan_id+"'";
		
		String query = new String("Select distinct cd_eq_id, eq_name From check_plan_detail WHERE " + search_check_plan_detail);
		try
		{
			unit.rs = unit.st.executeQuery(query);
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		ResultSetMetaData meta = unit.rs.getMetaData();
		while(unit.rs.next())
		{
			JSONObject taskItem = new JSONObject();
			for (int i = 1; i < 3; i++)
			{
					String columnIndex = meta.getColumnLabel(i);
				    String value = unit.rs.getString(columnIndex);
				    taskItem.put(columnIndex, value);
			}
			taskItem.put("checkList", getCheckList(unit.rs.getString("cd_eq_id"),plan_id));
			taskList.put(taskItem);
		}
		unit.close();
		System.out.println(taskList);
		return taskList;
	}
	
	private JSONArray getCheckList(String cd_eq_id, String plan_id) throws SQLException
	{
		JSONArray checkList = new JSONArray();
		Unit unit = Unit.getUnit();
		String query = new String("select * from check_list where check_id in (select cd_check_id from check_plan_detail where cd_eq_id="+cd_eq_id+" and cd_plan_id="+plan_id+")");                                        
		System.out.println(query);
		
		unit.rs = unit.st.executeQuery(query);
		ResultSetMetaData meta = unit.rs.getMetaData();
		while(unit.rs.next())
		{
			JSONObject checkItem = new JSONObject();
			for(int i=1; i<6; i++)
			{
				String columnIndex = meta.getColumnLabel(i);
			    String value = unit.rs.getString(columnIndex);
			    checkItem.put(columnIndex, value);
			}
			checkList.put(checkItem);
		}
		unit.close();
		System.out.println("checkList"+checkList.toString());
		return checkList;
	}
	
}
