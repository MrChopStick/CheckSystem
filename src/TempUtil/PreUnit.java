package TempUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import servlet.DB_act;

public class PreUnit
{
	private Connection con = null;
	public PreparedStatement st = null;

	public void close()
	{
		try
		{
			if (st != null)
				st.close();
			if (con != null)
				con.close();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

	private PreUnit()
	{
	}

	public static PreUnit getUnit(String query)
	{
		PreUnit u = new PreUnit();
		try
		{
			u.con = DB_act.ds.getConnection();
			u.st = u.con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			return u;
		} catch (SQLException e)
		{
			u.close();
			return null;
		}
	}

}
