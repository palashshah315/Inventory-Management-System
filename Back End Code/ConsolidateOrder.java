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
import org.json.simple.*;

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
				jsonobj.put("productname",ot.getProductname());
				jsonobj.put("productsize",ot.getProductsize());
				
				for(ClientProduct cp: ot.getProductreq()) {
					jsonobj.put(cp.getCustomername(), cp.getProduct_req());
				}
				
				json.add(jsonobj);
			}
			
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(json.toString());
			
			
		}
		
	}

}
