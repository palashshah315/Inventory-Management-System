package DAO;
import java.sql.*;
import java.util.*;
import BeanClass.*;
import org.json.simple.*;
public class Dao {
	String driverName = "com.mysql.cj.jdbc.Driver", dburl = "jdbc:mysql://localhost:3306/ims",dbusername = "root",dbpassword = "root";

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
	
//	public List<CartBean> getAllCartProductByUserId(int userid){
//		List<CartBean> list = new ArrayList<>();
//		try {
//			Class.forName(driverName);
//			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
//			String sql = "select * from `ims`.`addtocart` where userid="+userid;
//			Statement st = con.createStatement();
//			ResultSet rs = st.executeQuery(sql);
//			while(rs.next()) {
//				CartBean cb = new CartBean();
//				cb.setCartid(rs.getInt(1));
//				cb.setUserid(rs.getInt(2));
//				cb.setId(rs.getInt(3));
//				cb.setProductname(rs.getString(4));
//				cb.setProductsize(rs.getString(5));
//				cb.setProducttype(rs.getString(6));
//				
//				cb.setUnitprice(rs.getString(7));
//				cb.setProductquantity(rs.getInt(8));
//				list.add(cb);
//			}
//		}catch(Exception ex) {ex.printStackTrace();}
//		return list;
//	}
	public boolean checkProductInCart(int productid) {
		boolean status = false;
		try {
			
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "select `productid` from `ims`.`addtocart`";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()) {
				int product_id = rs.getInt("productid");
				
				if(product_id == productid) {
					status = true;
				}
			}
			
		}catch(Exception e) {e.printStackTrace();}
		return status;
	}

	
	public List<ProductDetailBean> getAllProductDetails(){
		List<ProductDetailBean> list = new ArrayList<>();
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "SELECT * from `ims`.`productdetail`";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDetailBean pd = new ProductDetailBean();
				pd.setId(rs.getInt(1));
				pd.setProductname(rs.getString(2));
				pd.setProductsize(rs.getString(3));
				pd.setUnitprice(rs.getString(4));
				pd.setProducttype(rs.getString(5));
				pd.setNoofproduct(rs.getString(6));
				list.add(pd);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (Exception e) {e.printStackTrace();}
		return list;
	}
	
//	public int updateGroovedTotalProduct(String productremaining,int id) {
//		int status=0;
//		try {
//			Class.forName(driverName);
//			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
//			String sql = "update `ims`.`groovedfitting` set `noofproduct` = ? where `id`=?";
//			PreparedStatement pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, productremaining);
//			pstmt.setInt(2, id);
//			status = pstmt.executeUpdate();
//		}
//		catch(Exception ex) {ex.printStackTrace();}
//		return status;
//	}
	
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
	
	public int insertProductDetail(ProductDetailBean pd) {
		int status=0;
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "insert into `ims`.`productdetail` (`name`,`size`,`unitprice`,`producttype`) values (?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pd.getProductname());
			pstmt.setString(2, pd.getProductsize());
			pstmt.setString(3, pd.getUnitprice());
			pstmt.setString(4, pd.getProducttype());
			status  = pstmt.executeUpdate();
			pstmt.close();
			con.close();
		}catch(Exception ex) {ex.printStackTrace();}
		return status;
	}
//	public int insertProductInCart(CartBean ct) {
//		int status = 0;
//		try {
//			
//			Class.forName(driverName);
//			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
//			String sql = "insert into `ims`.`addtocart` (`userid`,`productid`,`productname`,`productsize`,`producttype`,`totalproduct`,`unitprice`,`productrequired`) values (?,?,?,?,?,?,?,?)";
//			PreparedStatement pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, ct.getUserid());
//			pstmt.setInt(2, ct.getId());
//			pstmt.setString(3, ct.getProductname());
//			pstmt.setString(4, ct.getProductsize());
//			pstmt.setString(5, ct.getProducttype());
//			
//			pstmt.setString(6, ct.getUnitprice());
//			pstmt.setInt(7, ct.getProductquantity());
//			status = pstmt.executeUpdate();
//		}catch(Exception e) {e.printStackTrace();}
//		
//		return status;
//	}
//	public int insertGroovedFitting(GroovedFittingBean gb) {
//		int status = 0;
//		try {
//			Class.forName(driverName);
//			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
//			String sql = "insert into `ims`.`groovedfitting` (`name`,`size`,`noofproduct`,`unitprice`) values (?,?,?,?)";
//			PreparedStatement pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, gb.getProductName());
//			pstmt.setString(2, gb.getProductSize());
//			pstmt.setString(3, gb.getNoOfProduct());
//			pstmt.setString(4, gb.getUnitPrice());
//			status = pstmt.executeUpdate();
//		}catch(Exception ex) {ex.printStackTrace();}
//		return status;
//	}
	 
//	public int placedGroovedOrder(OrderGroovedFittingBean ordergrooved) {
//		int status = 0;
//		try {
//			Class.forName(driverName);
//			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
//			String sql = "insert into `ims`.`ordergrooved` (`productid`,`userid`,`userfirstname`,`userlastname`,`productname`,`productsize`,`productrequired`,`totalproduct`,`totalprice`,`clientname`,`clientaddress`,`clientemail`,`orderstatus`,`orderplaceddate`,`orderplacedtime`,`invoicestatus`) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//			PreparedStatement pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, ordergrooved.getProductId());
//			pstmt.setInt(2, ordergrooved.getUserId());
//			pstmt.setString(3, ordergrooved.getUserFirstName());
//			pstmt.setString(4, ordergrooved.getUserLastName());
//			pstmt.setString(5, ordergrooved.getProductname());
//			pstmt.setString(6, ordergrooved.getProductsize());
//			pstmt.setString(7, ordergrooved.getProductrequired());
//			pstmt.setString(8, ordergrooved.getTotalProduct());
//			pstmt.setLong(9, ordergrooved.getTotalProductPrice());
//			pstmt.setString(10, ordergrooved.getclientName());
//			pstmt.setString(11,ordergrooved.getClientAddress());
//			pstmt.setString(12, ordergrooved.getClientEmail());
//			pstmt.setString(13,ordergrooved.getOrderStatus());
//			pstmt.setString(14, ordergrooved.getOrderPlacedDate());
//			pstmt.setString(15, ordergrooved.getOrderPlacedTime());
//			pstmt.setString(16, ordergrooved.getInvoiceStatus());
//			status = pstmt.executeUpdate();
//		}
//		catch (Exception e) {e.printStackTrace();}
//		return status;
//	}
	public List<OrderBean> getAllApprovalDetails(){
		List<OrderBean> list = new ArrayList<>();
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "select * from `ims`.`orderdetail`";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderBean og = new OrderBean();
				og.setOrderid(rs.getInt(1));
				og.setInvoiceid(rs.getString(2));
				og.setProductId(rs.getInt(3));
				og.setUserId(rs.getInt(4));
				og.setUserFirstName(rs.getString(5));
				og.setUserLastName(rs.getString(6));
				og.setClientName(rs.getString(7));
				og.setClientAddress(rs.getString(8));
				og.setClientEmail(rs.getString(9));
				og.setProductname(rs.getString(10));
				og.setProductsize(rs.getString(11));
				og.setProductrequired(rs.getInt(12));
				og.setTotalProduct(rs.getString(13));
				og.setTotalProductPrice(rs.getLong(14));
				og.setOrderPlacedDate(rs.getString(15));
				og.setOrderPlacedTime(rs.getString(16));
				og.setApprovalDate(rs.getString(17));
				og.setApprovalTime(rs.getString(18));
				og.setOrderStatus(rs.getString(19));
				og.setInvoiceStatus(rs.getString(20));
				list.add(og);
			}
			
		}catch(Exception e) {e.printStackTrace();}
		return list;
	}
//	public List<OrderBean> getAllApprovalDetailsOfThrededFitting(){
//		List<OrderBean> list = new ArrayList<>();
//		try {
//			Class.forName(driverName);
//			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
//			String sql = "select * from `ims`.`orderthreded`";
//			PreparedStatement pstmt = con.prepareStatement(sql);
//			ResultSet rs = pstmt.executeQuery();
//			while(rs.next()) {
//				OrderBean ot = new OrderBean();
//				ot.setOrderId(rs.getInt(1));
//				ot.setProductId(rs.getInt(2));
//				ot.setUserId(rs.getInt(3));
//				ot.setUserFirstName(rs.getString(4));
//				ot.setUserLastName(rs.getString(5));
//				ot.setClientName(rs.getString(6));
//				ot.setClientAddress(rs.getString(7));
//				ot.setClientEmail(rs.getString(8));
//				ot.setProductname(rs.getString(9));
//				ot.setProductsize(rs.getString(10));
//				ot.setProductrequired(rs.getString(11));
//				ot.setTotalProduct(rs.getString(12));
//				ot.setTotalProductPrice(rs.getLong(13));
//				ot.setOrderPlacedDate(rs.getString(14));
//				ot.setOrderPlacedTime(rs.getString(15));
//				ot.setApprovalDate(rs.getString(16));
//				ot.setApprovalTime(rs.getString(17));
//				ot.setOrderStatus(rs.getString(18));
//				ot.setInvoiceStatus(rs.getString(19));
//				list.add(ot);
//			}
//			
//		}catch(Exception e) {e.printStackTrace();}
//		return list;
//	}
//	public int updateGroovedOrderStatus(OrderGroovedFittingBean og) {
//		int status =0;
//		try {
//			Class.forName(driverName);
//			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
//			String sql = "update `ims`.`ordergrooved` set `approveddate`=? , `approvedtime`=?, `orderstatus`=?  where `ordergrooveid`=?";
//			PreparedStatement pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, og.getApprovalDate());
//			pstmt.setString(2, og.getApprovalTime());
//			pstmt.setString(3, og.getOrderStatus());
//			pstmt.setInt(4, og.getOrderId());
//			status = pstmt.executeUpdate();
//			
//		}catch(Exception e) {e.printStackTrace();}
//		return status;
//	}
	public int updateOrderStatus(OrderBean ot) {
		int status =0;
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "update `ims`.`orderdetail` set `approveddate`=? , `approvedtime`=?, `orderstatus`=?  where `orderid`=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ot.getApprovalDate());
			pstmt.setString(2, ot.getApprovalTime());
			pstmt.setString(3, ot.getOrderStatus());
			pstmt.setInt(4, ot.getOrderid());
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
	public List<OrderBean> getAllProductDetailByClientName(String clientname){
		List<OrderBean> list = new ArrayList<OrderBean>();
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "select * from `ims`.`orderdetail` where `clientname`= ? and `invoicestatus`=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, clientname);
			pstmt.setString(2, "pending");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderBean ot = new  OrderBean();
				ot.setOrderid(rs.getInt(1));
				ot.setInvoiceid(rs.getString(2));
				ot.setProductId(rs.getInt(3));
				ot.setUserId( rs.getInt(4));
				ot.setUserFirstName(rs.getString(5));
				ot.setUserLastName(rs.getString(6));
				ot.setClientName(rs.getString(7));
				ot.setClientAddress(rs.getString(8));
				ot.setClientEmail(rs.getString(9));
				ot.setProductname(rs.getString(10));
				ot.setProductsize(rs.getString(11));
				ot.setProductrequired(rs.getInt(12));
				ot.setTotalProduct(rs.getString(13));
				ot.setTotalProductPrice((long) rs.getDouble(14));
				ot.setOrderPlacedDate(rs.getString(15));
				ot.setOrderPlacedTime(rs.getString(16));
				ot.setApprovalDate(rs.getString(17));
				ot.setApprovalTime(rs.getString(18));
				ot.setOrderStatus(rs.getString(19));
				ot.setInvoiceStatus(rs.getString(20));
				
				list.add(ot);
			}
		}catch(Exception e) {e.printStackTrace();}
		return list;
	}
//	public List<OrderGroovedFittingBean> getAllDetailsOfOrderGroovedFittingByUserId(int user_id)
//	{
//		List<OrderGroovedFittingBean> list = new ArrayList<>();
//		
//		try {
//			Class.forName(driverName);
//			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
//			String query = "select * from `ims`.`ordergrooved` where userid="+user_id;
//			Statement st = con.createStatement();
//			ResultSet rs = st.executeQuery(query);
//			while(rs.next()) {
//				OrderGroovedFittingBean og = new  OrderGroovedFittingBean();
//				og.setOrderId(rs.getInt(1));
//				og.setProductId(rs.getInt(2));
//				og.setUserId(rs.getInt(3));
//				og.setUserFirstName(rs.getString(4));
//				og.setUserLastName(rs.getString(5));
//				og.setClientName(rs.getString(6));
//				og.setClientAddress(rs.getString(7));
//				og.setClientEmail(rs.getString(8));
//				og.setProductname(rs.getString(9));
//				og.setProductsize(rs.getString(10));
//				og.setProductrequired(rs.getString(11));
//				og.setTotalProduct(rs.getString(12));
//				og.setTotalProductPrice(rs.getLong(13));
//				og.setOrderPlacedDate(rs.getString(14));
//				og.setOrderPlacedTime(rs.getString(15));
//				og.setApprovalDate(rs.getString(16));
//				og.setApprovalTime(rs.getString(17));
//				og.setOrderStatus(rs.getString(18));
//				og.setInvoiceStatus(rs.getString(19));
//				list.add(og);
//			}
//		}
//		catch(Exception ex) {ex.printStackTrace();}
//		return list;
//	}
	public List<OrderBean> getAllDetailsOfOrderDetailByUserId(int user_id)
	{
		List<OrderBean> list = new ArrayList<>();
		
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String query = "select * from `ims`.`orderdetail` where userid="+user_id;
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				OrderBean ot = new  OrderBean();
				ot.setOrderid(rs.getInt(1));
				ot.setInvoiceid(rs.getString(2));
				ot.setProductId(rs.getInt(3));
				ot.setUserId(rs.getInt(4));
				ot.setUserFirstName(rs.getString(5));
				ot.setUserLastName(rs.getString(6));
				ot.setClientName(rs.getString(7));
				ot.setClientAddress(rs.getString(8));
				ot.setClientEmail(rs.getString(9));
				ot.setProductname(rs.getString(10));
				ot.setProductsize(rs.getString(11));
				ot.setProductrequired(rs.getInt(12));
				ot.setTotalProduct(rs.getString(13));
				ot.setTotalProductPrice(rs.getLong(14));
				ot.setOrderPlacedDate(rs.getString(15));
				ot.setOrderPlacedTime(rs.getString(16));
				ot.setApprovalDate(rs.getString(17));
				ot.setApprovalTime(rs.getString(18));
				ot.setOrderStatus(rs.getString(19));
				ot.setInvoiceStatus(rs.getString(20));
				list.add(ot);
			}
		}
		catch(Exception ex) {ex.printStackTrace();}
		return list;
	}
//	public int updateGroovedFittingProductByProductId(int productid, int totalproduct) {
//		int status=0;
//		try {
//			String total_product = Integer.toString(totalproduct);
//			Class.forName(driverName);
//			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
//			String sql = "update `ims`.`groovedfitting` set `noofproduct`= ? where `id`= ?";
//			PreparedStatement pstmt = con.prepareStatement(sql);
//			pstmt.setString(1,total_product);
//			pstmt.setInt(2, productid);
//			status = pstmt.executeUpdate();
//		}catch(Exception e) {e.printStackTrace();}
//		return status;
//	}
//	public int updateThrededFittingProductByProductId(int productid,int totalproduct) {
//		int status=0;
//		try {
//			String total_product = Integer.toString(totalproduct);
//			Class.forName(driverName);
//			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
//			String sql = "update `ims`.`thrededfitting` set `noofproduct`= ? where `id`= ?";
//			PreparedStatement pstmt = con.prepareStatement(sql);
//			pstmt.setString(1,total_product);
//			pstmt.setInt(2, productid);
//			status = pstmt.executeUpdate();
//		}catch(Exception e) {e.printStackTrace();}
//		return status;
//	}
//	public List<OrderGroovedFittingBean> getAllGroovedProductByClientEmail(String clientemail)
//	{
//		List<OrderGroovedFittingBean> list = new ArrayList<>();
//		
//		try {
//			Class.forName(driverName);
//			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
//			String query = "select * from `ims`.`ordergrooved` where `clientemail`=? and `invoicestatus`=?";
//			PreparedStatement pstmt = con.prepareStatement(query);
//			pstmt.setString(1, clientemail);
//			pstmt.setString(2, "pending");
//			ResultSet rs = pstmt.executeQuery();
//			while(rs.next()) {
//				OrderGroovedFittingBean og = new  OrderGroovedFittingBean();
//				og.setOrderId(rs.getInt(1));
//				og.setProductId(rs.getInt(2));
//				og.setUserId(rs.getInt(3));
//				og.setUserFirstName(rs.getString(4));
//				og.setUserLastName(rs.getString(5));
//				og.setClientName(rs.getString(6));
//				og.setClientAddress(rs.getString(7));
//				og.setClientEmail(rs.getString(8));
//				og.setProductname(rs.getString(9));
//				og.setProductsize(rs.getString(10));
//				og.setProductrequired(rs.getString(11));
//				og.setTotalProduct(rs.getString(12));
//				og.setTotalProductPrice(rs.getLong(13));
//				og.setOrderPlacedDate(rs.getString(14));
//				og.setOrderPlacedTime(rs.getString(15));
//				og.setApprovalDate(rs.getString(16));
//				og.setApprovalTime(rs.getString(17));
//				og.setOrderStatus(rs.getString(18));
//				og.setInvoiceStatus(rs.getString(19));
//				list.add(og);
//			}
//		}catch(Exception ex) {ex.printStackTrace();}
//		return list;
//	}
	public int updateInvoiceStatusByClientName(String invoicestatus, String clientname) {
		int status=0;
		
		try {
			
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			
			String sql = "update `ims`.`orderdetail` set `invoicestatus`= ? where `clientname`= ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1,invoicestatus);
			pstmt.setString(2, clientname);
			
			
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
	public int deleteProductFromCartByProductId(int product_id) {
		int status=0;
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "delete from `ims`.`addtocart` where `productid`="+product_id;
			Statement st = con.createStatement();
			status = st.executeUpdate(sql);
		}catch(Exception ex) {ex.printStackTrace();}
		return status;
	}
//	public List<CartBean> getAllProductDetailsViaCartBean(int user_id) {
//		List<CartBean> list = new ArrayList<>();
//		try {
//			Class.forName(driverName);
//			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
//			String sql = "SELECT * from `ims`.`productdetail`";
//			Statement st = con.createStatement();
//			ResultSet rs = st.executeQuery(sql);
//			while(rs.next()) {
//				CartBean cb = new CartBean();
//				cb.setId(rs.getInt(1));
//				cb.setProductname(rs.getString(2));
//				cb.setProductsize(rs.getString(3));
//				
//				cb.setUnitprice(rs.getString(4));
//				cb.setProducttype(rs.getString(5));
//				cb.setProductquantity(1);
//				cb.setUserid(user_id);
//				list.add(cb);
//			}
//			
//		}catch(Exception ex) {ex.printStackTrace();}
//		return list;
//	}
//	public int updateProductRequiredByProductId(int product_req, int product_id) {
//		int status = 0;
//		try {
//			Class.forName(driverName);
//			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
//			String sql = "update `ims`.`addtocart` set productrequired="+product_req+" where productid="+product_id;
//			Statement st = con.createStatement();
//			status = st.executeUpdate(sql);
//
//		}catch(Exception ex) {ex.printStackTrace();}
//		return status;
//	}
	public boolean checkInvoiceId(int invoiceid) {
		boolean check = false;
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "select `invoiceid` from `ims`.`orderdetail`";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				int invoice_id = rs.getInt(1);
				if(invoice_id == invoiceid) {
					check = true;
					break;
				}
			}
		}catch(Exception ex) {ex.printStackTrace();}
		return check;
	}

	public int deleteProductFromCartByUserId(int userid) {
		int status=0;
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "delete from `ims`.`addtocart` where `userid`="+userid;
			Statement st = con.createStatement();
			status = st.executeUpdate(sql);
		}catch(Exception ex) {ex.printStackTrace();}
		return status;
	}
	
	public List<OrderBean> getAllOrderDetailByFromAndToDate(String fromdate, String todate) {
		List<OrderBean> list = new ArrayList<>();
		
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
String sql = "SELECT \r\n"
		+ "GROUP_CONCAT(DISTINCT \r\n"
		+ "CONCAT('sum(case when clientname = ''', clientname, ''' then productrequired end) AS ', \r\n"
		+ "replace(clientname, ' ', '') \r\n"
		+ ")  ) \r\n"
		+ "from ims.orderdetail";
String outersql = "";
//System.out.println(sql);
			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			 if(rs.next()) {
				 
				outersql = "SELECT productname, productsize,"+rs.getString(1)+" from ims.orderdetail "
						+ "where orderplaceddate between '"+fromdate+"'"+"  AND '"+todate+"' "+"group by productname, productsize";
				
				Statement st1 = con.createStatement();
				ResultSet rs1 = st1.executeQuery(outersql);
				ResultSetMetaData md = rs1.getMetaData();
				
				while(rs1.next()) {
					OrderBean ob = new OrderBean();
					List<ClientProduct> list1 = new ArrayList<>();
					ob.setProductname(rs1.getString(1));
					ob.setProductsize(rs1.getString(2));
					
					
					for(int i=3;i<=md.getColumnCount();i++) {
						ClientProduct cp = new ClientProduct();
						cp.setCustomername(md.getColumnName(i));
						cp.setProduct_req(rs1.getInt(i));
						list1.add(cp);
					}
					
					ob.setProductreq(list1);
					
					list.add(ob);
				}
			 }
			
		}catch(Exception ex) {ex.printStackTrace();}
		
		return list;
	}
	public List<OrderBean> getAllDetailsOfOrderDetail() {
		List<OrderBean> list = new ArrayList<>();
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "select * from `ims`.`orderdetail`";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				OrderBean ob = new OrderBean();
				ob.setOrderid(rs.getInt(1));
				ob.setInvoiceid(rs.getString(2));
				ob.setProductId(rs.getInt(3));
				ob.setUserId(rs.getInt(4));
				ob.setUserFirstName(rs.getString(5));
				ob.setUserLastName(rs.getString(6));
				ob.setClientName(rs.getString(7));
				ob.setClientAddress(rs.getString(8));
				ob.setClientEmail(rs.getString(9));
				ob.setProductname(rs.getString(10));
				ob.setProductsize(rs.getString(11));
				ob.setProductrequired(rs.getInt(12));
				ob.setTotalProduct(rs.getString(13));
				ob.setTotalProductPrice(rs.getInt(14));
				ob.setOrderPlacedDate(rs.getString(15));
				ob.setOrderPlacedTime(rs.getString(16));
				ob.setApprovalDate(rs.getString(17));
				ob.setApprovalTime(rs.getString(18));
				ob.setOrderStatus(rs.getString(19));
				ob.setInvoiceStatus(rs.getString(20));
				list.add(ob);
			}
		}catch(Exception ex) {ex.printStackTrace();}
		return list;
	}
	public int deleteProductFromOrderDetail(int orderid) {
		int status=0;
		try{
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "DELETE from `ims`.`orderdetail` where `orderid`="+orderid;
			Statement st = con.createStatement();
			status = st.executeUpdate(sql);
		}catch(Exception ex) {ex.printStackTrace();}
		return status;
	}
	
	public List<String> getAllClientName(){
		List<String> list = new ArrayList<>();
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "select clientname from `ims`.`orderdetail` group by clientname";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				list.add(rs.getString("clientname"));
			}
		}catch(Exception ex) {ex.printStackTrace();}
		return list;
	}
	public List<OrderBean> getAllProductDetailByClientNameAndOrderStatus(String customername) {
		List<OrderBean> list = new ArrayList<>();
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String query = "select * from `ims`.`orderdetail` where `clientname` = "+"'"+customername+"'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next())
			{
				OrderBean pd = new OrderBean();
				

				pd.setOrderid(rs.getInt("orderid"));
				pd.setUserId(rs.getInt("userid"));
				pd.setUserFirstName(rs.getString("userfirstname"));
				pd.setUserLastName(rs.getString("userlastname"));
				pd.setClientName(rs.getString("clientname"));
				pd.setClientAddress(rs.getString("clientaddress"));
				pd.setClientEmail(rs.getString("clientemail"));
				pd.setProductname(rs.getString("productname"));
				pd.setProductsize(rs.getString("productsize"));
				pd.setProductrequired(rs.getInt("productrequired"));
				pd.setTotalProduct(rs.getString("totalproduct"));
				pd.setTotalProductPrice(rs.getInt("totalprice"));
				pd.setOrderPlacedDate(rs.getString("orderplaceddate"));
				pd.setOrderPlacedTime(rs.getString("orderplacedtime"));
				pd.setApprovalDate(rs.getString("approveddate"));
				pd.setApprovalTime(rs.getString("approvedtime"));
				pd.setOrderStatus(rs.getString("orderstatus"));
				pd.setInvoiceStatus(rs.getString("invoicestatus"));
				pd.setInvoiceid(rs.getString("invoiceid"));
				
				list.add(pd);
			}
		}catch(Exception ex) {ex.printStackTrace();}
		return list;
	}
	public List<OrderBean> getAllProductDetailByClientNameAndOrderStatusApproved(String customername,String fromdate, String todate) {
		List<OrderBean> list = new ArrayList<>();
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String query = "select * from `ims`.`orderdetail` where `clientname` = "+"'"+customername+"'"+"  and `orderstatus` = 'Approved' and `orderplaceddate` between '"+fromdate+"' "+"  AND '"+todate+"'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next())
			{
				OrderBean pd = new OrderBean();
				
				pd.setProductId(rs.getInt("productid"));
				pd.setOrderid(rs.getInt("orderid"));
				pd.setUserId(rs.getInt("userid"));
				pd.setUserFirstName(rs.getString("userfirstname"));
				pd.setUserLastName(rs.getString("userlastname"));
				pd.setClientName(rs.getString("clientname"));
				pd.setClientAddress(rs.getString("clientaddress"));
				pd.setClientEmail(rs.getString("clientemail"));
				pd.setProductname(rs.getString("productname"));
				pd.setProductsize(rs.getString("productsize"));
				pd.setProductrequired(rs.getInt("productrequired"));
				pd.setTotalProduct(rs.getString("totalproduct"));
				pd.setTotalProductPrice(rs.getInt("totalprice"));
				pd.setOrderPlacedDate(rs.getString("orderplaceddate"));
				pd.setOrderPlacedTime(rs.getString("orderplacedtime"));
				pd.setApprovalDate(rs.getString("approveddate"));
				pd.setApprovalTime(rs.getString("approvedtime"));
				pd.setOrderStatus(rs.getString("orderstatus"));
				pd.setInvoiceStatus(rs.getString("invoicestatus"));
				pd.setInvoiceid(rs.getString("invoiceid"));
				
				list.add(pd);
			}
		}catch(Exception ex) {ex.printStackTrace();}
		return list;
	}
	public int updateOrderStatusToApproved(String orderstatus, String approvedate, String approvetime, int orderid) {
		int status = 0;
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "update `ims`.`orderdetail` set `approveddate`=? , `approvedtime`=?, `orderstatus`=?  where `orderid`=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, approvedate);
			pstmt.setString(2, approvetime);
			pstmt.setString(3, orderstatus);
			pstmt.setInt(4, orderid);
			status = pstmt.executeUpdate();
		}catch(Exception ex) {ex.printStackTrace();}
		return status;
	}
	public String getForgotPassword(String email) {
		String password = "";
		try {
			
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
			String sql = "select  `password`  from `ims`.`user` where `user_email`= "+"'"+email+"'";
			Statement st =  con.createStatement();
			ResultSet rs =  st.executeQuery(sql);
			while(rs.next())
			{
			
				password = rs.getString(1);
			}
		}catch(Exception ex) {
			
		}
		return password;
	}
	public List<OrderBean> getAllConsolidateOrder() {
		List<OrderBean> list = new ArrayList<>();
		
		try {
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
String sql = "SELECT \r\n"
		+ "GROUP_CONCAT(DISTINCT \r\n"
		+ "CONCAT('sum(case when clientname = ''', clientname, ''' then productrequired end) AS ', \r\n"
		+ "replace(clientname, ' ', '') \r\n"
		+ ")  ) \r\n"
		+ "from ims.orderdetail";
String outersql = "";
//System.out.println(sql);
			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			 if(rs.next()) {
				 
				outersql = "SELECT productname, productsize,"+rs.getString(1)+" from ims.orderdetail "
						+ "group by productname, productsize";
				
				Statement st1 = con.createStatement();
				ResultSet rs1 = st1.executeQuery(outersql);
				ResultSetMetaData md = rs1.getMetaData();
				
				while(rs1.next()) {
					OrderBean ob = new OrderBean();
					List<ClientProduct> list1 = new ArrayList<>();
					ob.setProductname(rs1.getString(1));
					ob.setProductsize(rs1.getString(2));
					
					
					for(int i=3;i<=md.getColumnCount();i++) {
						ClientProduct cp = new ClientProduct();
						cp.setCustomername(md.getColumnName(i));
						cp.setProduct_req(rs1.getInt(i));
						list1.add(cp);
					}
					
					ob.setProductreq(list1);
					
					list.add(ob);
				}
			 }
			
		}catch(Exception ex) {ex.printStackTrace();}
		
		return list;
	}

	public int placedOrder(OrderBean ob, String productname, String productsize, String quantity, String price) {
	int status=0;
	try{
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(dburl,dbusername,dbpassword);
		String sql = "insert into `ims`.`orderdetail` (`invoiceid`,`userid`,`userfirstname`,`userlastname`,`clientname`,`clientaddress`,`clientemail`,`productname`,`productsize`,`productrequired`,`totalprice`,`orderplaceddate`,`orderplacedtime`,`approveddate`,`approvedtime`,`orderstatus`,`invoicestatus`) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,ob.getInvoiceid());
		pstmt.setInt(2,ob.getUserId());
		pstmt.setString(3,ob.getUserFirstName());
		pstmt.setString(4,ob.getUserLastName());
		pstmt.setString(5,ob.getclientName());
		pstmt.setString(6,ob.getClientAddress());
		pstmt.setString(7,ob.getClientEmail());
		pstmt.setString(8,productname);
		pstmt.setString(9,productsize);
		pstmt.setString(10,quantity);
		pstmt.setString(11,price);
		pstmt.setString(12,ob.getOrderPlacedDate());
		pstmt.setString(13,ob.getOrderPlacedTime());
		pstmt.setString(14,ob.getApprovalDate());
		pstmt.setString(15,ob.getApprovalTime());
		pstmt.setString(16,ob.getOrderStatus());
		pstmt.setString(17,ob.getInvoiceStatus());

		status = pstmt.executeUpdate();

		con.close();
		pstmt.close();

	}
	catch(Exception ex){ex.printStackTrace();}
	return status;
	}
}