package Servlets;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.*;
import BeanClass.*;

@WebServlet("/ThrededOrderPlaced")
public class ThrededOrderPlaced extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String userfirstname = request.getParameter("userfirstname");
		String userlastname = request.getParameter("userlastname");
		String productId = request.getParameter("productid");
		String productname = request.getParameter("productname");
		String productsize = request.getParameter("productsize");
		String noOfproduct = request.getParameter("productquantity");
		int product_id = Integer.parseInt(productId);
		int user_id = Integer.parseInt(userid);
//		PrintWriter out = response.getWriter();
		OrderThrededFittingBean orderthreded = new OrderThrededFittingBean();
		orderthreded.setUserId(user_id);
		orderthreded.setUserFirstName(userfirstname);
		orderthreded.setUserLastName(userlastname);
		orderthreded.setId(product_id);
		orderthreded.setProductname(productname);
		orderthreded.setProductsize(productsize);
		orderthreded.setProductquantity(noOfproduct);
		
		Dao d = new Dao();
		
		int status = d.placedThrededOrder(orderthreded);
		if(status > 0) {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
		    response.getWriter().write("Your Order Has been placed"); 
		}
		
	}

}
