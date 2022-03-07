package servlets.inventorymanagementsystem;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/DeleteMyOrder")
public class DeleteMyOrder extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String orderid = request.getParameter("orderid");
		
		if(orderid==null || orderid.equals("")) {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("Order cannot be null"); 
		}
		
	
		int status=0;
		
		String query = "DELETE FROM `ims`.`orderdetail` where `orderid`="+orderid;
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ims","root","root");
			Statement st = con.createStatement();
			status = st.executeUpdate(query);
			
			if(status > 0) {
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("Your order deleted successfully"); 
			}
			
			else {
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("Your order is not deleted"); 
			}
			
		}
		catch(Exception e) {e.printStackTrace();}
		
	}

}
