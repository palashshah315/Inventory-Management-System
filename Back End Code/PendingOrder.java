package servlets.inventorymanagementsystem;
import java.io.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.*;

import BeanClass.*;
import java.util.*;
import DAO.*;
@WebServlet("/PendingOrder")
public class PendingOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PendingOrder() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String customername = request.getParameter("customername");
		PrintWriter out = response.getWriter();
		
		if(customername.isEmpty() || customername == null) {
			out.println("<script type = \"text/javascript\">");
			out.println("alert('Please select customer name');");
			out.println("</script>");
		}
		
		else {
			Dao d = new Dao();
			List<OrderBean> list = d.getAllProductDetailByClientNameAndOrderStatus(customername);
			JSONArray json = new JSONArray();
			
			for(OrderBean ot : list) {
				
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
				json.add(jsonobj);
				
			}
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().write(json.toString());
		}
	}

}
