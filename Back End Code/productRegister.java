package Servlets;
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
		String productQuantity = req.getParameter("productquantity");
		String fitting = req.getParameter("fitting");
		
		PrintWriter out = res.getWriter();
		
		if(fitting.equals("Threded Fitting")) {
			Dao d = new Dao();
			ThrededFittingBean tb = new ThrededFittingBean();
			int status=0;
			tb.setProductName(productName);
			tb.setProductSize(productSize);
			tb.setNoOfProduct(productQuantity);
			status = d.insertThrededFitting(tb);
			if(status > 0) {
				out.println("<script type = \"text/javascript\">");
	    		out.println("alert('Product Threded Fitting Added Successfully');");
	    		out.println("</script>");	
	    		out.println("<meta http-equiv=\"Refresh\" content=\"0;url=AddProduct.jsp\">");
			}
			
		}
		
		else {
			Dao d = new Dao();
			GroovedFittingBean gb = new GroovedFittingBean();
			int status=0;
			gb.setProductName(productName);
			gb.setProductSize(productSize);
			gb.setNoOfProduct(productQuantity);
			status = d.insertGroovedFitting(gb);
			if(status > 0) {
				out.println("<script type = \"text/javascript\">");
	    		out.println("alert('Product Grooved Fitting Added Successfully');");
	    		
	    		out.println("</script>");
	    		out.println("<meta http-equiv=\"Refresh\" content=\"0;url=AddProduct.jsp\">");
	    		
			}
		}
		
		
	
	}

}
