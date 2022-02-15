package Servlets;
import java.util.*;
import DAO.*;
import BeanClass.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/RemoveAllFromCart")
public class RemoveAllFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RemoveAllFromCart() {
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
			Dao d = new Dao();
			int user_id = Integer.parseInt(userid);
			List<CartBean> list = d.getAllCartProductByUserId(user_id);
			if(list == null  || list.isEmpty()) {
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("There is no product available in cart");
			}
			int status=0;
			for(CartBean cb : list) {
				status = d.deleteProductFromCartByProductId(cb.getId());
			}
			if(status > 0) {
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("All products remove");
			}
		}
	}

}
