import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class productRegisterDao 
{
	private String dbUrl = "jdbc:mysql://localhost:3306/harshdb";
	private String dbUname = "root";
	private String dbPassword = "HArsh@020703";
	private String dbDriver = "com.mysql.cj.jdbc.Driver";
	
	public int insert(productMember member)
	{
		int status=0;
		
		try
		{
		
		//Loading the driver
		try {
			Class.forName(dbDriver);
		} 
		catch (ClassNotFoundException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Connection con = DriverManager.getConnection(dbUrl,dbUname,dbPassword);
		String sql = "insert into productdetail values(?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, member.getProductname());
		ps.setString(2, member.getProductsize());
		ps.setString(3, member.getProductquantity());
		ps.setString(4, member.getFitting());
		
		status = ps.executeUpdate();
		
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return status;
		
	}
	
	public int insertp(productMember member)
	{
		int status=0;
		
		try
		{
		
		//Loading the driver
		try {
			Class.forName(dbDriver);
		} 
		catch (ClassNotFoundException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Connection con = DriverManager.getConnection(dbUrl,dbUname,dbPassword);
		String sql = "insert into productreference values(?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, member.getProductname());
		ps.setString(2, member.getProductsize());
		ps.setString(3, member.getProductquantity());
		ps.setString(4, member.getFitting());
		
		status = ps.executeUpdate();
		
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return status;
		
	}

}
