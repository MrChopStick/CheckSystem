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
 * Servlet implementation class equip
 */
@WebServlet("/equip")
public class equip extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public equip() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/x-www-form-urlencoded;charset=UTF-8");
		String type=request.getParameter("type");
		String equipName;
		int equipType;                 //与typeId代表的是同一事物，只不过是由不同网页产生
		int groupId;
		int equipId;
		int typeId;
		String typeName;
		int checkId;
		String checkName;
		String checkDescription;
		int dataType;                  //1.手动输入，2.打钩
		switch(type)
		{
		case "getType":
			getType(response);
			break;
		case "addEquip":
			equipName=request.getParameter("equipName");
			equipType=Integer.valueOf(request.getParameter("equipType"));
			groupId=Integer.valueOf(request.getParameter("groupId"));
			if(DB_act.Equip_list_insert(equipName, groupId, equipType, 1))
			{
				response.getWriter().append("增加成功");
				response.flushBuffer();
			}else
			{
				response.getWriter().append("增加失败");
				response.flushBuffer();
			}
			break;
		case "changeEquip":
			equipName=request.getParameter("equipName");
			equipType=Integer.valueOf(request.getParameter("equipType"));
			groupId=Integer.valueOf(request.getParameter("groupId"));
			equipId=Integer.valueOf(request.getParameter("equipId"));
			if(DB_act.Equip_list_update(equipName, groupId, equipType, 1, equipId))
			{
				response.getWriter().append("修改成功");
				response.flushBuffer();
			}else
			{
				response.getWriter().append("修改失败");
				response.flushBuffer();
			}
			break;
		case "deleteEquip":
			{
			equipId=Integer.valueOf(request.getParameter("equipId"));
			Unit u=Unit.getUnit();
			DB_act.Equip_list_select("eq_id="+equipId, u);
			try {
				if(u.rs.next())
				{
					u.rs.deleteRow();
					response.getWriter().append("删除成功");
					response.flushBuffer();
				}else{
					response.getWriter().append("删除失败");
					response.flushBuffer();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				response.getWriter().append("删除失败！！存在巡检项目");                        //外键
				response.flushBuffer();
				e.printStackTrace();
			}
			u.close();
			}
			break;
		case "getAll":
			getAll(response);
			break;
		//check_list部分;
		case "getEquipType":                      //获取所有的equipType;
			getAllType(response);
			break;
		case "addEquipType":
			typeName=request.getParameter("typeName");
			if(DB_act.Equip_type_insert(typeName))
			{
				response.getWriter().append("添加成功");
				response.flushBuffer();
			}else
			{
				response.getWriter().append("添加失败");
				response.flushBuffer();
			}
			break;
		case "changeEquipType":
			typeId=Integer.valueOf(request.getParameter("typeId"));
			typeName=request.getParameter("typeName");
			if(DB_act.Equip_type_update(typeName,typeId))
			{
				response.getWriter().append("修改成功");
				response.flushBuffer();
			}else
			{
				response.getWriter().append("修改失败");
				response.flushBuffer();
			}
			break;
		case "deleteEquipType":
			{
				typeId=Integer.valueOf(request.getParameter("typeId"));
				Unit u=Unit.getUnit();
				Unit li=Unit.getUnit();
				DB_act.Equip_type_select("type_Id="+typeId, u);
				try {
					u.rs.next();
					DB_act.Check_list_select("check_type="+u.rs.getInt(1), li);
					if(!li.rs.next())
					{
						DB_act.Equip_list_select("eq_type="+u.rs.getInt(1), li);
						if(!li.rs.next())
						{
							u.rs.deleteRow();
							response.getWriter().append("删除成功!");
						}else
						{
							response.getWriter().append("删除失败,设备非空!");
						}
					}else
					{
						response.getWriter().append("删除失败，检查项非空!");
					}
					response.flushBuffer();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					response.getWriter().append("删除失败");
					response.flushBuffer();
					e.printStackTrace();
				}
				u.close();
			}
			break;
		case "getCheckList":
			typeId=Integer.valueOf(request.getParameter("typeId"));
			getCheckList(typeId,response);
			break;
		case "addCheck":
			typeId=Integer.valueOf(request.getParameter("typeId"));
			checkName=request.getParameter("checkName");
			checkDescription=request.getParameter("checkDescription");
			dataType=Integer.valueOf(request.getParameter("dataType"));
			if(DB_act.Check_list_insert(typeId, checkName, checkDescription, dataType))
			{
				response.getWriter().append("增加成功");
				response.flushBuffer();
			}else
			{
				response.getWriter().append("增加失败");
				response.flushBuffer();
			}
			break;
		case "changeCheck":
			typeId=Integer.valueOf(request.getParameter("typeId"));
			checkId=Integer.valueOf(request.getParameter("checkId"));
			checkName=request.getParameter("checkName");
			checkDescription=request.getParameter("checkDescription");
			dataType=Integer.valueOf(request.getParameter("dataType"));
			if(DB_act.Check_list_update(typeId, checkName, checkDescription, dataType, checkId))
			{
				response.getWriter().append("修改成功");
				response.flushBuffer();
			}else
			{
				response.getWriter().append("修改失败");
				response.flushBuffer();
			}
			break;
		case "deleteCheck":
			{
				checkId=Integer.valueOf(request.getParameter("checkId"));
				Unit u=Unit.getUnit();
				try {
					if(u.st.executeUpdate("delete from check_list where check_id="+checkId)==1)
					{
						response.getWriter().append("删除成功");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					response.getWriter().append("删除失败");
					e.printStackTrace();
				}
				response.flushBuffer();
			}
			break;
		}
		
	}

	private void getCheckList(int typeId, HttpServletResponse response) {
		// TODO Auto-generated method stub
		Unit u=Unit.getUnit();
		DB_act.Check_list_select("check_type="+typeId, u);
		JSONObject json=new JSONObject();
		try {
			if(!u.rs.next())
			{
				json.put("data", 0);
			}else
			{
				int i=0;
				JSONArray data=new JSONArray();
				do
				{
					String dataName=" ";
					JSONArray o=new JSONArray();
					o.put(u.rs.getInt(1));
					o.put(u.rs.getString(3));
					o.put(u.rs.getString(4));
					o.put(u.rs.getInt(5));
					switch(u.rs.getInt(5))
					{
					case 1:
						dataName="手动输入";
						break;
					case 2:
						dataName="打钩";
						break;
					}
					o.put(dataName);
					data.put(i,o);
					i++;
				}while(u.rs.next());
				json.put("data", data);
			}
			response.getWriter().append(json.toString());
			response.flushBuffer();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		u.close();
		
	}

	private void getAllType(HttpServletResponse response) {
		// TODO Auto-generated method stub
		Unit u=Unit.getUnit();
		DB_act.Equip_type_select("1=1", u);
		JSONObject json=new JSONObject();
		try {
			if(!u.rs.next())
			{
				json.put("data", 0);
			}else
			{
				int i=0;
				JSONArray data=new JSONArray();
				do{
					JSONArray o=new JSONArray();
					o.put(u.rs.getInt(1));
					o.put(u.rs.getString(2));
					data.put(i,o);
					i++;
				}while(u.rs.next());
				json.put("data", data);
			}
			response.getWriter().append(json.toString());
			response.flushBuffer();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		u.close();
	}

	private void getAll(HttpServletResponse response) {
		// TODO Auto-generated method stub
		Unit u=Unit.getUnit();
		Unit type=Unit.getUnit();
		DB_act.Equip_list_select("1=1", u);
		
		JSONObject json=new JSONObject();
		JSONArray data=new JSONArray();
		json.put("data", data);
		try {
			if(!u.rs.next())
			{
				json.put("data", 0);
			}else
			{
				int i=0;
				do{
					JSONArray o=new JSONArray();
					o.put(u.rs.getInt(1));
					o.put(u.rs.getString(2));
					o.put(u.rs.getInt(5));
					
					if(DB_act.Equip_type_select("type_id="+u.rs.getInt(5), type))
					{
						
						type.rs.next();
						o.put(type.rs.getString(2));
					}else
					{
						o.put("");
					}
					
					o.put(u.rs.getInt(4));
					data.put(i, o);
					i++;
				}while(u.rs.next());
			}
			response.getWriter().append(json.toString());
			response.flushBuffer();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		u.close();
		type.close();
	}

	private void getType(HttpServletResponse response) {
			Unit u=Unit.getUnit();
			DB_act.Equip_type_select("1=1", u);
			JSONArray json=new JSONArray();
			try {
				while(u.rs.next())
				{
					JSONObject o=new JSONObject();
					o.put("id", u.rs.getInt(1));
					o.put("text", u.rs.getString(2));
					json.put(o);
				}
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
