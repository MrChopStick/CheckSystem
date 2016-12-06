package TempUtil;

import java.sql.SQLException;

public class LoadData
{

	public static void main(String[] args)
	{
		
	}
	
	public boolean db()
	{
		String query = new String("Insert into repair_list(repair_eqid,repair_detail,repair_state) values(?,?,?)");
		PreUnit u = PreUnit.getUnit(query);
		if (u == null)
			return false;
		try
		{
//			u.st.setInt(1, eqid);
//			u.st.setString(2, detail);
//			u.st.setInt(3, state);
			if (1 == u.st.executeUpdate())
			{
				u.close();
				return true;
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		u.close();
		return false;
	}
}
