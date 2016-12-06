package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/Check_result")
public class Check_result extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public Check_result()
	{
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		String type = request.getParameter("Type");

		switch (type)
		{
		case "Get":
			break;
		case "Insert":
			JSONArray jsonArray = new JSONArray(DB_act.get_request(request, response));
			int eq_id = 0;
			String eq_name = new String();
			String check_name = new String();
			int task_id = 0;
			String result_detail = new String();
			int falseTime = 0;
			for (int i = 0; i < jsonArray.length(); i++)
			{
				JSONObject json = jsonArray.getJSONObject(i);
				eq_name = json.getString("eq_name");
				eq_id = Integer.parseInt(json.getString("eq_id"));
				check_name = json.getString("check_name");
				task_id = Integer.parseInt(json.getString("task_id"));
				result_detail = json.getString("result_detail");
				if (insert_check_result(eq_id, eq_name, check_name, task_id, result_detail))
				{
					;
				} else
				{
					falseTime++;
				}
			}
			if (falseTime > 0)
				response.getWriter().append("OK");
			else
				response.getWriter().append("Failed");
			break;
		case "Update":
			break;
		case "Delete":
			break;
		}
	}

	boolean insert_check_result(int eq_id, String eq_name, String check_name, int task_id, String result_detail)
	{
		if (DB_act.Check_result_insert(eq_id, eq_name, check_name, task_id, result_detail))
		{
			return true;
		} else
		{
			return false;
		}
	}
}
