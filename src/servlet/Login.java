package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import java.sql.*;

@WebServlet("/Login")
public class Login extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public Login()
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
		int staff_id ;
		String staff_passwd = new String();
		String DataString = request.getParameter("json");
		String Type = request.getParameter("Type");
		
		
		System.out.println("LoginType="+Type);
		System.out.println(DataString);
		if(Type.equals("WebGet"))
		{
			String staff_id1 = request.getParameter("username");
			staff_passwd = request.getParameter("password");
			String login = "staff_id=" + staff_id1 + " AND " + "staff_passwd=" + staff_passwd;
			System.out.println("loginquery"+login);
			String result;
			Unit unit = Unit.getUnit();
			if (DB_act.Staff_select(login, unit))
			{
				try
				{
					unit.rs.last();
					JSONObject resultOfSQL = new JSONObject();
					JSONArray resultToApp = new JSONArray();
					if (unit.rs.getRow() > 0)
					{
						ResultSetMetaData metaData = unit.rs.getMetaData();
						String Staff_id = unit.rs.getString(1);
						String Staff_name = unit.rs.getString(2);
						String Staff_job = unit.rs.getString(3);
						int power = Integer.parseInt(unit.rs.getString(5));
						System.out.println(Staff_name);
						HttpSession session=request.getSession(true);
						session.setAttribute("name", Staff_name);
						session.setAttribute("job", Staff_job);
						session.setAttribute("id", Staff_id);
						switch(power)
						{
							case 0:
								response.sendRedirect("/CheckSystem/jsp/smStaff.jsp");
								//request.getRequestDispatcher("/jsp/smuser.jsp").forward(request, response);
								break;
							case 1:
								break;
							case 2:
								response.sendRedirect("/CheckSystem/jsp/emEquipment.jsp");
								//request.getRequestDispatcher("/jsp/emEquipment.jsp").forward(request, response);
								break;
							case 3:
								response.sendRedirect("/CheckSystem/jsp/staffTask.jsp");
								//request.getRequestDispatcher("/jsp/staffTask.jsp").forward(request, response);
								break;
							case 4:
								response.sendRedirect("/CheckSystem/jsp/userRepair.jsp");
								//request.getRequestDispatcher("/jsp/userRepair.jsp").forward(request, response);
								break;
						}
						
						
					} else
					{
						result = "Failed";
					}
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
				
			} else
			{
				result = "Failed";
			}
		}
		else try
		{
			JSONObject json = new JSONObject(DataString.toString());
			staff_id = Integer.parseInt(json.getString("staff_id"));
			staff_passwd = json.getString("staff_passwd");
			String login = "staff_id=" + String.valueOf(staff_id) + " AND " + "staff_passwd=" + staff_passwd;
			response.getWriter().append(CheckUser(login));
			System.out.println("Login  "+login+ "  "+ CheckUser(login));
		} catch (Exception e)
		{
			e.printStackTrace();
		}

	}

	public String CheckUser(String login) throws IOException, SQLException
	{
		String result;
		Unit unit = Unit.getUnit();
		if (DB_act.Staff_select(login, unit))
		{
			unit.rs.last();
			JSONObject resultOfSQL = new JSONObject();
			JSONArray resultToApp = new JSONArray();
			if (unit.rs.getRow() > 0)
			{
				ResultSetMetaData metaData = unit.rs.getMetaData();
				String colName = new String();
				String value = new String();
				for (int i = 2; i < 6; i++)
				{
					colName = metaData.getColumnName(i);
					value = unit.rs.getString(colName);
					resultOfSQL.put(colName, value);
				}
				result = resultOfSQL.toString();
				System.out.println(resultOfSQL.toString());
			} else
			{
				result = "Failed";
			}
		} else
		{
			result = "Failed";
		}
		return result;
	}
	
}
