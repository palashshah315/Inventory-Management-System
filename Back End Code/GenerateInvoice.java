package Servlets;
import java.util.*;
import java.io.IOException;
import DAO.*;
import BeanClass.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.*;
@WebServlet("/GenerateInvoice")
public class GenerateInvoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public GenerateInvoice() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String clientemail = request.getParameter("clientemail");
		
		if(clientemail.isEmpty()) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/plain");
			response.getWriter().write("Email is Empty");
		}
		
		else {
			Dao d = new Dao();
			
			List<OrderThrededFittingBean> list_threded = d.getAllThrededProductByClientEmail(clientemail);
			List<OrderGroovedFittingBean> list_grooved = d.getAllGroovedProductByClientEmail(clientemail);
			

				JSONArray jsonarray = new JSONArray(); 
				
				for(OrderThrededFittingBean ot : list_threded) {
					JSONObject jsonobj = new JSONObject();
					jsonobj.put("orderthrededid",ot.getOrderId());
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
					jsonarray.put(jsonobj);
				}
				for(OrderGroovedFittingBean og : list_grooved) {
					JSONObject jsonobj = new JSONObject();
					jsonobj.put("ordergroovedid",og.getOrderId());
					jsonobj.put("productid", og.getProductId());
					jsonobj.put("userid",og.getUserId());
					jsonobj.put("userfirstname",og.getUserFirstName());
					jsonobj.put("userlastname",og.getUserLastName());
					jsonobj.put("clientname",og.getclientName());
					jsonobj.put("clientaddress",og.getClientAddress());
					jsonobj.put("clientemail",og.getClientEmail());
					jsonobj.put("productname",og.getProductname());
					jsonobj.put("productsize",og.getProductsize());
					jsonobj.put("totalproduct",og.getTotalProduct());
					jsonobj.put("productrequired",og.getProductrequired());
					jsonobj.put("totalproductprice",og.getTotalProductPrice());
					jsonobj.put("orderplaceddate",og.getOrderPlacedDate());
					jsonobj.put("orderplacedtime",og.getOrderPlacedTime());
					jsonobj.put("approvaldate",og.getApprovalDate());
					jsonobj.put("approvaltime",og.getApprovalTime());
					jsonobj.put("orderstatus",og.getOrderStatus());
					jsonobj.put("invoicestatus",og.getInvoiceStatus());
					jsonarray.put(jsonobj);
				}

				
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");
				response.getWriter().write(jsonarray.toString());
			
		}
	}

}
