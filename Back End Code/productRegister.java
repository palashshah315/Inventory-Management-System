package servlets.inventorymanagementsystem;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.*;
import BeanClass.*;
@WebServlet("/ProductRegister")
public class ProductRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String productName = req.getParameter("productname");
		String productSize = req.getParameter("productsize");
		String unitprice = req.getParameter("productunitprice");
		String fitting = req.getParameter("fitting");
		
		PrintWriter out = res.getWriter();
		
			Dao d = new Dao();
			ProductDetailBean pd = new ProductDetailBean();
			int status=0;
			pd.setProductname(productName);
			pd.setProductsize(productSize);
			
			pd.setUnitprice(unitprice);
			pd.setProducttype(fitting);
			status = d.insertProductDetail(pd);
			if(status > 0) {
				out.println("<script type = \"text/javascript\">");
	    		out.println("alert('Product Added Successfully');");
	    		out.println("</script>");	
	    		out.println("<meta http-equiv=\"Refresh\" content=\"0;url=AddProduct.jsp\">");
			}
			
		
		
		
	
	}

}
