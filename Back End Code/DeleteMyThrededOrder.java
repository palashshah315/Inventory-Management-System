package Servlets;
import java.sql.*;
import DAO.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/DeleteMyThrededOrder")
public class DeleteMyThrededOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DeleteMyThrededOrder() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String orderthrededid = request.getParameter("orderid");
		String productreq = request.getParameter("productreq");
		String totalproduct = request.getParameter("totalproduct");
		String productid = request.getParameter("productid");
		int product_id = Integer.parseInt(productid);
		int total_product = Integer.parseInt(totalproduct);
		int product_req = Integer.parseInt(productreq);
		total_product = total_product + product_req;
		
		int order_threded_id = Integer.parseInt(orderthrededid);
		Dao d = new Dao();
		int status= d.updateThrededFittingProductByProductId(product_id,total_product);
		
		String query = "DELETE FROM `ims`.`orderthreded` where `orderthrededid`="+order_threded_id;
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
