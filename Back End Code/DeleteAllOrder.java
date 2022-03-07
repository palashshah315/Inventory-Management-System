package servlets.inventorymanagementsystem;
import DAO.*;
import BeanClass.*;
import java.util.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteAllOrder
 */
@WebServlet("/DeleteAllOrder")
public class DeleteAllOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DeleteAllOrder() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Dao d = new Dao();
		List<OrderBean> list = d.getAllDetailsOfOrderDetail();
		
		if(list == null || list.isEmpty()) {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("Order details is empty");
		}
		
		else {
			int status=0;
			
			for(OrderBean ob : list) {
				
				if(!isApproved(ob.getOrderStatus()))
					status = d.deleteProductFromOrderDetail(ob.getOrderid());
				
			}
			
			if(status > 0) {
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("All orders rejected");
			}
			else {
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("You cannot reject order once it's approved");
			}
			
		}
	}



	private boolean isApproved(String orderstatus) {
		boolean approve = false;
		
		if(orderstatus.equals("Approved"))
			approve = true;
		
		return approve;
	}

}
