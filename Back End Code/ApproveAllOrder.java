package Servlets;
import java.util.*;
import DAO.*;
import BeanClass.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ApproveAllOrder")
public class ApproveAllOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ApproveAllOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderstatus = request.getParameter("orderstatus");
		String approvedate = request.getParameter("approvedate");
		String approvetime = request.getParameter("approvetime");
		
		Dao d = new Dao();
		List<OrderBean> list = d.getAllDetailsOfOrderDetail();
		int status=0;
		if(list==null || list.isEmpty()) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/plain");
			response.getWriter().write("There is no order placed");
		}
		
		else {
				for(OrderBean ob : list) {
				
					if(ob.getOrderStatus().equals("pending"))
						status = d.updateOrderStatusToApproved(orderstatus,approvedate, approvetime,ob.getOrderid());
				
				}
				
				if(status > 0) {
					response.setCharacterEncoding("UTF-8");
					response.setContentType("text/plain");
					response.getWriter().write("All orders approved");
			}
		}
	}
}
