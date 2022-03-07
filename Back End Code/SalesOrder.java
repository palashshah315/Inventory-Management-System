package servlets.inventorymanagementsystem;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.*;

import BeanClass.OrderBean;
import DAO.*;
@WebServlet("/SalesOrder")
public class SalesOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SalesOrder() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String customername = request.getParameter("customername");
		String fromdate = request.getParameter("fromdate");
		String todate = request.getParameter("todate");
		PrintWriter out = response.getWriter();
		if(customername.isEmpty() || customername == null) {
			out.println("<script type = \"text/javascript\">");
			out.println("alert('Please select customer name');");
			out.println("</script>");
		}
		
		else if(fromdate.isEmpty() || fromdate==null || todate.isEmpty() || todate==null) {
			out.println("<script type = \"text/javascript\">");
			out.println("alert('Please select dates');");
			out.println("</script>");
		}
		
		else {
			Dao d = new Dao();
			List<OrderBean> list = d.getAllProductDetailByClientNameAndOrderStatusApproved(customername,fromdate,todate);
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
