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


/**
 * Servlet implementation class Hello
 */
@WebServlet("/equipGroup")
public class equipGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public equipGroup() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/x-www-form-urlencoded;charset=UTF-8");
		String type=request.getParameter("type");
		int id;
		String name;
		int manager;
		switch(type)
		{
		case "getAll":
			getAll(response);
			break;
		case "modify":
			id=Integer.valueOf(request.getParameter("groupId"));
			name=request.getParameter("groupName");
			manager=Integer.valueOf(request.getParameter("manager"));
			modifyGroup(id,name,manager,response);
			break;
		case "add":
			name=request.getParameter("groupName");
			manager=Integer.valueOf(request.getParameter("manager"));
			if(DB_act.Equip_group_insert(manager, name))
			{
				response.getWriter().append("成功添加");
				response.flushBuffer();
			}else
			{
				response.getWriter().append("添加失败");
				response.flushBuffer();
			}
			break;
		case "delete":
			id=Integer.valueOf(request.getParameter("groupId"));
			deleteGroup(id,response);
			break;
		case "getList":
			id=Integer.valueOf(request.getParameter("groupId"));
			getList(id,response);
			break;
		}
		/*String a="test";
		String b="[1,2,3]";
		Data_operator.Equip_type_insert(a, b);
		*/
		/*
		Unit u=Unit.getUnit();
		if(u!=null)
		{
			
			try {
				Data_operator.Equip_type_select("1=1",u);
				while(u.rs.next())
				{
					System.out.println(u.rs.getString(3));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				u.close();
			}
		}
		*/
		//Data_operator.Repair_insert(1, "umbrella", 0);
		//Data_operator.Repair_update(2, "m_got_time", "1996-10-30 11:11:11");
		//Data_operator.Equip_insert("2", 0, 3, 2, 0);
		/*
		Data_operator.Repair_insert(112, "kaiwanxiao", 0);
		Data_operator.Equip_list_insert("shebei", 1, 2, 1, 4);
		Data_operator.Equip_type_insert("as", "[1,2,3]");
		Data_operator.Equip_group_insert(213123);
		Date da=Date.valueOf("1998-10-22");
		Time t1=Time.valueOf("12:22:31");
		Time t2=Time.valueOf("11:43:22");
		Data_operator.Check_plan_insert("as", 24, da, t1, t1, 123, 321, 123, "666");
		Data_operator.Check_plan_detail_insert(11, 213, 666);
		Data_operator.Check_list_insert(12, "gg", "asd", 22);
		Data_operator.Check_result_insert(123, "asd", "zx", 123, "[\"kk\"]");
		Data_operator.Staff_insert("jj", "123", "asd", "11111111111", 3);
		*/
		/*
		Timestamp t=Timestamp.valueOf(LocalDateTime.now());
		Data_operator.Repair_update(3, Data_operator.FINISH_TIME, t);
		Data_operator.Equip_list_update("ASD", 21, 12, 4, 213, 1);
		Data_operator.Equip_type_update("asd", "[1, 4, 6]", 1);
		Date da=Date.valueOf(LocalDate.now());
		Time t1=Time.valueOf(LocalTime.now());
		Time t2=Time.valueOf(LocalTime.now());
		Data_operator.Check_plan_Update("123", 2, da, t1, t2, 44, 33, 2, "a", 1);
		Data_operator.Check_plan_detail_update(2, 1, 3, 1);
		Data_operator.Check_list_update(3,"45","sad",1,1);
		Data_operator.Staff_update("oo", "as", "zxc", "12222111111", 5, 100002);
		Unit u=Unit.getUnit();
		*/
		/*
		Date da=Date.valueOf("1998-10-22");
		Time t1=Time.valueOf("12:22:31");
		Time t2=Time.valueOf("11:43:22");
		Data_operator.Check_plan_insert("as", 24, da, t1, t1, 123, 321, 123, "666");
		*/
	}


	private void getList(int id, HttpServletResponse response) {
		Unit u=Unit.getUnit();
		Unit typeName=Unit.getUnit();
		//if(u==null)
		DB_act.Equip_list_select("eq_group="+id, u);
		JSONObject json=new JSONObject();
		json.append("data", new JSONArray());
		JSONArray data=json.getJSONArray("data");
		try {
			if(!u.rs.next())
			{
				json.put("data", 1);
				
			}else{
				int i=0;
				do
				{
					JSONArray row=new JSONArray();
					row.put(u.rs.getInt(1));
					row.put(u.rs.getString(2));
					row.put(u.rs.getInt(5));
					DB_act.Equip_type_select("type_id="+u.rs.getInt(5), typeName);
					typeName.rs.next();
					row.put(typeName.rs.getString(2));
					row.put(id);
					data.put(i,row);
					i++;
				}while(u.rs.next());
			}
			System.out.println(json.toString());
			response.getWriter().append(json.toString());
			response.flushBuffer();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void deleteGroup(int id,HttpServletResponse resp) {
		Unit u=Unit.getUnit();
		DB_act.Equip_list_select("eq_group="+id, u);
		try {
			if(!u.rs.next())
			{
				DB_act.Equip_group_select("group_id="+id, u);
				u.rs.next();
				u.rs.deleteRow();
				resp.getWriter().append("成功删除");
				resp.flushBuffer();
			}else
			{
				resp.getWriter().append("设备组非空");
				resp.flushBuffer();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		u.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	private void getAll(HttpServletResponse response)
	{
		Unit group=Unit.getUnit();
		Unit name=Unit.getUnit();
		//if(u==null)
		DB_act.Equip_group_select("1=1",group);
		JSONObject json1=new JSONObject();
		json1.append("data", new JSONArray());
		JSONArray data=json1.getJSONArray("data");
		try {
			int i=0;
			while(group.rs.next())
			{
				JSONArray row=new JSONArray();
				row.put(group.rs.getInt("group_id"));
				row.put(group.rs.getString("group_name"));
				int id=group.rs.getInt("group_manager");
				row.put(id);
				DB_act.Staff_select("staff_id="+id, name);
				name.rs.next();
				row.put(name.rs.getString("staff_name"));
				data.put(i, row);
				i++;
			}
			System.out.println(json1.toString());
			response.getWriter().write(json1.toString());
			response.flushBuffer();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		group.close();
		name.close();
	}
	private void modifyGroup(int id,String name,int manager,HttpServletResponse response)
	{
		Unit u=Unit.getUnit();
		DB_act.Equip_group_select("group_id="+id, u);
		try {
			u.rs.next();
			u.rs.updateString("group_name", name);
			u.rs.updateInt("group_manager", manager);
			u.rs.updateRow();
			response.getWriter().append("修改成功");
			response.flushBuffer();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				response.getWriter().append("修改失败");
				response.flushBuffer();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		u.close();
		
	}

}
