package servlets.inventorymanagementsystem;
import java.util.*;
import java.io.IOException;
import DAO.*;
import BeanClass.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.*;

@WebServlet("/GenerateInvoice")
public class GenerateInvoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public GenerateInvoice() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String clientname = request.getParameter("clientname");
		
		if(clientname.isEmpty()) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/plain");
			response.getWriter().write("Email is Empty");
		}
		
		else {
			Dao d = new Dao();
			
			List<OrderBean> list_threded = d.getAllProductDetailByClientName(clientname);
			
			

				JSONArray jsonarray = new JSONArray(); 
				
				for(OrderBean ot : list_threded) {
					JSONObject jsonobj = new JSONObject();
					jsonobj.put("orderid",ot.getOrderid());
					jsonobj.put("invoiceid",ot.getInvoiceid());
					jsonobj.put("productid", ot.getProductId());
					jsonobj.put("userid",ot.getUserId());
					jsonobj.put("userfirstname",ot.getUserFirstName());
					jsonobj.put("userlastname",ot.getUserLastName());
					jsonobj.put("clientname",ot.getclientName());
					jsonobj.put("clientaddress",ot.getClientAddress());
					jsonobj.put("clientemail",ot.getClientEmail());
					jsonobj.put("productname",ot.getProductname());
					jsonobj.put("productsize",ot.getProductsize());
					jsonobj.put("totalproduct",ot.getTotalProduct());
					jsonobj.put("productrequired",ot.getProductrequired());
					jsonobj.put("totalproductprice",ot.getTotalProductPrice());
					jsonobj.put("orderplaceddate",ot.getOrderPlacedDate());
					jsonobj.put("orderplacedtime",ot.getOrderPlacedTime());
					jsonobj.put("approvaldate",ot.getApprovalDate());
					jsonobj.put("approvaltime",ot.getApprovalTime());
					jsonobj.put("orderstatus",ot.getOrderStatus());
					jsonobj.put("invoicestatus",ot.getInvoiceStatus());
					jsonarray.add(jsonobj);
				}
				
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");
				response.getWriter().write(jsonarray.toString());
			
		}
	}

}
