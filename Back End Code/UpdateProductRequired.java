package Servlets;
import DAO.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateProductRequired
 */
@WebServlet("/UpdateProductRequired")
public class UpdateProductRequired extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductRequired() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productreq = request.getParameter("productreq");
		String productId = request.getParameter("productid");
		
		
		int product_req = Integer.parseInt(productreq);
		int product_id = Integer.parseInt(productId);
		
		int status=0;
		
		if(product_req < 1 ) {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("Product require cannot be less than 1");
		}
		else {
			
			Dao d = new Dao();
			status = d.updateProductRequiredByProductId(product_req,product_id);
			if(status > 0) {
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(productreq);
			}
		}
	}
}