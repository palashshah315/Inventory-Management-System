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
			String sql = "insert into `ims`.`user` (`user_firstname`,`user_lastname`,`user_email`,`user_phoneno`,`user_address`,`user_position`,`username`,`password`) values (?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getFirstname());
			pstmt.setString(2, user.getLastname());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6, user.getPosition());
			pstmt.setString(7, user.getUsername());
			pstmt.setString(8, user.getPassword());
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
				tb.setUnitPrice(rs.getString(5));
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
			String sql = "select * from `ims`.`groovedfitting`";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				GroovedFittingBean gb = new GroovedFittingBean();
				gb.setId(rs.getInt(1));
				gb.setProductName(rs.getString(2));
				gb.setProductSize(rs.getString(3));
				gb.setNoOfProduct(rs.getString(4));
				gb.setUnitPrice(rs.getString(5));
				list.add(gb);
			}
		}catch(Exception ex) {ex.printStackTrace();}
		return list;
	}
	
	public int updateGroovedTotalProduct(String productremaining,int id) {
		int status=0;
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "update `ims`.`groovedfitting` set `noofproduct` = ? where `id`=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, productremaining);
			pstmt.setInt(2, id);
			status = pstmt.executeUpdate();
		}
		catch(Exception ex) {ex.printStackTrace();}
		return status;
	}
	
	public int updateThrededTotalProduct(String productremaining,int id) {
		int status=0;
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "update `ims`.`thrededfitting` set `noofproduct`=? where `id`=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, productremaining);
			pstmt.setInt(2, id);
			status = pstmt.executeUpdate();
		}
		catch(Exception ex) {ex.printStackTrace();}
		return status;
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
			String sql = "insert into `ims`.`groovedfitting` (`name`,`size`,`noofproduct`) values (?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, gb.getProductName());
			pstmt.setString(2, gb.getProductSize());
			pstmt.setString(3, gb.getNoOfProduct());
			status = pstmt.executeUpdate();
		}catch(Exception ex) {ex.printStackTrace();}
		return status;
	}
	 
	public int placedGroovedOrder(OrderGroovedFittingBean ordergrooved) {
		int status = 0;
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "insert into `ims`.`ordergrooved` (`productid`,`userid`,`userfirstname`,`userlastname`,`productname`,`productsize`,`productrequired`,`totalproduct`,`totalprice`,`clientname`,`clientaddress`,`clientemail`,`orderstatus`,`orderplaceddate`,`orderplacedtime`,`invoicestatus`) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ordergrooved.getProductId());
			pstmt.setInt(2, ordergrooved.getUserId());
			pstmt.setString(3, ordergrooved.getUserFirstName());
			pstmt.setString(4, ordergrooved.getUserLastName());
			pstmt.setString(5, ordergrooved.getProductname());
			pstmt.setString(6, ordergrooved.getProductsize());
			pstmt.setString(7, ordergrooved.getProductrequired());
			pstmt.setString(8, ordergrooved.getTotalProduct());
			pstmt.setLong(9, ordergrooved.getTotalProductPrice());
			pstmt.setString(10, ordergrooved.getclientName());
			pstmt.setString(11,ordergrooved.getClientAddress());
			pstmt.setString(12, ordergrooved.getClientEmail());
			pstmt.setString(13,ordergrooved.getOrderStatus());
			pstmt.setString(14, ordergrooved.getOrderPlacedDate());
			pstmt.setString(15, ordergrooved.getOrderPlacedTime());
			pstmt.setString(16, ordergrooved.getInvoiceStatus());
			status = pstmt.executeUpdate();
		}
		catch (Exception e) {e.printStackTrace();}
		return status;
	}
	public int placedThrededOrder(OrderThrededFittingBean orderthreded) {
		int status = 0;
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "insert into `ims`.`orderthreded` (`productid`,`userid`,`userfirstname`,`userlastname`,`productname`,`productsize`,`productrequired`,`totalproduct`,`totalprice`,`clientname`,`clientaddress`,`clientemail`,`orderstatus`,`orderplaceddate`,`orderplacedtime`,`invoicestatus`) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, orderthreded.getProductId());
			pstmt.setInt(2, orderthreded.getUserId());
			pstmt.setString(3, orderthreded.getUserFirstName());
			pstmt.setString(4, orderthreded.getUserLastName());
			pstmt.setString(5, orderthreded.getProductname());
			pstmt.setString(6, orderthreded.getProductsize());
			pstmt.setString(7, orderthreded.getProductrequired());
			pstmt.setString(8, orderthreded.getTotalProduct());
			pstmt.setLong(9, orderthreded.getTotalProductPrice());
			pstmt.setString(10, orderthreded.getclientName());
			pstmt.setString(11,orderthreded.getClientAddress());
			pstmt.setString(12, orderthreded.getClientEmail());
			pstmt.setString(13,orderthreded.getOrderStatus());
			pstmt.setString(14, orderthreded.getOrderPlacedDate());
			pstmt.setString(15, orderthreded.getOrderPlacedTime());
			pstmt.setString(16, orderthreded.getInvoiceStatus());
			
			status = pstmt.executeUpdate();
		}
		catch (Exception e) {e.printStackTrace();}
		return status;
	}
	public List<OrderGroovedFittingBean> getAllApprovalDetailsOfGroovedFitting(){
		List<OrderGroovedFittingBean> list = new ArrayList<>();
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "select * from `ims`.`ordergrooved`";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderGroovedFittingBean og = new OrderGroovedFittingBean();
				og.setOrderId(rs.getInt(1));
				og.setProductId(rs.getInt(2));
				og.setUserId(rs.getInt(3));
				og.setUserFirstName(rs.getString(4));
				og.setUserLastName(rs.getString(5));
				og.setClientName(rs.getString(6));
				og.setClientAddress(rs.getString(7));
				og.setClientEmail(rs.getString(8));
				og.setProductname(rs.getString(9));
				og.setProductsize(rs.getString(10));
				og.setProductrequired(rs.getString(11));
				og.setTotalProduct(rs.getString(12));
				og.setTotalProductPrice(rs.getLong(13));
				og.setOrderPlacedDate(rs.getString(14));
				og.setOrderPlacedTime(rs.getString(15));
				og.setApprovalDate(rs.getString(16));
				og.setApprovalTime(rs.getString(17));
				og.setOrderStatus(rs.getString(18));
				og.setInvoiceStatus(rs.getString(19));
				list.add(og);
			}
			
		}catch(Exception e) {e.printStackTrace();}
		return list;
	}
	public List<OrderThrededFittingBean> getAllApprovalDetailsOfThrededFitting(){
		List<OrderThrededFittingBean> list = new ArrayList<>();
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "select * from `ims`.`orderthreded`";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderThrededFittingBean ot = new OrderThrededFittingBean();
				ot.setOrderId(rs.getInt(1));
				ot.setProductId(rs.getInt(2));
				ot.setUserId(rs.getInt(3));
				ot.setUserFirstName(rs.getString(4));
				ot.setUserLastName(rs.getString(5));
				ot.setClientName(rs.getString(6));
				ot.setClientAddress(rs.getString(7));
				ot.setClientEmail(rs.getString(8));
				ot.setProductname(rs.getString(9));
				ot.setProductsize(rs.getString(10));
				ot.setProductrequired(rs.getString(11));
				ot.setTotalProduct(rs.getString(12));
				ot.setTotalProductPrice(rs.getLong(13));
				ot.setOrderPlacedDate(rs.getString(14));
				ot.setOrderPlacedTime(rs.getString(15));
				ot.setApprovalDate(rs.getString(16));
				ot.setApprovalTime(rs.getString(17));
				ot.setOrderStatus(rs.getString(18));
				ot.setInvoiceStatus(rs.getString(19));
				list.add(ot);
			}
			
		}catch(Exception e) {e.printStackTrace();}
		return list;
	}
	public int updateGroovedOrderStatus(OrderGroovedFittingBean og) {
		int status =0;
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "update `ims`.`ordergrooved` set `approveddate`=? , `approvedtime`=?, `orderstatus`=?  where `ordergrooveid`=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, og.getApprovalDate());
			pstmt.setString(2, og.getApprovalTime());
			pstmt.setString(3, og.getOrderStatus());
			pstmt.setInt(4, og.getOrderId());
			status = pstmt.executeUpdate();
			
		}catch(Exception e) {e.printStackTrace();}
		return status;
	}
	public int updateThrededOrderStatus(OrderThrededFittingBean ot) {
		int status =0;
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "update `ims`.`orderthreded` set `approveddate`=? , `approvedtime`=?, `orderstatus`=?  where `orderthrededid`=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ot.getApprovalDate());
			pstmt.setString(2, ot.getApprovalTime());
			pstmt.setString(3, ot.getOrderStatus());
			pstmt.setInt(4, ot.getOrderId());
			status = pstmt.executeUpdate();
			
		}catch(Exception e) {e.printStackTrace();}
		return status;
	}
	public int updatePasswordByUserId(UserBean ub) {
		int status = 0;
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "update `ims`.`user` set `password`=? where `user_id`=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1,ub.getPassword());
			pstmt.setInt(2, ub.getId());
			status = pstmt.executeUpdate();
		}catch(Exception ex) {ex.printStackTrace();}
		return status;
	}
	public List<OrderThrededFittingBean> getAllThrededProductByClientEmail(String clientemail){
		List<OrderThrededFittingBean> list = new ArrayList<OrderThrededFittingBean>();
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "select * from `ims`.`orderthreded` where `clientemail`= ? and `invoicestatus`=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, clientemail);
			pstmt.setString(2, "pending");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderThrededFittingBean ot = new  OrderThrededFittingBean();
				ot.setOrderId(rs.getInt(1));
				ot.setProductId(rs.getInt(2));
				ot.setUserId(rs.getInt(3));
				ot.setUserFirstName(rs.getString(4));
				ot.setUserLastName(rs.getString(5));
				ot.setClientName(rs.getString(6));
				ot.setClientAddress(rs.getString(7));
				ot.setClientEmail(rs.getString(8));
				ot.setProductname(rs.getString(9));
				ot.setProductsize(rs.getString(10));
				ot.setProductrequired(rs.getString(11));
				ot.setTotalProduct(rs.getString(12));
				ot.setTotalProductPrice(rs.getLong(13));
				ot.setOrderPlacedDate(rs.getString(14));
				ot.setOrderPlacedTime(rs.getString(15));
				ot.setApprovalDate(rs.getString(16));
				ot.setApprovalTime(rs.getString(17));
				ot.setOrderStatus(rs.getString(18));
				ot.setInvoiceStatus(rs.getString(19));
				
				list.add(ot);
			}
		}catch(Exception e) {e.printStackTrace();}
		return list;
	}
	public List<OrderGroovedFittingBean> getAllDetailsOfOrderGroovedFittingByUserId(int user_id)
	{
		List<OrderGroovedFittingBean> list = new ArrayList<>();
		
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String query = "select * from `ims`.`ordergrooved` where userid="+user_id;
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				OrderGroovedFittingBean og = new  OrderGroovedFittingBean();
				og.setOrderId(rs.getInt(1));
				og.setProductId(rs.getInt(2));
				og.setUserId(rs.getInt(3));
				og.setUserFirstName(rs.getString(4));
				og.setUserLastName(rs.getString(5));
				og.setClientName(rs.getString(6));
				og.setClientAddress(rs.getString(7));
				og.setClientEmail(rs.getString(8));
				og.setProductname(rs.getString(9));
				og.setProductsize(rs.getString(10));
				og.setProductrequired(rs.getString(11));
				og.setTotalProduct(rs.getString(12));
				og.setTotalProductPrice(rs.getLong(13));
				og.setOrderPlacedDate(rs.getString(14));
				og.setOrderPlacedTime(rs.getString(15));
				og.setApprovalDate(rs.getString(16));
				og.setApprovalTime(rs.getString(17));
				og.setOrderStatus(rs.getString(18));
				og.setInvoiceStatus(rs.getString(19));
				list.add(og);
			}
		}
		catch(Exception ex) {ex.printStackTrace();}
		return list;
	}
	public List<OrderThrededFittingBean> getAllDetailsOfOrderThrededFittingByUserId(int user_id)
	{
		List<OrderThrededFittingBean> list = new ArrayList<>();
		
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String query = "select * from `ims`.`orderthreded` where userid="+user_id;
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				OrderThrededFittingBean ot = new  OrderThrededFittingBean();
				ot.setOrderId(rs.getInt(1));
				ot.setProductId(rs.getInt(2));
				ot.setUserId(rs.getInt(3));
				ot.setUserFirstName(rs.getString(4));
				ot.setUserLastName(rs.getString(5));
				ot.setClientName(rs.getString(6));
				ot.setClientAddress(rs.getString(7));
				ot.setClientEmail(rs.getString(8));
				ot.setProductname(rs.getString(9));
				ot.setProductsize(rs.getString(10));
				ot.setProductrequired(rs.getString(11));
				ot.setTotalProduct(rs.getString(12));
				ot.setTotalProductPrice(rs.getLong(13));
				ot.setOrderPlacedDate(rs.getString(14));
				ot.setOrderPlacedTime(rs.getString(15));
				ot.setApprovalDate(rs.getString(16));
				ot.setApprovalTime(rs.getString(17));
				ot.setOrderStatus(rs.getString(18));
				ot.setInvoiceStatus(rs.getString(19));
				list.add(ot);
			}
		}
		catch(Exception ex) {ex.printStackTrace();}
		return list;
	}
	public int updateGroovedFittingProductByProductId(int productid, int totalproduct) {
		int status=0;
		try {
			String total_product = Integer.toString(totalproduct);
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "update `ims`.`groovedfitting` set `noofproduct`= ? where `id`= ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1,total_product);
			pstmt.setInt(2, productid);
			status = pstmt.executeUpdate();
		}catch(Exception e) {e.printStackTrace();}
		return status;
	}
	public int updateThrededFittingProductByProductId(int productid,int totalproduct) {
		int status=0;
		try {
			String total_product = Integer.toString(totalproduct);
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "update `ims`.`thrededfitting` set `noofproduct`= ? where `id`= ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1,total_product);
			pstmt.setInt(2, productid);
			status = pstmt.executeUpdate();
		}catch(Exception e) {e.printStackTrace();}
		return status;
	}
	public List<OrderGroovedFittingBean> getAllGroovedProductByClientEmail(String clientemail)
	{
		List<OrderGroovedFittingBean> list = new ArrayList<>();
		
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String query = "select * from `ims`.`ordergrooved` where `clientemail`=? and `invoicestatus`=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, clientemail);
			pstmt.setString(2, "pending");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderGroovedFittingBean og = new  OrderGroovedFittingBean();
				og.setOrderId(rs.getInt(1));
				og.setProductId(rs.getInt(2));
				og.setUserId(rs.getInt(3));
				og.setUserFirstName(rs.getString(4));
				og.setUserLastName(rs.getString(5));
				og.setClientName(rs.getString(6));
				og.setClientAddress(rs.getString(7));
				og.setClientEmail(rs.getString(8));
				og.setProductname(rs.getString(9));
				og.setProductsize(rs.getString(10));
				og.setProductrequired(rs.getString(11));
				og.setTotalProduct(rs.getString(12));
				og.setTotalProductPrice(rs.getLong(13));
				og.setOrderPlacedDate(rs.getString(14));
				og.setOrderPlacedTime(rs.getString(15));
				og.setApprovalDate(rs.getString(16));
				og.setApprovalTime(rs.getString(17));
				og.setOrderStatus(rs.getString(18));
				og.setInvoiceStatus(rs.getString(19));
				list.add(og);
			}
		}catch(Exception ex) {ex.printStackTrace();}
		return list;
	}
	public int updateThrededInvoiceStatusByClientEmail(String invoicestatus, String clientemail) {
		int status=0;
		
		try {
			
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			
			String sql = "update `ims`.`orderthreded` set `invoicestatus`= ? where `clientemail`= ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1,invoicestatus);
			pstmt.setString(2, clientemail);
			
			
			status = pstmt.executeUpdate();
		}catch(Exception e) {e.printStackTrace();}
		return status;
	}
	public int updateGroovedInvoiceStatusByClientEmail(String invoicestatus, String clientemail) {
		int status=0;
		try {
			
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "update `ims`.`ordergrooved` set `invoicestatus`= ? where `clientemail`= ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1,invoicestatus);
			pstmt.setString(2, clientemail);
			status = pstmt.executeUpdate();
		}catch(Exception e) {e.printStackTrace();}
		return status;
	}
	public List<UserBean> getAllUser(){
		List<UserBean> list = new ArrayList<UserBean>();
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String query = "select * from `ims`.`user`";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				UserBean ub = new UserBean();
				ub.setId(rs.getInt(1));
				ub.setFirstname(rs.getString(2));
				ub.setLastname(rs.getString(3));
				ub.setEmail(rs.getString(4));
				ub.setPhone(rs.getString(5));
				ub.setAddress(rs.getString(6));
				ub.setPosition(rs.getString(7));
				ub.setUsername(rs.getString(8));
				ub.setPassword(rs.getString(9));
				list.add(ub);
			}
		}catch(Exception e) {e.printStackTrace();}
		return list;
	}
	
}