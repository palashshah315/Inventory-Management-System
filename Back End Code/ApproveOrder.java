package servlets.inventorymanagementsystem;
import java.io.IOException;
import DAO.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import BeanClass.*;
@WebServlet("/ApproveOrder")
public class ApproveOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderid = request.getParameter("orderid");
		String orderstatus = request.getParameter("orderstatus");
		String approvedate = request.getParameter("approvedate");
		String approvetime = request.getParameter("approvetime");
		
		OrderBean ot = new OrderBean();
		ot.setApprovalDate(approvedate);
		ot.setApprovalTime(approvetime);
		int order_id = Integer.parseInt(orderid);
		ot.setOrderid(order_id);
		ot.setOrderStatus(orderstatus);
		
		Dao d = new Dao();
		
		int status = d.updateOrderStatus(ot);
		
		if(status > 0) {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("Your order has been approved!!");
		}
		else if(orderid == null) {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("Order Id cannot be empty!!");
		}
		
		else if(orderstatus == null) {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("Order Status cannot be empty!!");
		}
		else if(approvedate == null) {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("approve date cannot be empty!!");
		}
		else if(approvetime == null) {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("Approve time cannot be empty!!");
		}
	}
}
