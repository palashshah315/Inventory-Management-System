package Servlets;
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
 * Servlet implementation class AddAllItemsToCart
 */
@WebServlet("/AddAllItemsToCart")
public class AddAllItemsToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public AddAllItemsToCart() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		
		if(userid.equals("") || userid == null) {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("Please login first");
		}
		
		else {
			int user_id = Integer.parseInt(userid);
			
			
			Dao d = new Dao();
			List<CartBean> list = d.getAllProductDetailsViaCartBean(user_id);
			
			boolean check = false;
			int status=0;
			for(CartBean cart : list) {
				if(d.checkProductInCart(cart.getId())) {
					check = true;
					break;
				}
				else {
					status = d.insertProductInCart(cart);
				}
			}
			
			if(!check && status>0) {
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("All the Product Added in Cart");
			}
			
			else {
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("Product already added");
			}
		}
	}

}
