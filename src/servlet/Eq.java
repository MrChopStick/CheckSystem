package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import java.util.*;

@WebServlet("/Eq")
public class Eq extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public Eq()
	{
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//JSONObject json = new JSONObject(DB_act.get_request(request, response));

		int eq_id = 0;
		String eq_name = new String();
		int eq_group = 0;
		int eq_type = 0;
		int eq_state = 0;
		int eq_manager = 0;
		String searchType = new String();
		String search = new String();

		String type = request.getParameter("Type");
		String jsons = request.getParameter("json");
		JSONObject json = new JSONObject(jsons);
		switch (type)
		{

		case "Get":
			/*
			 * searchType = json.names().toString();
			 * 
			 * switch(searchType){
			 * 
			 * case "eq_id": search = searchType + "=" + "`" +
			 * json.getString("search") + "`"; break; case "eq_name": search =
			 * searchType + "=" + json.getString("search"); break; case
			 * "eq_manager": search = searchType + "=" +
			 * json.getString("search"); break; case "eq_state": search =
			 * searchType + "=" + json.getString("search"); break; case
			 * "eq_group": search = searchType + "=" + json.getString("search");
			 * break; case "eq_type": search = searchType + "=" +
			 * json.getString("search"); break; case "eq_all": search = "1=1";
			 * break; }
			 */

			Iterator<String> getKey = json.keys();
			String key = getKey.next().toString();
			if (key.equals("eq_ALL"))
				search = "1=1";
			else
				search = key + "=" + "'" + json.getString(key) + "'";
			try
			{
				response.getWriter().append(create_eq_list(search));
			} catch (SQLException e1)
			{
				e1.printStackTrace();
			}
			break;
		case "Insert":
			eq_name = json.getString("eq_name");
			eq_group = Integer.parseInt(json.getString("eq_group"));
			eq_type = Integer.parseInt(json.getString("eq_type"));
			eq_manager = Integer.parseInt(json.getString("eq_manager"));

			response.getWriter().append(insert_eq(eq_name, eq_group, eq_type, eq_state, eq_manager));
			break;
		case "Update":
			eq_name = json.getString("eq_name");
			eq_group = Integer.parseInt(json.getString("eq_group"));
			eq_type = Integer.parseInt(json.getString("eq_type"));
			eq_manager = Integer.parseInt(json.getString("eq_manager"));
			eq_state = Integer.parseInt(json.getString("eq_state"));
			response.getWriter().append(update_eq(eq_id, eq_name, eq_group, eq_type, eq_state, eq_manager));
			break;
		case "Delete":
			eq_id = Integer.parseInt(json.getString("eq_id"));
			try
			{
				response.getWriter().append(delete_eq(eq_id));
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
			break;
		case "GetEqGroupList":
			try
			{
				response.getWriter().append(getEqGroupList(Integer.parseInt(json.getString("id"))));
			} catch (NumberFormatException | JSONException | SQLException e)
			{
				e.printStackTrace();
			}
			break;
		}
	}
	
	String getEqGroupList(int id) throws SQLException
	{
		Unit unit = Unit.getUnit();
		String result = new String();
		String query = "select * from eq_list where eq_group in (select group_id from eq_group where group_manager="+id+")";
		unit.rs = unit.st.executeQuery(query);
		JSONArray jArray = new JSONArray();
		int count=1;
		while(unit.rs.next())
		{
			JSONArray tempArray = new JSONArray();
			tempArray.put(count);
			count++;
			for(int i=1; i < 6 ;i++)
			{
				if(i!=4)
					tempArray.put(unit.rs.getString(i).toString());
			}
			jArray.put(tempArray);
		}
		JSONObject rs = new JSONObject();
		rs.put("data", jArray);
		return rs.toString();
	}

	String create_eq_list(String search) throws SQLException
	{
		Unit unit = Unit.getUnit();
		if (DB_act.Equip_list_select(search, unit))
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
			return resultToApp.toString();

		} else
		{
			String result = "Failed";
			unit.close();
			return result;
		}

	}

	String insert_eq(String eq_name, int eq_group, int eq_type, int eq_state, int manager)
	{
		String result = new String();
		if (DB_act.Equip_list_insert(eq_name, eq_group, eq_type, eq_state, manager))
			result = "OK";
		else
			result = "Failed";
		return result;
	}

	String delete_eq(int eq_id) throws SQLException
	{
		String result;
		String search = "eq_id=" + String.valueOf(eq_id);
		Unit unit = Unit.getUnit();
		if (DB_act.Equip_list_select(String.valueOf(search), unit))
		{
			unit.rs.deleteRow();
			result = "OK";
		} else
		{
			result = "Failed";
		}
		return result;
	}

	String update_eq(int eq_id, String eq_name, int eq_group, int eq_type, int eq_state, int manager)
	{
		String result;
		if (DB_act.Equip_list_update(eq_name, eq_group, eq_type, eq_state, manager, eq_id))
			result = "OK";
		else
			result = "Failed";
		return result;
	}

}
