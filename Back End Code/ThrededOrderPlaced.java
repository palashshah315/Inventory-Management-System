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
		String productreq = request.getParameter("productquantity");
		String totalProduct = request.getParameter("productavailable"); 
		String clientname = request.getParameter("clientname");
		String clientaddress = request.getParameter("clientaddress");
		String orderplaceddate = request.getParameter("orderplaceddate");
		String orderplacedtime = request.getParameter("orderplacedtime");
		String orderstatus = "pending";
		int product_id = Integer.parseInt(productId);
		int user_id = Integer.parseInt(userid);
		
		int totalproduct = Integer.parseInt(totalProduct);
		int productrequired = Integer.parseInt(productreq);
		int remainingproduct = totalproduct - productrequired;
		
		String remaining_product = Integer.toString(remainingproduct);
		
//		PrintWriter out = response.getWriter();
		OrderThrededFittingBean orderthreded = new OrderThrededFittingBean();
		orderthreded.setUserId(user_id);
		orderthreded.setUserFirstName(userfirstname);
		orderthreded.setUserLastName(userlastname);
		orderthreded.setProductId(product_id);
		orderthreded.setProductname(productname);
		orderthreded.setProductsize(productsize);
		orderthreded.setProductrequired(productreq);
		orderthreded.setClientName(clientname);
		orderthreded.setClientAddress(clientaddress);
		orderthreded.setTotalProduct(remaining_product);
		orderthreded.setOrderStatus(orderstatus);
		orderthreded.setOrderPlacedDate(orderplaceddate);
		orderthreded.setOrderPlacedTime(orderplacedtime);
		
		Dao d = new Dao();
		if(remainingproduct >= 0 ) {
			
		
		int status = d.placedThrededOrder(orderthreded);
		int flag = d.updateThrededTotalProduct(remaining_product,product_id);
		
			if(status > 0 && flag>0) {
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8"); 
				String msg = "Your Order of "+productreq+" product quantity and "+productname+" product name has been placed you can see your order detail in approval section";
				response.getWriter().write(msg); 
				}
			}
		
		else {
			remainingproduct = totalproduct;
			String productrem = Integer.toString(remainingproduct);
			System.out.println(productrem);
			int status = d.updateThrededTotalProduct(productrem, user_id);
			
			if(status > 0) {
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8"); 
				response.getWriter().write("you cannot order "); 
			}
		}
		
	}

}
