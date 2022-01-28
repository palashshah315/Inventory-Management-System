package Servlets;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DAO.*;
import BeanClass.*;

@WebServlet("/GroovedOrderPlaced")
public class GroovedOrderPlaced extends HttpServlet {
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
		String clientemail = request.getParameter("clientemail");
		String orderstatus = "pending";
		String invoicestatus = "pending";
		String unitprice = request.getParameter("unitprice");
		
		int product_id = Integer.parseInt(productId);
		int user_id = Integer.parseInt(userid);
		
	
		int productrequired = Integer.parseInt(productreq);
		
		
		
//		PrintWriter out = response.getWriter();
		OrderGroovedFittingBean ordergrooved = new OrderGroovedFittingBean();
		ordergrooved.setUserId(user_id);
		ordergrooved.setUserFirstName(userfirstname);
		ordergrooved.setUserLastName(userlastname);
		ordergrooved.setProductId(product_id);
		ordergrooved.setProductname(productname);
		ordergrooved.setProductsize(productsize);
		ordergrooved.setProductrequired(productreq);
		ordergrooved.setClientName(clientname);
		ordergrooved.setClientAddress(clientaddress);
		ordergrooved.setTotalProduct(totalProduct);
		ordergrooved.setOrderStatus(orderstatus);
		ordergrooved.setOrderPlacedDate(orderplaceddate);
		ordergrooved.setOrderPlacedTime(orderplacedtime);
		ordergrooved.setClientEmail(clientemail);
		ordergrooved.setInvoiceStatus(invoicestatus);
		
		Dao d = new Dao();
		
		long productunitprice = Long.parseLong(unitprice);
		long totalprice = productunitprice * productrequired;
		ordergrooved.setTotalProductPrice(totalprice);
		
		int status = d.placedGroovedOrder(ordergrooved);
		
		
			if(status > 0) {
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8"); 
				String msg = "Your Order of "+productname+" product and "+productreq+" product required and "+productsize+" product size has been placed you can see your order detail in My Order section";
				response.getWriter().write(msg); 
				}
			else {
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8"); 
				String msg ="There is an error while placing order";
				response.getWriter().write(msg); 
			}
		
		}

	}
