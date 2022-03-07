package servlets.inventorymanagementsystem;
import BeanClass.*;
import DAO.*;
import java.util.*;
import org.json.simple.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AllConsolidateOrder
 */
@WebServlet("/AllConsolidateOrder")
public class AllConsolidateOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AllConsolidateOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Dao d = new Dao();
		List<OrderBean> list = d.getAllConsolidateOrder();
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
