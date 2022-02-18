package Servlets;
import DAO.*;
import BeanClass.*;
import java.util.*;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.JsonObject;
@WebServlet("/ConsolidateOrder")
public class ConsolidateOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ConsolidateOrder() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fromdate = request.getParameter("fromdate");
		String todate = request.getParameter("todate");
		SimpleDateFormat sm = new SimpleDateFormat("mm-dd-yyyy");
		fromdate = sm.format(fromdate);
		todate = sm.format(todate);
		if(fromdate.equals("")|| fromdate==null || todate.equals("") || todate==null) {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("Please select dates");
		}
		
		else {
			Dao d = new Dao();
			List<OrderBean> list = d.getAllOrderDetailByFromAndToDate(fromdate,todate);
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
				json.put(jsonobj);
			}
			System.out.println(json.toString());
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json.toString());
			
		}
		
	}

}
