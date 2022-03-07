package servlets.inventorymanagementsystem;
import BeanClass.OrderBean;
import DAO.Dao;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Servlet")

public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET REQUEST");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String item = request.getParameter("orderdetails");
		String userid = request.getParameter("userid");
		String userfirstname = request.getParameter("userfirstname");
		String userlastname = request.getParameter("userlastname");
		String clientemail = request.getParameter("clientemail");
		String clientname = request.getParameter("clientname");
		String clientaddress = request.getParameter("clientaddress");
		String invoiceno = request.getParameter("invoiceno");
		String orderplaceddate = request.getParameter("orderplaceddate");
		String orderplacedtime = request.getParameter("orderplacedtime");
		String approvedate = request.getParameter("approvedate");
		String approvetime = request.getParameter("approvetime");
		String orderstatus = request.getParameter("orderstatus");

		String invoicestatus = "Pending";
		int status =0;
		Dao d = new Dao();
		OrderBean ob = new OrderBean();
		int user_id = Integer.parseInt(userid);
		ob.setUserId(user_id);
		ob.setUserFirstName(userfirstname);
		ob.setUserLastName(userlastname);
		ob.setClientName(clientname);
		ob.setClientEmail(clientemail);
		ob.setClientAddress(clientaddress);
		ob.setInvoiceid(invoiceno);
		ob.setOrderPlacedDate(orderplaceddate);
		ob.setOrderPlacedTime(orderplacedtime);
		ob.setApprovalDate(approvedate);
		ob.setApprovalTime(approvetime);
		ob.setInvoiceStatus(invoicestatus);
		ob.setOrderStatus(orderstatus);

		if(userid.isEmpty() || clientemail.isEmpty() || clientname.isEmpty() || clientaddress.isEmpty() || invoiceno.isEmpty() || orderplaceddate.isEmpty() || orderplacedtime.isEmpty() || approvedate.isEmpty() ||approvetime.isEmpty() || orderstatus.isEmpty() || userfirstname.isEmpty() || userlastname.isEmpty())
		{
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("Fields cannot be empty!!");
		}
		else{

			JSONParser parser = new JSONParser();
			try {
				JSONArray jsonarr = (JSONArray) parser.parse(item);
				for (int i = 0; i < jsonarr.size(); i++)
				{
					JSONObject jsonObj = (JSONObject) jsonarr.get(i);
					status = d.placedOrder(ob,(String) jsonObj.get("productname"), (String) jsonObj.get("productsize"), (String) jsonObj.get("quantity"), (String) jsonObj.get("price"));

				}
			} catch (ParseException e) {
				e.printStackTrace();
			}

			if(status > 0){
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("Order added successfully");
			}
		}
	}

}
