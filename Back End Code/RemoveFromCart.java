package Servlets;
import DAO.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RemoveFromCart
 */
@WebServlet("/RemoveFromCart")
public class RemoveFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RemoveFromCart() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productid = request.getParameter("productid");
		
		if(productid.equals("") || productid == null) {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("Product id cannot be empty");
		}
		
		else {
			Dao d = new Dao();
			int product_id = Integer.parseInt(productid);
			int status = d.deleteProductFromCartByProductId(product_id);
			if(status > 0) {
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("Product remove successfully");
			}
		}
	}

}
