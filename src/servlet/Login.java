package servlet;

//Realm
import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		System.out.println("login");
		int staff_id = 0;
		String staff_passwd = new String();
		String DataString = DB_act.get_request(request, response);
		try
		{
			JSONObject json = new JSONObject(DataString.toString());
			staff_id = Integer.parseInt(json.getString("staff_id"));
			staff_passwd = json.getString("staff_passwd");
			String login = "staff_id=" + String.valueOf(staff_id) + " AND " + "staff_passwd=" + staff_passwd;
			response.getWriter().append(CheckUser(login));
			System.out.println("Login");
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
