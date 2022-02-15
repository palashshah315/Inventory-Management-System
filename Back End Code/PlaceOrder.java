package Servlets;
import java.util.*;
import BeanClass.*;
import java.io.*;
import DAO.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

/**
 * Servlet implementation class PlaceOrder
 */
@WebServlet("/PlaceOrder")
public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PlaceOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String clientname = request.getParameter("clientname");
		String clientemail = request.getParameter("clientemail");
		String clientaddress = request.getParameter("clientaddress");
		String userfirstname = request.getParameter("userfirstname");
		String userlastname = request.getParameter("userlastname");
		String orderplaceddate = request.getParameter("orderplaceddate");
		String orderplacedtime = request.getParameter("orderplacedtime");
		String orderstatus = "pending";
		String invoicestatus = "pending";
		PrintWriter out = response.getWriter();
		if(userid == null || userid.equals("")) {
			out.println("<script type = \"text/javascript\">");
    		out.println("alert('Please login first');");
    		out.println("</script>");	
    		out.println("<meta http-equiv=\"Refresh\" content=\"0;url=index.jsp\">");
		}
		
		else if(userfirstname==null || userfirstname.equals("") || userlastname==null || userlastname.equals("")) {
			out.println("<script type = \"text/javascript\">");
    		out.println("alert('Please login first');");
    		out.println("</script>");	
    		out.println("<meta http-equiv=\"Refresh\" content=\"0;url=index.jsp\">");
		}
		
		else if(clientname==null || clientname.equals("") || clientemail==null || clientemail.equals("")|| clientaddress==null || clientaddress.equals("")) 
		{	
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("Please enter client details");
		}
		else {
			int user_id = Integer.parseInt(userid);
			Dao d = new Dao();
			List<CartBean> list = d.getAllCartProductByUserId(user_id);
			Random random = new Random();
			int invoiceid = random.nextInt(10000);
			System.out.println(invoiceid);
			
			while(d.checkInvoiceId(invoiceid)) {
				invoiceid = random.nextInt(10000);
			}
			
			if(list == null || list.isEmpty()) {
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("Please add the order");
			}
			
			else {
				int del=0;
				
				int totalprice=0,status=0;
				for(CartBean cb: list) {
					OrderBean ob = new OrderBean();
					int price = Integer.parseInt(cb.getUnitprice());
					totalprice = cb.getProductquantity() * price;
					ob.setInvoiceid(invoiceid);
					ob.setProductId(cb.getId());
					ob.setUserId(user_id);
					ob.setUserFirstName(userfirstname);
					ob.setUserLastName(userlastname);
					ob.setClientName(clientname);
					ob.setClientAddress(clientaddress);
					ob.setClientEmail(clientemail);
					ob.setProductname(cb.getProductname());
					ob.setProductsize(cb.getProductsize());
					ob.setProductrequired(cb.getProductquantity());
					ob.setTotalProduct(cb.getNoofproduct());
					ob.setTotalProductPrice(totalprice);
					ob.setOrderPlacedDate(orderplaceddate);
					ob.setOrderPlacedTime(orderplacedtime);
					ob.setOrderStatus(orderstatus);
					ob.setInvoiceStatus(invoicestatus);
					status = d.placedOrder(ob);
					del = d.deleteProductFromCartByUserId(cb.getUserid());
				}
				
				if(status > 0 || del>0) {
					response.setContentType("text/plain");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write("Order placed successfully");
				}
				
			}
			
		}
	}
}
