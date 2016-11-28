package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TestLogin")
public class TestLogin extends HttpServlet
{

	private static final long serialVersionUID = 1L;
	private String message;

	public TestLogin()
	{
		super();
	}

	public void init() throws ServletException
	{
		message = "Hello World";
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("正在登录");
		String username = request.getParameter("Username");
		switch (username)
		{
		case "123":
			request.getRequestDispatcher("/jsp/EquiGroup.jsp").forward(request, response);
			break;
		case "456":
			request.getRequestDispatcher("/jsp/EquiGroup2.jsp").forward(request, response);
			break;
		case "789":
			request.getRequestDispatcher("/jsp/EquiGroup3.jsp").forward(request, response);
			break;
		default:
			response.getWriter().println("用户不存在");
		}

	}

	public void destroy()
	{

	}
}