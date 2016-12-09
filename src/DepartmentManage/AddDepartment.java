package DepartmentManage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.DB_act;

@WebServlet("/AddDepartment")
public class AddDepartment extends HttpServlet
{

	private static final long serialVersionUID = 1L;

	public AddDepartment()
	{
		super();
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String departmentId =request.getParameter("departmentId");
		String departmentName =request.getParameter("departmentName");
		String managerId = request.getParameter("managerId");
		if(DB_act.Department_insert(departmentId, departmentName, managerId)==true)
		{
			System.out.println("添加成功");
			request.setAttribute("IsAdd", "T");
			//request.getRequestDispatcher("/jsp/department.jsp").forward(request, response);
			response.sendRedirect("/CheckSystem/jsp/success.jsp");
		}
			
		else
		{
			System.out.println("添加失败");
			
		}
			
	}
	public void destroy(){}
}