package Servlets;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import BeanClass.*;
import DAO.*;

@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String productid = request.getParameter("productid");
		String productname = request.getParameter("productname");
		String productsize = request.getParameter("productsize");
		String userid = request.getParameter("userid");
		String totalproduct = request.getParameter("totalproduct");
		String unitprice = request.getParameter("unitprice");
		String producttype = request.getParameter("producttype");
		Dao d = new Dao();
		int user_id = Integer.parseInt(userid);
		int product_id = Integer.parseInt(productid);
		
		boolean exist = d.checkProductInCart(product_id);
		
		if(exist) {
			response.getWriter().write("Product already added");
		}
		
	else {
		CartBean ct = new CartBean();
		ct.setId(product_id);
		ct.setUserid(user_id);
		ct.setProductname(productname);
		ct.setProductsize(productsize);
		ct.setProducttype(producttype);
		ct.setNoofproduct(totalproduct);
		ct.setUnitprice(unitprice);
		
		
		int status = d.insertProductInCart(ct);
		
		if(status > 0) {
			response.getWriter().write("Product Added in Cart");
			}
		}
	}

}
