package DAO;
import java.sql.*;
import java.util.*;
import BeanClass.*;
public class Dao {
	String driverName = "com.mysql.cj.jdbc.Driver",dburl = "jdbc:mysql://localhost:3306/ims",dbusername = "root",dbpassword = "root";

	public int insertUser(UserBean user) {
		int status=0;
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "insert into `ims`.`user` (`user_firstname`,`user_lastname`,`user_email`,`user_phoneno`,`user_address`,`user_position`) values (?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getFirstname());
			pstmt.setString(2, user.getLastname());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6, user.getPosition());
			status = pstmt.executeUpdate();
			pstmt.close();
			con.close();
		}catch (Exception e) {e.printStackTrace();}
		return status;
	}
	public boolean checkUserLoginInfo(String login,String password) {
		boolean flag = false;
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "select `user`.`username`,`user`.`password` from `ims`.`user` where `user`.`username`=? and `user`.`password`=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, login);
			pstmt.setString(2,password);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				flag = true;
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (Exception e) {e.printStackTrace();}
		return flag;
	}
	public UserBean getUserByLoginAndPassword(String username ,String password) {
		UserBean user = new UserBean();
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "select * from `ims`.`user` where `username`=? and `password`=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				user.setId(rs.getInt(1));
				user.setFirstname(rs.getString(2));
				user.setLastname(rs.getString(3));
				user.setEmail(rs.getString(4));
				user.setPhone(rs.getString(5));
				user.setAddress(rs.getString(6));
				user.setPosition(rs.getString(7));
				user.setUsername(rs.getString(8));
				user.setPassword(rs.getString(9));
			}
			pstmt.close();
			rs.close();
			con.close();
		}catch (Exception e) {e.printStackTrace();}
		return user;
	}
	
	// code for getting name and id by username and password
//	public  UserBean getUserNameByLoginAndPassword(int id,String login,String password){
//		UserBean user = new UserBean();
//		try {
//			
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ims","root","root");
//			String sql = "select `user`.`user_firstname`,`user`.`user_lastname` from `ims`.`user` where `username`=? and `password`=?";
//			PreparedStatement pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, login);
//			pstmt.setString(2, password);
//			ResultSet rs = pstmt.executeQuery();
//			while(rs.next()) {
//				
//				user.setFirstname(rs.getString(1));
//				user.setLastname(rs.getString(2));
//			}
//			rs.close();
//			pstmt.close();
//			con.close();
//		} catch (Exception e) { e.printStackTrace();}
//		return user;
//	}
	//code for retrive id by username and password
	/* public int getUserIdByLoginAndPassword(String login,String password) {
		int id=0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ims","root","root");
			String sql = "select `user`.`user_id` from `ims`.`user` where `username`=? and `password`=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, login);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
				id = rs.getInt(1);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return id;
		
	}
	*/
	public List<ThrededFittingBean> getAllDetailsOfThrededFittings(){
		List<ThrededFittingBean> list = new ArrayList<>();
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "SELECT * from `ims`.`thrededfitting`";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				ThrededFittingBean tb = new ThrededFittingBean();
				tb.setId(rs.getInt(1));
				tb.setProductName(rs.getString(2));
				tb.setProductSize(rs.getString(3));
				tb.setNoOfProduct(rs.getString(4));
				list.add(tb);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (Exception e) {e.printStackTrace();}
		return list;
	}
	public List<GroovedFittingBean> getAllDetailsOfGroovedFittings(){
		List<GroovedFittingBean> list = new ArrayList<>();
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "SELECT * from `ims`.`groovedfitting`";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				GroovedFittingBean gb = new GroovedFittingBean();
				gb.setId(rs.getInt(1));
				gb.setProductName(rs.getString(2));
				gb.setProductSize(rs.getString(3));
				gb.setNoOfProduct(rs.getString(4));
				list.add(gb);
			}
		}catch(Exception ex) {ex.printStackTrace();}
		return list;
	}
	public int insertThrededFitting(ThrededFittingBean tb) {
		int status=0;
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "insert into `ims`.`thrededfitting` (`name`,`size`,`noofproduct`) values (?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tb.getProductName());
			pstmt.setString(2, tb.getProductSize());
			pstmt.setString(3, tb.getNoOfProduct());
			status  = pstmt.executeUpdate();
			pstmt.close();
			con.close();
		}catch(Exception ex) {ex.printStackTrace();}
		return status;
	}
	public int insertGroovedFitting(GroovedFittingBean gb) {
		int status = 0;
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "insert into `ims`.`groovedfitting` (`name`,`size`,`noofproduct`) values (?,?,?)`";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, gb.getProductName());
			pstmt.setString(2, gb.getProductSize());
			pstmt.setString(3, gb.getNoOfProduct());
			status = pstmt.executeUpdate();
		}catch(Exception ex) {ex.printStackTrace();}
		return status;
	}
}