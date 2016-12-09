package servlet;

import java.io.IOException;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/Department")
public class Department extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public Department()
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
		String type = request.getParameter("Type");
		String jsonString = request.getParameter("json");
		JSONObject requestJson;
		if(jsonString!=null)
			requestJson = new JSONObject(jsonString);
		else 
			requestJson = new JSONObject();
		String result = new String();
		Unit unit = Unit.getUnit();
		PreUnit u;
		ResultSetMetaData meta;
		String query ;
		switch(type)
		{
			case "Get":
				query= "select * from department";
				try
				{
					unit.rs = unit.st.executeQuery(query);
					meta = unit.rs.getMetaData();
					JSONObject departmentObject = new JSONObject();
					JSONArray departmentArray = new JSONArray();
					while(unit.rs.next())
					{
						JSONArray tempArray = new JSONArray();
						for(int i=1; i<3; i++)
						{
							tempArray.put(unit.rs.getString(i));
						}
						Unit getManager = Unit.getUnit();
						getManager.rs = getManager.st.executeQuery("select staff_name from staff where staff_id="+unit.rs.getString(3));
						if(getManager.rs.next())
							System.out.println(getManager.rs.getString(1));
						else
							System.out.println("没有结果");
						tempArray.put(getManager.rs.getString(1));
						departmentArray.put(tempArray);
						getManager.close();
					}
					//departmentObject.put("data", departmentArray);
					result = departmentArray.toString();
				} 
				catch (SQLException e)
				{
					e.printStackTrace();
				}
				break;
			case "Update":
//				String update = "update department set manager_id="+requestJson.getString("managerId")+" where department_id="+requestJson.getString("departmentId");            
//				u = PreUnit.getUnit(update);
//				if(u == null)
//					result="Faild";
//				else
//					result="success";
//				System.out.println(result+update);
//				u.close();
				String departmentId = requestJson.getString("departmentId");
				String managerId=requestJson.getString("managerId");
				if(DB_act.Department_update(departmentId, managerId))
					result = "success";
				else
					result = "faild";
				break;
			case "Insert":
				String insert = "insert into department values("+requestJson.getString("departmentId")+","
								+"'"+requestJson.getString("departmentName")+"'"+","+requestJson.getString("managerId")+")";
				u = PreUnit.getUnit(insert);
				if(u == null)
					result="Faild";
				else
				{
					try
					{
						if (1 == u.st.executeUpdate())
						{
							
							result="{[Success]}";
						}
					} catch (SQLException e)
					{
						e.printStackTrace();
						result="Faild";
					}
					u.close();
				}
				break;
			case "GetManagerList":
				query="select staff_id,staff_name from staff where staff_power=1";
				JSONArray managerList = new JSONArray();
				try
				{
					unit.rs = unit.st.executeQuery(query);
					meta = unit.rs.getMetaData();
					
					while(unit.rs.next())
					{
						JSONArray tempArray = new JSONArray();
						tempArray.put(unit.rs.getString(1));
						tempArray.put(unit.rs.getString(2));
						managerList.put(tempArray);
					}
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
				result=managerList.toString();
				break;
			case "GetStaffList":
				String queryCondition;
				String Id=request.getParameter("departmentId");
				if(Id.equals("all"))
					queryCondition="1=1";
				else
					queryCondition= "department_id="+request.getParameter("departmentId");
				System.out.println(queryCondition);
				JSONObject staffList = new JSONObject();
				JSONArray staffArray = new JSONArray();
				if(DB_act.Staff_select(queryCondition, unit))
				{
					try
					{
						while(unit.rs.next())
						{
							JSONArray tempArray = new JSONArray();
							tempArray.put(unit.rs.getString(1));
							tempArray.put(unit.rs.getString(2));
							tempArray.put(unit.rs.getString(3));
							tempArray.put(unit.rs.getString(4));
							staffArray.put(tempArray);
						}
						staffList.put("data", staffArray);
					} catch (SQLException e)
					{
						e.printStackTrace();
					}
				}
				result=staffList.toString();
				break;
			default:
				unit.close();
		}
		System.out.println(result);
		response.getWriter().append(result);
	}
}
